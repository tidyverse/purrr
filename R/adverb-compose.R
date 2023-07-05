#' Compose multiple functions together to create a new function
#'
#' Create a new function that is the composition of multiple functions,
#' i.e. `compose(f, g)` is equivalent to `function(...) f(g(...))`.
#'
#' @param ... Functions to apply in order (from right to left by
#'   default). Formulas are converted to functions in the usual way.
#'
#'   [Dynamic dots][rlang::dyn-dots] are supported. In particular, if
#'   your functions are stored in a list, you can splice that in with
#'   `!!!`.
#' @param .dir If `"backward"` (the default), the functions are called
#'   in the reverse order, from right to left, as is conventional in
#'   mathematics. If `"forward"`, they are called from left to right.
#' @inheritSection safely Adverbs
#' @family adverbs
#' @return A function
#' @export
#' @examples
#' not_null <- compose(`!`, is.null)
#' not_null(4)
#' not_null(NULL)
#'
#' add1 <- function(x) x + 1
#' compose(add1, add1)(8)
#'
#' fn <- compose(\(x) paste(x, "foo"), \(x) paste(x, "bar"))
#' fn("input")
#'
#' # Lists of functions can be spliced with !!!
#' fns <- list(
#'   function(x) paste(x, "foo"),
#'   \(x) paste(x, "bar")
#' )
#' fn <- compose(!!!fns)
#' fn("input")
compose <- function(..., .dir = c("backward", "forward")) {
  .dir <- arg_match0(.dir, c("backward", "forward"))

  fns <- map(list2(...), rlang::as_closure, env = caller_env())
  if (!length(fns)) {
    # Return the identity function
    return(compose(function(x, ...) x))
  }

  if (.dir == "backward") {
    n <- length(fns)
    first_fn <- fns[[n]]
    fns <- rev(fns[-n])
  } else {
    first_fn <- fns[[1]]
    fns <- fns[-1]
  }

  composed <- function() {
    env <- env(caller_env(), `_fn` = first_fn)

    first_call <- sys.call()
    first_call[[1]] <- quote(`_fn`)
    env$`_out` <- .Call(purrr_eval, first_call, env)

    call <- quote(`_fn`(`_out`))

    for (fn in fns) {
      env$`_fn` <- fn
      env$`_out` <- .Call(purrr_eval, call, env)
    }

    env$`_out`
  }
  formals(composed) <- formals(first_fn)

  structure(
    composed,
    class = c("purrr_function_compose", "function"),
    first_fn = first_fn,
    fns = fns
  )
}

#' @export
print.purrr_function_compose <- function(x, ...) {
  cat("<composed>\n")

  first <- attr(x, "first_fn")
  cat("1. ")
  print(first, ...)

  fns <- attr(x, "fns")
  for (i in seq_along(fns)) {
    cat(sprintf("\n%d. ", i + 1))
    print(fns[[i]], ...)
  }

  invisible(x)
}
