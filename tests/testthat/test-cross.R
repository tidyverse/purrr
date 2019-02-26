context("cross")

test_that("long format corresponds to expand.grid output", {
  skip_if_not_installed("tibble")

  x <- list(a = 1:3, b = 4:9)

  out1 <- cross_df(x)
  out2 <- expand.grid(x, KEEP.OUT.ATTRS = FALSE) %>% tibble::as_tibble()

  expect_equal(out1, out2)
})

test_that("filtering works", {
  filter <- function(x, y) x >= y
  out <- cross2(1:3, 1:3, .filter = filter)
  expect_equal(out, list(list(1, 2), list(1, 3), list(2, 3)))
})

test_that("filtering requires a predicate function", {
  expect_error(cross2(1:3, 1:3, .filter = ~ c(TRUE, TRUE)), "not a logical vector of length 2")
})

test_that("filtering fails when filter function doesn't return a logical", {
  filter <- function(x, y, z) x + y + z
  expect_error(cross3(1:3, 1:3, 1:3, .filter = filter))
})

test_that("works with empty input", {
  expect_equal(cross(list()), list())
  expect_equal(cross(NULL), NULL)
})
