context("is_formula")

test_that("is_formula works as expected", {
  expect_true(is_formula(~ x + y))
  expect_false(is_formula(1))
  expect_false(is_formula(quote(x + y)))
  # one-sided formula
  expect_true(is_formula(~ x + y, has_lhs = NA))
  expect_true(is_formula(~ x + y, has_lhs = NULL))
  expect_false(is_formula(~ x + y, has_lhs = TRUE))
  expect_true(is_formula(~ x + y, has_lhs = FALSE))
  # two-sided formula
  expect_true(is_formula(y ~ x, has_lhs = NA))
  expect_true(is_formula(y ~ x, has_lhs = NULL))
  expect_true(is_formula(y ~ x, has_lhs = TRUE))
  expect_false(is_formula(y ~ x, has_lhs = FALSE))
})
