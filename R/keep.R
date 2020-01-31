#' Keep or discard elements using a predicate function.
#'
#' `keep()` and `discard()` are opposites. `compact()` is a handy
#' wrapper that removes all empty elements.
#'
#' These are usually called `select` or `filter` and `reject` or
#' `drop`, but those names are already taken. `keep()` is similar to
#' [Filter()], but the argument order is more convenient, and the
#' evaluation of the predicate function `.p` is stricter.
#'
#' @param .x A list or vector.
#' @param .p For `keep()` and `discard()`, a predicate function. Only
#'   those elements where `.p` evaluates to `TRUE` will be kept or
#'   discarded.
#'
#'   For `compact()`, a function that is applied to each element of
#'   `.x`. Only those elements where `.p` evaluates to an empty vector
#'   will be discarded.
#' @param ... Additional arguments passed on to `.p`.
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
#'
#' # compact() discards elements that are NULL or that have length zero
#' list(a = "a", b = NULL, c = integer(0), d = NA, e = list()) %>%
#'   compact()
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
  discard(.x, function(x) is_empty(.f(x)))
}
