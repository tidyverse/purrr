test_that("input must be a list of vectors", {
  expect_bad_type_error(pmap(environment(), identity), "`.l` must be a list, not an environment")
  expect_bad_type_error(pmap(list(environment()), identity), "Element 1 of `.l` must be a vector, not an environment")
})

test_that("inputs are recycled", {
  expect_equal(pmap(list(1, 1), c), list(c(1, 1)))
  expect_equal(pmap(list(1:2, 1), c), list(c(1, 1), c(2, 1)))

  expect_equal(pmap(list(list(), 1), ~ 1), list())
  expect_equal(pmap(list(NULL, 1), ~ 1), list())

  expect_snapshot(pmap(list(1:2, 1:3), identity), error = TRUE)
  expect_snapshot(pmap(list(1:2, integer()), identity), error = TRUE)
})

test_that(".f called with named arguments", {
  out <- pmap(list(x = 1, 2, y = 3), list)[[1]]
  expect_equal(names(out), c("x", "", "y"))
})

test_that("names are preserved", {
  out <- pmap(list(c(x = 1, y = 2), 3:4), list)
  expect_equal(names(out), c("x", "y"))
})

test_that("pmap() recycles names (#779)", {
  expect_identical(
    pmap(list(c(a = 1), 1:2), ~ .x),
    list(a = 1, a = 1)
  )
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
  expect_bare(pmap_lgl(list(x), is.numeric), "logical")
  expect_bare(pmap_int(list(x), length), "integer")
  expect_bare(pmap_dbl(list(x), mean), "double")
  expect_bare(pmap_chr(list(x), paste), "character")
})

test_that("outputs are suffixes have correct type for data frames", {
  skip_if_not_installed("dplyr")
  local_name_repair_quiet()

  local_options(rlang_message_verbosity = "quiet")
  x <- 1:3
  expect_s3_class(pmap_dfr(list(x), as.data.frame), "data.frame")
  expect_s3_class(pmap_dfc(list(x), as.data.frame), "data.frame")
})

test_that("pmap on data frames performs rowwise operations", {
  mtcars2 <- mtcars[c("mpg", "cyl")]
  expect_length(pmap(mtcars2, paste), nrow(mtcars))
  expect_bare(pmap_lgl(mtcars2, function(mpg, cyl) mpg > cyl), "logical")
  expect_bare(pmap_int(mtcars2, function(mpg, cyl) as.integer(cyl)), "integer")
  expect_bare(pmap_dbl(mtcars2, function(mpg, cyl) mpg + cyl), "double")
  expect_bare(pmap_chr(mtcars2, paste), "character")
})

test_that("pmap works with empty lists", {
  expect_identical(pmap(list(), ~ 1), list())
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
})
