#' Find head/tail that all satisfies a predicate.
#'
#' @inheritParams map_if
#' @inheritParams map
#' @return A vector the same type as `.x`.
#' @export
#' @examples
#' pos <- function(x) x >= 0
#' head_while(5:-5, pos)
#' tail_while(5:-5, negate(pos))
#'
#' big <- function(x) x > 100
#' head_while(0:10, big)
#' tail_while(0:10, big)
head_while <- function(.x, .p, ...) {
  # Find location of first FALSE
  .p <- as_predicate(.p, ..., .mapper = TRUE)
  loc <- detect_index(.x, negate(.p), ...)
  if (loc == 0) {
    return(.x)
  }

  .x[seq_len(loc - 1)]
}

#' @export
#' @rdname head_while
tail_while <- function(.x, .p, ...) {
  .p <- as_predicate(.p, ..., .mapper = TRUE)
  # Find location of last FALSE
  loc <- detect_index(.x, negate(.p), ..., .dir = "backward")
  if (loc == 0) {
    return(.x)
  }

  .x[-seq_len(loc)]
}
