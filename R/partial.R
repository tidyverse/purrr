#' Partial apply a function, filling in some arguments.
#'
#' Partial function application allows you to modify a function by pre-filling
#' some of the arguments.  It is particularly useful in conjunction with
#' functionals and other function operators.
#'
#' @param .f a function. For the output source to read well, this should be a
#'   named function.
#' @param ... named arguments to `.f` that should be partially applied.
#'
#'   Pass an empty `... = ` argument to specify the position of future
#'   arguments relative to partialised ones. See
#'   [rlang::call_modify()] to learn more about this syntax.
#'
#'   These dots support quasiquotation and quosures. If you unquote a
#'   value, it is evaluated only once at function creation time.
#'   Otherwise, it is evaluated each time the function is called.
#' @param .env Soft-deprecated as of purrr 0.3.0. The environments are
#'   now captured via quosures.
#' @param .first Soft-deprecated as of purrr 0.3.0. Please pass an
#'   empty argument `... = ` to specify the position of future
#'   arguments.
#' @param .lazy Soft-deprecated as of purrr 0.3.0. Please unquote the
#'   arguments that should be evaluated once at function creation time.
#'
#' @examples
#' # Partial is designed to replace the use of anonymous functions for
#' # filling in function arguments. Instead of:
#' compact1 <- function(x) discard(x, is.null)
#'
#' # we can write:
#' compact2 <- partial(discard, .p = is.null)
#'
#' # and the generated source code is very similar to what we made by hand
#' compact1
#' compact2
#'
#' # Note that the evaluation occurs "lazily" so that arguments will be
#' # repeatedly evaluated
#' f <- partial(runif, n = rpois(1, 5))
#' f
#' f()
#' f()
#'
#' # If you unquote an argument, it is evaluated only once at function
#' # creation time:
#' f <- partial(runif, n = !!rpois(1, 5))
#' f
#' f()
#' f()
#'
#' # This also means that partial works fine with functions that do
#' # non-standard evaluation
#' my_long_variable <- 1:10
#' plot2 <- partial(plot, my_long_variable)
#' plot2()
#' plot2(runif(10), type = "l")
#'
#'
#' # By default, partialised arguments are passed before new ones:
#' my_list <- partial(list, 1, 2)
#' my_list("foo")
#'
#' # Control the position of these arguments by passing an empty
#' # `... = ` argument:
#' my_list <- partial(list, 1, ... = , 2)
#' my_list("foo")
#' @export
partial <- function(.f,
                    ...,
                    .env = NULL,
                    .lazy = NULL,
                    .first = NULL) {
  args <- enquos(...)
  if (has_name(args, "...f")) {
    stop_defunct("`...f` has been renamed to `.f` as of purrr 0.3.0.")
  }

  fn_expr <- enexpr(.f)
  fn <- switch(typeof(.f),
    builtin = ,
    special =
      as_closure(.f),
    closure =
      .f,
    abort(sprintf("`.f` must be a function, not a %s", friendly_type_of(.f)))
  )

  if (!is_null(.env)) {
    signal_soft_deprecated(paste_line(
      "The `.env` argument is soft-deprecated as of purrr 0.3.0.",
    ))
  }
  if (!is_null(.lazy)) {
    signal_soft_deprecated(paste_line(
      "The `.lazy` argument is soft-deprecated as of purrr 0.3.0.",
      "Please unquote the arguments that should be evaluated once and for all.",
      "",
      "  # Before:",
      "  partial(fn, u = runif(1), n = rnorm(1), .lazy = FALSE)",
      "",
      "  # After:",
      "  partial(fn, u = !!runif(1), n = !!rnorm(1))  # All constant",
      "  partial(fn, u = !!runif(1), n = rnorm(1))    # First constant"
    ))
    if (!.lazy) {
      args <- map(args, eval_tidy, env = caller_env())
    }
  }
  if (!is_null(.first)) {
    signal_soft_deprecated(paste_line(
      "The `.first` argument is soft-deprecated as of purrr 0.3.0.",
      "Please pass a `... =` argument instead.",
      "",
      "  # Before:",
      "  partial(fn, x = 1, y = 2, .first = FALSE)",
      "",
      "  # After:",
      "  partial(fn, x = 1, y = 2, ... = )  # Partialised arguments last",
      "  partial(fn, x = 1, ... = , y = 2)  # Partialised arguments around"
    ))
  }

  if (is_false(.first)) {
    # For compatibility
    call <- call_modify(call2(fn), ... = , !!!args)
  } else {
    # Pass on `...` from parent function. It should be last, this way if
    # `args` also contain a `...` argument, the position in `args`
    # prevails.
    call <- call_modify(call2(fn), !!!args, ... = )
  }

  # Unwrap quosured arguments if possible
  call <- quo_invert(call)

  # Derive a mask where dots can be forwarded
  mask <- new_data_mask(env())

  partialised <- function(...) {
    env_bind(mask, ... = env_get(current_env(), "..."))
    eval_tidy(call, mask)
  }

  structure(
    partialised,
    class = c("purrr_function_partial", "function"),
    body = call,
    fn = fn_expr
  )
}

#' @export
print.purrr_function_partial <- function(x, ...) {
  cat("<partialised>\n")

  body <- quo_squash(partialised_body(x))
  body[[1]] <- partialised_fn(x)
  body(x) <- body

  # Remove reference to internal environment
  x <- set_env(x, global_env())

  print(x, ...)
}

partialised_body <- function(x) attr(x, "body")
partialised_fn <- function(x) attr(x, "fn")
