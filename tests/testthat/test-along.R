context("along")

test_that("list_along works", {
  x <- 1:5
  expect_identical(list_along(x), vector("list", 5))
})

test_that("rep_along works", {
  expect_equal(
    rep_along(c("c", "b", "a"), 1:3),
    rep_along(c("d", "f", "e"), 1:3)
  )
})
