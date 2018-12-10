context("conditions")

test_that("stop_bad_type() stores fields", {
  err <- catch_cnd(stop_bad_type(NA, "`NULL`", actual = "a foobaz", arg = ".foo"))
  expect_is(err, "purrr_error_bad_type")
  expect_identical(err$x, NA)
  expect_identical(err$expected, "`NULL`")
  expect_identical(err$actual, "a foobaz")
  expect_identical(err$arg, ".foo")
})

test_that("stop_bad_type() constructs default `what`", {
  expect_error_cnd(
    stop_bad_type(NA, "`NULL`"),
    "Object must be `NULL`",
    "purrr_error_bad_type"
  )
  expect_error_cnd(
    stop_bad_type(NA, "`NULL`", arg = ".foo"),
    "`.foo` must be `NULL`",
    "purrr_error_bad_type"
  )
  expect_error_cnd(
    stop_bad_type(NA, "`NULL`", arg = quote(.foo)),
    "`arg` must be `NULL` or a string, not a symbol",
    "purrr_error_bad_type"
  )
})

test_that("stop_bad_element_type() constructs type errors", {
  expect_error_cnd(
    stop_bad_element_type(1:3, 3, "a foobaz"),
    "Element 3 must be a foobaz, not an integer vector",
    "purrr_error_bad_element_type"
  )

  expect_error_cnd(
    stop_bad_element_type(1:3, 3, "a foobaz", actual = "a quux"),
    "Element 3 must be a foobaz, not a quux",
    "purrr_error_bad_element_type"
  )

  expect_error_cnd(
    stop_bad_element_type(1:3, 3, "a foobaz", arg = "..arg"),
    "Element 3 of `..arg` must be a foobaz, not an integer vector",
    "purrr_error_bad_element_type"
  )
})

test_that("stop_bad_element_type() accepts `what`", {
  expect_error_cnd(
    stop_bad_element_type(1:3, 3, "a foobaz", what = "Result"),
    "Result 3 must be a foobaz, not an integer vector",
    "purrr_error_bad_element_type"
  )
})

test_that("stop_bad_length() stores fields", {
  err <- catch_cnd(stop_bad_length(1:3, 10, actual = 100, arg = ".foo"))
  expect_is(err, "purrr_error_bad_length")
  expect_identical(err$x, 1:3)
  expect_identical(err$expected_length, 10)
  expect_identical(err$arg, ".foo")
})

test_that("stop_bad_length() constructs error message", {
  expect_error_cnd(stop_bad_length(1:3, 10), "Vector must have length 10, not 3", "purrr_error_bad_length")
  expect_error_cnd(stop_bad_length(1:3, 10, arg = ".foo"), "`.foo` must have length 10, not 3", "purrr_error_bad_length")
  expect_error_cnd(stop_bad_length(1:3, 10, arg = ".foo", what = "This thing"), "This thing must have length 10, not 3", "purrr_error_bad_length")
  expect_error_cnd(stop_bad_length(1:3, 10, arg = ".foo", what = "This thing", recycle = TRUE), "This thing must have length 1 or 10, not 3", "purrr_error_bad_length")
})

test_that("stop_bad_element_length() constructs error message", {
  expect_error_cnd(stop_bad_element_length(1:3, 8, 10), "Element 8 must have length 10, not 3", "purrr_error_bad_element_length")
  expect_error_cnd(stop_bad_element_length(1:3, 8, 10, arg = ".foo"), "Element 8 of `.foo` must have length 10, not 3", "purrr_error_bad_element_length")
  expect_error_cnd(stop_bad_element_length(1:3, 8, 10, arg = ".foo", what = "Result"), "Result 8 of `.foo` must have length 10, not 3", "purrr_error_bad_element_length")
  expect_error_cnd(stop_bad_element_length(1:3, 8, 10, arg = ".foo", what = "Result", recycle = TRUE), "Result 8 of `.foo` must have length 1 or 10, not 3", "purrr_error_bad_element_length")
})

test_that("stop_bad_vector() constructs error message", {
  expect_error_cnd(stop_bad_vector(1:3, character(), 1), "Vector must be a single string, not an integer vector of length 3", "purrr_error_bad_vector")
  expect_error_cnd(stop_bad_vector(factor(c("a", "b")), character(), 10), "Vector must be a character vector of length 10, not a vector of class `factor` and of length 2", "purrr_error_bad_vector")
  expect_error_cnd(stop_bad_vector(1:3, character(), 10, recycle = TRUE), "Vector must be a character vector of length 1 or 10, not an integer vector of length 3", "purrr_error_bad_vector")
  expect_error_cnd(stop_bad_vector(1:3, 1:2, 10, what = "This foobaz vector", recycle = TRUE), "This foobaz vector must be an integer vector of length 1 or 10, not an integer vector of length 3", "purrr_error_bad_vector")
  expect_error_cnd(stop_bad_vector(list(1, 2), logical(), 10, arg = ".quux", recycle = TRUE), "`.quux` must be a logical vector of length 1 or 10, not a list of length 2", "purrr_error_bad_vector")
})

test_that("stop_bad_element_vector() constructs error message", {
  expect_error_cnd(stop_bad_element_vector(1:3, 3, character(), 1), "Element 3 must be a single string, not an integer vector of length 3", "purrr_error_bad_element_vector")
  expect_error_cnd(stop_bad_element_vector(1:3, 20, 1:2, 10, what = "Result", recycle = TRUE), "Result 20 must be an integer vector of length 1 or 10, not an integer vector of length 3", "purrr_error_bad_element_vector")
  expect_error_cnd(stop_bad_element_vector(list(1, 2), 1, logical(), 10, arg = ".quux", recycle = TRUE), "Element 1 of `.quux` must be a logical vector of length 1 or 10, not a list of length 2", "purrr_error_bad_element_vector")
})
