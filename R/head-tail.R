#' Find head/tail that all satisfies a predicate.
#'
#' @inheritParams map_if
#' @param .p A predicate function specified in one of the following ways:
#'
#'   * A named function, e.g. `is.character`.
#'   * An anonymous function, e.g. `\(x) all(x < 0)` or `function(x) all(x < 0)`.
#'
#'   * A logical vector of the same length as `.x`.
#'   * A string, if the elements of `.x` are themselves lists of objects,
#'     giving the name of a logical element in the inner lists.
#'
#'   Only those elements where `.p` evaluates to `TRUE` will be kept.
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
  loc <- which_satisfies_predicate(.x, .p, ..., .dir = "forward", .negate = TRUE, .p_arg_name = ".p")
  if (loc == 0) {
    return(.x)
  }

  .x[seq_len(loc - 1)]
}

#' @export
#' @rdname head_while
tail_while <- function(.x, .p, ...) {
  # Find location of last FALSE
  loc <- which_satisfies_predicate(.x, .p, ..., .dir = "backward", .negate = TRUE, .p_arg_name = ".p")
  if (loc == 0) {
    return(.x)
  }

  .x[-seq_len(loc)]
}
