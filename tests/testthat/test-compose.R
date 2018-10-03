context("compose")

test_that("composed functions are applied right to left", {
  expect_identical(!is.null(4), compose(`!`, is.null)(4))

  set.seed(1)
  x <- sample(1:4, 100, replace = TRUE)
  expect_identical(unname(sort(table(x))), compose(unname, sort, table)(x))
})

test_that("compose supports formulas and characters", {

  # Test for formulaes
  round_mean <- compose(~ .x * 100, ~ round(.x, 2), ~ mean(.x, na.rm = TRUE))

  expect_is(round_mean, "function")
  expect_identical(round_mean(1:100), round( mean(1:100, na.rm = TRUE), 2) * 100 )

  # Test for characters
  round_mean <- compose("round", "mean")

  expect_is(round_mean, "function")
  expect_identical( round_mean(1:100), round(mean(1:100)) )
})
