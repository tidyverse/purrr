#' Keep or discard elements using a predicate function.
#'
#' `keep()` selects all elements where `.p` evaluates to `TRUE`;
#' `discard()` selects all elements where `.p` evaluates to `FALSE`.
#' `compact()` discards elements where `.p` evaluates to an empty vector.
#'
#' In other languages, `keep()` and `discard()` are often called `select()`/
#' `filter()` and `reject()`/ `drop()`, but those names are already taken
#' in R. `keep()` is similar to [Filter()], but the argument order is more
#' convenient, and the evaluation of the predicate function `.p` is stricter.
#'
#' @param .x A list or vector.
#' @param .p A predicate function (i.e. a function that returns either `TRUE`
#'   or `FALSE`) specified in one of the following ways:
#'
#'   * A named function, e.g. `is.character`.
#'   * An anonymous function, e.g. `function(x) all(x < 0)`.
#'   * A lambda function, e.g. `\(x) all(x < 0)`.
#'   * A formula, e.g. `~ all(.x < 0)`. You must use `.x` to refer to the first
#'     argument). Only appropriate for very tasks.
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
