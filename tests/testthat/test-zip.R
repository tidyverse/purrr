context("zip")

test_that("scalars simplified to vector", {
  expect_equal(zip(list(list(1), list(2)), .simplify = TRUE), list(1:2))
})

test_that("names preserved", {
  expect_equal(zip(list(list(x = 1), list(x = 2)), .simplify = TRUE), list(x = 1:2))
})

test_that("uses names if present", {
  expect_equal(zip(list(list(x = 1), list(y = 2))), list(x = list(1, NULL)))
})

test_that("uses names if present", {
  expect_equal(
    zip(list(list(x = 1), list(y = 2)), .fields = c("x", "y")),
    list(x = list(1, NULL), y = list(NULL, 2))
  )
})
