test_that("simplification requires vectors", {
  expect_equal(list_simplify(list(mean)), list(mean))
})

test_that("simplification requires length 1 inputs", {
  expect_equal(list_simplify(list(1, 2:3)), list(1, 2:3))
  expect_equal(list_simplify(list(1, 2, 3)), c(1, 2, 3))
})

test_that("simplification requires common type", {
  expect_equal(list_simplify(list(1, 2)), c(1, 2))
  expect_equal(list_simplify(list(1, "a")), list(1, "a"))
})

test_that("never simplifies data frames", {
  x <- list(data.frame(x = 1), data.frame(y = 1))
  expect_equal(list_simplify(x), x)
})

test_that("ptype is checked", {
  expect_equal(list_simplify(list(1, 2), ptype = double()), c(1, 2))
  expect_snapshot(list_simplify(list(1, 2), ptype = character()), error = TRUE)
})


# argument checking -------------------------------------------------------

test_that("x must be a list", {
  expect_snapshot(list_simplify(1:5), error = TRUE)
})
