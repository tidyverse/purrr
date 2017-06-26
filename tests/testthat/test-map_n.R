context("pmap")

test_that("input must be a list of vectors", {
  expect_error(pmap(environment(), identity), "not a list")
  expect_error(pmap(list(environment()), identity), "not a vector")
})

test_that("elements must be same length", {
  expect_error(pmap(list(1:2, 1:3), identity), "has length 2")
})

test_that("handles any length 0 input", {
  expect_equal(pmap(list(list(), list(), list()), ~ 1), list())
  expect_equal(pmap(list(NULL, NULL, NULL), ~ 1), list())

  expect_equal(pmap(list(list(), list(), 1:10), ~ 1), list())
  expect_equal(pmap(list(NULL, NULL, 1:10), ~ 1), list())
})

test_that("length 1 elemetns are recycled", {
  out <- pmap(list(1:2, 1), c)
  expect_equal(out, list(c(1, 1), c(2, 1)))
})

test_that(".f called with named arguments", {
  out <- pmap(list(x = 1, 2, y = 3), list)[[1]]
  expect_equal(names(out), c("x", "", "y"))
})

test_that("names are preserved", {
  out <- pmap(list(c(x = 1, y = 2), 3:4), list)
  expect_equal(names(out), c("x", "y"))
})

test_that("... are passed on", {
  out <- pmap(list(x = 1:2), list, n = 1)
  expect_equal(out, list(
    list(x = 1, n = 1),
    list(x = 2, n = 1)
  ))
})

test_that("outputs are suffixes have correct type", {
  x <- 1:3
  expect_is(pmap_lgl(list(x), is.numeric), "logical")
  expect_is(pmap_int(list(x), length), "integer")
  expect_is(pmap_dbl(list(x), mean), "numeric")
  expect_is(pmap_chr(list(x), paste), "character")
  expect_is(pmap_dfr(list(x), as.data.frame), "data.frame")
  expect_is(pmap_dfc(list(x), as.data.frame), "data.frame")
})

test_that("pmap on data frames performs rowwise operations", {
  mtcars2 <- mtcars[c("mpg", "cyl")]
  expect_length(pmap(mtcars2, paste), nrow(mtcars))
  expect_is(pmap_lgl(mtcars2, function(mpg, cyl) mpg > cyl), "logical")
  expect_is(pmap_int(mtcars2, function(mpg, cyl) as.integer(cyl)), "integer")
  expect_is(pmap_dbl(mtcars2, function(mpg, cyl) mpg + cyl), "numeric")
  expect_is(pmap_chr(mtcars2, paste), "character")
})
