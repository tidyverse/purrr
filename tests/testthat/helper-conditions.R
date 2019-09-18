
expect_error_cnd <- function(expr, regexp, class, ...) {
  err <- catch_cnd(expr)
  expect_true(inherits_all(err, c(class, "error", "condition")))
  expect_match(conditionMessage(err), regexp, ...)
}

expect_bad_type_error <- function(object, regexp = NULL, ...) {
  expect_error(!!enquo(object), regexp = regexp, class = "purrr_error_bad_type", ...)
}
expect_bad_element_type_error <- function(object, regexp = NULL, ...) {
  expect_error(!!enquo(object), regexp = regexp, class = "purrr_error_bad_element_type", ...)
}
expect_bad_element_length_error <- function(object, regexp = NULL, ...) {
  expect_error(!!enquo(object), regexp = regexp, class = "purrr_error_bad_element_length", ...)
}
expect_bad_element_vector_error <- function(object, regexp = NULL, ...) {
  expect_error(!!enquo(object), regexp = regexp, class = "purrr_error_bad_element_vector", ...)
}
