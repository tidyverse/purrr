context("update_list")

test_that("can modify element called x", {
  expect_equal(update_list(list(), x = 1), list(x = 1))
})
