context("rbernoulli")

test_that("rbernouli works with n = 0", {
  set.seed(213521)
  expect_equal(rbernoulli(0), logical(0))
  expect_equal(rbernoulli(NULL), logical(0))
})

test_that("rbernolli works with n = 1", {
  set.seed(213521)
  expect_equal(rbernoulli(1), TRUE)
})

test_that("rbernoulli works with only n argument", {
  set.seed(34531)
  expect_equal(rbernoulli(5), c(TRUE, TRUE, TRUE, FALSE, FALSE))
})

test_that("rbernoulli works with one n and multple p", {
  set.seed(235)
  expect_equal(rbernoulli(2, c(0.1, 0.2)), c(TRUE, FALSE))
})

test_that("rbernoulli works with n set by length of n", {
  set.seed(2351)
  expect_equal(rbernoulli(c("a", "b"), c(0.1, 0.2)), c(FALSE, FALSE))
})

test_that("rbernoulli works with n = 1, and multiple p", {
  set.seed(12351)
  expect_equal(rbernoulli(1, c(0.1, 0.2)), FALSE)
})
