#' Find the value or position of the first match.
#'
#' @inheritParams every
#' @inheritParams map
#' @param .right If `FALSE`, the default, starts at the beginning
#'   of the vector and move towards the end; if `TRUE`, starts at the end
#'   of the vector and moves towards the beginning.
#' @return `detect` the value of the first item that matches the
#'  predicate; `detect_index` the position of the matching item.
#'  If not found, `detect` returns `NULL` and `detect_index`
#'  returns 0.
#' @export
#' @examples
#' is_even <- function(x) x %% 2 == 0
#'
#' 3:10 %>% detect(is_even)
#' 3:10 %>% detect_index(is_even)
#'
#' 3:10 %>% detect(is_even, .right = TRUE)
#' 3:10 %>% detect_index(is_even, .right = TRUE)
#'
#'
#' # Since `.f` is passed to as_mapper(), you can supply a
#' # lambda-formula or a pluck object:
#' x <- list(
#'   list(1, foo = FALSE),
#'   list(2, foo = TRUE),
#'   list(3, foo = TRUE)
#' )
#'
#' detect(x, "foo")
#' detect_index(x, "foo")
detect <- function(.x, .f, ..., .right = FALSE, .p) {
  if (!missing(.p)) {
    warn("`.p` has been renamed to `.f`", "purrr_2.2.3")
    .f <- .p
  }
  .f <- as_mapper(.f, ...)

  for (i in index(.x, .right)) {
    if (is_true(.f(.x[[i]], ...))) return(.x[[i]])
  }
  NULL
}

#' @export
#' @rdname detect
detect_index <- function(.x, .f, ..., .right = FALSE, .p) {
  if (!missing(.p)) {
    warn("`.p` has been renamed to `.f`", "purrr_2.2.3")
    .f <- .p
  }
  .f <- as_mapper(.f, ...)

  for (i in index(.x, .right)) {
    if (is_true(.f(.x[[i]], ...))) return(i)
  }
  0L
}

index <- function(x, right = FALSE) {
  idx <- seq_along(x)
  if (right)
    idx <- rev(idx)
  idx
}

#' Does a list contain an object?
#'
#' @inheritParams map
#' @param .y Object to test for
#' @export
#' @examples
#' x <- list(1:10, 5, 9.9)
#' x %>% has_element(1:10)
#' x %>% has_element(3)
has_element <- function(.x, .y) {
  some(.x, identical, .y)
}
