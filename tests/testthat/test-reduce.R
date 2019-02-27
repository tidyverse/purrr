context("reduce")

test_that("empty input returns init or error", {
  expect_error(reduce(list()), "no `.init` supplied")
  expect_equal(reduce(list(), `+`, .init = 0), 0)
})

test_that("first/value value used as first value", {
  expect_equal(reduce(c(1, 1), `+`), 2)
  expect_equal(reduce(c(1, 1), `+`, .init = 1), 3)
})

test_that("length 1 argument reduced with init", {
  expect_equal(reduce(1, `+`, .init = 1), 2)
})

test_that("direction of reduce determines how generated trees lean", {
  expect_identical(reduce(1:4, list), list(list(list(1L, 2L), 3L), 4L))
  expect_identical(reduce(1:4, list, .dir = "backward"), list(1L, list(2L, list(3L, 4L))))
})

test_that("can shortcircuit reduction with done()", {
  x <- c(TRUE, TRUE, FALSE, TRUE, TRUE)
  out <- reduce(x, ~ if (.y) c(.x, "foo") else done(.x), .init = NULL)
  expect_identical(out, c("foo", "foo"))

  # Empty done box yields the same value as returning the
  # result-so-far (the last value) in a done box
  out2 <- reduce(x, ~ if (.y) c(.x, "foo") else done(), .init = NULL)
  expect_identical(out2, out)
})

test_that("reduce() forces arguments (#643)", {
  skip_if(!has_force_and_call)
  compose <- function(f, g) function(x) f(g(x))
  expect_identical(reduce(list(identity, identity), compose)(1), 1)
})


# accumulate --------------------------------------------------------------

test_that("accumulate passes arguments to function", {
  tt <- c("a", "b", "c")

  expect_equal(accumulate(tt, paste, sep = "."), c("a", "a.b", "a.b.c"))
  expect_equal(accumulate(tt, paste, sep = ".", .dir = "backward"), c("a.b.c", "b.c", "c"))

  expect_equal(accumulate(tt, paste, sep = ".", .init = "z"), c("z", "z.a", "z.a.b", "z.a.b.c"))
  expect_equal(accumulate(tt, paste, sep = ".", .dir = "backward", .init = "z"), c("a.b.c.z", "b.c.z", "c.z", "z"))
})

test_that("accumulate keeps input names", {
  input <- set_names(1:26, letters)
  expect_identical(accumulate(input, sum), set_names(cumsum(1:26), letters))
  expect_identical(accumulate(input, sum, .dir = "backward"), set_names(rev(cumsum(rev(1:26))), rev(letters)))
})

test_that("accumulate keeps input names when init is supplied", {
  expect_identical(accumulate(1:2, c, .init = 0L), list(0L, 0:1, 0:2))
  expect_identical(accumulate(0:1, c, .init = 2L, .dir = "backward"), list(0:2, 1:2, 2L))

  expect_identical(accumulate(c(a = 1L, b = 2L), c, .init = 0L), list(.init = 0L, a = 0:1, b = 0:2))
  expect_identical(accumulate(c(a = 0L, b = 1L), c, .init = 2L, .dir = "backward"), list(b = 0:2, a = 1:2, .init = 2L))
})

test_that("can terminate accumulate() early", {
  tt <- c("a", "b", "c")
  paste2 <- function(x, y) {
    out <- paste(x, y, sep = ".")
    if (x == "b" || y == "b") {
      done(out)
    } else {
      out
    }
  }

  expect_equal(accumulate(tt, paste2), c("a", "a.b"))
  expect_equal(accumulate(tt, paste2, .dir = "backward"), c("b.c", "c"))

  expect_equal(accumulate(tt, paste2, .init = "z"), c("z", "z.a", "z.a.b"))
  expect_equal(accumulate(tt, paste2, .dir = "backward", .init = "z"), c("b.c.z", "c.z", "z"))
})

test_that("can terminate accumulate() early with an empty box", {
  tt <- c("a", "b", "c")
  paste2 <- function(x, y) {
    out <- paste(x, y, sep = ".")
    if (x == "b" || y == "b") {
      done()
    } else {
      out
    }
  }

  expect_equal(accumulate(tt, paste2), "a")
  expect_equal(accumulate(tt, paste2, .dir = "backward"), "c")

  expect_equal(accumulate(tt, paste2, .init = "z"), c("z", "z.a"))
  expect_equal(accumulate(tt, paste2, .dir = "backward", .init = "z"), c("c.z", "z"))

  # Init value is always included, even if done at first iteration
  expect_equal(accumulate(c("b", "c"), paste2), "b")
})

test_that("accumulate() forces arguments (#643)", {
  skip_if(!has_force_and_call)
  compose <- function(f, g) function(x) f(g(x))
  fns <- accumulate(list(identity, identity), compose)
  expect_true(every(fns, function(f) identical(f(1), 1)))
})


# reduce2 -----------------------------------------------------------------

test_that("basic application works", {
  paste2 <- function(x, y, sep) paste(x, y, sep = sep)

  x <- c("a", "b", "c")
  expect_equal(reduce2(x, c("-", "."), paste2), "a-b.c")
  expect_equal(reduce2(x, c(".", "-", "."), paste2, .init = "x"), "x.a-b.c")
})

test_that("reduce returns original input if it was length one", {
  x <- list(c(0, 1), c(2, 3), c(4, 5))
  expect_equal(reduce(x[1], paste), x[[1]])
})

test_that("can shortcircuit reduce2() with done()", {
  x <- c(TRUE, TRUE, FALSE, TRUE, TRUE)
  out <- reduce2(x, 1:5, ~ if (.y) c(.x, "foo") else done(.x), .init = NULL)
  expect_identical(out, c("foo", "foo"))
})

test_that("reduce2() forces arguments (#643)", {
  skip_if(!has_force_and_call)
  compose <- function(f, g, ...) function(x) f(g(x))
  fns <- reduce2(list(identity, identity), "foo", compose)
  expect_identical(fns(1), 1)
})

# accumulate2 -------------------------------------------------------------

test_that("basic accumulate2() works", {
  paste2 <- function(x, y, sep) paste(x, y, sep = sep)

  x <- c("a", "b", "c")
  expect_equal(accumulate2(x, c("-", "."), paste2), list("a", "a-b", "a-b.c"))
  expect_equal(accumulate2(x, c(".", "-", "."), paste2, .init = "x"), list("x", "x.a", "x.a-b", "x.a-b.c"))
})

test_that("can terminate accumulate2() early", {
  paste2 <- function(x, y, sep) {
    out <- paste(x, y, sep = sep)
    if (y == "b") {
      done(out)
    } else {
      out
    }
  }

  x <- c("a", "b", "c")
  expect_equal(accumulate2(x, c("-", "."), paste2), list("a", "a-b"))
  expect_equal(accumulate2(x, c(".", "-", "."), paste2, .init = "x"), list("x", "x.a", "x.a-b"))
})

test_that("accumulate2() forces arguments (#643)", {
  skip_if(!has_force_and_call)
  compose <- function(f, g, ...) function(x) f(g(x))
  fns <- accumulate2(list(identity, identity), "foo", compose)
  expect_true(every(fns, function(f) identical(f(1), 1)))
})


# Life cycle --------------------------------------------------------------

test_that("right variants are retired", {
  scoped_lifecycle_warnings()
  expect_warning(reduce_right(1:3, c), "soft-deprecated")
  expect_warning(reduce2_right(1:3, 1:2, c), "soft-deprecated")
  expect_warning(accumulate_right(1:3, c), "soft-deprecated")
})

test_that("reduce_right still works", {
  scoped_lifecycle_silence()
  expect_equal(reduce_right(c(1, 1), `+`), 2)
  expect_equal(reduce_right(c(1, 1), `+`, .init = 1), 3)
  expect_equal(reduce_right(1, `+`, .init = 1), 2)
})

test_that("reduce_right equivalent to reversing input", {
  scoped_lifecycle_silence()
  x <- list(c(2, 1), c(4, 3), c(6, 5))
  expect_equal(reduce_right(x, c), c(6, 5, 4, 3, 2, 1))
  expect_equal(reduce_right(x, c, .init = 7), c(7, 6, 5, 4, 3, 2, 1))
})

test_that("reduce2_right still works", {
  scoped_lifecycle_silence()

  paste2 <- function(x, y, sep) paste(x, y, sep = sep)
  x <- c("a", "b", "c")
  expect_equal(reduce2_right(x, c("-", "."), paste2), "c.b-a")
  expect_equal(reduce2_right(x, c(".", "-", "."), paste2, .init = "x"), "x.c-b.a")

  x <- list(c(0, 1), c(2, 3), c(4, 5))
  y <- list(c(6, 7), c(8, 9))
  expect_equal(reduce2_right(x, y, paste), c("4 2 8 0 6", "5 3 9 1 7"))
  expect_error(reduce2_right(y, x, paste))
})

test_that("accumulate_right still works", {
  scoped_lifecycle_silence()

  tt <- c("a", "b", "c")
  expect_equal(accumulate_right(tt, paste, sep = "."), c("c.b.a", "c.b", "c"))

  input <- set_names(1:26, letters)
  expect_identical(accumulate_right(input, sum), set_names(rev(cumsum(rev(1:26))), rev(letters)))

  expect_identical(accumulate_right(0:1, c, .init = 2L), list(2:0, 2:1, 2L))
  expect_identical(accumulate_right(c(a = 0L, b = 1L), c, .init = 2L), list(b = 2:0, a = 2:1, .init = 2L))
})
