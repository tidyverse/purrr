context("map2")

test_that("map2 inputs must be same length", {
  expect_error(map2(1:3, 2:3, function(...) NULL), "different lengths")
})

test_that("map2 can't simplify if elements longer than length 1", {
  expect_error(
    map2_int(1:4, 5:8, range),
    "Result 1 is not a length 1 atomic vector"
  )
})

test_that("fails on non-vectors", {
  expect_error(map2(environment(), "a", identity), "not a vector")
  expect_error(map2("a", environment(), identity), "not a vector")
})

test_that("map2 vectorised inputs of length 1", {
  expect_equal(map2(1:2, 1, `+`), list(2, 3))
  expect_equal(map2(1, 1:2, `+`), list(2, 3))
})

test_that("any 0 length input gives 0 length output", {
  expect_equal(map2(list(), list(), ~ 1), list())
  expect_equal(map2(1:10, list(), ~ 1), list())
  expect_equal(map2(list(), 1:10, ~ 1), list())

  expect_equal(map2(NULL, NULL, ~ 1), list())
  expect_equal(map2(1:10, NULL, ~ 1), list())
  expect_equal(map2(NULL, 1:10, ~ 1), list())
})

test_that("map2 takes only names from x", {
  x1 <- 1:3
  x2 <- set_names(x1)

  expect_equal(names(map2(x1, x2, `+`)), NULL)
  expect_equal(names(map2(x2, x1, `+`)), names(x2))
})

test_that("map2 always returns a list", {
  expect_is(map2(mtcars, 0, ~mtcars), "list")
})
