#' Do every, some, or none of the elements of a list satisfy a predicate?
#'
#' * `some()` returns `TRUE` when `.p` is `TRUE` for at least one element.
#' * `every()` returns `TRUE` when `.p` is `TRUE` for all elements.
#' * `none()` returns `TRUE` when `.p` is `FALSE` for all elements.
#'
#' @inheritParams keep
#' @param ... Additional arguments passed on to `.p`.
#' @return A logical vector of length 1.
#' @export
#' @examples
#' x <- list(0:10, 5.5)
#' x |> every(is.numeric)
#' x |> every(is.integer)
#' x |> some(is.integer)
#' x |> none(is.character)
#'
#' # Missing values are propagated:
#' some(list(NA, FALSE), identity)
#'
#' # If you need to use these functions in a context where missing values are
#' # unsafe (e.g. in `if ()` conditions), make sure to use safe predicates:
#' if (some(list(NA, FALSE), rlang::is_true)) "foo" else "bar"
every <- function(.x, .p, ...) {
  satisfies_predicate(.x, .p, ..., .purrr_predicate = "every")
}

#' @export
#' @rdname every
some <- function(.x, .p, ...) {
  satisfies_predicate(.x, .p, ..., .purrr_predicate = "some")
}

#' @export
#' @rdname every
none <- function(.x, .p, ...) {
  satisfies_predicate(.x, .p, ..., .purrr_predicate = "none")
}

satisfies_predicate <- function(
  .x,
  .p,
  ...,
  .purrr_predicate,
  .purrr_user_env = caller_env(2),
  .purrr_error_call = caller_env()
) {
  # Not using `as_predicate()` as R level predicate result checks are too slow.
  # Checks are done at the C level instead (#1169). Also, `NA` propagates
  # through these functions, which `as_predicate()` doesn't allow.
  .p <- as_mapper(.p, ...)

  # Consistent with `map()`
  .x <- vctrs_vec_compat(.x, .purrr_user_env)
  obj_check_vector(.x, arg = ".x", call = .purrr_error_call)

  n <- vec_size(.x)

  i <- 0L

  # We refer to `.p`, `.x`, `i`, `...`, and `.purrr_error_call` all from C level
  switch(
    .purrr_predicate,
    every = .Call(every_impl, environment(), n, i),
    some = .Call(some_impl, environment(), n, i),
    none = .Call(none_impl, environment(), n, i),
    abort("Unreachable", .internal = TRUE)
  )
}
