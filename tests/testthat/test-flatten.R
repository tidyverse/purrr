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
