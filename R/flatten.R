#' Flatten a list of lists into a simple vector.
#'
#' These functions remove a level hierarchy from a list. They are similar to
#' \code{\link{unlist}}, only ever remove a single layer of hierarchy, and
#' are type-stable so you always know what the type of the output is.
#'
#' @param .x A list of flatten. The contents of the list can be anything for
#'   \code{flatten} (as a list is returned), but the contents must match the
#'   type for the other functions.
#' @return \code{flatten()} returns a list, \code{flatten_lgl} a logical
#'   vector, \code{flatten_int} an integer vector, \code{flatten_dbl} a
#'   double vector, and \code{flatten_chr} a character vector.
#' @inheritParams map
#' @export
#' @examples
#' x <- rerun(2, sample(4))
#' x
#' x %>% flatten()
#' x %>% flatten_int()
#'
#' # You can use flatten in conjunction with map
#' x %>% map(1L) %>% flatten_int()
#' # But it's more efficient to use the typed map instead.
#' x %>% map_int(1L)
#' @useDynLib purrr flatten_impl vflatten_impl
flatten <- function(.x) {
  .Call(flatten_impl, .x)
}

#' @export
#' @rdname flatten
flatten_lgl <- function(.x) {
  .Call(vflatten_impl, .x, "logical")
}

#' @export
#' @rdname flatten
flatten_int <- function(.x) {
  .Call(vflatten_impl, .x, "integer")
}

#' @export
#' @rdname flatten
flatten_dbl <- function(.x) {
  .Call(vflatten_impl, .x, "double")
}

#' @export
#' @rdname flatten
flatten_chr <- function(.x) {
  .Call(vflatten_impl, .x, "character")
}

#' @export
#' @rdname flatten
flatten_df <- function(.x, .id = NULL) {
  res <- .Call(flatten_impl, .x)
  dplyr::bind_rows(res, .id = .id)
}
