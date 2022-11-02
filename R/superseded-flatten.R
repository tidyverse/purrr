#' Flatten a list of lists into a simple vector
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions were superseded in purrr 1.0.0 because their behaviour was
#' inconsistent. Superseded functions will not go away, but will only receive
#' critical bug fixes.
#'
#' * `flatten()` has been superseded by [list_flatten()].
#' * `flatten_lgl()`, `flatten_int()`, `flatten_dbl()`, and `flatten_chr()`
#'    have been superseded by [list_c()].
#' * `flatten_dfr()` and `flatten_dfc()` have been superseded by [list_rbind()]
#'    and [list_cbind()] respectively.
#'
#' @param .x A list to flatten. The contents of the list can be anything for
#'   `flatten()` (as a list is returned), but the contents must match the
#'   type for the other functions.
#' @return `flatten()` returns a list, `flatten_lgl()` a logical
#'   vector, `flatten_int()` an integer vector, `flatten_dbl()` a
#'   double vector, and `flatten_chr()` a character vector.
#'
#'   `flatten_dfr()` and `flatten_dfc()` return data frames created by
#'   row-binding and column-binding respectively. They require dplyr to
#'   be installed.
#' @keywords internal
#' @inheritParams map
#' @export
#' @examples
#' x <- map(1:3, \(i) sample(4))
#' x
#'
#' # was
#' x |> flatten_int() |> str()
#' # now
#' x |> list_c() |> str()
#'
#' x <- list(list(1, 2), list(3, 4))
#' # was
#' x |> flatten() |> str()
#' # now
#' x |> list_flatten() |> str()
flatten <- function(.x) {
  # in 1.0.0
  lifecycle::signal_stage("superseded", "flatten()", "list_flatten()")
  .Call(flatten_impl, .x)
}

#' @export
#' @rdname flatten
flatten_lgl <- function(.x) {
  # in 1.0.0
  lifecycle::signal_stage("superseded", "flatten_lgl()", "list_c()")
  .Call(vflatten_impl, .x, "logical")
}

#' @export
#' @rdname flatten
flatten_int <- function(.x) {
  lifecycle::signal_stage("superseded", "flatten_lgl()", "list_c()")
  .Call(vflatten_impl, .x, "integer")
}

#' @export
#' @rdname flatten
flatten_dbl <- function(.x) {
  # in 1.0.0
  lifecycle::signal_stage("superseded", "flatten_lgl()", "list_c()")
  .Call(vflatten_impl, .x, "double")
}

#' @export
#' @rdname flatten
flatten_chr <- function(.x) {
  # in 1.0.0
  lifecycle::signal_stage("superseded", "flatten_lgl()", "list_c()")
  .Call(vflatten_impl, .x, "character")
}


#' @export
#' @rdname flatten
flatten_dfr <- function(.x, .id = NULL) {
  # in 1.0.0
  lifecycle::signal_stage("superseded", "flatten_dfr()", "list_rbind()")
  check_installed("dplyr", "for `flatten_dfr()`.")

  res <- .Call(flatten_impl, .x)
  dplyr::bind_rows(res, .id = .id)
}

#' @export
#' @rdname flatten
flatten_dfc <- function(.x) {
  # in 1.0.0
  lifecycle::signal_stage("superseded", "flatten_dfc()", "list_cbind()")
  check_installed("dplyr", "for `flatten_dfc()`.")

  res <- .Call(flatten_impl, .x)
  dplyr::bind_cols(res)
}

#' @export
#' @rdname flatten
#' @usage NULL
flatten_df <- function(.x, .id = NULL) {
  # in 1.0.0
  lifecycle::signal_stage("superseded", "flatten_df()", "list_rbind()")
  check_installed("dplyr", "for `flatten_dfr()`.")

  res <- .Call(flatten_impl, .x)
  dplyr::bind_rows(res, .id = .id)
}
