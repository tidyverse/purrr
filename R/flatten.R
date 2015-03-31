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
#' @param .recursive Recursively flatten list components?
#' @param .unname Remove names before flattening?
#' @export
#' @examples
#' x <- rerun(10, sample(5))
#' x %>% flatten(x)
#'
#' # You can use flatten in conjunction with map
#' x %>% map(~ .[1]) %>% flatten()
#' # But it's better to use map_v
#' x %>% map_v(~ .[1])
flatten <- function(.x, .recursive = FALSE, .unname = FALSE) {
  use_names <- TRUE
  if (.unname && .recursive) {
    use_names <- FALSE
  } else if (.unname && !.recursive) {
    names(.x) <- NULL
  }
  unlist(.x, recursive = .recursive, use.names = use_names)
}
