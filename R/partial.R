#' Partial apply a function, filling in some arguments.
#'
#' Partial function application allows you to modify a function by pre-filling
#' some of the arguments.  It is particularly useful in conjunction with
#' functionals and other function operators.
#'
#' @section Design choices:
#'
#' There are many ways to implement partial function application in R.
#' (see e.g. `dots` in \url{https://github.com/crowding/ptools} for another
#' approach.)  This implementation is based on creating functions that are as
#' similar as possible to the anonymous functions that you'd create by hand,
#' if you weren't using `partial`.
#'
#' @param ...f a function. For the output source to read well, this should be an
#'   be a named function.
#' @param ... named arguments to `...f` that should be partially applied.
#' @param .env the environment of the created function. Defaults to
#'   [parent.frame()] and you should rarely need to modify this.
#' @param .lazy If `TRUE` arguments evaluated lazily, if `FALSE`,
#'   evaluated when `partial` is called.
#' @param .first If `TRUE`, the partialized arguments are placed
#'   to the front of the function signature. If `FALSE`, they are
#'   moved to the back. Only useful to control position matching of
#'   arguments when the partialized arguments are not named.
#' @export
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
#' # You can override this by saying .lazy = FALSE
#' f <- partial(runif, n = rpois(1, 5), .lazy = FALSE)
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
#' # It also works with primitive functions:
#' minus1 <- partial(`-`, e1 = 10)
#' minus2 <- partial(`-`, e2 = 10)
#' minus1(3)
#' minus2(3)
#'
#' map(1:5, partial(`-`, e2 = 10))
partial <- function(...f, ..., .env = parent.frame(), .lazy = TRUE, .first) {
  if (!missing(.first)) {
    warn("`.first` is deprecated and has no longer any effect")
  }

  ...f <- rlang::as_function(...f)

  # FIXME: Is it good UI that splicing syntax changes with `.lazy` value?
  if (.lazy) {
    dots <- tidy_quotes(...)
    dots <- map(dots, lang, .fn = quote(rlang::tidy_eval))
  } else {
    dots <- dots_list(...)
  }

  body(...f) <- tidy_quote_expr({
    !!! imap(dots, function(x, n) lang("<-", symbol(n), x))

    NULL # FIXME: This NULL is a workaround for a bug in tidy_interp()

    !!! body(...f)
  })

  # Remove arguments
  # FIXME: unnamed NULLs do not remove positionally yet
  dots <- map(dots, function(...) NULL)
  fmls <- node_modify(fn_fmls(...f), spliced(dots))
  formals(...f) <- fmls

  ...f
}
