test_that("stop_bad_type() stores fields", {
  err <- catch_cnd(stop_bad_type(NA, "`NULL`", actual = "a foobaz", arg = ".foo"))
  expect_s3_class(err, "purrr_error_bad_type")
  expect_identical(err$x, NA)
  expect_identical(err$expected, "`NULL`")
  expect_identical(err$actual, "a foobaz")
  expect_identical(err$arg, ".foo")
})

test_that("stop_bad_type() constructs default `what`", {
  expect_snapshot(stop_bad_type(NA, "`NULL`"), error = TRUE)
  expect_snapshot(stop_bad_type(NA, "`NULL`", arg = ".foo"), error = TRUE)
  expect_snapshot(stop_bad_type(NA, "`NULL`", arg = quote(.foo)), error = TRUE)
})

test_that("stop_bad_element_type() constructs type errors", {
  expect_snapshot(stop_bad_element_type(1:3, 3, "a foobaz"), error = TRUE)
  expect_snapshot(stop_bad_element_type(1:3, 3, "a foobaz", actual = "a quux"), error = TRUE)
  expect_snapshot(stop_bad_element_type(1:3, 3, "a foobaz", arg = "..arg"), error = TRUE)
})

test_that("stop_bad_element_type() accepts `what`", {
  expect_snapshot(stop_bad_element_type(1:3, 3, "a foobaz", what = "Result"), error = TRUE)
})

test_that("stop_bad_element_length() constructs error message", {
  expect_snapshot(stop_bad_element_length(1:3, 8, 10), error = TRUE)
  expect_snapshot(stop_bad_element_length(1:3, 8, 10, arg = ".foo"), error = TRUE)
  expect_snapshot(stop_bad_element_length(1:3, 8, 10, arg = ".foo", what = "Result"), error = TRUE)
  expect_snapshot(stop_bad_element_length(1:3, 8, 10, arg = ".foo", what = "Result", recycle = TRUE), error = TRUE)
})

test_that("stop_bad_element_vector() constructs error message", {
  expect_snapshot(stop_bad_element_vector(1:3, 3, character(), 1), error = TRUE)
  expect_snapshot(stop_bad_element_vector(1:3, 20, 1:2, 10, what = "Result", recycle = TRUE), error = TRUE)
  expect_snapshot(stop_bad_element_vector(list(1, 2), 1, logical(), 10, arg = ".quux", recycle = TRUE), error = TRUE)
})
