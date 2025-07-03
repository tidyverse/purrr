#' Map over multiple input simultaneously (in "parallel")
#'
#' @description
#' These functions are variants of [map()] that iterate over multiple arguments
#' simultaneously. They are parallel in the sense that each input is processed
#' in parallel with the others, not in the sense of multicore computing, i.e.
#' they share the same notion of "parallel" as [base::pmax()] and [base::pmin()].
#'
#' @param .l A list of vectors. The length of `.l` determines the number of
#'   arguments that `.f` will be called with. Arguments will be supply by
#'   position if unnamed, and by name if named.
#'
#'   Vectors of length 1 will be recycled to any length; all other elements
#'   must be have the same length.
#'
#'   A data frame is an important special case of `.l`. It will cause `.f`
#'   to be called once for each row.
#' @param .f A function, specified in one of the following ways:
#'
#'   * A named function.
#'   * An anonymous function, e.g. `\(x, y, z) x + y / z` or
#'     `function(x, y, z) x + y / z`
#'   * A formula, e.g. `~ ..1 + ..2 / ..3`. No longer recommended.
#'
#'   `r lifecycle::badge("experimental")`
#'
#'   Wrap a function with [in_parallel()] to declare that it should be performed
#'   in parallel. See [in_parallel()] for more details.
#'   Use of `...` is not permitted in this context.
#' @inheritParams map
#' @returns
#' The output length is determined by the maximum length of all elements of `.l`.
#' The output names are determined by the names of the first element of `.l`.
#' The output type is determined by the suffix:
#'
#' * No suffix: a list; `.f()` can return anything.
#'
#' * `_lgl()`, `_int()`, `_dbl()`, `_chr()` return a logical, integer, double,
#'   or character vector respectively; `.f()` must return a compatible atomic
#'   vector of length 1.
#'
#' * `_vec()` return an atomic or S3 vector, the same type that `.f` returns.
#'   `.f` can return pretty much any type of vector, as long as it is length 1.
#'
#' * `pwalk()` returns the input `.l` (invisibly). This makes it easy to
#'    use in a pipe. The return value of `.f()` is ignored.
#'
#' Any errors thrown by `.f` will be wrapped in an error with class
#' [purrr_error_indexed].
#' @family map variants
#' @export
#' @examples
#' x <- list(1, 1, 1)
#' y <- list(10, 20, 30)
#' z <- list(100, 200, 300)
#' pmap(list(x, y, z), sum)
#'
#' # Matching arguments by position
#' pmap(list(x, y, z), function(first, second, third) (first + third) * second)
#'
#' # Matching arguments by name
#' l <- list(a = x, b = y, c = z)
#' pmap(l, function(c, b, a) (a + c) * b)
#'
#' # Vectorizing a function over multiple arguments
#' df <- data.frame(
#'   x = c("apple", "banana", "cherry"),
#'   pattern = c("p", "n", "h"),
#'   replacement = c("P", "N", "H"),
#'   stringsAsFactors = FALSE
#'   )
#' pmap(df, gsub)
#' pmap_chr(df, gsub)
#'
#' # Use `...` to absorb unused components of input list .l
#' df <- data.frame(
#'   x = 1:3,
#'   y = 10:12,
#'   z = letters[1:3]
#' )
#' plus <- function(x, y) x + y
#' \dontrun{
#' # this won't work
#' pmap(df, plus)
#' }
#' # but this will
#' plus2 <- function(x, y, ...) x + y
#' pmap_dbl(df, plus2)
#'
#' # The "p" for "parallel" in pmap() is the same as in base::pmin()
#' # and base::pmax()
#' df <- data.frame(
#'   x = c(1, 2, 5),
#'   y = c(5, 4, 8)
#' )
#' # all produce the same result
#' pmin(df$x, df$y)
#' map2_dbl(df$x, df$y, min)
#' pmap_dbl(df, min)
pmap <- function(.l, .f, ..., .progress = FALSE) {
  pmap_("list", .l, .f, ..., .progress = .progress)
}

#' @export
#' @rdname pmap
pmap_lgl <- function(.l, .f, ..., .progress = FALSE) {
  pmap_("logical", .l, .f, ..., .progress = .progress)
}
#' @export
#' @rdname pmap
pmap_int <- function(.l, .f, ..., .progress = FALSE) {
  pmap_("integer", .l, .f, ..., .progress = .progress)
}
#' @export
#' @rdname pmap
pmap_dbl <- function(.l, .f, ..., .progress = FALSE) {
  pmap_("double", .l, .f, ..., .progress = .progress)
}
#' @export
#' @rdname pmap
pmap_chr <- function(.l, .f, ..., .progress = FALSE) {
  pmap_("character", .l, .f, ..., .progress = .progress)
}

pmap_ <- function(
  .type,
  .l,
  .f,
  ...,
  .progress = FALSE,
  .purrr_user_env = caller_env(2),
  .purrr_error_call = caller_env()
) {
  .l <- vctrs_list_compat(.l, error_call = .purrr_error_call)
  .l <- map(.l, vctrs_vec_compat)

  n <- vec_size_common(!!!.l, .arg = ".l", .call = .purrr_error_call)
  .l <- vec_recycle_common(
    !!!.l,
    .size = n,
    .arg = ".l",
    .call = .purrr_error_call
  )

  if (length(.l) > 0L) {
    names <- vec_names(.l[[1L]])
  } else {
    names <- NULL
  }

  .f <- as_mapper(.f, ...)

  if (running_in_parallel(.f)) {
    attributes(.l) <- list(
      names = names(.l),
      class = "data.frame",
      row.names = if (is.null(names)) .set_row_names(n) else names
    )
    return(mmap_(.l, .f, .progress, .type, .purrr_error_call, ...))
  }

  call_names <- names(.l)
  call_n <- length(.l)

  i <- 0L
  with_indexed_errors(
    i = i,
    names = names,
    error_call = .purrr_error_call,
    call_with_cleanup(
      pmap_impl,
      environment(),
      .type,
      .progress,
      n,
      names,
      i,
      call_names,
      call_n
    )
  )
}


#' @export
#' @rdname pmap
pmap_vec <- function(.l, .f, ..., .ptype = NULL, .progress = FALSE) {
  .f <- as_mapper(.f, ...)

  out <- pmap(.l, .f, ..., .progress = .progress)
  simplify_impl(out, ptype = .ptype)
}

#' @export
#' @rdname pmap
pwalk <- function(.l, .f, ..., .progress = FALSE) {
  pmap(.l, .f, ..., .progress = .progress)
  invisible(.l)
}
