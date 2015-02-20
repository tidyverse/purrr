#' Find head/tail that all satisfies a predicate.
#'
#' @inheritParams map_if
#' @inheritParams map
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
  loc <- detect_index(.x, negate(.p), ...)
  if (loc == 0) return(.x)

  .x[seq_len(loc - 1)]
}

#' @export
#' @rdname head_while
tail_while <- function(.x, .p, ...) {
  # Find location of last FALSE
  loc <- detect_index(.x, negate(.p), ..., .right = TRUE)
  if (loc == 0) return(.x)

  .x[-seq_len(loc)]
}
