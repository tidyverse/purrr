test_that("as_vector can be type-specifc", {
  expect_identical(as_vector(as.list(letters), "character"), letters)
})

test_that("as_vector cannot coerce lists with zero-length elements", {
  x <- list(a = 1, b = c(list(), 3))
  expect_error(as_vector(x))
  expect_identical(x, simplify(x))
})
