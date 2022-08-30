#' Function that return raw vectors
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#' These variants of [map()], [map2()], [imap()], [pmap()], and [flatten()]
#' return raw vectors. They have been deprecated because they are of limited
#' use and you can now use `map_vec()` instead.
#'
#' @keywords internal
#' @export
map_raw <- function(.x, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "map_raw()", "map_vec()")

  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "raw")
}

#' @export
#' @rdname map_raw
map2_raw <- function(.x, .y, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "map2_raw()", "map2_vec()")

  .f <- as_mapper(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "raw")
}

#' @rdname map_raw
#' @export
imap_raw <- function(.x, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "imap_raw()", "imap_vec()")

  .f <- as_mapper(.f, ...)
  map2_raw(.x, vec_index(.x), .f, ...)
}

#' @export
#' @rdname map_raw
pmap_raw <- function(.l, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "pmap_raw()", "pmap_vec()")

  .f <- as_mapper(.f, ...)
  if (is.data.frame(.l)) {
    .l <- as.list(.l)
  }

  .Call(pmap_impl, environment(), ".l", ".f", "raw")
}

#' @export
#' @rdname map_raw
flatten_raw <- function(.x) {
  lifecycle::deprecate_warn("0.4.0", "flatten_raw()")
  .Call(vflatten_impl, .x, "raw")
}
