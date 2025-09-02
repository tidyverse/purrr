#' Map over two inputs
#'
#' @description
#' These functions are variants of [map()] that iterate over two arguments at
#' a time.
#'
#' @param .x,.y A pair of vectors, usually the same length. If not, a vector
#'   of length 1 will be recycled to the length of the other.
#' @param .f A function, specified in one of the following ways:
#'
#'   * A named function.
#'   * An anonymous function, e.g. `\(x, y) x + y` or `function(x, y) x + y`.
#'   * A formula, e.g. `~ .x + .y`. You must use `.x` to refer to the current
#'     element of `x` and `.y` to refer to the current element of `y`.
#'     No longer recommended.
#'
#'   `r lifecycle::badge("experimental")`
#'
#'   Wrap a function with [in_parallel()] to declare that it should be performed
#'   in parallel. See [in_parallel()] for more details.
#'   Use of `...` is not permitted in this context.
#' @inheritParams map
#' @inherit map return
#' @family map variants
#' @export
#' @examples
#' x <- list(1, 1, 1)
#' y <- list(10, 20, 30)
#'
#' map2(x, y, \(x, y) x + y)
#' # Or just
#' map2(x, y, `+`)
#'
#' # Split into pieces, fit model to each piece, then predict
#' by_cyl <- mtcars |> split(mtcars$cyl)
#' mods <- by_cyl |> map(\(df) lm(mpg ~ wt, data = df))
#' map2(mods, by_cyl, predict)
map2 <- function(.x, .y, .f, ..., .progress = FALSE) {
  map2_("list", .x, .y, .f, ..., .progress = .progress)
}
#' @export
#' @rdname map2
map2_lgl <- function(.x, .y, .f, ..., .progress = FALSE) {
  map2_("logical", .x, .y, .f, ..., .progress = .progress)
}
#' @export
#' @rdname map2
map2_int <- function(.x, .y, .f, ..., .progress = FALSE) {
  map2_("integer", .x, .y, .f, ..., .progress = .progress)
}
#' @export
#' @rdname map2
map2_dbl <- function(.x, .y, .f, ..., .progress = FALSE) {
  map2_("double", .x, .y, .f, ..., .progress = .progress)
}
#' @export
#' @rdname map2
map2_chr <- function(.x, .y, .f, ..., .progress = FALSE) {
  map2_("character", .x, .y, .f, ..., .progress = .progress)
}

map2_ <- function(
  .type,
  .x,
  .y,
  .f,
  ...,
  .progress = FALSE,
  .purrr_user_env = caller_env(2),
  .purrr_error_call = caller_env()
) {
  .x <- vctrs_vec_compat(.x, .purrr_user_env)
  .y <- vctrs_vec_compat(.y, .purrr_user_env)

  n <- vec_size_common(.x = .x, .y = .y, .call = .purrr_error_call)
  args <- vec_recycle_common(
    .x = .x,
    .y = .y,
    .size = n,
    .call = .purrr_error_call
  )
  .x <- args$.x
  .y <- args$.y

  names <- vec_names(.x)

  .f <- as_mapper(.f, ...)

  if (running_in_parallel(.f)) {
    attributes(args) <- list(
      class = "data.frame",
      row.names = if (is.null(names)) .set_row_names(n) else names
    )
    return(mmap_(args, .f, .progress, .type, .purrr_error_call, ...))
  }

  i <- 0L
  with_indexed_errors(
    i = i,
    names = names,
    error_call = .purrr_error_call,
    call_with_cleanup(map2_impl, environment(), .type, .progress, n, names, i)
  )
}

#' @rdname map2
#' @export
map2_vec <- function(.x, .y, .f, ..., .ptype = NULL, .progress = FALSE) {
  out <- map2(.x, .y, .f, ..., .progress = .progress)
  simplify_impl(out, ptype = .ptype)
}

#' @export
#' @rdname map2
walk2 <- function(.x, .y, .f, ..., .progress = FALSE) {
  map2(.x, .y, .f, ..., .progress = .progress)
  invisible(.x)
}
