#' Functions that return raw vectors
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' These functions were deprecated in purrr 1.0.0 because they are of limited
#' use and you can now use `map_vec()` instead. They are variants of [map()],
#' [map2()], [imap()], [pmap()], and [flatten()] that return raw vectors.
#'
#' @keywords internal
#' @export
map_raw <- function(.x, .f, ...) {
  lifecycle::deprecate_soft("1.0.0", "map_raw()", "map_vec()")
  map_("raw", .x, .f, ...)
}

#' @export
#' @rdname map_raw
map2_raw <- function(.x, .y, .f, ...) {
  lifecycle::deprecate_soft("1.0.0", "map2_raw()", "map2_vec()")
  map2_("raw", .x, .y, .f, ...)
}

#' @rdname map_raw
#' @export
imap_raw <- function(.x, .f, ...) {
  lifecycle::deprecate_soft("1.0.0", "imap_raw()", "imap_vec()")
  map2_("raw", .x, vec_index(.x), .f, ...)
}

#' @export
#' @rdname map_raw
pmap_raw <- function(.l, .f, ...) {
  lifecycle::deprecate_soft("1.0.0", "pmap_raw()", "pmap_vec()")
  pmap_("raw", .l, .f, ...)
}

#' @export
#' @rdname map_raw
flatten_raw <- function(.x) {
  lifecycle::deprecate_soft("1.0.0", "flatten_raw()")
  .Call(vflatten_impl, .x, "raw")
}
