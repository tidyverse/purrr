#' Pipe operator
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

maybe_as_data_frame <- function(out, x) {
  if (is.data.frame(x)) {
    tibble::as_tibble(out)
  } else {
    out
  }
}

recycle_args <- function(args) {
  lengths <- map_int(args, length)
  n <- max(lengths)

  stopifnot(all(lengths == 1L | lengths == n))
  to_recycle <- lengths == 1L
  args[to_recycle] <- lapply(args[to_recycle], function(x) rep.int(x, n))
  args
}

names2 <- function(x) {
  names(x) %||% rep("", length(x))
}

#' Default value for `NULL`.
#'
#' This infix function makes it easy to replace `NULL`s with a
#' default value. It's inspired by the way that Ruby's or operation (`||`)
#' works.
#'
#' @param x,y If `x` is NULL, will return `y`; otherwise returns
#'   `x`.
#' @export
#' @name null-default
#' @examples
#' 1 %||% 2
#' NULL %||% 2
`%||%` <- function(x, y) {
  if (is.null(x)) {
    y
  } else {
    x
  }
}

#' Infix attribute accessor
#'
#' @param x Object
#' @param name Attribute name
#' @export
#' @name get-attr
#' @examples
#' factor(1:3) %@% "levels"
#' mtcars %@% "class"
`%@%` <- function(x, name) attr(x, name, exact = TRUE)


#' Generate random sample from a Bernoulli distribution
#'
#' @param n Number of samples
#' @param p Probability of getting `TRUE`
#' @return A logical vector
#' @export
#' @examples
#' rbernoulli(10)
#' rbernoulli(100, 0.1)
rbernoulli <- function(n, p = 0.5) {
  stats::runif(n) > (1 - p)
}

#' Generate random sample from a discrete uniform distribution
#'
#' @param n Number of samples to draw.
#' @param a,b Range of the distribution (inclusive).
#' @export
#' @examples
#' table(rdunif(1e3, 10))
#' table(rdunif(1e3, 10, -5))
rdunif <- function(n, b, a = 1) {
  stopifnot(is.numeric(a), length(a) == 1)
  stopifnot(is.numeric(b), length(b) == 1)

  a1 <- min(a, b)
  b1 <- max(a, b)

  sample(b1 - a1 + 1, n, replace = TRUE) + a1 - 1
}

# magrittr placeholder
globalVariables(".")


has_names <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep_along(x, FALSE)
  } else {
    !(is.na(nms) | nms == "")
  }
}

ndots <- function(...) nargs()
