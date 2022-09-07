#' Modify a list
#'
#' `list_modify()` and `list_merge()` recursively combine two lists, matching
#' elements either by name or position. If a sub-element is present in
#' both lists, `list_modify()` takes the value from `y`, and `list_merge()`
#' concatenates the values together.
#'
#' @param .x List to modify.
#' @param ... New values of a list. Use `zap()` to remove values.
#'
#'   These values should be either all named or all unnamed. When
#'   inputs are all named, they are matched to `.x` by name. When they
#'   are all unnamed, they are matched positionally.
#'
#'   [Dynamic dots][rlang::dyn-dots] are supported. In particular, if
#'   your functions are stored in a list, you can splice that in with
#'   `!!!`.
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
#' # All these functions support dynamic dots features. Use !!! to splice
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
  if (!is_null(y_names) && !is_named(y)) {
    abort("`...` arguments must be either all named, or all unnamed")
  }

  # N.B. is_list(zap()) is TRUE.
  if (is_null(y_names)) {
    for (i in rev(seq_along(y))) {
      if (i <= length(x) && is_list(x[[i]]) && is_list(y[[i]]) && !is_zap(y[[i]])) {
        x[[i]] <- list_recurse(x[[i]], y[[i]], base_case)
      } else {
        x[[i]] <- maybe_zap(base_case(x[[i]], y[[i]]))
      }
    }
  } else {
    for (i in seq_along(y_names)) {
      nm <- y_names[[i]]
      if (has_name(x, nm) && is_list(x[[nm]]) && is_list(y[[i]]) && !is_zap(y[[i]])) {
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

  lifecycle::deprecate_warn(
    when = "0.3.0",
    what = I("Removing elements with `NULL`"),
    with = "zap()"
  )
  # Allow removing with `NULL` for now. In purrr 0.5.0, this
  # functionality will be defunct and we'll allow setting elements to
  # `NULL`.
  NULL
}


#' Update a list with formulas
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `update_list()` handles formulas and quosures that can refer to
#' values existing within the input list. This function is deprecated
#' because we no longer believe that functions that use tidy evaluation are
#' a good fit for purrr.
#'
#' @inheritParams list_modify
#' @export
#' @keywords internal
update_list <- function(.x, ...) {
  lifecycle::deprecate_warn("0.4.0", "update_list()")

  dots <- dots_list(...)

  formulas <- map_lgl(dots, is_bare_formula, lhs = FALSE, scoped = TRUE)
  dots <- map_if(dots, formulas, as_quosure)
  dots <- map_if(dots, is_quosure, eval_tidy, data = .x)

  list_recurse(.x, dots, function(x, y) y)
}
