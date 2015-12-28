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
#'   list of argument-lists the same length as \code{.f} (or length 1).
#'   The default argument, \code{list(NULL)}, will be recycled to the
#'   same length as \code{.f}, and will call each function with no
#'   arguments (apart from any suppled in \code{...}.
#' @param ... Additional arguments passed to each function.
#' @inheritParams map
#' @export
#' @examples
#' # Invoke a function with a list of arguments
#' invoke(runif, list(n = 10))
#' # Invoke a function with named arguments
#' invoke(runif, n = 10)
#'
#' # Combine the two:
#' invoke(paste, list("01a", "01b"), sep = "-")
#' # That's more natural as part of a pipeline:
#' list("01a", "01b") %>%
#'   invoke(paste, ., sep = ".")
#'
#' # Invoke a list of functions, each with different arguments
#' invoke_map(list(runif, rnorm), list(list(n = 10), list(n = 5)))
#' # Or with the same inputs:
#' invoke_map(list(runif, rnorm), list(list(n = 5)))
#' invoke_map(list(runif, rnorm), n = 5)
#' # Or the same function with different inputs:
#' invoke_map("runif", list(list(n = 5), list(n = 10)))
#'
#' # Or as a pipeline
#' list(m1 = mean, m2 = median) %>% invoke_map(x = rcauchy(100))
#' list(m1 = mean, m2 = median) %>% invoke_map_dbl(x = rcauchy(100))
#'
#' # Note that you can also match by position by explicitly omitting `.x`.
#' # This can be useful when the argument names of the functions are not
#' # identical
#' list(m1 = mean, m2 = median) %>%
#'   invoke_map(, rcauchy(100))
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
invoke <- function(.f, .x = NULL, ...) {
  do.call(.f, c(.x, list(...)))
}

as_invoke_function <- function(f) {
  if (is.function(f)) {
    list(f)
  } else {
    f
  }
}

#' @rdname invoke
#' @export
invoke_map <- function(.f, .x = list(NULL), ...) {
  .f <- as_invoke_function(.f)
  map2(.f, .x, invoke, ...)
}
#' @rdname invoke
#' @export
invoke_map_lgl <- function(.f, .x = list(NULL), ...) {
  .f <- as_invoke_function(.f)
  map2_lgl(.f, .x, invoke, ...)
}
#' @rdname invoke
#' @export
invoke_map_int <- function(.f, .x = list(NULL), ...) {
  .f <- as_invoke_function(.f)
  map2_int(.f, .x, invoke, ...)
}
#' @rdname invoke
#' @export
invoke_map_dbl <- function(.f, .x = list(NULL), ...) {
  .f <- as_invoke_function(.f)
  map2_dbl(.f, .x, invoke, ...)
}
#' @rdname invoke
#' @export
invoke_map_chr <- function(.f, .x = list(NULL), ...) {
  .f <- as_invoke_function(.f)
  map2_chr(.f, .x, invoke, ...)
}

#' @rdname invoke
#' @export
invoke_map_df <- function(.f, .x = list(NULL), ...) {
  .f <- as_invoke_function(.f)
  map2_df(.f, .x, invoke, ...)
}


#' @rdname invoke
#' @export
#' @usage NULL
map_call <- function(.x, .f, ...) {
  warning("`map_call()` is deprecated. Please use `invoke()` instead.")
  invoke(.f, .x, ...)
}
