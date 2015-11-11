#' Partial apply a function, filling in some arguments.
#'
#' Partial function application allows you to modify a function by pre-filling
#' some of the arguments.  It is particularly useful in conjunction with
#' functionals and other function operators.
#'
#' @section Design choices:
#'
#' There are many ways to implement partial function application in R.
#' (see e.g. \code{dots} in \url{https://github.com/crowding/ptools} for another
#' approach.)  This implementation is based on creating functions that are as
#' similar as possible to the anonymous function that'd you'd create by hand,
#' if you weren't using \code{partial}.
#'
#' @param ...f a function. For the output source to read well, this should be an
#'   be a named function.
#' @param ... named arguments to \code{...f} that should be partially applied.
#' @param .env the environment of the created function. Defaults to
#'   \code{\link{parent.frame}} and you should rarely need to modify this.
#' @param .lazy If \code{TRUE} arguments evaluated lazily, if \code{FALSE},
#'   evaluated when \code{partial} is called.
#' @param .first If \code{TRUE}, the partialized arguments are placed
#'   to the front of the function signature. If \code{FALSE}, they are
#'   moved to the back. Only useful to control position matching of
#'   arguments when the partialized arguments are not named.
#' @export
#' @examples
#' # Partial is designed to replace the use of anonymous functions for
#' # filling in function arguments. Instead of:
#' compact1 <- function(x) discard(x, is.null)
#'
#' # we can write:
#' compact2 <- partial(discard, .f = is.null)
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
partial <- function(...f, ..., .env = parent.frame(), .lazy = TRUE, .first = TRUE) {
  stopifnot(is.function(...f))

  if (.lazy) {
    fcall <- substitute(...f(...))
  } else {
    fcall <- make_call(substitute(...f), .args = list(...))
  }

  # Pass on ... from parent function
  n <- length(fcall)
  if (!.first && n > 1) {
    tmp <- fcall[1]
    tmp[[2]] <- quote(...)
    tmp[seq(3, n + 1)] <- fcall[seq(2, n)]
    names(tmp)[seq(3, n + 1)] <- names2(fcall)[seq(2, n)]
    fcall <- tmp
  } else {
    fcall[[n + 1]] <- quote(...)
  }

  args <- list("..." = quote(expr = ))
  make_function(args, fcall, .env)
}

make_call <- function(f, ..., .args = list()) {
  if (is.character(f)) f <- as.name(f)
  as.call(c(f, ..., .args))
}

make_function <- function(args, body, env = parent.frame()) {
  args <- as.pairlist(args)
  stopifnot(is.call(body) || is.name(body) || is.atomic(body))
  env <- as.environment(env)

  eval(call("function", args, body), env)
}
