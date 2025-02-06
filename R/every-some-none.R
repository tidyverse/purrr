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
  # .p <- as_predicate(.p, ..., .mapper = TRUE, .allow_na = TRUE)
  .p <- as_mapper(.p, ...)

  n <- vec_size(.x)
  i <- 0L

  .Call(every_impl, environment(), n, i)
}

#' @export
#' @rdname every
some <- function(.x, .p, ...) {
  .p <- as_predicate(.p, ..., .mapper = TRUE, .allow_na = TRUE)

  val <- FALSE
  for (i in seq_along(.x)) {
    val <- val || .p(.x[[i]], ...)

    if (is_true(val)) {
      return(TRUE)
    }
  }

  val
}

#' @export
#' @rdname every
none <- function(.x, .p, ...) {
  every(.x, negate(.p), ...)
}
