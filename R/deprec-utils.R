#' Generate random sample from a Bernoulli distribution
#'
#' @description
#' `r lifecycle::badge("defunct")`
#'
#' This function was deprecated in purrr 1.0.0 and is now defunct because it's
#' not related to the core purpose of purrr.
#'
#' @param n Number of samples
#' @param p Probability of getting `TRUE`
#' @return A logical vector
#' @keywords internal
#' @export
rbernoulli <- function(n, p = 0.5) {
  lifecycle::deprecate_stop("1.0.0", "rbernoulli()")
}

#' Generate random sample from a discrete uniform distribution
#'
#' @description
#' `r lifecycle::badge("defunct")`
#'
#' This function was deprecated in purrr 1.0.0 and is now defunct because it's
#' not related to the core purpose of purrr.
#'
#' @param n Number of samples to draw.
#' @param a,b Range of the distribution (inclusive).
#' @keywords internal
#' @export
rdunif <- function(n, b, a = 1) {
  lifecycle::deprecate_stop("1.0.0", "rdunif()")
}
