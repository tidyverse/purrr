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
detect <- function(.x, .p, ..., .right = FALSE) {
  .p <- as_mapper(.p, ...)

  for (i in index(.x, .right)) {
    if (is_true(.p(.x[[i]], ...))) return(.x[[i]])
  }
  NULL
}

#' @export
#' @rdname detect
detect_index <- function(.x, .p, ..., .right = FALSE) {
  .p <- as_mapper(.p, ...)

  for (i in index(.x, .right)) {
    if (is_true(.p(.x[[i]], ...))) return(i)
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
