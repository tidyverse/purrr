#' Set names in a vector
#'
#' This is a snake case wrapper for \code{\link[stats]{setNames}}, with
#' tweaked defaults, and stricter argument checking.
#'
#' @param x Vector to name
#' @param nm Vector of names, the same length as \code{x}
#' @export
#' @examples
#' set_names(1:4, c("a", "b", "c", "d"))
#'
#' # If the second argument is ommitted a vector is named with itself
#' set_names(letters[1:5])
set_names <- function(x, nm = x) {
  if (!is_vector(x)) {
    stop("`x` must be a vector", call. = FALSE)
  }
  if (length(x) != length(x)) {
    stop("`x` and `nm` must be the same length", call. = FALSE)
  }

  names(x) <- nm
  x
}
