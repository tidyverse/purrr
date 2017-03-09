#' Keep or discard elements using a predicate function.
#'
#' `keep` and `discard` are opposites. `compact` is a handy
#' wrapper that removes all elements that are `NULL`.
#'
#' These are usually called `select` or `filter` and `reject` or
#' `drop`, but those names are already taken. `keep` is similar to
#' [Filter()] but the argument order is more convenient, and the
#' evaluation of `.f` is stricter.
#'
#' @param .x A list or vector.
#' @param ... Additional arguments passed on to `.p`.
#' @inheritParams map_if
#' @export
#' @examples
#' rep(10, 10) %>%
#'   map(sample, 5) %>%
#'   keep(function(x) mean(x) > 6)
#'
#' # Or use a formula
#' rep(10, 10) %>%
#'   map(sample, 5) %>%
#'   keep(~ mean(.x) > 6)
#'
#' # Using a string instead of a function will select all list elements
#' # where that subelement is TRUE
#' x <- rerun(5, a = rbernoulli(1), b = sample(10))
#' x
#' x %>% keep("a")
#' x %>% discard("a")
keep <- function(.x, .p, ...) {
  sel <- probe(.x, .p, ...)
  .x[!is.na(sel) & sel]
}

#' @export
#' @rdname keep
discard <- function(.x, .p, ...) {
  sel <- probe(.x, .p, ...)
  .x[is.na(sel) | !sel]
}

#' @export
#' @rdname keep
compact <- function(.x, .p = identity) {
  .f <- as_mapper(.p)
  .x %>% discard(function(x) is_empty(.f(x)))
}
