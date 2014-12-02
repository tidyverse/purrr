#' Negate a predicate function.
#'
#' @inheritParams map
#' @return A new predicate function.
#' @export
#' @examples
#' x <- zip(list(x = 1:10, y = rbenoulli(10)))
#' x %>% keep("y") %>% length()
#' x %>% keep(negate("y")) %>% length()
#' # Same as
#' x %>% discard("y") %>% length()
negate <- function(.f) {
  .f <- as_function(.f)
  function(...) !.f(...)
}
