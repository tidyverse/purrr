#' Create a list of given length
#'
#' @description
#'
#' `r lifecycle::badge("questioning")`
#'
#' It can be useful to create an empty list that you plan to fill later. This is
#' similar to the idea of [seq_along()], which creates a vector of the same
#' length as its input.
#'
#' @details
#'
#' This function might change to [vec_init()].
#'
#' @param x A vector.
#' @return A list of the same length as `x`.
#' @keywords internal
#' @examples
#' x <- 1:5
#' seq_along(x)
#' list_along(x)
#' @name along
#' @rdname along
#' @export
list_along <- function(x) {
  vector("list", length(x))
}
