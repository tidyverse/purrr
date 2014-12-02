#' Invoke every element of a list of functions.
#'
#' @param .x A function or list of functions.
#' @param ... Arguments passed to each function.
#' @inheritParams map
#' @export
#' @examples
#' middle <- list(m1 = mean, m2 = median)
#'
#' middle %>% invoke(rcauchy(100))
#' middle %>% invoke_v(rcauchy(100))
invoke <- function(.x, ...) {
  if (is.function(.x)) {
    list(.x(...))
  } else {
    lapply(.x, function(f) f(...))
  }
}

#' @export
#' @rdname invoke
invoke_v <- function(.x, ..., .type) {
  if (is.function(.x)) {
    .x(...)
  } else {
    map_v(.x, function(f) f(...), .type = .type)
  }
}
