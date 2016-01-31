#' Do every or some elements of a list satisfy a predicate?
#'
#' @inheritParams map_if
#' @inheritParams map
#' @return Either \code{TRUE} or \code{FALSE}.
#' @export
#' @examples
#' x <- list(0, 1, TRUE)
#' x %>% every(identity)
#' x %>% some(identity)
#'
#' y <- list(0:10, 5.5)
#' y %>% every(is.numeric)
#' y %>% every(is.integer)
every <- function(.x, .p, ...) {
  .p <- as_function(.p, ...)
  for (i in seq_along(.x)) {
    if (!isTRUE(.p(.x[[i]], ...))) return(FALSE)
  }
  TRUE
}

#' @export
#' @rdname every
some <- function(.x, .p, ...) {
  .p <- as_function(.p, ...)
  for (i in seq_along(.x)) {
    if (isTRUE(.p(.x[[i]], ...))) return(TRUE)
  }
  FALSE
}
