#' Functions that return data frames
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' These variants of [map()], [map2()], [imap()], and [pmap()] return data
#' frames. They have been deprecated because they use `dplyr::bind_rows()`
#' and `dplyr::bind_cols()` which often have confusing semantics, and their
#' names are suboptimal because they suggest they work like `_lgl()`, `_int()`,
#' and friends which require length 1 outputs, but actually they return results
#' of any size because the results are combined together without any size checks.
#'
#' Instead, we now recommend usin `map()`, `map2()`, etc with [list_rbind()]
#' and [list_cbind()]. These use [vctrs::vec_rbind()] and [vctrs::vec_cbind()]
#' under the hood, and have names that more clearly reflect their semantics.
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
#'   map(~ as.data.frame(t(as.matrix(coef(.))))) %>%
#'   list_rbind()
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
#' map2(arg1, arg2, ex_fun) %>% list_rbind()
#'
#' # was
#' map2_dfc(arg1, arg2, ex_fun)
#' # now
#' map2(arg1, arg2, ex_fun) %>% list_cbind()
map_dfr <- function(.x, .f, ..., .id = NULL) {
  lifecycle::deprecate_warn("0.4.0", "map_dfr()", I("`map()` + `list_rbind()`"), always = TRUE)
  check_installed("dplyr", "for `map_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @usage NULL
#' @export
map_df <- function(.x, .f, ..., .id = NULL) {
  lifecycle::deprecate_warn("0.4.0", "map_df()", I("`map()` + `list_rbind()`"))
  check_installed("dplyr", "for `map_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
map_dfc <- function(.x, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "map_dfc()", I("`map()` + `list_cbind()`"))
  check_installed("dplyr", "for `map_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
imap_dfr <- function(.x, .f, ..., .id = NULL) {
  lifecycle::deprecate_warn("0.4.0", "imap_dfr()", I("`imap()` + `list_rbind()`"))

  .f <- as_mapper(.f, ...)
  res <- map2(.x, vec_index(.x), .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
imap_dfc <- function(.x, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "imap_dfc()", I("`imap()` + `list_cbind()`"))

  .f <- as_mapper(.f, ...)
  res <- map2(.x, vec_index(.x), .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
map2_dfr <- function(.x, .y, .f, ..., .id = NULL) {
  lifecycle::deprecate_warn("0.4.0", "map2_dfr()", I("`map2()` + `list_rbind()`"))
  check_installed("dplyr", "for `map2_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map2(.x, .y, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
map2_dfc <- function(.x, .y, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "map2_dfc()", I("`map2()` + `list_cbind()`"))
  check_installed("dplyr", "for `map2_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- map2(.x, .y, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
#' @usage NULL
map2_df <- function(.x, .y, .f, ..., .id = NULL) {
  lifecycle::deprecate_warn("0.4.0", "map2_df()", I("`map2()` + `list_rbind()`"))
  check_installed("dplyr", "for `map2_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map2(.x, .y, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
pmap_dfr <- function(.l, .f, ..., .id = NULL) {
  lifecycle::deprecate_warn("0.4.0", "pmap_dfr()", I("`pmap()` + `list_rbind()`"))
  check_installed("dplyr", "for `pmap_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
pmap_dfc <- function(.l, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "pmap_dfc()", I("`pmap()` + `list_cbind()`"))
  check_installed("dplyr", "for `pmap_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
#' @usage NULL
pmap_df <- function(.l, .f, ..., .id = NULL) {
  lifecycle::deprecate_warn("0.4.0", "pmap_df()", I("`pmap()` + `list_rbind()`"))
  check_installed("dplyr", "for `pmap_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}
