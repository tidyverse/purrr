context("rerun")

test_that("single unnamed arg doesn't get extra list", {
  expect_equal(rerun(2, 1), list(1, 1))
})

test_that("single named arg gets extra list", {
  expect_equal(rerun(2, a = 1), list(list(a = 1), list(a = 1)))
})

test_that("every run is different", {
  x <- rerun(2, runif(1))
  expect_true(x[[1]] != x[[2]])
})

test_that("rerun uses scope of expression", {
  f <- function(n) {
    rerun(1, x = seq_len(n))
  }

  expect_equal(f(10)[[1]]$x, 1:10)
})
