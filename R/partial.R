#' Partial apply a function, filling in some arguments.
#'
#' Partial function application allows you to modify a function by pre-filling
#' some of the arguments.  It is particularly useful in conjunction with
#' functionals and other function operators.
#'
#' @param ...f a function. For the output source to read well, this should be a
#'   named function.
#' @param ... named arguments to `...f` that should be partially applied.
#'
#'   These dots support quasiquotation and quosures. If you unquote a
#'   value, it is evaluated once and for all when the argument is
#'   partialised. Otherwise, it is evaluated each time the function is
#'   called.
#' @param .env Soft-deprecated as of purrr 0.3.0. The environments are
#'   now captured via quosures.
#' @param .first If `TRUE`, the partialized arguments are placed
#'   to the front of the function signature. If `FALSE`, they are
#'   moved to the back. Only useful to control position matching of
#'   arguments when the partialized arguments are not named.
#' @param .lazy Soft-deprecated as of purrr 0.3.0. Please unquote the
#'   arguments that should be evaluated once and for all.
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
#' # If you unquote an argument, it is evaluated once and for all:
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
#' @export
partial <- function(...f,
                    ...,
                    .env = NULL,
                    .lazy = NULL,
                    .first = TRUE) {
  fn <- enquo(...f)
  stopifnot(is.function(...f))

  args <- enquos(...)

  fn <- switch(typeof(...f),
    builtin = ,
    special =
      as_closure(...f),
    closure =
      fn,
    abort(sprintf("`...f` must be a function, not a %s", friendly_type_of(...f)))
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

  # Pass on ... from parent function
  if (.first) {
    call <- call_modify(call2(fn), !!!args, ... = )
  } else {
    call <- call_modify(call2(fn), ... = , !!!args)
  }

  partialised <- function(...) {
    eval_tidy(call)
  }

  structure(
    partialised,
    class = "purrr_partial_function",
    body = call
  )
}

#' @export
print.purrr_partial_function <- function(x, ...) {
  cat("<partialised>\n")

  body <- quo_squash(partialised_body(x))
  body[[1]] <- quo_squash(body[[1]])
  body(x) <- body

  # Remove reference to internal environment
  x <- set_env(x, global_env())

  print(x, ...)
}

partialised_body <- function(x) attr(x, "body")
