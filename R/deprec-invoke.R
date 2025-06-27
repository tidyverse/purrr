#' Invoke functions.
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' These functions were superded in purrr 0.3.0 and deprecated in purrr 1.0.0.
#'
#' * `invoke()` is deprecated in favour of the simpler `exec()` function
#'   reexported from rlang. `exec()` evaluates a function call built
#'   from its inputs and supports [dynamic dots][rlang::dyn-dots]:
#'
#'   ```R
#'   # Before:
#'   invoke(mean, list(na.rm = TRUE), x = 1:10)
#'
#'   # After
#'   exec(mean, 1:10, !!!list(na.rm = TRUE))
#'   ```
#'
#' * `invoke_map()` is deprecated because it's harder to understand than the
#'   corresponding code using `map()`/`map2()` and `exec()`:
#'
#'   ```R
#'   # Before:
#'   invoke_map(fns, list(args))
#'   invoke_map(fns, list(args1, args2))
#'
#'   # After:
#'   map(fns, exec, !!!args)
#'   map2(fns, list(args1, args2), \(fn, args) exec(fn, !!!args))
#'   ```
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
#' @keywords internal
#' @examples
#' # was
#' invoke(runif, list(n = 10))
#' invoke(runif, n = 10)
#' # now
#' exec(runif, n = 10)
#'
#' # was
#' args <- list("01a", "01b")
#' invoke(paste, args, sep = "-")
#' # now
#' exec(paste, !!!args, sep = "-")
#'
#' # was
#' funs <- list(runif, rnorm)
#' funs |> invoke_map(n = 5)
#' funs |> invoke_map(list(list(n = 10), list(n = 5)))
#'
#' # now
#' funs |> map(exec, n = 5)
#' funs |> map2(list(list(n = 10), list(n = 5)), function(f, args) exec(f, !!!args))
#'
#' # or use pmap + a tibble
#' df <- tibble::tibble(
#'   fun = list(runif, rnorm),
#'   args = list(list(n = 10), list(n = 5))
#' )
#' df |> pmap(function(fun, args) exec(fun, !!!args))
#'
#'
#' # was
#' list(m1 = mean, m2 = median) |> invoke_map(x = rcauchy(100))
#' # now
#' list(m1 = mean, m2 = median) |> map(function(f) f(rcauchy(100)))
#'
#' @export
invoke <- function(.f, .x = NULL, ..., .env = NULL) {
  lifecycle::deprecate_soft("1.0.0", "invoke()", "exec()")

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
  lifecycle::deprecate_soft("1.0.0", "invoke_map()", I("map() + exec()"))

  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_lgl <- function(.f, .x = list(NULL), ..., .env = NULL) {
  lifecycle::deprecate_soft("1.0.0", "invoke_lgl()", I("map_lgl() + exec()"))

  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_lgl(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_int <- function(.f, .x = list(NULL), ..., .env = NULL) {
  lifecycle::deprecate_soft("1.0.0", "invoke_int()", I("map_int() + exec()"))

  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_int(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_dbl <- function(.f, .x = list(NULL), ..., .env = NULL) {
  lifecycle::deprecate_soft("1.0.0", "invoke_dbl()", I("map_dbl() + exec()"))

  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_dbl(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_chr <- function(.f, .x = list(NULL), ..., .env = NULL) {
  lifecycle::deprecate_soft("1.0.0", "invoke_chr()", I("map_chr() + exec()"))

  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_chr(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_raw <- function(.f, .x = list(NULL), ..., .env = NULL) {
  lifecycle::deprecate_soft("1.0.0", "invoke_raw()", I("map_raw() + exec()"))

  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)

  map2_("raw", .f, .x, invoke, ...)
}

#' @rdname invoke
#' @export
invoke_map_dfr <- function(.f, .x = list(NULL), ..., .env = NULL) {
  lifecycle::deprecate_soft(
    "1.0.0",
    "invoke_df()",
    I("map() + exec() + list_rbind()")
  )

  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_dfr(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
invoke_map_dfc <- function(.f, .x = list(NULL), ..., .env = NULL) {
  lifecycle::deprecate_soft(
    "1.0.0",
    "invoke_dfc()",
    I("map() + exec() + list_cbind()")
  )

  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_dfc(.f, .x, invoke, ..., .env = .env)
}
#' @rdname invoke
#' @export
#' @usage NULL
invoke_map_df <- function(.f, .x = list(NULL), ..., .env = NULL) {
  lifecycle::deprecate_soft(
    "1.0.0",
    "invoke_df()",
    I("map() + exec() + list_rbind()")
  )

  .env <- .env %||% parent.frame()
  .f <- as_invoke_function(.f)
  map2_dfr(.f, .x, invoke, ..., .env = .env)
}
