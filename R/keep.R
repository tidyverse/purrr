#' Keep or discard elements using a predicate function.
#'
#' \code{keep} and \code{discard} are opposites. \code{compact} is a handy
#' wrapper that removes all elements that are \code{NULL}.
#'
#' These are usually called \code{select} or \code{filter} and \code{reject} or
#' \code{drop}, but those names are already taken. \code{keep} is similar to
#' \code{\link{Filter}} but the argument order is more convenient, and the
#' evaluation of \code{.f} is stricter.
#'
#' @param .x A list or vector.
#' @param ... Additional arguments passed on to \code{.p}.
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
  .f <- as_function(.p)
  .x %>% discard(function(x) is_empty(.p(x)))
}
