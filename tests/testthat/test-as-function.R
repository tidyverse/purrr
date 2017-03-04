context("as_function")

test_that(".null replaces absent values", {
  x <- list(
    list(a = 1, b = 2, c = 3),
    list(a = 1, c = 2),
    NULL
  )

  expect_equal(map_dbl(x, 3, .null = NA), c(3, NA, NA))
  expect_equal(map_dbl(x, "b", .null = NA), c(2, NA, NA))
})

test_that(".null replaces elements with length 0", {
  x <- list(
    list(a = 1),
    list(a = NULL),
    list(a = numeric())
  )
  expect_equal(map_dbl(x, "a", .null = NA), c(1, NA, NA))
})
