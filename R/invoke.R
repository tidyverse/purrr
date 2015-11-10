#' Invoke functions.
#'
#' This pair of functions make it easier to combine a function and list
#' of parameters to get a result. \code{invoke} is a wrapper around
#' \code{do.call} that makes it easy to use in a pipe. \code{invoke_map}
#' makes it easier to call lists of functions with lists of parameters.
#'
#' @param .f For \code{invoke}, a function; for \code{invoke_map} a
#'   list of functions.
#' @param .x For \code{invoke}, an argument-list; for \code{invoke_map} a
#'   list of argument-lists the same length as \code{.f}. Set to \code{NULL}
#'   to use the same arguments to every invocation of the function.
#' @param ... Additional arguments passed to each function.
#' @inheritParams map
#' @export
#' @examples
#' # Invoke a function with a list of arguments
#' invoke(runif, list(n = 10))
#' # Invoke a function with named arguments
#' invoke(runif, NULL, n = 10)
#'
#' # Combine the two:
#' invoke(paste, list("01a", "01b"), sep = "-")
#' # That's more natural as part of a pipeline:
#' list("01a", "01b") %>%
#'   invoke(paste, ., sep = ".")
#'
#' # Invoke a list of functions, each with different arguments
#' invoke_map(list(runif, rnorm), list(list(n = 10), list(n = 5)))
#' # Invoke a list of function, each with the same arguments
#' invoke_map(list(runif, rnorm), NULL, n = 5)
#'
#' # Or as a pipeline
#' list(m1 = mean, m2 = median) %>%
#'   invoke_map(NULL, rcauchy(100))
#'
#' # If you have pairs of function name and arguments, it's natural
#' # to store them in a data frame:
#' if (requireNamespace("dplyr", quietly = TRUE)) {
#' df <- dplyr::data_frame(
#'   f = c("runif", "rpois", "rnorm"),
#'   params = list(
#'     list(n = 10),
#'     list(n = 5, lambda = 10),
#'     list(n = 10, mean = -3, sd = 10)
#'   )
#' )
#' df
#' invoke_map(df$f, df$params)
#' }
invoke <- function(.f, .x, ...) {
  if (is.null(.x)) {
    .f(...)
  } else {
    stopifnot(is.list(.x))
    do.call(.f, c(.x, list(...)))
  }
}

#' @rdname invoke
#' @export
invoke_map <- function(.f, .x, ...) {
  if (is.null(.x)) {
    lapply(.f, function(f) do.call(f, list(quote(...))))
  } else {
    set_names(map2(.f, .x, invoke), names(.f))
  }
}

#' @rdname invoke
#' @export
#' @usage NULL
map_call <- function(.x, .f, ...) {
  warning("`map_call()` is deprecated. Please use `invoke()` instead.")
  invoke(.f, .x, ...)
}
