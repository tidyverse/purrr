context("along")

test_that("list_along works", {
  x <- 1:5
  expect_identical(list_along(x), vector("list", 5))
})

test_that("rep_along works", {
  x1 <- 1:5
  x2 <- 6:10
  y <- 1:3
  expect_identical(rep_along(x1, y), rep_along(x2, y))
})
