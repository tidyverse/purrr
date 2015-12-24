context("transpose")

test_that("input must be a list", {
  expect_error(transpose(1:3), "is not a list")
})

test_that("elements of input must be vectors", {
  expect_error(transpose(list(environment())), "is not a vector")
  expect_error(transpose(list(list(), environment())), "is not a vector")
})

test_that("empty list returns empty list", {
  expect_equal(transpose(list()), list())
})

test_that("transpose switches order of first & second idnex", {
  x <- list(list(1, 3), list(2, 4))
  expect_equal(transpose(x), list(list(1, 2), list(3, 4)))
})

test_that("inside names become outside names", {
  x <- list(list(x = 1), list(x = 2))
  expect_equal(transpose(x), list(x = list(1, 2)))
})

test_that("outside names become inside names", {
  x <- list(x = list(1, 3), y = list(2, 4))
  expect_equal(transpose(x), list(list(x = 1, y = 2), list(x = 3, y = 4)))
})

test_that("warns if element too short", {
  x <- list(list(1, 2), list(1))
  expect_warning(out <- transpose(x), "Element 2 has length 1")
  expect_equal(out, list(list(1, 1), list(2, NULL)))
})
test_that("warns if element too long", {
  x <- list(list(1, 2), list(1, 2, 3))
  expect_warning(out <- transpose(x), "Element 2 has length 3")
  expect_equal(out, list(list(1, 1), list(2, 2)))
})

test_that("can transpose list of atomic vectors", {
  x <- list(list(TRUE, 1L, 1, "1"))
  expect_equal(transpose(x), list(list(TRUE), list(1L), list(1), list("1")))
})
