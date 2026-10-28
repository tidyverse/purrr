#' Negate a predicate function so it selects what it previously rejected
#'
#' Negating a function changes `TRUE` to `FALSE` and `FALSE` to `TRUE`.
#'
#' @param .p A predicate function (i.e. a function that returns either `TRUE`
#'   or `FALSE`) specified in one of the following ways:
#'
#'   * A named function, e.g. `is.character`.
#'   * An anonymous function, e.g. `\(x) all(x < 0)` or `function(x) all(x < 0)`.
#'
#' @inheritSection safely Adverbs
#' @family adverbs
#' @return A new predicate function.
#' @export
#' @examples
#' x <- list(x = 1:10, y = runif(10) > 0.5, z = letters)
#' x |> keep(is.numeric) |> names()
#' x |> keep(negate(is.numeric)) |> names()
#' # Same as
#' x |> discard(is.numeric)
negate <- function(.p) {
  compose(`!`, as_mapper(.p))
}
