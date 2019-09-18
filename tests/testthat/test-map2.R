context("map2")

test_that("map2 inputs must be same length", {
  expect_error(
    map2(1:3, 2:3, function(...) NULL),
    paste_line(
      "Mapped vectors must have consistent lengths:",
      "\\* `.x` has length 3",
      "\\* `.y` has length 2"
    )
  )
})

test_that("map2 can't simplify if elements longer than length 1", {
  expect_bad_element_vector_error(
    map2_int(1:4, 5:8, range),
    "Result 1 must be a single integer, not an integer vector of length 2"
  )
})

test_that("fails on non-vectors", {
  expect_bad_type_error(map2(environment(), "a", identity), "`.x` must be a vector, not an environment")
  expect_bad_type_error(map2("a", environment(), identity), "`.y` must be a vector, not an environment")
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

test_that("map2() with empty input copies names", {
  named_list <- named(list())
  expect_identical(    map2(named_list, list(), identity), named(list()))
  expect_identical(map2_lgl(named_list, list(), identity), named(lgl()))
  expect_identical(map2_int(named_list, list(), identity), named(int()))
  expect_identical(map2_dbl(named_list, list(), identity), named(dbl()))
  expect_identical(map2_chr(named_list, list(), identity), named(chr()))
  expect_identical(map2_raw(named_list, list(), identity), named(raw()))
})
