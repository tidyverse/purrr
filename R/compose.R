#' Compose multiple functions
#'
#' @param ... Functions to apply in order (from right to left by
#'   default). Formulas are converted to functions in the usual way.
#'
#'   These dots support [tidy dots][rlang::list2] features. In
#'   particular, if your functions are stored in a list, you can
#'   splice that in with `!!!`.
#' @param .dir If `"backward"` (the default), the functions are called
#'   in the reverse order, from right to left, as is conventional in
#'   mathematics. If `"forward"`, they are called from left to right.
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
#' # You can use the formula shortcut for functions:
#' fn <- compose(~ paste(.x, "foo"), ~ paste(.x, "bar"))
#' fn("input")
#'
#' # Lists of functions can be spliced with !!!
#' fns <- list(
#'   function(x) paste(x, "foo"),
#'   ~ paste(.x, "bar")
#' )
#' fn <- compose(!!!fns)
#' fn("input")
compose <- function(..., .dir = c("backward", "forward")) {
  .dir <- arg_match(.dir, c("backward", "forward"))

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

  body <- expr({
    out <- !!fn_body(first_fn)

    fns <- !!fns
    for (fn in fns) {
      out <- fn(out)
    }

    out
  })

  structure(
    new_function(formals(first_fn), body, fn_env(first_fn)),
    class = "purrr_composed_fn",
    first_fn = first_fn,
    fns = fns
  )
}

#' @export
print.purrr_composed_fn <- function(x, ...) {
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
