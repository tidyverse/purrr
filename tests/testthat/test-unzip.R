context("unzip")

test_that("scalars simplified to vector", {
  expect_equal(unzip(list(list(1), list(2))), list(1:2))
})

test_that("names preserved", {
  expect_equal(unzip(list(list(x = 1), list(x = 2))), list(x = 1:2))
})

test_that("unzip uses names if present", {
  expect_equal(unzip(list(list(x = 1), list(y = 2))), list(x = list(1, NULL)))
})

test_that("unzip uses names if present", {
  expect_equal(
    unzip(list(list(x = 1), list(y = 2)), c("x", "y")),
    list(x = list(1, NULL), y = list(NULL, 2))
  )
})
