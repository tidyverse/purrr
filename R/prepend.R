#' Prepend a vector
#'
#' This is a companion to [append()] to help merging two
#' lists or atomic vectors. `prepend()` is a clearer semantic
#' signal than `c()` that a vector is to be merged at the beginning of
#' another, especially in a pipe chain.
#'
#' @param x the vector to be modified.
#' @param values to be included in the modified vector.
#' @param before a subscript, before which the values are to be appended.
#' @return A merged vector.
#' @export
#' @examples
#' x <- as.list(1:3)
#'
#' x %>% append("a")
#' x %>% prepend("a")
#' x %>% prepend(list("a", "b"), before = 3)
prepend <- function(x, values, before = 1) {
  n <- length(x)
  stopifnot(before > 0 && before <= n)

  if (before == 1) {
    c(values, x)
  } else {
    c(x[1:(before - 1)], values, x[before:n])
  }
}
