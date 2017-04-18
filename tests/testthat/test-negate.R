context("negate")

test_that("negate works with both functions and vectors", {
  true <- function(...) TRUE
  expect_equal(negate(true)(), FALSE)
  expect_equal(negate("x")(list(x = TRUE)), FALSE)

  expect_equal(negate(is.null)(TRUE), TRUE)
  expect_equal(negate(is.null)(NULL), FALSE)
})
