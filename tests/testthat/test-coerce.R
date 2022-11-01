test_that("can coerce to logical vectors",{
  expect_equal(coerce_lgl(c(TRUE, FALSE, NA)), c(TRUE, FALSE, NA))

  expect_equal(coerce_lgl(c(1L, 0L, NA)), c(TRUE, FALSE, NA))
  expect_error(coerce_lgl(2L), "Can't coerce")

  expect_equal(coerce_lgl(c(1, 0, NA)), c(TRUE, FALSE, NA))
  expect_error(coerce_lgl(1.5), "Can't coerce")

  expect_error(coerce_lgl("true"), "Can't coerce")
})

test_that("can coerce to integer vectors", {
  expect_identical(coerce_int(c(TRUE, FALSE, NA)), c(1L, 0L, NA))

  expect_identical(coerce_int(c(NA, 1L, 10L)), c(NA, 1L, 10L))

  expect_identical(coerce_int(c(NA, 1, 10)), c(NA, 1L, 10L))
  expect_error(coerce_int(1.5), "Can't coerce")

  expect_error(coerce_int("1"), "Can't coerce")
})

test_that("can coerce to double vctrs", {
  expect_identical(coerce_dbl(c(TRUE, FALSE, NA)), c(1, 0, NA))

  expect_identical(coerce_dbl(c(NA, 1L, 10L)), c(NA, 1, 10))

  expect_identical(coerce_dbl(c(NA, 1.5)), c(NA, 1.5))

  expect_error(coerce_dbl("1.5"), "Can't coerce")
})

test_that("can coerce to character vectors", {
  expect_equal(coerce_chr(NA), NA_character_)

  expect_snapshot({
    expect_equal(coerce_chr(TRUE), "TRUE")
    expect_equal(coerce_chr(1L), "1")
    expect_equal(coerce_chr(1.5), "1.500000")
  })

  expect_equal(coerce_chr("x"), "x")
})

test_that("error captures correct env", {
  expect_snapshot(map_chr(1:4, identity))
})

test_that("warns once per vector", {
  expect_warning(expect_warning(coerce_chr(1:5)), NA)
})

test_that("can't coerce to expressions", {
  expect_error(coerce(list(1), "expression"))
})
