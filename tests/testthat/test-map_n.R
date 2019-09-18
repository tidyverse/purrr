context("pmap")

test_that("input must be a list of vectors", {
  expect_bad_type_error(pmap(environment(), identity), "`.l` must be a list, not an environment")
  expect_bad_type_error(pmap(list(environment()), identity), "Element 1 of `.l` must be a vector, not an environment")
})

test_that("elements must be same length", {
  expect_bad_element_length_error(pmap(list(1:2, 1:3), identity), "Element 1 of `.l` must have length 1 or 3, not 2")
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
  expect_is(pmap_raw(list(x), as.raw), "raw")
})

test_that("outputs are suffixes have correct type for data frames", {
  skip_if_not_installed("dplyr")
  x <- 1:3
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
  expect_is(pmap_raw(mtcars2, function(mpg, cyl) as.raw(cyl)), "raw")
})

test_that("pmap works with empty lists", {
  expect_identical(pmap(list(), identity), list())
})

test_that("preserves S3 class of input vectors (#358)", {
  date <- as.Date("2018-09-27")
  expect_equal(pmap(list(date), identity), list(date))
  expect_output(pwalk(list(date), print), format(date))
})

test_that("walk2() and pwalk() don't evaluate symbolic objects", {
  walk2(exprs(1 + 2), NA, ~ expect_identical(.x, quote(1 + 2)))
  pwalk(list(exprs(1 + 2)), ~ expect_identical(.x, quote(1 + 2)))
})

test_that("map2() and pmap() don't evaluate symbolic objects", {
  map2(exprs(1 + 2), NA, ~ expect_identical(.x, quote(1 + 2)))
  pmap(list(exprs(1 + 2)), ~ expect_identical(.x, quote(1 + 2)))
})

test_that("pmap() with empty input copies names", {
  named_list <- list(named(list()))
  expect_identical(    pmap(named_list, identity), named(list()))
  expect_identical(pmap_lgl(named_list, identity), named(lgl()))
  expect_identical(pmap_int(named_list, identity), named(int()))
  expect_identical(pmap_dbl(named_list, identity), named(dbl()))
  expect_identical(pmap_chr(named_list, identity), named(chr()))
  expect_identical(pmap_raw(named_list, identity), named(raw()))
})
