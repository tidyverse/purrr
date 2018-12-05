#' Modify a list
#'
#' @description
#'
#' `list_modify()` and `list_merge()` recursively combine two lists, matching
#' elements either by name or position. If a sub-element is present in
#' both lists `list_modify()` takes the value from `y`, and `list_merge()`
#' concatenates the values together.
#'
#' `update_list()` handles formulas and quosures that can refer to
#' values existing within the input list. Note that this function
#' might be deprecated in the future in favour of a `dplyr::mutate()`
#' method for lists.
#'
#' @param .x List to modify.
#' @param ... New values of a list. Use `zap()` to remove values.
#'
#'   These values should be either all named or all unnamed. When
#'   inputs are all named, they are matched to `.x` by name. When they
#'   are all unnamed, they are matched positionally.
#'
#'   These dots support [tidy dots][rlang::list2] features. In
#'   particular, if your functions are stored in a list, you can
#'   splice that in with `!!!`.
#' @export
#' @examples
#' x <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
#' str(x)
#'
#' # Update values
#' str(list_modify(x, a = 1))
#' # Replace values
#' str(list_modify(x, z = 5))
#' str(list_modify(x, z = list(a = 1:5)))
#'
#' # Remove values
#' str(list_modify(x, z = zap()))
#'
#' # Combine values
#' str(list_merge(x, x = 11, z = list(a = 2:5, c = 3)))
#'
#'
#' # All these functions support tidy dots features. Use !!! to splice
#' # a list of arguments:
#' l <- list(new = 1, y = zap(), z = 5)
#' str(list_modify(x, !!!l))
list_modify <- function(.x, ...) {
  list_recurse(.x, list2(...), function(x, y) y)
}
#' @export
#' @rdname list_modify
list_merge <- function(.x, ...) {
  list_recurse(.x, list2(...), c)
}

list_recurse <- function(x, y, base_case) {
  stopifnot(is.list(x), is.list(y))

  if (is_empty(x)) {
    return(y)
  }
  if (is_empty(y)) {
    return(x)
  }

  y_names <- names(y)

  if (!is_null(y_names) && !is_names(y_names)) {
    abort("`...` arguments must be either all named, or all unnamed")
  }

  if (is_null(y_names)) {
    for (i in rev(seq_along(y))) {
      if (i <= length(x) && is_list(x[[i]]) && is_list(y[[i]])) {
        x[[i]] <- list_recurse(x[[i]], y[[i]], base_case)
      } else {
        x[[i]] <- maybe_zap(base_case(x[[i]], y[[i]]))
      }
    }
  } else {
    for (i in seq_along(y_names)) {
      nm <- y_names[[i]]
      if (has_name(x, nm) && is_list(x[[nm]]) && is_list(y[[i]])) {
        x[[nm]] <- list_recurse(x[[nm]], y[[i]], base_case)
      } else {
        x[[nm]] <- maybe_zap(base_case(x[[nm]], y[[i]]))
      }
    }
  }

  x
}

maybe_zap <- function(x) {
  if (is_zap(x)) {
    return(NULL)
  }
  if (!is_null(x)) {
    return(x)
  }

  signal_soft_deprecated(paste_line(
    "Removing elements with `NULL` is soft-deprecated as of purrr 0.3.0.",
    "Please use `zap()` instead of `NULL`",
    "",
    "  # Before:",
    "  list_modify(x, foo = NULL)",
    "",
    "  # After:",
    "  list_modify(x, foo = zap())"
  ))

  # Allow removing with `NULL` for now. In purrr 0.5.0, this
  # functionality will be defunct and we'll allow setting elements to
  # `NULL`.
  NULL
}

#' @rdname list_modify
#' @export
#' @usage NULL
update_list <- function(.x, ...) {
  dots <- dots_list(...)

  formulas <- map_lgl(dots, is_bare_formula, lhs = FALSE, scoped = TRUE)
  dots <- map_if(dots, formulas, as_quosure)
  dots <- map_if(dots, is_quosure, eval_tidy, data = .x)

  list_recurse(.x, dots, function(x, y) y)
}
