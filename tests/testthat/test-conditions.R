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
  expect_error(
    stop_bad_type(NA, "`NULL`"),
    "Object must be `NULL`",
    "purrr_error_bad_type"
  )
  expect_error(
    stop_bad_type(NA, "`NULL`", arg = ".foo"),
    "`.foo` must be `NULL`",
    "purrr_error_bad_type"
  )
  expect_error(
    stop_bad_type(NA, "`NULL`", arg = quote(.foo)),
    "`arg` must be `NULL` or a string, not a symbol",
    "purrr_error_bad_type"
  )
})

test_that("stop_bad_element_type() constructs type errors", {
  expect_error(
    stop_bad_element_type(1:3, 3, "a foobaz"),
    "Element 3 must be a foobaz, not an integer vector",
    "purrr_error_bad_element_type"
  )

  expect_error(
    stop_bad_element_type(1:3, 3, "a foobaz", actual = "a quux"),
    "Element 3 must be a foobaz, not a quux",
    "purrr_error_bad_element_type"
  )

  expect_error(
    stop_bad_element_type(1:3, 3, "a foobaz", arg = "..arg"),
    "Element 3 of `..arg` must be a foobaz, not an integer vector",
    "purrr_error_bad_element_type"
  )
})

test_that("stop_bad_element_type() accepts `what`", {
  expect_error(
    stop_bad_element_type(1:3, 3, "a foobaz", what = "Result"),
    "Result 3 must be a foobaz, not an integer vector",
    "purrr_error_bad_element_type"
  )
})
