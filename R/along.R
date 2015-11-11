#' Helper to create vectors with matching length.
#'
#' These functions take the idea of \code{\link{seq_along}} and generalise
#' it to creating lists (\code{list_along}) and repeating values
#' (\code{rep_along}).
#'
#' @param x A vector.
#' @param y Values to repeat.
#' @examples
#' x <- 1:5
#' rep_along(x, 1:2)
#' rep_along(x, 1)
#' list_along(x)
#' @name along
NULL

#' @export
#' @rdname along
list_along <- function(x) {
  vector("list", length(x))
}

#' @export
#' @rdname along
rep_along <- function(x, y) {
  rep(y, length.out = length(x))
}
