#' Flatten a list of lists into a list.
#'
#' This is a wrapper for \code{\link{unlist}()} that defaults to
#' \code{recursive = FALSE}.
#'
#' @param x A list of flatten
#' @param recursive Recursively flatten list components?
#' @export
#' @examples
#' x <- rerun(10, sample(5))
#' x %>% flatten(x)
#'
#' # You can use flatten in conjunction with map
#' x %>% map(~ .[1]) %>% flatten()
#' # But it's better to use map_v
#' x %>% map_v(~ .[1])
flatten <- function(x, recursive = FALSE) {
  unlist(x, recursive = recursive)
}
