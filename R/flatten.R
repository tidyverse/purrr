#' Flatten a list of lists into a list.
#'
#' This is a wrapper for \code{\link{unlist}()} that defaults to
#' \code{recursive = FALSE}.
#'
#' When \code{.unname} is \code{TRUE} and \code{.recursive} is
#' \code{FALSE}, only the names of \code{.x} are removed, leaving the
#' inner lists intact. But if \code{.recursive} is \code{TRUE}, the
#' names of all inner lists are also removed.
#' @param .x A list of flatten
#' @return \code{flatten()} returns a list.
#' @export
#' @examples
#' x <- rerun(10, sample(5))
#' x %>% flatten()
#'
#' # You can use flatten in conjunction with map
#' x %>% map(1L) %>% flatten()
#' # But it's better to use map_int etc.
#' x %>% map_int(1L)
#' @useDynLib purrr flatten_impl
flatten <- function(.x) {
  .Call(flatten_impl, .x)
}
