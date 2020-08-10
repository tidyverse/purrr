#' Flatten a list of into a simpler structure
#'
#' @description
#'
#' These functions remove a level hierarchy from a list. They are
#' similar to [unlist()], but:
#'
#' - They only ever remove a single layer of hierarchy.
#'
#' - They are type-stable, so you always know what the type of the
#'   output is. On the other hand the final size is not stable and
#'   depends on the contents of the list.
#'
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
#' @inheritParams ellipsis::dots_empty
#' @inheritParams map
#'
#'
#' @section List and atomic flattening:
#'
#' The behaviours of `flatten()` and of the atomic variants are a bit
#' different:
#'
#' - `flatten()` accepts lists that contain any kind of elements. The
#'   elements whose `typeof()` is a list (including data frames) are
#'   spliced into the containing list. This operation always returns a
#'   list. If the list contains other lists, one level of nestedness
#'   removed. If the list doesn't contain other lists, `flatten()`
#'   doesn't do anything. The final size is equal to the sum of the
#'   sizes of the list elements, plus the number of non-list elements.
#'
#'   These expressions are equivalent:
#'
#'   ```
#'   flatten(list(1, list(2), list(list(3))))
#'   c(list(1), list(2), list(list(3)))
#'   list(1, 2, list(3))
#'   ```
#'
#' - The atomic variants like `flatten_int()` expect lists containing
#'   elements that can be coerced to the target type. For example
#'   `flatten_int(list(FALSE, 1L, c(2.0, 3.0)))` returns `0:3`. The
#'   elements are assembled with [vctrs::vec_c()] (via
#'   [vctrs::vec_unchop()], a wrapper that takes lists of
#'   vectors). The final size is equal to the sum of the sizes of all
#'   elements.
#'
#'   These expressions are equivalent:
#'
#'   ```
#'   flatten_int(list(1, 2, 3:4))
#'   c(1, 2, 3:4)
#'   ```
#'
#' Despite these differences, these functions are said to be
#' "flattening" because of the dependence of the final size on the
#' contents of the input list. The output is usually larger after
#' flattening (though it could well be smaller if some of the
#' flattened elements are empty).
#'
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
flatten <- function(.x) {
  .Call(flatten_impl, .x)
}

#' @export
#' @inheritParams vctrs::vec_unchop
#' @rdname flatten
flatten_lgl <- function(.x, ..., name_spec = "{inner}") {
  ellipsis::check_dots_empty()
  .x <- validate_flatten_vec(.x)
  vec_unchop(.x, ptype = logical(), name_spec = name_spec)
}

#' @export
#' @rdname flatten
flatten_int <- function(.x, ..., name_spec = "{inner}") {
  ellipsis::check_dots_empty()
  .x <- validate_flatten_vec(.x)
  vec_unchop(.x, ptype = integer(), name_spec = name_spec)
}

#' @export
#' @rdname flatten
flatten_dbl <- function(.x, ..., name_spec = "{inner}") {
  ellipsis::check_dots_empty()
  .x <- validate_flatten_vec(.x)
  vec_unchop(.x, ptype = double(), name_spec = name_spec)
}

#' @export
#' @rdname flatten
flatten_chr <- function(.x, ..., name_spec = "{inner}") {
  ellipsis::check_dots_empty()
  .x <- validate_flatten_vec(.x)

  deprecate <- FALSE
  out <- map(.x, function(x) {
    tryCatch(
      # Compatibility with historical deparsing behaviour
      vctrs_error_incompatible_type = function(...) {
        deprecate <<- TRUE
        coerce_chr(x)
      },
      vec_cast(x, character())
    )
  })
  if (deprecate) {
    signal_soft_deprecated("Numeric to character coercion is deprecated as of purrr 0.4.0.")
  }

  vec_unchop(out, ptype = character(), name_spec = name_spec)
}

is_chr_coercible <- function(x) {
  typeof(x) %in% c("logical", "integer", "double", "raw")
}

#' @export
#' @rdname flatten
flatten_raw <- function(.x) {
  .x <- validate_flatten_vec(.x)
  vec_unchop(.x, ptype = raw())
}

validate_flatten_vec <- function(x) {
  if (is.data.frame(x)) {
    # Do we want to deprecate this historical behaviour?
    unstructure(x)
  } else {
    x
  }
}

#' @export
#' @rdname flatten
flatten_dfr <- function(.x, .id = NULL) {
  if (!is_installed("dplyr")) {
    abort("`flatten_dfr()` requires dplyr")
  }

  res <- .Call(flatten_impl, .x)
  dplyr::bind_rows(res, .id = .id)
}

#' @export
#' @rdname flatten
flatten_dfc <- function(.x) {
  if (!is_installed("dplyr")) {
    abort("`flatten_dfc()` requires dplyr")
  }

  res <- .Call(flatten_impl, .x)
  dplyr::bind_cols(res)
}

#' @export
#' @rdname flatten
#' @usage NULL
flatten_df <- flatten_dfr
