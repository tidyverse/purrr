context("update_list")

test_that("can modify element called x", {
  expect_equal(update_list(list(), x = 1), list(x = 1))
})

test_that("can remove with NULL", {
  expect_equal(update_list(list(x = 1, y = 2), x = NULL), list(y = 2))
})

test_that("quosures are evaluated", {
  expect_equal(update_list(list(x = 1), y = ~ x + 1), list(x = 1, y = 2))
})
