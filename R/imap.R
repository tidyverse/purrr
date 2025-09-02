#' Apply a function to each element of a vector, and its index
#'
#' `imap(x, ...)`, an indexed map, is short hand for
#' `map2(x, names(x), ...)` if `x` has names, or `map2(x, seq_along(x), ...)`
#' if it does not. This is useful if you need to compute on both the value
#' and the position of an element.
#'
#' @param .f A function, specified in one of the following ways:
#'
#'   * A named function, e.g. `paste`.
#'   * An anonymous function, e.g. `\(x, idx) x + idx` or
#'     `function(x, idx) x + idx`.
#'   * A formula, e.g. `~ .x + .y`. You must use `.x` to refer to the
#'     current element and `.y` to refer to the current index.
#'     No longer recommended.
#'
#'   `r lifecycle::badge("experimental")`
#'
#'   Wrap a function with [in_parallel()] to declare that it should be performed
#'   in parallel. See [in_parallel()] for more details.
#'   Use of `...` is not permitted in this context.
#' @inheritParams map
#' @return A vector the same length as `.x`.
#' @export
#' @family map variants
#' @examples
#' imap_chr(sample(10), paste)
#'
#' imap_chr(sample(10), \(x, idx) paste0(idx, ": ", x))
#'
#' iwalk(mtcars, \(x, idx) cat(idx, ": ", median(x), "\n", sep = ""))
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
imap_vec <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  map2_vec(.x, vec_index(.x), .f, ...)
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
