context("utils")

test_that("%@% is an infix attribute accessor", {
  expect_identical(mtcars %@% "names", attr(mtcars, "names"))
})

test_that("rbernoulli is a special case of rbinom", {
  set.seed(1)
  x <- rbernoulli(10)

  set.seed(1)
  y <- ifelse(rbinom(10, 1, 0.5) == 1, TRUE, FALSE)

  expect_equal(x, y)
})

test_that("rdunif works", {
  expect_length(rdunif(100, 10), 100)
})

test_that("rdunif fails if a and b are not unit length numbers", {
  expect_error(rdunif(1000, 1, "a"))
  expect_error(rdunif(1000, 1, c(0.5, 0.2)))
  expect_error(rdunif(1000, FALSE, 2))
  expect_error(rdunif(1000, c(2, 3), 2))
})

test_that("has_names returns vector of logicals", {
  expect_equal(has_names(letters %>% set_names()), rep_along(letters, TRUE))
  expect_equal(has_names(letters), rep_along(letters, FALSE))
})
