#' Error conditions for bad types
#'
#' @param x The object whose type doesn't match `expected`.
#' @param what What does `x` represent? This is used to introduce the
#'   object in the error message and should be capitalised. If `NULL`
#'   and `arg` is `NULL` as well, defaults to `"Object"`. Otherwise
#'   defaults to `arg` wrapped in backquotes.
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
#' @name purrr-conditions-type
#' @noRd
NULL

stop_bad_type <- function(
  x,
  expected,
  ...,
  what = NULL,
  arg = NULL,
  call = caller_env()
) {
  what <- what %||% what_bad_object(arg)
  cli::cli_abort(
    "{what} must be {expected}, not {.obj_type_friendly {x}}.",
    arg = arg,
    call = call
  )
}

stop_bad_element_type <- function(
  x,
  index,
  expected,
  ...,
  what = NULL,
  arg = NULL,
  call = caller_env()
) {
  what <- what_bad_element(what, arg, index)
  cli::cli_abort(
    "{what} must be {expected}, not {.obj_type_friendly {x}}.",
    arg = arg,
    call = call
  )
}

stop_bad_element_length <- function(
  x,
  index,
  expected_length,
  ...,
  what = NULL,
  arg = NULL,
  recycle = FALSE,
  call = caller_env()
) {
  what <- what_bad_element(what, arg, index)

  if (recycle) {
    expected <- sprintf("1 or %s", expected_length)
  } else {
    expected <- expected_length
  }

  cli::cli_abort(
    "{what} must have length {expected}, not {length(x)}.",
    arg = arg,
    call = call
  )
}

# Helpers -----------------------------------------------------------------

what_bad_object <- function(arg) {
  if (is_null(arg)) {
    "Object"
  } else if (is_string(arg)) {
    sprintf("`%s`", arg)
  } else {
    stop_bad_type(arg, "`NULL` or a string", arg = "arg")
  }
}

what_bad_element <- function(what, arg, index) {
  stopifnot(is_integerish(index, n = 1, finite = TRUE))

  if (is_null(arg)) {
    what <- what %||% "Element"
    sprintf("%s %d", what, index)
  } else {
    sprintf("`%s[[%d]]`", arg, index)
  }
}
