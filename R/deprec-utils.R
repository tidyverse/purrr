#' Infix attribute accessor
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 0.3.0. Instead, lease use the `%@%`
#' operator exported in rlang. It has an interface more consistent with `@`:
#' uses NSE, supports S4 fields, and has an assignment variant.
#'
#' @param x Object
#' @param name Attribute name
#' @export
#' @name get-attr
#' @keywords internal
`%@%` <- function(x, name) {
  lifecycle::deprecate_warn("0.3.0", I("%@%"), I("rlang::%@%"), always = TRUE)
  attr(x, name, exact = TRUE)
}

#' Generate random sample from a Bernoulli distribution
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 1.0.0 because it's not related to the
#' core purpose of purrr.
#'
#' @param n Number of samples
#' @param p Probability of getting `TRUE`
#' @return A logical vector
#' @keywords internal
#' @export
#' @examples
#' rbernoulli(10)
#' rbernoulli(100, 0.1)
rbernoulli <- function(n, p = 0.5) {
  lifecycle::deprecate_soft("1.0.0", "rbernoulli()")
  stats::runif(n) > (1 - p)
}

#' Generate random sample from a discrete uniform distribution
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 1.0.0 because it's not related to the
#' core purpose of purrr.
#'
#' @param n Number of samples to draw.
#' @param a,b Range of the distribution (inclusive).
#' @keywords internal
#' @export
#' @examples
#' table(rdunif(1e3, 10))
#' table(rdunif(1e3, 10, -5))
rdunif <- function(n, b, a = 1) {
  lifecycle::deprecate_soft("1.0.0", "rdunif()")

  stopifnot(is.numeric(a), length(a) == 1)
  stopifnot(is.numeric(b), length(b) == 1)

  a1 <- min(a, b)
  b1 <- max(a, b)

  sample(b1 - a1 + 1, n, replace = TRUE) + a1 - 1
}
