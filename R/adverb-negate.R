#' Negate a predicate function so it selects what it previously rejected
#'
#' Negating a function changes `TRUE` to `FALSE` and `FALSE` to `TRUE`.
#'
#' @inheritParams keep
#' @inheritSection safely Adverbs
#' @family adverbs
#' @return A new predicate function.
#' @export
#' @examples
#' x <- list(x = 1:10, y = rbernoulli(10), z = letters)
#' x |> keep(is.numeric) |> names()
#' x |> keep(negate(is.numeric)) |> names()
#' # Same as
#' x |> discard(is.numeric)
negate <- function(.p) {
  compose(`!`, as_mapper(.p))
}
