#' Modify a list
#'
#' @description
#' * `list_update()` modifies the elements of a list by name or position.
#' * `list_modify()` modifies the elements of a list recursively.
#' * `list_modify()` merges the elements of a list recursively.
#'
#' `list_modify()` is inspired by [utils::modifyList()].
#'
#' @param .x List to modify.
#' @param ... New values of a list. Use `zap()` to remove values.
#'
#'   These values should be either all named or all unnamed. When
#'   inputs are all named, they are matched to `.x` by name. When they
#'   are all unnamed, they are matched by position.
#'
#'   [Dynamic dots][rlang::dyn-dots] are supported. In particular, if your
#'   replacement values are stored in a list, you can splice that in with
#'   `!!!`.
#' @export
#' @examples
#' x <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
#' str(x)
#'
#' # Update values
#' str(list_update(x, a = 1))
#' # Replace values
#' str(list_update(x, z = 5))
#' str(list_update(x, z = NULL))
#'
#' str(list_update(x, z = list(a = 1:5)))
#' # replace recursively, leaving the other elements of z alone
#' str(list_modify(x, z = list(a = 1:5)))
#'
#' # Remove values
#' str(list_update(x, z = zap()))
#'
#' # Combine values with list_merge()
#' str(list_merge(x, x = 11, z = list(a = 2:5, c = 3)))
#'
#' # All these functions support dynamic dots features. Use !!! to splice
#' # a list of arguments:
#' l <- list(new = 1, y = zap(), z = 5)
#' str(list_update(x, !!!l))
list_update <- function(.x, ...) {
  .x <- vctrs_list_compat(.x)
  y <- dots_list(..., .named = NULL, .homonyms = "error")
  list_recurse(.x, y, function(x, y) y, recurse = FALSE)
}

#' @export
#' @rdname list_update
list_modify <- function(.x, ...) {
  .x <- vctrs_list_compat(.x)
  y <- dots_list(..., .named = NULL, .homonyms = "error")
  list_recurse(.x, y, function(x, y) y)
}

#' @export
#' @rdname list_update
list_merge <- function(.x, ...) {
  .x <- vctrs_list_compat(.x)
  y <- dots_list(..., .named = NULL, .homonyms = "error")
  list_recurse(.x, y, c)
}

list_recurse <- function(x, y, base_f, recurse = TRUE, error_call = caller_env()) {
  if (!is_null(names(y)) && !is_named(y)) {
    cli::cli_abort(
      "`...` arguments must be either all named or all unnamed.",
      call = error_call
    )
  }

  idx <- names(y) %||% rev(seq_along(y))

  for (i in idx) {
    x_i <- pluck(x, i)
    y_i <- pluck(y, i)

    if (is_zap(y_i)) {
      x[[i]] <- NULL
    } else if (recurse && vec_is_list(x_i) && vec_is_list(y_i)) {
      list_slice2(x, i) <- list_recurse(x_i, y_i, base_f)
    } else {
      list_slice2(x, i) <- base_f(x_i, y_i)
    }
  }

  x
}

#' Update a list with formulas
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `update_list()` was deprecated in purrr 1.0.0, because we no longer believe
#' that functions that use NSE are a good fit for purrr.
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
  lifecycle::deprecate_soft("1.0.0", "update_list()")

  dots <- dots_list(...)

  formulas <- map_lgl(dots, is_bare_formula, lhs = FALSE, scoped = TRUE)
  dots <- map_if(dots, formulas, as_quosure)
  dots <- map_if(dots, is_quosure, eval_tidy, data = .x)

  list_recurse(.x, dots, function(x, y) y)
}
