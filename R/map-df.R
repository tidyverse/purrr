#' Functions that return data frames
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' These variants of [map()], [map2()], [imap()], and [pmap()] return data
#' frames. They have been deprecated because they use `dplyr::bind_rows()`
#' and `dplyr::bind_cols()` which have often confusing semantics, and their
#' names are suboptimal because they suggest they work like `_lgl()`, `_int()`,
#' and friends which require length 1 outputs, but actually they accept results
#' of anything because the results are combined to together.
#'
#' You can now instead use functions with `_rbind()` and `_cbind()` suffixes
#' which use `vctrs::vec_rbind()` and `vctrs::vec_cbind()` under the hood,
#' and have names that more clearly reflect their semantics.
#'
#' @param .id Either a string or `NULL`. If a string, the output will contain
#'   a variable with that name, storing either the name (if `.x` is named) or
#'   the index (if `.x` is unnamed) of the input. If `NULL`, the default, no
#'   variable will be created.
#'
#'   Only applies to `_dfr` variant.
#' @keywords internal
#' @export
#' @examples
#' # map ---------------------------------------------
#' # Was:
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .x)) %>%
#'   map_dfr(~ as.data.frame(t(as.matrix(coef(.)))))
#'
#' # Now:
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .x)) %>%
#'   map_rbind(~ as.data.frame(t(as.matrix(coef(.)))))
#'
#' # map2 ---------------------------------------------
#'
#' ex_fun <- function(arg1, arg2){
#'   col <- arg1 + arg2
#'   x <- as.data.frame(col)
#' }
#' arg1 <- 1:4
#' arg2 <- 10:13
#'
#' # was
#' map2_dfr(arg1, arg2, ex_fun)
#' # now
#' map2_rbind(arg1, arg2, ex_fun)
#'
#' # was
#' map2_dfc(arg1, arg2, ex_fun)
#' # now
#' map2_cbind(arg1, arg2, ex_fun)
map_dfr <- function(.x, .f, ..., .id = NULL) {
  lifecycle::deprecate_warn("0.4.0", "map_dfc()", "map_rbind()")
  check_installed("dplyr", "for `map_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @usage NULL
#' @export
map_df <- function(.x, .f, ..., .id = NULL) {
  lifecycle::deprecate_warn("0.4.0", "map_df()", "map_rbind()")
  check_installed("dplyr", "for `map_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
map_dfc <- function(.x, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "map_dfc()", "map_cbind()")

  check_installed("dplyr", "for `map_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
imap_dfr <- function(.x, .f, ..., .id = NULL) {
  .f <- as_mapper(.f, ...)
  map2_dfr(.x, vec_index(.x), .f, ..., .id = .id)
}

#' @rdname map_dfr
#' @export
imap_dfc <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  map2_dfc(.x, vec_index(.x), .f, ...)
}

#' @rdname map_dfr
#' @export
map2_dfr <- function(.x, .y, .f, ..., .id = NULL) {
  check_installed("dplyr", "for `map2_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map2(.x, .y, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
map2_dfc <- function(.x, .y, .f, ...) {
  check_installed("dplyr", "for `map2_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- map2(.x, .y, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
#' @usage NULL
map2_df <- map2_dfr

#' @rdname map_dfr
#' @export
pmap_dfr <- function(.l, .f, ..., .id = NULL) {
  check_installed("dplyr", "for `pmap_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
pmap_dfc <- function(.l, .f, ...) {
  check_installed("dplyr", "for `pmap_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
#' @usage NULL
pmap_df <- pmap_dfr
