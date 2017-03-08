#' Modify a list
#'
#' `modify_list()` recursively modifies a list, matching elements either by
#' name or position. `update_list()` is a helper optimised for interactively
#' modifying an existing list: you can use a formula (a quosure) to replace
#' using existing values.
#'
#' @param _x,x List to modify
#' @param ... New values of a list. Use `NULL` to remove values.
#'   Use a formula to evaluate in the context of the list values.
#' @param y Replacement list
#' @export
#' @examples
#' x <- list(x = 1:10, y = 4)
#' update_list(x, z = 10)
#' update_list(x, z = ~ x + y)
modify_list <- function(x, y) {
  stopifnot(is.list(x), is.list(y))

  if (length(x) == 0) {
    return(y)
  } else if (length(y) == 0) {
    return(x)
  }

  x_names <- names(x)
  y_names <- names(y)

  if (is.null(x_names) && is.null(y_names)) {
    for (i in rev(seq_along(y))) {
      if (i <= length(x) && is_list(x[[i]]) && is_list(y[[i]])) {
        x[[i]] <- modify_list(x[[i]], y[[i]])
      } else {
        x[[i]] <- y[[i]]
      }
    }
  } else if (!is.null(x_names) && !is.null(y_names)) {
    for (nm in y_names) {
      if (has_name(x, nm) && is_list(x[[nm]]) && is_list(y[[nm]])) {
        x[[nm]] <- modify_list(x[[nm]], y[[nm]])
      } else {
        x[[nm]] <- y[[nm]]
      }
    }
  } else {
    stop("`x` and `y` must be either both named or both unnamed", call. = FALSE)
  }

  x
}


#' @export
#' @rdname modify_list
update_list <- function(`_x`, ...) {
  y <- list(...)

  needs_eval <- map_lgl(y, is_quosure)
  y[needs_eval] <- tidy_eval(y[needs_eval], `_x`)

  modify_list(`_x`, y)
}
