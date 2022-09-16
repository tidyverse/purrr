#' Modify a pluck location
#'
#' @description
#'
#' * `assign_in()` takes a data structure and a [pluck] location,
#'   assigns a value there, and returns the modified data structure.
#'
#' * `modify_in()` applies a function to a pluck location, assigns the
#'   result back to that location with [assign_in()], and returns the
#'   modified data structure.
#'
#' @inheritParams pluck
#' @param .f A function to apply at the pluck location given by `.where`.
#' @param ... Arguments passed to `.f`.
#' @param .where,where A pluck location, as a numeric vector of
#'   positions, a character vector of names, or a list combining both.
#'   The location must exist in the data structure.
#' @seealso [pluck()]
#' @export
#' @examples
#' # Recall that pluck() returns a component of a data structure that
#' # might be arbitrarily deep
#' x <- list(list(bar = 1, foo = 2))
#' pluck(x, 1, "foo")
#'
#' # Use assign_in() to modify the pluck location:
#' str(assign_in(x, list(1, "foo"), 100))
#' # Or zap to remove it
#' str(assign_in(x, list(1, "foo"), zap()))
#'
#' # Like pluck(), this works even when the element (or its parents) don't exist
#' pluck(x, 1, "baz")
#' str(assign_in(x, list(2, "baz"), 100))
#'
#' # modify_in() applies a function to that location and update the
#' # element in place:
#' modify_in(x, list(1, "foo"), \(x) x * 200)
#'
#' # Additional arguments are passed to the function in the ordinary way:
#' modify_in(x, list(1, "foo"), `+`, 100)
modify_in <- function(.x, .where, .f, ...) {
  .where <- as.list(.where)
  .f <- rlang::as_function(.f)

  value <- .f(pluck(.x, !!!.where), ...)
  assign_in(.x, .where, value)
}
#' @rdname modify_in
#' @param value A value to replace in `.x` at the pluck location.
#'   Use `zap()` to instead remove the element.
#' @export
assign_in <- function(x, where, value) {
  n <- length(where)
  if (n == 0) {
    cli::cli_abort(
      "{.arg where} must contain at least one element.",
      arg = "where"
    )
  } else if (n > 1) {
    old <- pluck(x, where[[1]], .default = list())
    if (!is_zap(value) || !identical(old, list())) {
      value <- assign_in(old, where[-1], value)
    }
  }

  if (is_zap(value)) {
    x[[where[[1]]]] <- NULL
  } else {
    list_slice2(x, where[[1]]) <- value
  }

  x
}
