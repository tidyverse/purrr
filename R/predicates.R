#' Test is an object is integer or double
#'
#' Numeric is used in three different ways in base R:
#' * as an alias for double (as in [as.numeric()])
#' * to mean either integer or double (as in [mode()])
#' * for something representable as numeric (as in [as.numeric()])
#' This function tests for the second, which is often not what you want
#' so these functions are deprecated.
#'
#' @export
#' @keywords internal
is_numeric <- function(x) {
  warning("Deprecated", call. = FALSE)
  is_integer(x) || is_double(x)
}

#' @export
#' @rdname is_numeric
is_scalar_numeric <- function(x) {
  warning("Deprecated", call. = FALSE)
  is_scalar_integer(x) || is_scalar_double(x)
}

# Re-exports from purrr ---------------------------------------------------

#' @export
rlang::is_bare_list

#' @export
rlang::is_bare_atomic

#' @export
rlang::is_bare_vector

#' @export
rlang::is_bare_double

#' @export
rlang::is_bare_integer

#' @export
rlang::is_bare_numeric

#' @export
rlang::is_bare_character

#' @export
rlang::is_bare_logical

#' @export
rlang::is_list

#' @export
rlang::is_atomic

#' @export
rlang::is_vector

#' @export
rlang::is_integer

#' @export
rlang::is_double

#' @export
rlang::is_character

#' @export
rlang::is_logical

#' @export
rlang::is_null

#' @export
rlang::is_function

#' @export
rlang::is_scalar_list

#' @export
rlang::is_scalar_atomic

#' @export
rlang::is_scalar_vector

#' @export
rlang::is_scalar_double

#' @export
rlang::is_scalar_character

#' @export
rlang::is_scalar_logical

#' @export
rlang::is_empty

#' @export
rlang::is_formula
