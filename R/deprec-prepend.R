#' Prepend a vector
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 1.0.0 because it's not related to the
#' core purpose of purrr.
#'
#' This is a companion to [append()] to help merging two
#' lists or atomic vectors. `prepend()` is a clearer semantic
#' signal than `c()` that a vector is to be merged at the beginning of
#' another, especially in a pipe chain.
#'
#' @param x the vector to be modified.
#' @param values to be included in the modified vector.
#' @param before a subscript, before which the values are to be appended. If
#'   `NULL`, values will be appended at the beginning even for `x` of length 0.
#' @return A merged vector.
#' @keywords internal
#' @export
#' @examples
#' x <- as.list(1:3)
#'
#' x |> append("a")
#' x |> prepend("a")
#' x |> prepend(list("a", "b"), before = 3)
#' prepend(list(), x)
prepend <- function(x, values, before = NULL) {
  lifecycle::deprecate_soft("1.0.0", "prepend()", I("append(after = 0)"))

  n <- length(x)
  stopifnot(is.null(before) || (before > 0 && before <= n))

  if (is.null(before) || before == 1) {
    c(values, x)
  } else {
    c(x[1:(before - 1)], values, x[before:n])
  }
}
