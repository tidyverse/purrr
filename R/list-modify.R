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
#' @param ... New values of a list. Use `NULL` to remove values.
#'   Use a formula to evaluate in the context of the list values.
#'   These dots have [splicing semantics][rlang::dots_list].
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
#' # Remove values
#' str(list_modify(x, z = NULL))
#'
#' # Combine values
#' str(list_merge(x, x = 11, z = list(a = 2:5, c = 3)))
#'
#'
#' # All these functions support tidy dots features. Use !!! to splice
#' # a list of arguments:
#' l <- list(new = 1, y = NULL, z = 5)
#' str(list_modify(x, !!!l))
list_modify <- function(.x, ...) {
  dots <- dots_list(...)
  list_recurse(.x, dots, function(x, y) y)
}
#' @export
#' @rdname list_modify
list_merge <- function(.x, ...) {
  dots <- dots_list(...)
  list_recurse(.x, dots, c)
}

list_recurse <- function(x, y, base_case) {
  stopifnot(is.list(x), is.list(y))

  if (is_empty(x)) {
    return(y)
  } else if (is_empty(y)) {
    return(x)
  }

  x_names <- names(x)
  y_names <- names(y)

  if (!is_names(x_names) && !is_names(y_names)) {
    for (i in rev(seq_along(y))) {
      if (i <= length(x) && is_list(x[[i]]) && is_list(y[[i]])) {
        x[[i]] <- list_recurse(x[[i]], y[[i]], base_case)
      } else {
        x[[i]] <- base_case(x[[i]], y[[i]])
      }
    }
  } else if (is_names(x_names) && is_names(y_names)) {
    for (i in seq_along(y_names)) {
      nm <- y_names[[i]]
      if (has_name(x, nm) && is_list(x[[nm]]) && is_list(y[[i]])) {
        x[[nm]] <- list_recurse(x[[nm]], y[[i]], base_case)
      } else {
        x[[nm]] <- base_case(x[[nm]], y[[i]])
      }
    }
  } else {
    stop("`x` and `y` must be either both named or both unnamed", call. = FALSE)
  }

  x
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
