#' Extract elements of a list by position.
#'
#' A wrapper around \code{\link{map}()} for one of the most common use cases.
#'
#' @inheritParams map
#' @param .i A string or integer index.
#' @export
#' @examples
#' by_cyl <- split(mtcars, mtcars$cyl)
#' mod_sum <- by_cyl %>%
#'   map(lm, formula = mpg ~ wt) %>%
#'   map(summary)
#'
#' # If .type is missing, you always get a list
#' mod_sum %>% pluck("r.squared")
#'
#' # If you supply .type, you'll get a vector
#' mod_sum %>% pluck("r.squared", numeric(1))
pluck <- function(.x, .i, .type) {
  map(.x, .subset2, .i, .type = .type)
}
