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
  p <- tidy_capture(.p)

  if (is.function(.p)) {
    tidy_interp(function(...) !UQE(p)(...))
  } else {
    .p <- as_mapper(.p)
    function(...) !.p(...)
  }
}
