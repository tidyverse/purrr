#' Error conditions for bad types
#'
#' @param x The object whose type doesn't match `expected`.
#' @param what What does `x` represent? This is used to introduce the
#'   object in the error message.
#' @param expected,actual The expected and actual type of `x`, in
#'   friendly representation. If `actual` is not supplied, `x` is
#'   passed to `friendly_type_of()` to provide a default value.
#' @param index The index of `x` when it is an element of a vector.
#' @param ...,message,.subclass Only use these fields when creating a subclass.
#'
#' @details
#'
#' Some of the fields are expected to be in friendly representation,
#' i.e. a longer description that includes indefinite articles. For
#' example, a friendly representation of `"integer"` would be
#' `"an integer vector"`.
#'
#' Fields in pretty representation are meant for printing, not for
#' testing. They should not be relied on in unit tests as upstream
#' packages might tweak the friendly representation at any time.
#'
#' @keywords internal
#' @name purrr-conditions
#' @noRd
NULL

stop_bad_type <- function(x,
                          expected,
                          ...,
                          what = "Object",
                          actual = NULL,
                          message = NULL,
                          .subclass = NULL) {
  actual <- actual %||% friendly_type_of(x)
  message <- message %||% sprintf(
    "%s must be %s, not %s",
    what,
    expected,
    actual
  )

  abort(
    message,
    x = x,
    what = what,
    expected = expected,
    actual = actual,
    ...,
    .subclass = c(.subclass, "purrr_error_bad_type")
  )
}

stop_bad_element_type <- function(x,
                                  index,
                                  expected,
                                  ...,
                                  actual = NULL,
                                  arg = NULL,
                                  message = NULL,
                                  .subclass = NULL) {
  stopifnot(is_integerish(index, n = 1, finite = TRUE))

  if (is_null(arg)) {
    where <- ""
  } else {
    where <- sprintf(" of `%s`", as_string(arg))
  }
  what <- sprintf("Element %d%s", index, where)

  stop_bad_type(
    x,
    expected,
    what = what,
    actual = actual,
    arg = arg,
    index = index,
    ...,
    message = message,
    .subclass = c(.subclass, "purrr_error_bad_element_type")
  )
}
