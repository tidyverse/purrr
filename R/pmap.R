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
#'   A data frame is an important special case of `.l`. It will cause `.f`
#'   to be called once for each row.
#' @param .f A function, specified in one of the following ways:
#'
#'   * A named function.
#'   * An anonymous function, e.g. `function(x, y, z) x + y / z`
#'   * A lambda function, e.g. `\(x, y, z) x + y / z`.
#'   * A formula, e.g. `~ ..1 + ..2 / ..3`. This syntax is not recommended as
#'     you can only refer to arguments by position.
#' @inheritParams map
#' @inherit map return
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
#'
#' # If you want to bind the results of your function rowwise, use:
#' # map2_dfr() or pmap_dfr()
#' ex_fun <- function(arg1, arg2){
#' col <- arg1 + arg2
#' x <- as.data.frame(col)
#' }
#' arg1 <- 1:4
#' arg2 <- 10:13
#' map2_dfr(arg1, arg2, ex_fun)
#' # If instead you want to bind by columns, use map2_dfc() or pmap_dfc()
#' map2_dfc(arg1, arg2, ex_fun)
pmap <- function(.l, .f, ...) {
  .f <- as_mapper(.f, ...)
  if (is.data.frame(.l)) {
    .l <- as.list(.l)
  }

  .Call(pmap_impl, environment(), ".l", ".f", "list")
}

#' @export
#' @rdname pmap
pmap_lgl <- function(.l, .f, ...) {
  .f <- as_mapper(.f, ...)
  if (is.data.frame(.l)) {
    .l <- as.list(.l)
  }

  .Call(pmap_impl, environment(), ".l", ".f", "logical")
}
#' @export
#' @rdname pmap
pmap_int <- function(.l, .f, ...) {
  .f <- as_mapper(.f, ...)
  if (is.data.frame(.l)) {
    .l <- as.list(.l)
  }

  .Call(pmap_impl, environment(), ".l", ".f", "integer")
}
#' @export
#' @rdname pmap
pmap_dbl <- function(.l, .f, ...) {
  .f <- as_mapper(.f, ...)
  if (is.data.frame(.l)) {
    .l <- as.list(.l)
  }

  .Call(pmap_impl, environment(), ".l", ".f", "double")
}
#' @export
#' @rdname pmap
pmap_chr <- function(.l, .f, ...) {
  .f <- as_mapper(.f, ...)
  if (is.data.frame(.l)) {
    .l <- as.list(.l)
  }

  .Call(pmap_impl, environment(), ".l", ".f", "character")
}

#' @rdname pmap
#' @export
pmap_dfr <- function(.l, .f, ..., .id = NULL) {
  check_installed("dplyr", "for `pmap_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname pmap
#' @export
pmap_dfc <- function(.l, .f, ...) {
  check_installed("dplyr", "for `pmap_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname pmap
#' @export
#' @usage NULL
pmap_df <- pmap_dfr

#' @export
#' @rdname pmap
pwalk <- function(.l, .f, ...) {
  pmap(.l, .f, ...)
  invisible(.l)
}
