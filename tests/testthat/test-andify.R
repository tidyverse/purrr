library(purr)
context("andify()")

is_numeric <- is.numeric
is_even <- function(x) x %% 2 == 0
greater_than_10 <- function(x) x > 10
less_than_100 <- function(x) x < 100
even_number_between_10_and_100 <-
  andify(is_numeric, is_even, greater_than_10, less_than_100)

test_that("Produces the correct output.", {
  expect_equal(andify(is.numeric, function(x) x < 20)(20), FALSE)
  expect_equal(andify(is.numeric, function(x) x < 20)(19), TRUE)
  expect_equal(even_number_between_10_and_100(8), FALSE)
  expect_equal(even_number_between_10_and_100(9), FALSE)
  expect_equal(even_number_between_10_and_100(10), FALSE)
  expect_equal(even_number_between_10_and_100(11), FALSE)
  expect_equal(even_number_between_10_and_100(12), TRUE)
  expect_equal(even_number_between_10_and_100(49), FALSE)
  expect_equal(even_number_between_10_and_100(50), TRUE)
  expect_equal(even_number_between_10_and_100(100), FALSE)
  expect_equal(even_number_between_10_and_100(101), FALSE)
  expect_equal(even_number_between_10_and_100(102), FALSE)
})

test_that("Produces the correct output type.", {
  expect_is(andify(is.numeric, function(x) x < 20), "function")
  expect_is(even_number_between_10_and_100, "function")
})

test_that("Produces the correct errors.", {
  expect_error(andify())
})
