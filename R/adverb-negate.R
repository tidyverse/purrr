#' Negate a predicate function.
#'
#' @inheritParams map_if
#' @inheritParams as_mapper
#' @return A new predicate function.
#' @export
#' @examples
#' negate("x")
#' negate(is.null)
#' negate(~ .x > 0)
#'
#' x <- transpose(list(x = 1:10, y = rbernoulli(10)))
#' x %>% keep("y") %>% length()
#' x %>% keep(negate("y")) %>% length()
#' # Same as
#' x %>% discard("y") %>% length()
negate <- function(.p) {
  compose(`!`, as_mapper(.p))
}
