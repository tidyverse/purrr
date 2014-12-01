#' Do every or some elements of a list satisfy a predicate?
#'
#' @inheritParams map
#' @param .f A predicate function, i.e. a function that returns either
#'   \code{TRUE} or \code{FALSE}
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
every <- function(.x, .f, ...) {
  .f <- as_function(.f)
  for (i in seq_along(.x)) {
    if (!isTRUE(.f(.x[[i]], ...))) return(FALSE)
  }
  TRUE
}

#' @export
#' @rdname every
some <- function(.x, .f, ...) {
  .f <- as_function(.f)
  for (i in seq_along(.x)) {
    if (isTRUE(.f(.x[[i]], ...))) return(TRUE)
  }
  FALSE
}
