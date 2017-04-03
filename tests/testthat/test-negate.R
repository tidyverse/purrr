context("negate")

test_that("negate works with both functions and vectors", {
  true <- function(...) TRUE
  expect_equal(negate(true)(), FALSE)
  expect_equal(negate("x")(list(x = TRUE)), FALSE)

  skip("until we use rlang::as_closure()")
  # See https://github.com/hadley/rlang/issues/75
  expect_equal(negate(is.null)(TRUE), TRUE)
  expect_equal(negate(is.null)(NULL), FALSE)
})
