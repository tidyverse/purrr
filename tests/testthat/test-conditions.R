context("conditions")

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
