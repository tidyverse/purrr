#' Compute the depth of a vector
#'
#' The depth of a vector is how many levels that you can index/pluck into it.
#' `pluck_depth()` was previously called `vec_depth()`.
#'
#' @param x A vector
#' @param is_node Optionally override the default criteria for determine an
#'   element can be recursed within. The default matches the behaviour of
#'   `pluck()` which can recurse into lists and expressions.
#' @return An integer.
#' @export
#' @examples
#' x <- list(
#'   list(),
#'   list(list()),
#'   list(list(list(1)))
#' )
#' pluck_depth(x)
#' x |> map_int(pluck_depth)
pluck_depth <- function(x, is_node = NULL) {
  if (is.null(is_node)) {
    is_node <- function(x) is.expression(x) || is.list(x)
  }
  is_node <- as_is_node(is_node)

  if (is_node(x)) {
    depths <- map_int(x, pluck_depth, is_node = is_node)
    1L + max(depths, 0L)
  } else if (is_atomic(x)) {
    1L
  } else {
    0L
  }
}

#' @export
#' @rdname pluck_depth
#' @usage NULL
vec_depth <- function(x) {
  lifecycle::deprecate_soft("1.0.0", "vec_depth()", "pluck_depth()")
  pluck_depth(x)
}
