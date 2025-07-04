test_that("is deprecated", {
  expect_snapshot({
    . <- rerun(5, rnorm(1))
    . <- rerun(5, rnorm(1), rnorm(2))
  })
})

test_that("single unnamed arg doesn't get extra list", {
  local_options(lifecycle_verbosity = "quiet")
  expect_equal(rerun(2, 1), list(1, 1))
})

test_that("single named arg gets extra list", {
  local_options(lifecycle_verbosity = "quiet")
  expect_equal(rerun(2, a = 1), list(list(a = 1), list(a = 1)))
})

test_that("every run is different", {
  local_options(lifecycle_verbosity = "quiet")
  x <- rerun(2, runif(1))
  expect_true(x[[1]] != x[[2]])
})

test_that("rerun uses scope of expression", {
  local_options(lifecycle_verbosity = "quiet")
  f <- function(n) {
    rerun(1, x = seq_len(n))
  }

  expect_equal(f(10)[[1]]$x, 1:10)
})
