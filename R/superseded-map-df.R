#' Functions that return data frames
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These [map()], [map2()], [imap()], and [pmap()] variants return data
#' frames by row-binding or column-binding the outputs together.
#'
#' The functions were superseded in purrr 1.0.0 because their names
#' suggest they work like `_lgl()`, `_int()`, etc which require length
#' 1 outputs, but actually they return results of any size because the results
#' are combined without any size checks. Additionally, they use
#' `dplyr::bind_rows()` and `dplyr::bind_cols()` which require dplyr to be
#' installed and have confusing semantics with edge cases. Superseded
#' functions will not go away, but will only receive critical bug fixes.
#'
#' Instead, we recommend using `map()`, `map2()`, etc with [list_rbind()] and
#' [list_cbind()]. These use [vctrs::vec_rbind()] and [vctrs::vec_cbind()]
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
#' mtcars |>
#'   split(mtcars$cyl) |>
#'   map(\(df) lm(mpg ~ wt, data = df)) |>
#'   map_dfr(\(mod) as.data.frame(t(as.matrix(coef(mod)))))
#'
#' # Now:
#' mtcars |>
#'   split(mtcars$cyl) |>
#'   map(\(df) lm(mpg ~ wt, data = df)) |>
#'   map(\(mod) as.data.frame(t(as.matrix(coef(mod))))) |>
#'   list_rbind()
#'
#' # for certain pathological inputs `map_dfr()` and `map_dfc()` actually
#' # both combine the list by column
#' df <- data.frame(
#'   x = c(" 13", "  15 "),
#'   y = c("  34",  " 67 ")
#' )
#'
#' # Was:
#' map_dfr(df, trimws)
#' map_dfc(df, trimws)
#'
#' # But list_rbind()/list_cbind() fail because they require data frame inputs
#' try(map(df, trimws) |> list_rbind())
#'
#' # Instead, use modify() to apply a function to each column of a data frame
#' modify(df, trimws)
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
#' map2(arg1, arg2, ex_fun) |> list_rbind()
#'
#' # was
#' map2_dfc(arg1, arg2, ex_fun)
#' # now
#' map2(arg1, arg2, ex_fun) |> list_cbind()
map_dfr <- function(.x, .f, ..., .id = NULL) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "map_dfr()",
    I("`map()` + `list_rbind()`")
  )
  check_installed("dplyr", "for `map_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @usage NULL
#' @export
map_df <- function(.x, .f, ..., .id = NULL) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "map_df()",
    I("`map()` + `list_rbind()`")
  )
  check_installed("dplyr", "for `map_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
map_dfc <- function(.x, .f, ...) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "map_dfc()",
    I("`map()` + `list_cbind()`")
  )
  check_installed("dplyr", "for `map_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
imap_dfr <- function(.x, .f, ..., .id = NULL) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "imap_dfr()",
    I("`imap()` + `list_rbind()`")
  )

  .f <- as_mapper(.f, ...)
  res <- map2(.x, vec_index(.x), .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
imap_dfc <- function(.x, .f, ...) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "imap_dfc()",
    I("`imap()` + `list_cbind()`")
  )

  .f <- as_mapper(.f, ...)
  res <- map2(.x, vec_index(.x), .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
map2_dfr <- function(.x, .y, .f, ..., .id = NULL) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "map2_dfr()",
    I("`map2()` + `list_rbind()`")
  )
  check_installed("dplyr", "for `map2_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map2(.x, .y, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
map2_dfc <- function(.x, .y, .f, ...) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "map2_dfc()",
    I("`map2()` + `list_cbind()`")
  )
  check_installed("dplyr", "for `map2_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- map2(.x, .y, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
#' @usage NULL
map2_df <- function(.x, .y, .f, ..., .id = NULL) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "map2_df()",
    I("`map2()` + `list_rbind()`")
  )
  check_installed("dplyr", "for `map2_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- map2(.x, .y, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
pmap_dfr <- function(.l, .f, ..., .id = NULL) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "pmap_dfr()",
    I("`pmap()` + `list_rbind()`")
  )
  check_installed("dplyr", "for `pmap_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map_dfr
#' @export
pmap_dfc <- function(.l, .f, ...) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "pmap_dfc()",
    I("`pmap()` + `list_cbind()`")
  )
  check_installed("dplyr", "for `pmap_dfc()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_cols(res)
}

#' @rdname map_dfr
#' @export
#' @usage NULL
pmap_df <- function(.l, .f, ..., .id = NULL) {
  # in 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "pmap_df()",
    I("`pmap()` + `list_rbind()`")
  )
  check_installed("dplyr", "for `pmap_dfr()`.")

  .f <- as_mapper(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}
