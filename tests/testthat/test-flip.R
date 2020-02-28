context("flip")

test_that("flip returns a function", {
  f <- flip(rep)

  expect_is(f, "function")
})

test_that("flip transposes the first two arguments of a function", {
  f <- flip(rep)

  x <- f(1:3, 3:1)

  expect_equal(x, c(3, 2, 2, 1, 1, 1))
})
