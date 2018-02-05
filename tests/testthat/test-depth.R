context("depth")

test_that("depth of NULL is 0", {
  expect_equal(vec_depth(NULL), 0L)
})

test_that("depth of atomic vector is 1", {
  expect_equal(vec_depth(1:10), 1)
  expect_equal(vec_depth(letters), 1)
  expect_equal(vec_depth(c(TRUE, FALSE)), 1)
})

test_that("depth of empty list is 1", {
  expect_equal(vec_depth(list()), 1)
})

test_that("depth of nested is depth of deepest element + 1", {
  x <- list(
    NULL,
    list(),
    list(list())
  )

  depths <- map_int(x, vec_depth)
  expect_equal(depths, c(0, 1, 2))
  expect_equal(vec_depth(x), max(depths) + 1)
})

test_that("depth throws an error if input is not a vector", {
  expect_error(vec_depth(as.formula(y ~ x)))
})
