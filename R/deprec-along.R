#' Create a list of given length
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 1.0.0 since it's not related to the
#' core purpose of purrr.
#'
#' It can be useful to create an empty list that you plan to fill later. This is
#' similar to the idea of [seq_along()], which creates a vector of the same
#' length as its input.
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
  lifecycle::deprecate_soft("1.0.0", "list_along()", I("rep_along(x, list())"))

  vector("list", length(x))
}
