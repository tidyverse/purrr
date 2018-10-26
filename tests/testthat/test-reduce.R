context("reduce")

test_that("empty input returns init or error", {
  expect_error(reduce(list()), "no `.init` supplied")
  expect_equal(reduce(list(), `+`, .init = 0), 0)
})

test_that("first/value value used as first value", {
  x <- c(1, 1)

  expect_equal(reduce(x, `+`), 2)
  expect_equal(reduce(x, `+`, .init = 1), 3)
  expect_equal(reduce_right(x, `+`), 2)
  expect_equal(reduce_right(x, `+`, .init = 1), 3)
})

test_that("length 1 argument reduced with init", {
  expect_equal(reduce(1, `+`, .init = 1), 2)
  expect_equal(reduce_right(1, `+`, .init = 1), 2)
})

test_that("reduce_right equivalent to reversing input", {
  x <- list(c(2, 1), c(4, 3), c(6, 5))
  expect_equal(reduce_right(x, c), c(6, 5, 4, 3, 2, 1))
  expect_equal(reduce_right(x, c, .init = 7), c(7, 6, 5, 4, 3, 2, 1))
})

# reduce_while --------------------------------------------------------------

test_that("reduce_while stops appropriately", {
  expect_equal(reduce_while(1:6, `+`, ~ . < 5), 3)
  expect_equal(reduce_while(1:6, `+`, ~ . < 5, .hind = FALSE), 6)
})

test_that("hind looking reduce_while with a failing predicate returns NA", {
  expect_true(is.na(reduce_while(1:6, `+`, ~ FALSE)))
})

test_that("reduce_while_right works like reduce_while(rev(x), ...)", {
  expect_equal(reduce_while(1:6, `+`, ~ . < 20)
             , reduce_while_right(rev(1:6), `+`, ~ . < 20))
})

# accumulate --------------------------------------------------------------

test_that("accumulate passes arguments to function", {
  tt <- c("a", "b", "c")
  expect_equal(accumulate(tt, paste, sep = "."), c("a", "a.b", "a.b.c"))
  expect_equal(accumulate_right(tt, paste, sep = "."), c("c.b.a", "c.b", "c"))
})

test_that("accumulate keeps input names", {
  input <- set_names(1:26, letters)
  expect_identical(accumulate(input, sum), set_names(cumsum(1:26), letters))
  expect_identical(accumulate_right(input, sum), set_names(rev(cumsum(rev(1:26))), letters))
})

# reduce2 -----------------------------------------------------------------

test_that("basic application works", {
  paste2 <- function(x, y, sep) paste(x, y, sep = sep)

  x <- c("a", "b", "c")
  expect_equal(reduce2(x, c("-", "."), paste2), "a-b.c")
  expect_equal(reduce2(x, c(".", "-", "."), paste2, .init = "x"), "x.a-b.c")
})

test_that("reduce2_right works if lengths match", {
  x <- list(c(0, 1), c(2, 3), c(4, 5))
  y <- list(c(6, 7), c(8, 9))
  expect_equal(reduce2_right(x, paste, y), c("4 2 8 0 6", "5 3 9 1 7"))
  expect_error(reduce2_right(y, paste, x))
})

test_that("reduce returns original input if it was length one", {
  x <- list(c(0, 1), c(2, 3), c(4, 5))
  expect_equal(reduce(x[1], paste), x[[1]])
})

# reduce2 -----------------------------------------------------------------

test_that("basic application works", {
  paste2 <- function(x, y, sep) paste(x, y, sep = sep)

  x <- c("a", "b", "c")
  expect_equal(reduce2_while(x, c("-", "."), paste2, ~ nchar(.) < 5), "a-b")
  expect_equal(reduce2_while(x, c(".", "-", "."), paste2,  ~ nchar(.) < 6, .init = "x")
             , "x.a-b")
})
