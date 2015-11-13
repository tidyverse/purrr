context("flatten")

test_that("input must be a list", {
  expect_error(flatten(1), "must be a list")
})

test_that("contents of list must be vectors", {
  expect_error(flatten(list(quote(a))), "not a vector")
})

test_that("each second level element becomes first level element", {
  expect_equal(flatten(list(1:2)), list(1, 2))
  expect_equal(flatten(list(1, 2)), list(1, 2))
})

test_that("names are preserved", {
  expect_equal(flatten(list(list(x = 1), list(y = 1))), list(x = 1, y = 1))
})

# typed flattens ----------------------------------------------------------

test_that("error thrown when invalid input", {
  expect_error(flatten_lgl(list(1)), "not a logical")
})

test_that("output is correct for simple examples", {
  expect_equal(flatten_lgl(list(TRUE, FALSE)), c(TRUE, FALSE))
  expect_equal(flatten_dbl(list(1, 2)), c(1, 2))
  expect_equal(flatten_int(list(1L, 2L)), c(1L, 2L))
  expect_equal(flatten_chr(list("a", "b")), c("a", "b"))
})
