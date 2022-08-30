#' Compute the depth of a vector
#'
#' The depth of a vector is how many levels that you can index/pluck into it.
#' `pluck_depth()` was previously called `vec_depth()`.
#'
#' @param x A vector
#' @return An integer.
#' @export
#' @examples
#' x <- list(
#'   list(),
#'   list(list()),
#'   list(list(list(1)))
#' )
#' pluck_depth(x)
#' x %>% map_int(pluck_depth)
pluck_depth <- function(x) {
  if (is.list(x) || is.expression(x) || is.call(x)) {
    depths <- map_int(x, pluck_depth)
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
  lifecycle::deprecate_warn("0.4.0", "vec_depth()", "pluck_depth()")
  pluck_depth(x)
}
