#' Negate a predicate function.
#'
#' @inheritParams map_if
#' @return A new predicate function.
#' @export
#' @examples
#' x <- transpose(list(x = 1:10, y = rbernoulli(10)))
#' x %>% keep("y") %>% length()
#' x %>% keep(negate("y")) %>% length()
#' # Same as
#' x %>% discard("y") %>% length()
negate <- function(.p) {
  .p <- as_function(.p)
  function(...) !.p(...)
}
