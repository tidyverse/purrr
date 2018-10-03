#' Compose multiple functions
#'
#' @param ... n functions to apply in order from right to left.
#' @return A function
#' @export
#' @examples
#' not_null <- compose(`!`, is.null)
#' not_null(4)
#' not_null(NULL)
#'
#' add1 <- function(x) x + 1
#' compose(add1, add1)(8)
compose <- function(...) {

  # Keep compatibility for composition with character vectors

  fs <- lapply(list(...), function(x) ifelse( is.character(x), match.fun(x), rlang::as_function(x) ) )

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
