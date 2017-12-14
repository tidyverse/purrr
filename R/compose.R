#' Compose multiple functions
#'
#' @param ... n functions to apply in order from right to left.
#' @return A function
#'
#' @export
#' @examples
#' not_null <- compose(`!`, "is.null")
#' not_null(4)
#' not_null(NULL)
#'
#' add1 <- function(x) x + 1
#' compose(add1, add1)(8)
compose <- function(...) {
  # characters args are get() to mimic
  # match.fun behavior
  args <- modify_if(list(...), is.character, get)
  fs <- lapply(args, as_mapper)
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


