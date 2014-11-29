#' Find the value or position of the first match.
#'
#' @inheritParams every
#' @inheritParams map
#' @return \code{detect} the value of the first item that matches the
#'  predicate; \code{position} the position of the matching item.
#' @export
#' @examples
#' is_even <- function(x) x %% 2 == 0
#'
#' 1:6 %>% detect(is_even)
#' 1:6 %>% position(is_even)
detect <- function(.x, .f, ...) {
  for (i in seq_along(.x)) {
    if (isTRUE(.f(.x[[i]], ...))) return(.x[[i]])
  }
  NULL
}

#' @export
#' @rdname detect
position <- function(.x, .f, ...) {
  for (i in seq_along(.x)) {
    if (isTRUE(.f(.x[[i]], ...))) return(i)
  }
  NA_integer_
}

#' Does a list contain an object?
#'
#' @inheritParams map
#' @param .y Object to test for
#' @export
#' @examples
#' x <- list(1:10, 5, 9.9)
#' x %>% contains(1:10)
#' x %>% contains(3)
contains <- function(.x, .y) {
  some(.x, identical, .y)
}
