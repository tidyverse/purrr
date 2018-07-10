#' Do every or some elements of a list satisfy a predicate?
#'
#' @inheritParams map_if
#' @inheritParams map
#' @return A logical vector of length 1.
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
  .p <- as_mapper(.p, ...)
  for (i in seq_along(.x)) {
    val <- .p(.x[[i]], ...)
    if (is_false(val)) return(FALSE)
    if (anyNA(val)) return(NA)
  }
  TRUE
}

#' @export
#' @rdname every
some <- function(.x, .p, ...) {
  .p <- as_mapper(.p, ...)
  no_na <- TRUE
  for (i in seq_along(.x)) {
    val <- .p(.x[[i]], ...)
    if (is_true(val)) return(TRUE)
    if (no_na && anyNA(val)) no_na <- FALSE
  }
  if (no_na) FALSE
  NA
}
