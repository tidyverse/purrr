context("set_names")

test_that("inputs must be valid", {
  expect_error(set_names(environment()), "must be a vector")

  x <- 1:10
  expect_error(set_names(x, letters[1:4]), "same length")
})

test_that("can supply vector or ...", {
  x <- 1:2

  expect_named(set_names(x, c("a", "b")), c("a", "b"))
  expect_named(set_names(x, "a", "b"), c("a", "b"))
})


test_that("can supply function/formula to rename", {
  x <- c(a = 1, b = 2)

  expect_named(set_names(x, toupper), c("A", "B"))
  expect_named(set_names(x, ~ toupper(.)), c("A", "B"))
})
