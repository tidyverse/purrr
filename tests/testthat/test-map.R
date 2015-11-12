context("map")

test_that("preserves names", {
  out <- map(list(x = 1, y = 2), identity)
  expect_equal(names(out), c("x", "y"))
})

test_that("creates simple call", {
  out <- map(1, function(x) sys.call())[[1]]
  expect_identical(out, quote(.f(.x[[i]], ...)))
})

test_that("fails on non-vectors", {
  expect_error(map(environment(), identity), "not a vector")
  expect_error(map(quote(a), identity), "not a vector")
})

test_that("0 length input gives 0 length output", {
  out <- map(list(), identity)
  expect_equal(out, list())
})

test_that("map() returns a data frame when given one", {
  df <- data.frame(a = c("a", "b"), b = c("a", "b"))

  out1 <- map(df, as.character)
  out2 <- map(df, `[[`, 1)

  expect_is(out1, "data.frame")
  expect_is(out2, "data.frame")
})
