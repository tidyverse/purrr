#' Negate a predicate function.
#'
#' @inheritParams map_if
#' @inheritParams as_mapper
#' @return A new predicate function.
#' @export
#' @examples
#' negate("x")
#' negate(is.null)
#'
#' x <- transpose(list(x = 1:10, y = rbernoulli(10)))
#' x %>% keep("y") %>% length()
#' x %>% keep(negate("y")) %>% length()
#' # Same as
#' x %>% discard("y") %>% length()
negate <- function(.p, .default = FALSE) {
  .p <- as_mapper(.p)

  body(.p) <- tidy_interp(quote({
    ! ( !! body(.p) )
  }))

  .p
}
