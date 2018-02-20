#' Apply a function to each element of a vector, and its index
#'
#' `imap_xxx(x, ...)`, an indexed map, is short hand for
#' `map2(x, names(x), ...)` if `x` has names, or `map2(x, seq_along(x), ...)`
#' if it does not. This is useful if you need to compute on both the value
#' and the position of an element.
#'
#' @inheritParams map
#' @return A vector the same length as `.x`.
#' @export
#' @family map variants
#' @examples
#' # Note that when using the formula shortcut, the first argument
#' # is the value, and the second is the position
#' imap_chr(sample(10), ~ paste0(.y, ": ", .x))
#' iwalk(mtcars, ~ cat(.y, ": ", median(.x), "\n", sep = ""))
imap <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  map2(.x, vec_index(.x), .f, ...)
}

#' @rdname imap
#' @export
imap_lgl <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  map2_lgl(.x, vec_index(.x), .f, ...)
}

#' @rdname imap
#' @export
imap_chr <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  map2_chr(.x, vec_index(.x), .f, ...)
}

#' @rdname imap
#' @export
imap_int <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  map2_int(.x, vec_index(.x), .f, ...)
}

#' @rdname imap
#' @export
imap_dbl <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  map2_dbl(.x, vec_index(.x), .f, ...)
}

#' @rdname imap
#' @export
imap_raw <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  map2_raw(.x, vec_index(.x), .f, ...)
}

#' @rdname imap
#' @export
imap_dfr <- function(.x, .f, ..., .id = NULL) {
  .f <- as_mapper(.f, ...)
  map2_dfr(.x, vec_index(.x), .f, ..., .id = .id)
}

#' @rdname imap
#' @export
imap_dfc <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  map2_dfc(.x, vec_index(.x), .f, ...)
}

#' @export
#' @rdname imap
iwalk <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  walk2(.x, vec_index(.x), .f, ...)
}


vec_index <- function(x) {
  names(x) %||% seq_along(x)
}
