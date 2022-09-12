test_that("old simplification functions are deprecated", {
  expect_snapshot({
    . <- as_vector(list(1, 2))
    . <- simplify(list(1, 2))
    . <- simplify_all(list(1, 2))
  })
})


test_that("as_vector can be type-specifc", {
  local_options(lifecycle_verbosity = "quiet")

  expect_identical(as_vector(as.list(letters), "character"), letters)
})

test_that("as_vector cannot coerce lists with zero-length elements", {
  local_options(lifecycle_verbosity = "quiet")

  x <- list(a = 1, b = c(list(), 3))
  expect_error(as_vector(x))
  expect_identical(x, simplify(x))
})
