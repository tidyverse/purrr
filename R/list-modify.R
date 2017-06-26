#' Modify a list
#'
#' `list_modify()` and `list_merge()` recursively combine two lists, matching
#' elements either by name or position. If an sub-element is present in
#' both lists `list_modify()` takes the value from `y`, and `list_merge()`
#' concatenates the values together.
#'
#' `list_update()` is a helper optimised for interactively
#' modifying an existing list: you can use a formula (a quosure) to replace
#' using existing values.
#'
#' @param _x,x List to modify
#' @param ... New values of a list. Use `NULL` to remove values.
#'   Use a formula to evaluate in the context of the list values.
#' @param y Replacement list
#' @export
#' @examples
#' x <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
#' str(x)
#'
#' # Update values
#' str(list_modify(x, list(a = 1)))
#' # Replace values
#' str(list_modify(x, list(z = 5)))
#' str(list_modify(x, list(z = list(a = 1:5))))
#' # Remove values
#' str(list_modify(x, list(z = NULL)))
#'
#' # Combine values
#' str(list_merge(x, list(x = 11, z = list(a = 2:5, c = 3))))
#'
#' # list_update is useful for interactive tweaking, because it
#' # uses ... instead of a separate list
#' str(list_update(x, a = 1))
#' str(list_update(x, z = 5))
#' str(list_update(x, z = list(a = 1:5)))
#' str(list_update(x, z = NULL))
#'
#' # In list_update() you can also use quosures to compute new values
#' list_update(x, z1 = rlang::quo(z[1]))
#' list_update(x, z = rlang::quo(x + y))
list_modify <- function(x, y) {
  list_recurse(x, y, function(x, y) y)
}

#' @export
#' @rdname list_modify
list_merge <- function(x, y) {
  list_recurse(x, y, c)
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

  if (is.null(x_names) && is.null(y_names)) {
    for (i in rev(seq_along(y))) {
      if (i <= length(x) && is_list(x[[i]]) && is_list(y[[i]])) {
        x[[i]] <- list_recurse(x[[i]], y[[i]], base_case)
      } else {
        x[[i]] <- base_case(x[[i]], y[[i]])
      }
    }
  } else if (!is.null(x_names) && !is.null(y_names)) {
    for (nm in y_names) {
      if (has_name(x, nm) && is_list(x[[nm]]) && is_list(y[[nm]])) {
        x[[nm]] <- list_recurse(x[[nm]], y[[nm]], base_case)
      } else {
        x[[nm]] <- base_case(x[[nm]], y[[nm]])
      }
    }
  } else {
    stop("`x` and `y` must be either both named or both unnamed", call. = FALSE)
  }

  x
}

#' @export
#' @rdname  list_modify
list_update <- function(`_x`, ...) {
  y <- dots_list(...)
  y <- modify_if(y, is_symbolic, eval_tidy, data = `_x`)
  list_modify(`_x`, y)
}

#' @export
#' @usage NULL
#' @rdname list_modify
update_list <- list_update
