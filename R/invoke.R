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
#' middle %>% invoke(rcauchy(100), .type = numeric(1))
invoke <- function(.x, ..., .type) {
  if (is.function(.x)) {
    .x(...)
  } else {
    map(.x, function(f) f(...), .type = .type)
  }
}
