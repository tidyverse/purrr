context("negate")

test_that("negate works with both functions and vectors", {
  true <- function(...) TRUE
  expect_equal(negate(true)(), FALSE)
  expect_equal(negate("x")(list(x = TRUE)), FALSE)

  expect_equal(negate(is.null)(TRUE), TRUE)
  expect_equal(negate(is.null)(NULL), FALSE)
})

test_that("negate() works with early returns", {
  expect_false(negate(~ return(TRUE))())
})

test_that("negate() works with generic functions and local methods", {
  is_foobar <- function(x) UseMethod("is_foobar")
  local({
    is_foobar.default <- function(x) TRUE
    expect_false(negate(is_foobar)())
  })
})
