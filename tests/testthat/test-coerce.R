context("coerce")

test_that("missing values converted to new type", {
  expect_equal(coerce_int(NA), NA_integer_)
  expect_equal(coerce_dbl(NA), NA_real_)
  expect_equal(coerce_chr(NA), NA_character_)

  expect_equal(coerce_dbl(NA_integer_), NA_real_)
  expect_equal(coerce_chr(NA_integer_), NA_character_)

  expect_equal(coerce_chr(NA_real_), NA_character_)
})

test_that("can't coerce downwards", {
  expect_error(coerce_chr(list(1)), "Can't coerce")
  expect_error(coerce_dbl(list(1)), "Can't coerce")
  expect_error(coerce_int(list(1)), "Can't coerce")
  expect_error(coerce_lgl(list(1)), "Can't coerce")

  expect_error(coerce_dbl("a"), "Can't coerce")
  expect_error(coerce_int("a"), "Can't coerce")
  expect_error(coerce_lgl("a"), "Can't coerce")

  expect_error(coerce_int(1), "Can't coerce")
  expect_error(coerce_lgl(1), "Can't coerce")

  expect_error(coerce_lgl(1L), "Can't coerce")
})

test_that("coercing to same type returns input", {
  expect_equal(coerce_lgl(c(TRUE, FALSE)), c(TRUE, FALSE))
  expect_equal(coerce_dbl(c(1, 2)), c(1, 2))
  expect_equal(coerce_int(c(1L, 2L)), c(1L, 2L))
  expect_equal(coerce_chr(c("a", "b")), c("a", "b"))
})

test_that("types automatically coerced upwards", {
  expect_identical(coerce_int(c(FALSE, TRUE)), c(0L, 1L))
  expect_identical(coerce_dbl(c(FALSE, TRUE)), c(0, 1))
  expect_identical(coerce_dbl(c(1L, 2L)), c(1, 2))
  expect_identical(coerce_chr(c(FALSE, TRUE)), c("FALSE", "TRUE"))
  expect_identical(coerce_chr(c(1L, 2L)), c("1", "2"))
  expect_identical(coerce_chr(c(1.5, 2.5)), c("1.500000", "2.500000"))
})

test_that("coercing to character values correctly", {
  expect_equal(coerce_chr(c(FALSE, TRUE)), c("FALSE", "TRUE"))
  expect_equal(coerce_chr(c(1L, 2L)), c("1", "2"))
  expect_equal(coerce_chr(c(1.5, 2.5)), c("1.500000", "2.500000"))
  expect_equal(coerce_chr(c("a", "b")), c("a", "b"))

  x <- c(NA, NaN, Inf, -Inf)
  expect_equal(coerce(x, "character"), as.character(x))
})

test_that("can't coerce to expressions", {
  expect_error(coerce(list(1), "expression"))
})

test_that("as_vector can be type-specifc", {
  expect_identical(as_vector(as.list(letters), "character"), letters)
})

test_that("as_vector cannot coerce lists with zero-length elements", {
  x <- list(a = 1, b = c(list(), 3))
  expect_error(as_vector(x))
  expect_identical(x, simplify(x))
})
