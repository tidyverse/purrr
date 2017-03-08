#' Modify a list
#'
#' @param _data A list.
#' @param ... New values of a list. Use `NULL` to remove values.
#'   Use a formula to evaluate in the context of the list values.
#' @export
#' @examples
#' x <- list(x = 1:10, y = 4)
#' update_list(x, z = 10)
#' update_list(x, z = ~ x + y)
update_list <- function(`_data`, ...) {
  new_values <- list(...)

  needs_eval <- map_lgl(new_values, is_quosure)
  new_values[needs_eval] <- tidy_eval(new_values[needs_eval], data = `_data`)

  utils::modifyList(`_data`, new_values)
}
