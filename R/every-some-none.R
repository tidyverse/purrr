#' Do every, some, or none of the elements of a list satisfy a predicate?
#'
#' @inheritParams map
#' @param .p A predicate function to apply on each element of `.x`.
#'   `some()` returns `TRUE` when `.p` is `TRUE` for at least one
#'   element. `every()` returns `TRUE` when `.p` is `TRUE` for all
#'   elements. `none()` returns `TRUE` when `.p` is `FALSE` for all
#'   elements.`
#' @param ... Additional arguments passed on to `.p`.
#' @return A logical vector of length 1.
#' @export
#' @examples
#' y <- list(0:10, 5.5)
#' y %>% every(is.numeric)
#' y %>% every(is.integer)
#' y %>% some(is.integer)
#' y %>% none(is.character)
every <- function(.x, .p, ...) {
  .p <- as_predicate(.p, ..., .mapper = TRUE, .deprecate = TRUE)

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
  .p <- as_predicate(.p, ..., .mapper = TRUE, .deprecate = TRUE)

  val <- FALSE
  for (i in seq_along(.x)) {
    val <- val || .p(.x[[i]], ...)
    if (is_true(val)) return(TRUE)
  }

  val
}

#' @export
#' @rdname every
none <- function(.x, .p, ...) {
  every(.x, negate(.p), ...)
}
