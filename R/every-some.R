#' Do every or some elements of a list satisfy a predicate?
#'
#' @inheritParams map
#' @param .p A predicate function to apply on each element of `.x`.
#'   `some()` returns `TRUE` when `.p` is `TRUE` for at least one
#'   element. `every()` returns `TRUE` when `.p` is `TRUE` for all
#'   elements.
#' @param ... Additional arguments passed on to `.p`.
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
  val <- FALSE
  for (i in seq_along(.x)) {
    val <- val || .p(.x[[i]], ...)
    if (is_true(val)) return(TRUE)
  }
  val
}
