context("simplify")

test_that("can_simplify() understands vector molds", {
  x <- as.list(1:3)
  x2 <- c(x, list(1:3))
  expect_true(can_simplify(x, integer(1)))
  expect_false(can_simplify(x, character(1)))
  expect_false(can_simplify(x2, integer(1)))

  x3 <- list(1:2, 3:4, 5:6)
  expect_true(can_simplify(x3, integer(2)))
  expect_false(can_simplify(x, integer(2)))
})

test_that("can_simplify() understands types as strings", {
  x <- as.list(1:3)
  expect_true(can_simplify(x, "integer"))
  expect_false(can_simplify(x, "character"))
})

test_that("integer is coercible to double", {
  x <- list(1L, 2L)
  expect_true(can_simplify(x, "numeric"))
  expect_true(can_simplify(x, numeric(1)))
  expect_true(can_simplify(x, "double"))
  expect_true(can_simplify(x, double(1)))
})

test_that("numeric is an alias for double", {
  expect_true(can_simplify(list(1, 2), "numeric"))
})

test_that("double is not coercible to integer", {
  expect_false(can_simplify(list(1, 2), "integer"))
})
