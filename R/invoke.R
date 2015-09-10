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
#' middle %>% invoke_dbl(rcauchy(100))
invoke <- function(.x, ...) {
  if (is.function(.x)) {
    list(.x(...))
  } else {
    lapply(.x, function(f) f(...))
  }
}

#' @export
#' @rdname invoke
invoke_lgl <- function(.x, ...) {
  if (is.function(.x)) {
    out <- .x(...)
    stopifnot(is.logical(out), length(out) == 1)
    out
  } else {
    map_lgl(.x, function(f) f(...))
  }
}
#' @export
#' @rdname invoke
invoke_int <- function(.x, ...) {
  if (is.function(.x)) {
    out <- .x(...)
    stopifnot(is.integer(out), length(out) == 1)
    out
  } else {
    map_int(.x, function(f) f(...))
  }
}

#' @export
#' @rdname invoke
invoke_dbl <- function(.x, ...) {
  if (is.function(.x)) {
    out <- .x(...)
    stopifnot(is.double(out), length(out) == 1)
    out
  } else {
    map_dbl(.x, function(f) f(...))
  }
}

#' @export
#' @rdname invoke
invoke_chr <- function(.x, ...) {
  if (is.function(.x)) {
    out <- .x(...)
    stopifnot(is.character(out), length(out) == 1)
    out
  } else {
    map_chr(.x, function(f) f(...))
  }
}
