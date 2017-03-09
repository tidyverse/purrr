#' Set names in a vector
#'
#' This is a snake case wrapper for [stats::setNames()], with
#' tweaked defaults, and stricter argument checking.
#'
#' @param x Vector to name
#' @param nm Vector of names, the same length as `x`.
#'
#'   If `x` already has names, you can provide a function or formula
#'   to transform the existing names.
#' @return `.x` with the names attribute set.
#' @export
#' @examples
#' set_names(1:4, c("a", "b", "c", "d"))
#'
#' # If the second argument is ommitted a vector is named with itself
#' set_names(letters[1:5])
#'
#' # Alternatively you can supply a function
#' set_names(1:10, ~ letters[seq_along(.)])
#' set_names(head(mtcars), toupper)
set_names <- function(x, nm = x) {
  if (!is_vector(x)) {
    stop("`x` must be a vector", call. = FALSE)
  }

  if (is.function(nm) || is_formula(nm)) {
    nm <- as_mapper(nm)
    nm <- nm(names2(x))
  }

  if (length(x) != length(nm)) {
    stop("`nm` must be the same length as `x`", call. = FALSE)
  }

  names(x) <- nm
  x
}
