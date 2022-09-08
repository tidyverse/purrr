#' Flatten a list
#'
#' Flattening a list removes a single layer of internal hierarchy,
#' i.e. it inlines elements that are lists leaving non-lists alone.
#'
#' @param x A list.
#' @param name_spec If both inner and outer names are present, control
#'   how they are combined. Should be a glue specification that uses
#'   variables `inner` and `outer`.
#' @param name_repair One of `"minimal"`, `"unique"`, `"universal"`, or
#'   `"check_unique"`. See [vctrs::vec_as_names()] for the meaning of these
#'   options.
#' @return A list. The list might be shorter if `x` contains empty lists,
#'   the same length if it contains lists of length 1 or no sub-lists,
#'   or longer if it contains lists of length > 1.
#' @export
#' @examples
#' x <- list(1, list(2, 3), list(4, list(5)))
#' x %>% list_flatten() %>% str()
#' x %>% list_flatten() %>% list_flatten() %>% str()
#'
#' # Flat lists are left as is
#' list(1, 2, 3, 4, 5) %>% list_flatten() %>% str()
#'
#' # Empty lists will disappear
#' list(1, list(), 2, list(3)) %>% list_flatten() %>% str()
#'
#' # Another way to see this is that it reduces the depth of the list
#' x <- list(
#'   list(),
#'   list(list())
#' )
#' x %>% pluck_depth()
#' x %>% list_flatten() %>% pluck_depth()
#'
#' # Use name_spec to control how inner and outer names are combined
#' x <- list(x = list(a = 1, b = 2), y = list(c = 1, d = 2))
#' x %>% list_flatten() %>% names()
#' x %>% list_flatten(name_spec = "{outer}") %>% names()
#' x %>% list_flatten(name_spec = "{inner}") %>% names()
list_flatten <- function(
    x,
    name_spec = "{outer}_{inner}",
    name_repair = c("minimal", "unique", "check_unique", "universal")
  ) {
  vec_check_list(x)

  x <- modify_if(x, vec_is_list, identity, .else = list)
  vec_unchop(
    x,
    ptype = list(),
    name_spec = name_spec,
    name_repair = name_repair
  )
}
