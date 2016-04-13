context("as_function")

test_that(".null replaces absent values", {
  x <- list(
    list(a = 1, b = 2, c = 3),
    list(a = 1, c = 2)
  )

  expect_equal(map_dbl(x, 3, .null = NA), c(3, NA))
  expect_equal(map_dbl(x, "b", .null = NA), c(2, NA))
})


# extract -----------------------------------------------------------------

test_that("can extract by position", {
  x <- list("a", 1, c(TRUE, FALSE))

  expect_identical(extract(x, list(1)), x[[1]])
  expect_identical(extract(x, list(2)), x[[2]])
  expect_identical(extract(x, list(3)), x[[3]])
})

test_that("can extract by name", {
  x <- list(a = "a", b = 1, c = c(TRUE, FALSE))

  expect_identical(extract(x, list("a")), x[["a"]])
  expect_identical(extract(x, list("b")), x[["b"]])
  expect_identical(extract(x, list("c")), x[["c"]])
})

test_that("can extract by name and position", {
  x <- list(a = list(list(b = 1)))
  expect_equal(extract(x, list("a", 1, "b")), 1)
})

test_that("special values never matches", {
  x <- list(1, 2, 3)

  expect_null(extract(x, list(NA_character_)))
  expect_null(extract(x, list("")))

  expect_null(extract(x, list(NA_integer_)))

  expect_null(extract(x, list(NA_real_)))
  expect_null(extract(x, list(NaN)))
  expect_null(extract(x, list(Inf)))
})
