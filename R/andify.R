#' Predicate function operator that creates new predicate functions linked by the && operator.
#'
#' @param ... n functions to apply in order from left to right.
#' @return A predicate function linked by the && operator.
#' @family predicate function operators
#' @seealso \code{\link{Orify}} to create new predicate functions linked by the || operator.
#' @examples
#' # Examples
#' is_numeric <- is.numeric
#' is_even <- function(x) x %% 2 == 0
#' greater_than_10 <- function(x) x > 10
#' less_than_100 <- function(x) x < 100
#' even_number_between_10_and_100 <-
#' andify(is_numeric, is_even, greater_than_10, less_than_100)
#' even_number_between_10_and_100(8) # FALSE
#' even_number_between_10_and_100(9) # FALSE
#' even_number_between_10_and_100(10) # FALSE
#' even_number_between_10_and_100(11) # FALSE
#' even_number_between_10_and_100(12) # TRUE
#' even_number_between_10_and_100(49) # FALSE
#' even_number_between_10_and_100(50) # TRUE
#' even_number_between_10_and_100(100) # FALSE
#' even_number_between_10_and_100(101) # FALSE
#' even_number_between_10_and_100(102) # FALSE
#' @export
andify <- function(...) {
  fs <- lapply(list(...), match.fun)
  if (length(fs) == 0) stop("Must pass at least one argument.")
  first <- fs[[1]]
  rest <- fs[-1]

  function(...) {
    out <- first(...)
    for (f in rest) {
      if (!out) return(FALSE)
      out <- `&&`(out, f(...))
    }
    out
  }
}
