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
#' @param ...f a function. For the output source to read well, this should be a
#'   named function.
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
partial <- function(...f, ..., .first = TRUE, .env, .lazy) {
  if (!missing(.env))
    abort("`.env` is deprecated")
  if (!missing(.lazy))
    abort("`.lazy` is deprecated; use unquoting to enforce eager evaluation")

  f <- as_closure(...f)
  args <- quos(...)

  if (is_empty(args))
    return(f)

  `__subst_args` <- function(call) {
    vals <- lapply(args, eval_tidy)
    subst_vals(call, vals)
  }
  if (.first)
    subst_vals <- function(call, vals) as.call(c(f, vals, node_cdr(call)))
  else
    subst_vals <- function(call, vals) as.call(c(f, node_cdr(call), vals))

  set_attrs(
    function(...) {
      call <- `__subst_args`(sys.call())
      eval_bare(call, parent.frame())
    },
    class = "partial_function"
  )
}

#' @export
print.partial_function <- function(x, ...) {
  cat("<partial_function>\n")
  cat("\n* Default values:\n")
  cat(itemize_vals(environment(x)$args), "\n", sep = "")
  cat("\n* Original function:\n")
  print(environment(x)$f)
  invisible(x)
}
itemize_vals <- function(args) {
  vals <- lapply(args, quo_expr)
  nms <- names(vals)
  nms[nzchar(nms)] <- sprintf("%s = ", nms[nzchar(nms)])
  paste(paste0(nms, vals), collapse = "\n")
}
