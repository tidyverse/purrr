#' Compute the depth of a vector
#'
#' The depth of a vector is basically how many levels that you can index
#' into it.
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
#' depth(x)
#' x %>% map_int(depth)
depth <- function(x) {
  if (is_null(x)) {
    0L
  } else if (is_atomic(x)) {
    1L
  } else if (is_list(x)) {
    depths <- map_int(x, depth)
    1L + max(depths, 0L)
  } else {
    stop("`x` must be a vector", call. = FALSE)
  }
}
