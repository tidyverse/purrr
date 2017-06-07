#' Invoke functions.
#'
#' This pair of functions make it easier to combine a function and list
#' of parameters to get a result. `invoke` is a wrapper around
#' `do.call` that makes it easy to use in a pipe. `invoke_map`
#' makes it easier to call lists of functions with lists of parameters.
#'
#' @param .f For `invoke`, a function; for `invoke_map` a
#'   list of functions.
#' @param .x For `invoke`, an argument-list; for `invoke_map` a
#'   list of argument-lists the same length as `.f` (or length 1).
#'   The default argument, `list(NULL)`, will be recycled to the
#'   same length as `.f`, and will call each function with no
#'   arguments (apart from any supplied in `...`.
#' @param ... Additional arguments passed to each function.
#' @param .env Environment in which [do.call()] should
#'   evaluate a constructed expression. This only matters if you pass
#'   as `.f` the name of a function rather than its value, or as
#'   `.x` symbols of objects rather than their values.
#' @inheritParams map
#' @export
#' @family map variants
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
#'   invoke(paste, ., sep = "-")
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
#' # to store them in a data frame. Here we use a tibble because
#' # it has better support for list-columns
#' df <- tibble::tibble(
#'   f = c("runif", "rpois", "rnorm"),
#'   params = list(
#'     list(n = 10),
#'     list(n = 5, lambda = 10),
#'     list(n = 10, mean = -3, sd = 10)
#'   )
#' )
#' df
#' invoke_map(df$f, df$params)
invoke <- function(.f, .x = NULL, ..., .env = NULL) {
  .env <- .env %||% parent.frame()

  args <- c(as.list(.x), list(...))
  do.call(.f, args, envir = .env)
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
invoke_map <- function(.f, .x = list(NULL), ..., .env = NULL) {
  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_lgl <- function(.f, .x = list(NULL), ..., .env = NULL) {
  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_lgl(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_int <- function(.f, .x = list(NULL), ..., .env = NULL) {
  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_int(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_dbl <- function(.f, .x = list(NULL), ..., .env = NULL) {
  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_dbl(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_chr <- function(.f, .x = list(NULL), ..., .env = NULL) {
  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_chr(.f, .x, invoke, ..., .env = .env)
}

#' @rdname invoke
#' @export
invoke_map_dfr <- function(.f, .x = list(NULL), ..., .env = NULL) {
  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_dfr(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_dfc <- function(.f, .x = list(NULL), ..., .env = NULL) {
  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_dfc(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
#' @usage NULL
invoke_map_df <- invoke_map_dfr


#' @rdname invoke
#' @export
#' @usage NULL
map_call <- function(.x, .f, ...) {
  warning("`map_call()` is deprecated. Please use `invoke()` instead.")
  invoke(.f, .x, ...)
}
