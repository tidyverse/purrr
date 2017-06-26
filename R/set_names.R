#' @title Set names in a vector
#'
#' @details
#' This is a snake case wrapper for [stats::setNames()], with
#' tweaked defaults, and stricter argument checking.
#'
#' @usage set_names(x, nm = x, ...)
#' @param x Vector to name
#' @param nm,... Vector of names, the same length as `x`.
#'
#'   You can specify names in three ways:
#'
#'   * If you do nothing, `x` will be named with itself
#'
#'   * You can supply either a character vector to `nm` or individual
#'     strings in to `...``
#'
#'   * If `x` already has names, you can provide a function or formula
#'     to transform the existing names.
#'
#' @return `.x` with the names attribute set.
#' @export
#' @examples
#' set_names(1:4, c("a", "b", "c", "d"))
#' set_names(1:4, letters[1:4])
#' set_names(1:4, "a", "b", "c", "d")
#'
#' # If the second argument is ommitted a vector is named with itself
#' set_names(letters[1:5])
#'
#' # Alternatively you can supply a function
#' set_names(1:10, ~ letters[seq_along(.)])
#' set_names(head(mtcars), toupper)
#' @name set_names
rlang::set_names
