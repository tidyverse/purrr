#' Compose multiple functions
#'
#' @param ... Functions to apply in order from right to left. Formulas
#'   are converted to functions in the usual way.
#'
#'   These dots support [tidy dots features][rlang::list2]. In particular, you can
#'   splice lists of functions with `!!!`.
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
compose <- function(...) {
  fs <- map(list2(...), rlang::as_function, env = caller_env())

  n <- length(fs)

  last <- fs[[n]]
  rest <- fs[-n]

  function(...) {
    out <- last(...)
    for (f in rev(rest)) {
      out <- f(out)
    }
    out
  }
}
