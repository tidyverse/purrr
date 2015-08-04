#' Predicate function operator that creates new predicate functions linked by the || operator.
#'
#' @param ... n functions to apply in order from left to right
#' @return A predicate function linked by the || operator.
#' @family predicate function operators
#' @seealso \code{\link{Andify}} to create new predicate functions linked by the && operator.
#' @examples
#' # Examples
#' is_character_or_factor <- orify(is.character, is.factor)
#' is_character_or_factor(letters) # TRUE
#' is_character_or_factor(factor(state.abb)) # TRUE
#' is_character_or_factor(1:100) # FALSE
#' @export
orify <- function(...) {
  fs <- lapply(list(...), match.fun)
  first <- fs[[1]]
  rest <- fs[-1]

  function(...) {
    out <- first(...)
    for (f in rest) {
      if (out) return(TRUE)
      out <- `||`(out, f(...))
    }
    out
  }
}
