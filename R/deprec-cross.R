#' Produce all combinations of list elements
#'
#' @description
#' `r lifecycle::badge("defunct")`
#'
#' These functions were deprecated in purrr 1.0.0 and are now defunct because
#' they are slow and buggy, and we no longer think they are the right
#' approach to solving this problem. Please use `tidyr::expand_grid()`
#' instead.
#'
#' Here is an example of equivalent usages for `cross()` and
#' `expand_grid()`:
#'
#' ```R
#' data <- list(
#'   id = c("John", "Jane"),
#'   sep = c("! ", "... "),
#'   greeting = c("Hello.", "Bonjour.")
#' )
#'
#' # With defunct `cross()`
#' data |> cross() |> map_chr(\(...) paste0(..., collapse = ""))
#'
#' # With `expand_grid()`
#' tidyr::expand_grid(!!!data) |> pmap_chr(paste)
#' ```
#'
#' @details
#' `cross2()` returns the product set of the elements of
#' `.x` and `.y`. `cross3()` takes an additional
#' `.z` argument. `cross()` takes a list `.l` and
#' returns the cartesian product of all its elements in a list, with
#' one combination by element. `cross_df()` is like
#' `cross()` but returns a data frame, with one combination by
#' row.
#'
#' `cross()`, `cross2()` and `cross3()` return the
#' cartesian product is returned in wide format. This makes it more
#' amenable to mapping operations. `cross_df()` returns the output
#' in long format just as `expand.grid()` does. This is adapted
#' to rowwise operations.
#'
#' When the number of combinations is large and the individual
#' elements are heavy memory-wise, it is often useful to filter
#' unwanted combinations on the fly with `.filter`. It must be
#' a predicate function that takes the same number of arguments as the
#' number of crossed objects (2 for `cross2()`, 3 for
#' `cross3()`, `length(.l)` for `cross()`) and
#' returns `TRUE` or `FALSE`. The combinations where the
#' predicate function returns `TRUE` will be removed from the
#' result.
#' @seealso [expand.grid()]
#' @param .x,.y,.z Lists or atomic vectors.
#' @param .l A list of lists or atomic vectors. Alternatively, a data
#'   frame. `cross_df()` requires all elements to be named.
#' @param .filter A predicate function that takes the same number of
#'   arguments as the number of variables to be combined.
#' @return `cross2()`, `cross3()` and `cross()`
#'   always return a list. `cross_df()` always returns a data
#'   frame. `cross()` returns a list where each element is one
#'   combination so that the list can be directly mapped
#'   over. `cross_df()` returns a data frame where each row is one
#'   combination.
#' @keywords internal
#' @export
cross <- function(.l, .filter = NULL) {
  lifecycle::deprecate_stop(
    "1.0.0",
    "purrr::cross()",
    "tidyr::expand_grid()",
    details = c(i = "See <https://github.com/tidyverse/purrr/issues/768>.")
  )
}

#' @export
#' @rdname cross
cross2 <- function(.x, .y, .filter = NULL) {
  lifecycle::deprecate_stop(
    "1.0.0",
    "purrr::cross2()",
    "tidyr::expand_grid()",
    details = c(i = "See <https://github.com/tidyverse/purrr/issues/768>.")
  )
}

#' @export
#' @rdname cross
cross3 <- function(.x, .y, .z, .filter = NULL) {
  lifecycle::deprecate_stop(
    "1.0.0",
    "purrr::cross3()",
    "tidyr::expand_grid()",
    details = c(i = "See <https://github.com/tidyverse/purrr/issues/768>.")
  )
}

#' @rdname cross
#' @export
cross_df <- function(.l, .filter = NULL) {
  lifecycle::deprecate_stop(
    "1.0.0",
    "purrr::cross_df()",
    "tidyr::expand_grid()",
    details = c(i = "See <https://github.com/tidyverse/purrr/issues/768>.")
  )
}
