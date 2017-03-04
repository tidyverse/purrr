#' Do every or some elements of a list satisfy a predicate?
#'
#' @inheritParams map_if
#' @inheritParams map
#' @return Either `TRUE` or `FALSE`.
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
    val <- .p(.x[[i]], ...)
    if (isFALSE(val)) return(FALSE)
    if (anyNA(val)) return(NA)
  }
  TRUE
}

#' @export
#' @rdname every
some <- function(.x, .p, ...) {
  .p <- as_function(.p, ...)
  for (i in seq_along(.x)) {
    val <- .p(.x[[i]], ...)
    if (isTRUE(val)) return(TRUE)
    if (anyNA(val)) return(NA)
  }
  FALSE
}
