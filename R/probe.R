#' Interrogate the elements of a list with a predicate function.
#'
#' \code{probe} applies a predicate to each element of a list or a vector
#' and returns a logical vector.
#' @inheritParams map_if
#' @return A logical vector.
#' @export
#' @examples
#' # To switch numeric vectors to character ones and vice versa using map_if(),
#' # we first need to record a logical vector. Using a predicate function in both
#' # map_if() calls would not work since they change the list contents.
#' l <- list(a = 1, b = "2", c = "3")
#' 
#' is_character <- probe(l, is.character)
#' l <- l %>%
#'   map_if(is_character, as.numeric) %>%
#'   map_if(!is_character, as.character)
probe <- function(.x, .p, ...) {
  if (is.logical(.p)) {
    stopifnot(length(.p) == length(.x))
    .p
  } else {
    .p <- as_function(.p)
    vapply(.x, .p, logical(1), ...)
  }
}
