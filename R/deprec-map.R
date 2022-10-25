#' Map at depth
#'
#' This function is defunct and has been replaced by [map_depth()].
#' See also [modify_depth()] for a version that preserves the types of
#' the elements of the tree.
#'
#' @export
#' @keywords internal
at_depth <- function(.x, .depth, .f, ...) {
  lifecycle::deprecate_stop("0.3.0", "at_depth()", "map_depth()")
}
