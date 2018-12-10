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

stop_bad_type <- function(x,
                          expected,
                          ...,
                          actual = NULL,
                          what = NULL,
                          arg = NULL,
                          message = NULL,
                          .subclass = NULL) {
  what <- what %||% what_bad_object(arg) %||% "Object"
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
    expected = expected,
    actual = actual,
    what = what,
    arg = arg,
    ...,
    .subclass = c(.subclass, "purrr_error_bad_type")
  )
}

stop_bad_element_type <- function(x,
                                  index,
                                  expected,
                                  ...,
                                  actual = NULL,
                                  what = NULL,
                                  arg = NULL,
                                  message = NULL,
                                  .subclass = NULL) {
  stopifnot(is_integerish(index, n = 1, finite = TRUE))
  what <- what_bad_element(what, arg, index)

  stop_bad_type(
    x,
    expected,
    actual = actual,
    what = what,
    arg = arg,
    index = index,
    ...,
    message = message,
    .subclass = c(.subclass, "purrr_error_bad_element_type")
  )
}

what_bad_object <- function(arg) {
  if (is_null(arg)) {
    NULL
  } else if (is_string(arg)) {
    sprintf("`%s`", arg)
  } else {
    stop_bad_type(arg, "`NULL` or a string", arg = "arg")
  }
}
what_bad_element <- function(what, arg, index) {
  if (is_null(arg)) {
    where <- ""
  } else {
    where <- sprintf(" of `%s`", as_string(arg))
  }

  what <- what %||% "Element"
  sprintf("%s %d%s", what, index, where)
}


#' Error conditions for bad lengths
#'
#' @inheritParams purrr-conditions-type
#' @param expected_length The expected length as a number. The actual length
#'   is computed with `length(x)`.
#' @param recycle Whether `x` is also allowed to have length 1.
#'
#' @keywords internal
#' @name purrr-conditions-length
#' @noRd
NULL

stop_bad_length <- function(x,
                            expected_length,
                            ...,
                            what = NULL,
                            arg = NULL,
                            message = NULL,
                            recycle = FALSE,
                            .subclass = NULL) {
  what <- what %||% what_bad_object(arg) %||% "Vector"

  if (recycle) {
    expected <- sprintf("1 or %s", expected_length)
  } else {
    expected <- as.character(expected_length)
  }
  actual <- length(x)

  message <- message %||% sprintf(
    "%s must have length %s, not %s",
    what,
    expected,
    actual
  )

  abort(
    message,
    x = x,
    expected_length = expected_length,
    what = what,
    arg = arg,
    recycle = recycle,
    ...,
    .subclass = c(.subclass, "purrr_error_bad_length")
  )
}

stop_bad_element_length <- function(x,
                                    index,
                                    expected_length,
                                    ...,
                                    what = NULL,
                                    arg = NULL,
                                    message = NULL,
                                    recycle = FALSE,
                                    .subclass = NULL) {
  stopifnot(is_integerish(index, n = 1, finite = TRUE))
  what <- what_bad_element(what, arg, index)

  stop_bad_length(
    x,
    expected_length,
    what = what,
    arg = arg,
    index = index,
    ...,
    recycle = recycle,
    message = message,
    .subclass = c(.subclass, "purrr_error_bad_element_length")
  )
}

#' Error conditions for bad vectors
#'
#' @inheritParams purrr-conditions-length
#' @param expected_ptype The expected prototype of `x`, i.e. an empty
#'   vector of the expected type.
#'
#' @keywords internal
#' @name purrr-conditions-vector
#' @noRd
stop_bad_vector <- function(x,
                            expected_ptype,
                            expected_length = NULL,
                            ...,
                            what = NULL,
                            arg = NULL,
                            message = NULL,
                            recycle = FALSE,
                            .subclass = NULL) {
  what <- what %||% what_bad_object(arg) %||% "Vector"

  expected <- friendly_vector_type(expected_ptype, expected_length, recycle)
  actual <- friendly_vector_type(x, length(x))

  stop_bad_type(
    x,
    expected,
    actual = actual,
    what = what,
    arg = arg,
    recycle = recycle,
    message = message,
    .subclass = c(.subclass, "purrr_error_bad_vector")
  )
}

stop_bad_element_vector <- function(x,
                                    index,
                                    expected_ptype,
                                    expected_length,
                                    ...,
                                    what = NULL,
                                    arg = NULL,
                                    message = NULL,
                                    recycle = FALSE,
                                    .subclass = NULL) {
  stopifnot(is_integerish(index, n = 1, finite = TRUE))
  what <- what_bad_element(what, arg, index)

  stop_bad_vector(
    x,
    expected_ptype,
    expected_length,
    what = what,
    arg = arg,
    index = index,
    ...,
    recycle = recycle,
    message = message,
    .subclass = c(.subclass, "purrr_error_bad_element_vector")
  )
}

friendly_vector_type <- function(x, length = NULL, recycle = FALSE) {
  length <- length %||% length(x)

  if (length == 1) {
    return(friendly_type_of_element(x))
  }

  if (is.object(x)) {
    classes <- paste0("`", paste_classes(x), "`")
    type <- sprintf("a vector of class %s and", classes)
  } else {
    type <- friendly_type_of(x)
  }

  if (recycle) {
    length <- sprintf("1 or %s", length)
  } else {
    length <- as.character(length)
  }

  sprintf("%s of length %s", type, length)
}
