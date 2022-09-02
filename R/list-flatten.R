#' Flatten a list
#'
#' Flattening a list removes a single layer of internal hierarchy.
#'
#' @param x A list
#' @return A list, probably longer.
#' @export
#' @examples
#' x <- list(1, list(2, 3), list(4, list(5)))
#' x %>% list_flatten() %>% str()
#' x %>% list_flatten() %>% list_flatten() %>% str()
#'
#' # It's now as flat as it can get so further flattening leaves it
#' # changed.
#' x %>% list_flatten() %>% list_flatten() %>% list_flatten() %>% str()
#'
#' # Another way to see this is that it reduces the depth of the list
#' x <- list(
#'   list(),
#'   list(list())
#' )
#' x %>% pluck_depth()
#' x %>% list_flatten() %>% pluck_depth()
list_flatten <- function(x) {
  check_is_list(x)

  is_nested <- map_lgl(x, vctrs::vec_is_list)
  x[!is_nested] <- map(x[!is_nested], list)

  unlist(x, recursive = FALSE)
}
