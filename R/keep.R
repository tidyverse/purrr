#' Keep/discard elements based on their values
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
#'   * An anonymous function, e.g. `\(x) all(x < 0)` or `function(x) all(x < 0)`.
#'   * A formula, e.g. `~ all(.x < 0)`. You must use `.x` to refer to the first
#'     argument). No longer recommended.
#' @seealso [keep_at()]/[discard_at()] to keep/discard elements by name.
#' @param ... Additional arguments passed on to `.p`.
#' @export
#' @examples
#' rep(10, 10) |>
#'   map(sample, 5) |>
#'   keep(function(x) mean(x) > 6)
#'
#' # Or use a formula
#' rep(10, 10) |>
#'   map(sample, 5) |>
#'   keep(\(x) mean(x) > 6)
#'
#' # Using a string instead of a function will select all list elements
#' # where that subelement is TRUE
#' x <- rerun(5, a = rbernoulli(1), b = sample(10))
#' x
#' x |> keep("a")
#' x |> discard("a")
#'
#' # compact() discards elements that are NULL or that have length zero
#' list(a = "a", b = NULL, c = integer(0), d = NA, e = list()) |>
#'   compact()
keep <- function(.x, .p, ...) {
  where <- where_if(.x, .p, ...)
  .x[!is.na(where) & where]
}

#' @export
#' @rdname keep
discard <- function(.x, .p, ...) {
  where <- where_if(.x, .p, ...)
  .x[is.na(where) | !where]
}

#' @export
#' @rdname keep
compact <- function(.x, .p = identity) {
  .f <- as_mapper(.p)
  discard(.x, function(x) is_empty(.f(x)))
}


#' Keep/discard elements based on their name/position
#'
#' @inheritParams map_at
#' @seealso [keep()]/[discard()] to keep/discard elements by value.
#' @export
#' @examples
#' x <- c(a = 1, b = 2, cat = 10, dog = 15, elephant = 5, e = 10)
#' x |> keep_at(letters)
#' x |> discard_at(letters)
#'
#' # Can also use a function
#' x |> keep_at(\(x) nchar(x) == 3)
#' x |> discard_at(\(x) nchar(x) == 3)
keep_at <- function(x, at) {
  where <- where_at(x, at, user_env = caller_env())
  x[where]
}

#' @export
#' @rdname keep_at
discard_at <- function(x, at) {
  where <- where_at(x, at, user_env = caller_env())
  x[!where]
}
