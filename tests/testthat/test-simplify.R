context("simplify")

test_that("as_vector_ptype_compat() understands vector molds", {
  x <- as.list(1:3)
  x2 <- c(x, list(1:3))
  expect_identical(as_vector_ptype_compat(x, type = integer(1)), integer(1))
  expect_identical(as_vector_ptype_compat(x2, type = integer(1)), zap())
  expect_identical(as_vector_ptype_compat(x, type = character(1)), character(1))

  x3 <- list(1:2, 3:4, 5:6)
  expect_identical(as_vector_ptype_compat(x3, type = integer(2)), integer(2))
  expect_identical(as_vector_ptype_compat(x, type = integer(2)), zap())
})

test_that("as_vector_ptype_compat() understands types as strings", {
  x <- as.list(1:3)
  expect_identical(as_vector_ptype_compat(x, type = "integer"), integer())
  expect_identical(as_vector_ptype_compat(x, type = "character"), character())
})

test_that("integer is coercible to double", {
  x <- list(1L, 2L)
  expect_identical(as_vector_ptype_compat(x, type = "numeric"), double())
  expect_identical(as_vector_ptype_compat(x, type = numeric(1)), double(1))
  expect_identical(as_vector_ptype_compat(x, type = "double"), double())
  expect_identical(as_vector_ptype_compat(x, type = double(1)), double(1))
})

test_that("numeric is an alias for double", {
  expect_identical(
    as_vector_ptype_compat(list(1, 2), type = "numeric"),
    double()
  )
})

test_that("double is coercible to integer", {
  local_options(lifecycle_verbosity = "quiet")

  expect_identical(
    as_vector_ptype_compat(list(1, 2), type = "integer"),
    integer()
  )
  expect_identical(
    simplify(list(1, 2), .type = integer()),
    1:2
  )
  expect_error(
    simplify(list(1, 2.5), .type = integer()),
    class = "vctrs_error_cast_lossy"
  )
})

test_that("data frames are treated as atomic vectors", {
  expect_identical(simplify(mtcars), mtcars)
  expect_identical(as_vector(mtcars), mtcars)
})

test_that("moulds and modes are deprecated", {
  local_options(lifecycle_verbosity = "error")

  expect_error(
    simplify(list(1:2, 3:4), .type = integer(2)),
    class = "lifecycle_error_deprecated"
  )

  expect_error(
    simplify(list(1, 2), .type = "double"),
    class = "lifecycle_error_deprecated"
  )
})
