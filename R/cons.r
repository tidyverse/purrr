#' Cons operators
#'
#' The cons operators construct lists from a lhs and a rhs.
#' \code{\%:\%} wraps its arguments in a list automatically, while
#' \code{\%::\%}, \code{\%.:\%}, \code{\%:.\%} and \code{\%..\%} allow
#' for fine-grained control of which argument is wrapped and which is
#' left as is.
#'
#' \enumerate{
#'   \item \code{\%:\%} wraps its non-list arguments in a list. Only
#'         non-object lists are considered as lists by \code{\%:\%}.
#'         Thus, a data.frame is a non-list argument and will get
#'         wrapped in a list before concatenation.
#'   \item \code{\%::\%} wraps both its arguments in a list.
#'   \item \code{\%.:\%} wraps only its right hand side in a list.
#'   \item \code{\%:.\%} wraps only its left hand side in a list.
#'   \item \code{\%..\%} does not wrap any argument in a list.
#'         \code{a \%..\% b} is equivalent to \code{c(a, b)} and
#'         can also be used to create non-list vectors.
#' }
#' @name cons
#' @examples
#' 1:3 %:% 4
#'
#' # Create a list of fitted models. `lm` objects are lists but have
#' # a class attribute. Thus `%:%` encloses them in a list before binding
#' # them.
#' fits <-
#'   lm(mpg ~ cyl, mtcars) %:%
#'   lm(disp ~ cyl, mtcars)
#'
#' # Here, `%:%` only wraps the right hand side.
#' coefs <- fits %:%
#'   lm(hp ~ cyl, mtcars) %>%
#'   map(coef)
#' @export
`%:%` <- function(lhs, rhs) {
  if (is.object(lhs) || !is.list(lhs))
    lhs <- list(lhs)
  if (is.object(rhs) || !is.list(rhs))
    rhs <- list(rhs)

  c(lhs, rhs)
}

#' @rdname cons
#' @export
`%::%` <- function(lhs, rhs) {
  c(list(lhs), list(rhs))
}

#' @rdname cons
#' @export
`%.:%` <- function(lhs, rhs) {
  c(lhs, list(rhs))
}

#' @rdname cons
#' @export
`%:.%` <- function(lhs, rhs) {
  c(list(lhs), rhs)
}

#' @rdname cons
#' @export
`%..%` <- function(lhs, rhs) {
  c(lhs, rhs)
}
