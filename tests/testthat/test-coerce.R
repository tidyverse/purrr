test_that("can coerce to logical vectors", {
  expect_equal(coerce_lgl(c(TRUE, FALSE, NA)), c(TRUE, FALSE, NA))

  expect_equal(coerce_lgl(c(1L, 0L, NA)), c(TRUE, FALSE, NA))
  expect_snapshot(coerce_lgl(2L), error = TRUE)

  expect_equal(coerce_lgl(c(1, 0, NA)), c(TRUE, FALSE, NA))
  expect_snapshot(coerce_lgl(1.5), error = TRUE)

  expect_snapshot(coerce_lgl("true"), error = TRUE)
})

test_that("can coerce to integer vectors", {
  expect_identical(coerce_int(c(TRUE, FALSE, NA)), c(1L, 0L, NA))

  expect_identical(coerce_int(c(NA, 1L, 10L)), c(NA, 1L, 10L))

  expect_identical(coerce_int(c(NA, 1, 10)), c(NA, 1L, 10L))
  expect_snapshot(coerce_int(1.5), error = TRUE)

  expect_snapshot(coerce_int("1"), error = TRUE)
})

test_that("can coerce to double vctrs", {
  expect_identical(coerce_dbl(c(TRUE, FALSE, NA)), c(1, 0, NA))

  expect_identical(coerce_dbl(c(NA, 1L, 10L)), c(NA, 1, 10))

  expect_identical(coerce_dbl(c(NA, 1.5)), c(NA, 1.5))

  expect_snapshot(coerce_dbl("1.5"), error = TRUE)
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
  indirect <- function() {
    purrr::map_chr(1:4, identity)
  }
  environment(indirect) <- ns_env("rlang")

  expect_snapshot({
    map_chr(1:4, identity)
    indirect()
  })
})

test_that("warns once per vector", {
  expect_warning(expect_warning(coerce_chr(1:5)), NA)
})

test_that("can't coerce to expressions", {
  expect_snapshot(coerce(list(1), "expression"), error = TRUE)
})
