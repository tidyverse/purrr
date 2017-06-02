context("cross")

test_that("long format corresponds to expand.grid output", {
  x <- list(a = 1:3, b = 4:9)

  out1 <- cross_df(x)
  out2 <- expand.grid(x, KEEP.OUT.ATTRS = FALSE) %>% dplyr::as_data_frame()

  expect_equal(out1, out2)
})

test_that("filtering works", {
  filter <- function(x, y) x >= y
  out <- cross2(1:3, 1:3, .filter = filter)
  expect_equal(out, list(list(1, 2), list(1, 3), list(2, 3)))
})

test_that("filtering fails when filter function doesn't return a logical", {
  filter <- function(x, y, z) x + y + z
  expect_error(cross3(1:3, 1:3, 1:3, .filter = filter))
})

test_that("works with empty input", {
  expect_equal(cross(list()), list())
  expect_equal(cross(NULL), NULL)
})
