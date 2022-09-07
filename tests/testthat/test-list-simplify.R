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

test_that("can simplify one-row data frames", {
  x <- list(data.frame(x = 1), data.frame(y = 2))
  expect_equal(list_simplify(x), data.frame(x = c(1, NA), y = c(NA, 2)))
})

test_that("ptype is checked", {
  expect_equal(list_simplify(list(1, 2), ptype = double()), c(1, 2))
  expect_snapshot(list_simplify(list(1, 2), ptype = character()), error = TRUE)
})

test_that("can suppress simplification", {
  x <- list(1, 2)
  expect_equal(list_simplify(x, simplify = FALSE), x)
})

test_that("strict simplification will error", {
  expect_snapshot(error = TRUE, {
    list_simplify(list(1, "a"), simplify = TRUE)
    list_simplify(list(1, 1:2), simplify = TRUE)
    list_simplify(list(1, 2), simplify = TRUE, ptype = character())
  })
})

# argument checking -------------------------------------------------------

test_that("validates inputs", {
  expect_snapshot(list_simplify(1:5), error = TRUE)
  expect_snapshot(list_simplify(list(), simplify = 1), error = TRUE)
  expect_snapshot(list_simplify(list(), simplify = FALSE, ptype = integer()), error = TRUE)
})
