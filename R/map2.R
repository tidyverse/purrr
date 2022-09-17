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
#'     element of `x` and `.y` to refer to the current element of `y`. Only
#'     recommended if you require backward compatibility with older versions
#'     of R.
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
  .f <- as_mapper(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "list", .progress)
}
#' @export
#' @rdname map2
map2_lgl <- function(.x, .y, .f, ..., .progress = FALSE) {
  .f <- as_mapper(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "logical", .progress)
}
#' @export
#' @rdname map2
map2_int <- function(.x, .y, .f, ..., .progress = FALSE) {
  .f <- as_mapper(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "integer", .progress)
}
#' @export
#' @rdname map2
map2_dbl <- function(.x, .y, .f, ..., .progress = FALSE) {
  .f <- as_mapper(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "double", .progress)
}
#' @export
#' @rdname map2
map2_chr <- function(.x, .y, .f, ..., .progress = FALSE) {
  .f <- as_mapper(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "character", .progress)
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
