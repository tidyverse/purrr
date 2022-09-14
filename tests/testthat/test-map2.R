test_that("map2 can't simplify if elements longer than length 1", {
  expect_snapshot(map2_int(1:4, 5:8, range), error = TRUE)
})

test_that("fails on non-vectors", {
  expect_snapshot(map2(environment(), "a", identity), error = TRUE)
  expect_snapshot(map2("a", environment(), identity), error = TRUE)
})

test_that("map2 recycles inputs", {
  expect_equal(map2(1, 1, `+`), list(2))

  expect_equal(map2(1:2, 1, `+`), list(2, 3))
  expect_equal(map2(integer(), 1, `+`), list())
  expect_equal(map2(NULL, 1, `+`), list())

  expect_snapshot(map2(1:2, 1:3, `+`), error = TRUE)
})

test_that("map2 takes only names from x", {
  x1 <- 1:3
  x2 <- set_names(x1)

  expect_equal(names(map2(x1, x2, `+`)), NULL)
  expect_equal(names(map2(x2, x1, `+`)), names(x2))
})

test_that("map2 always returns a list", {
  expect_bare(map2(mtcars, 0, ~mtcars), "list")
})

test_that("map2() with empty input copies names", {
  named_list <- named(list())
  expect_identical(    map2(named_list, list(), identity), named(list()))
  expect_identical(map2_lgl(named_list, list(), identity), named(lgl()))
  expect_identical(map2_int(named_list, list(), identity), named(int()))
  expect_identical(map2_dbl(named_list, list(), identity), named(dbl()))
  expect_identical(map2_chr(named_list, list(), identity), named(chr()))
})

test_that("map2() recycle names (#779)", {
  expect_identical(
    map2(c(a = 1), 1:2, ~ .x),
    list(a = 1, a = 1)
  )
})
