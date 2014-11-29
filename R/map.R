#' Apply a function to each element of a list.
#'
#' \code{map} returns the transformed input; \code{each} calls \code{.f} for
#' its side-effect and returns the original input.
#'
#' @param .x A list or vector.
#' @param .f A function to apply to each element of \code{.x}.
#' @param ... Additional arguments passed on to \code{.f}.
#' @param .type Specifies the type of result of \code{.f}, if known.
#'   If supplied, the result of \code{map} will be a vector or matrix.
#'   If omitted, the result of \code{map} will be a list.
#' @return \code{map} the transformed input; \code{each} the input \code{.x}.
#' @export
#' @examples
#' 1:10 %>%
#'   map(rnorm, n = 10) %>%
#'   map(mean, .type = numeric(1))
map <- function(.x, .f, ..., .type) {
  if (missing(.type)) {
    lapply(.x, .f, ...)
  } else {
    vapply(.x, .f, ..., FUN.VALUE = .type)
  }
}

#' @export
#' @rdname map
each <- function(.x, .f, ...) {
  for (i in seq_along(x)) {
    .f(.x[[i]], ...)
  }
  x
}
