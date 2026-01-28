# reduce ------------------------------------------------------------------

## Basic tests ----
test_that("reduce() works correctly in the basic case", {
  # Example of function that gives the same result in both directions
  expect_identical(reduce(letters[1:4], paste0), "abcd")
  # Example of function that gives different results when reduced backward
  expect_equal(reduce(c(30, 5, 3, 2), `/`), 1)
})

test_that("reduce() extracts each element with [[", {
  expect_identical(
    reduce(as.list(1:5), `+`),
    reduce(1:5, `+`)
  )
})

## .init tests ----
test_that("reduce() uses init as initial value if given", {
  expect_identical(reduce(letters[1:4], paste0), "abcd")
  expect_identical(reduce(letters[1:4], paste0, .init = "-"), "-abcd")
})

test_that("reduce() accepts NULL as init", {
  expect_identical(
    reduce(1:3, list, .init = NULL),
    list(list(list(NULL, 1L), 2L), 3L)
  )
})

test_that("if input empty, reduce() returns error", {
  expect_snapshot(reduce(list()), error = TRUE)
})

test_that("if input empty and init given, reduce() returns init", {
  expect_equal(reduce(list(), `+`, .init = 0), 0)
})

test_that("if input length 1, reduce() returns the first element", {
  x <- list("a")
  paste_dot <- function(.x, .y) { sprintf("%s.%s", .x, .y) }
  expect_identical(reduce(x, paste_dot), x[[1]])
})

test_that("if input length 1 and init given, reduce() reduces value with init", {
  expect_equal(reduce(1, `+`, .init = 1), 2)
})

## .dir tests ----
test_that("direction of reduce() determines how generated trees lean", {
  expect_identical(
    reduce(1:4, list),
    list(list(list(1L, 2L), 3L), 4L)
  )
  expect_identical(
    reduce(1:4, list, .dir = "backward"),
    list(1L, list(2L, list(3L, 4L)))
  )
})

test_that("direction of reduce() is irrelevant for associative functions", {
  expect_identical(
    reduce(letters[1:4], paste),
    reduce(letters[1:4], paste, .dir = "backward")
  )
})

test_that("reduce() still uses init as initial value if direction is backward", {
  expect_identical(reduce(letters[1:4], paste0, .init = "-"), "-abcd")
  # Note that "initial" doesn't mean "placed before the first element of input"
  expect_identical(
    reduce(letters[1:4], paste0, .init = "-", .dir = "backward"),
    "abcd-"
  )
})

## Early return tests ----
test_that("reduce() can shortcircuit reduction with done()", {
  x <- c(TRUE, TRUE, FALSE, TRUE, TRUE)
  out <- reduce(x, ~{ if (.y) c(.x, "foo") else done(.x) }, .init = NULL)
  expect_identical(out, c("foo", "foo"))

  # Empty done box yields the same value as returning the
  # result-so-far (the last value) in a done box
  out2 <- reduce(x, ~{ if (.y) c(.x, "foo") else done() }, .init = NULL)
  expect_identical(out2, out)

  # Done box can also return a value that had one last transformation applied to it
  out3 <- reduce(x, ~{ if (.y) c(.x, "foo") else done(paste0(.x, "+")) }, .init = NULL)
  expect_identical(out3, c("foo+", "foo+"))
})

## ... tests ----
test_that("reduce() passes ... to function", {
  expect_identical(
    reduce(letters[1:4], paste, sep = "."),
    reduce(letters[1:4], function(x, y) { paste(x, y, sep = ".") })
  )
})

test_that("reduce() treats .f with as_mapper()", {
  # "a" -> \(x, ...) pluck_raw(x, list("a"))
  # Therefore, if direction set to backward, it should return .x[[1]][["a"]]
  expect_identical(
    reduce(list(list(a = "A"), list(a = "B"), list(a = "C")), "a", .dir = "backward"),
    "A"
  )
  expect_snapshot(reduce(1:4, NULL), error = TRUE)
})

test_that("reduce() cannot take .acc in ... due to argument collision", {
  expect_snapshot(reduce(1:4, `+`, .acc = TRUE), error = TRUE)
})

## Other tests ----
test_that("reduce() forces arguments (#643)", {
  compose <- function(f, g) function(x) f(g(x))
  expect_identical(reduce(list(identity, identity), compose)(1), 1)
})

# accumulate --------------------------------------------------------------

## Basic tests ----
test_that("accumulate() works correctly in the basic case", {
  # Example of function that gives the same result in both directions
  expect_identical(accumulate(letters[1:4], paste0), c("a", "ab", "abc", "abcd"))
  # Example of function that gives different results when reduced backward
  expect_equal(accumulate(c(30, 5, 3, 2), `/`), c(30, 6, 2, 1))
})

test_that("accumulate() extracts each element with [[", {
  expect_identical(
    accumulate(as.list(1:5), `+`),
    accumulate(1:5, `+`)
  )
})

## .init tests ----
test_that("accumulate() uses init as initial value if given", {
  expect_identical(
    accumulate(letters[1:4], paste0),
    c("a", "ab", "abc", "abcd")
  )
  expect_identical(
    accumulate(letters[1:4], paste0, .init = "-"),
    c("-", "-a", "-ab", "-abc", "-abcd")
  )
})

test_that("accumulate() accepts NULL as init", {
  expect_identical(
    accumulate(list(1L, "a"), list, .init = NULL),
    list(NULL, list(NULL, 1L), list(list(NULL, 1L), "a"))
  )
})

test_that("if input empty, accumulate() returns error", {
  expect_snapshot(accumulate(list()), error = TRUE)
})

test_that("if input empty and init given, accumulate() returns init", {
  expect_equal(accumulate(list(), `+`, .init = 0), 0)
})

test_that("if input length 1, accumulate() returns the first element", {
  x <- list("a")
  paste_dot <- function(.x, .y) { sprintf("%s.%s", .x, .y) }
  expect_identical(accumulate(x, paste_dot), x[[1]])
})

test_that("if input length 1 and init given, accumulate() reduces value with init", {
  expect_equal(accumulate(1, `+`, .init = 1), c(1L, 2L))
})

## .dir tests ----
test_that("direction of accumulate() determines how generated trees lean", {
  expect_identical(
    accumulate(1:4, list),
    list(1L, list(1L, 2L), list(list(1L, 2L), 3L), list(list(list(1L, 2L), 3L), 4L))
  )
  expect_identical(
    accumulate(1:4, list, .dir = "backward"),
    list(list(1L, list(2L, list(3L, 4L))), list(2L, list(3L, 4L)), list(3L, 4L), 4L)
  )
})

test_that("accumulate() still uses init as initial value if direction is backward", {
  expect_identical(
    accumulate(letters[1:4], paste0, .init = "-"),
    c("-", "-a", "-ab", "-abc", "-abcd")
  )
  # Note that "initial" doesn't mean "placed before the first element of input"
  expect_identical(
    accumulate(letters[1:4], paste0, .init = "-", .dir = "backward"),
    c("abcd-", "bcd-", "cd-", "d-", "-")
  )
})

## Comparisons to reduce() ----
test_that("last element of accumulate() is equal to the reduce() output", {
  x <- letters[1:4]
  expect_identical(
    accumulate(x, paste)[[length(x)]],
    reduce(x, paste)
  )
})

test_that("if direction is backward, first element of accumulate() is equal to the reduce() output", {
  x <- letters[1:4]
  expect_identical(
    accumulate(x, paste, .dir = "backward")[[1]],
    reduce(x, paste)
  )
})

## Tests of output names ----
test_that("accumulate keeps input names", {
  input <- set_names(1:26, letters)
  expect_identical(accumulate(input, sum), set_names(cumsum(1:26), letters))
  expect_identical(
    accumulate(input, sum, .dir = "backward"),
    set_names(rev(cumsum(rev(1:26))), rev(letters))
  )
})

test_that("accumulate keeps input names when init is supplied", {
  expect_identical(accumulate(1:2, c, .init = 0L), list(0L, 0:1, 0:2))
  expect_identical(
    accumulate(0:1, c, .init = 2L, .dir = "backward"),
    list(0:2, 1:2, 2L)
  )

  expect_identical(
    accumulate(c(a = 1L, b = 2L), c, .init = 0L),
    list(.init = 0L, a = 0:1, b = 0:2)
  )
  expect_identical(
    accumulate(c(a = 0L, b = 1L), c, .init = 2L, .dir = "backward"),
    list(b = 0:2, a = 1:2, .init = 2L)
  )
})

## Early return tests ----
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
  expect_equal(
    accumulate(tt, paste2, .dir = "backward", .init = "z"),
    c("b.c.z", "c.z", "z")
  )
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
  expect_equal(
    accumulate(tt, paste2, .dir = "backward", .init = "z"),
    c("c.z", "z")
  )

  # Init value is always included, even if done at first iteration
  expect_equal(accumulate(c("b", "c"), paste2), "b")
})

test_that("can terminate accumulate() early if input has names (#1243)", {
  x <- list(a = 1, b = 2, c = 3, d = 4)
  expect_identical(
    purrr::accumulate(x, \(x, y) { if (y < 3) x + y else rlang::done() }, .init = 0),
    c(.init = 0, a = 1, b = 3)
  )
})

## ... tests ----
test_that("accumulate() passes ... to function", {
  expect_identical(
    accumulate(letters[1:4], paste, sep = "."),
    accumulate(letters[1:4], function(x, y) { paste(x, y, sep = ".") })
  )
})

test_that("accumulate() treats .f with as_mapper()", {
  # "a" -> \(x, ...) pluck_raw(x, list("a"))
  # Therefore, if direction set to backward, it should return [["a"]] of every element, and init value
  expect_identical(
    accumulate(list(list(a = "A"), list(a = "B"), list(a = "C")), "a", .init = NULL, .dir = "backward"),
    list("A", "B", "C", NULL)
  )
  expect_snapshot(reduce(1:4, NULL), error = TRUE)
})

test_that("accumulate() cannot take .acc in ... due to argument collision", {
  expect_snapshot(accumulate(1:4, `+`, .acc = FALSE), error = TRUE)
})

## .simplify tests ----
test_that("accumulate() uses vctrs to simplify results", {
  expect_identical(accumulate(list("foo", factor("bar")), ~.y), c("foo", "bar"))
})

test_that("accumulate() does not fail when input can't be simplified", {
  expect_identical(accumulate(list(1L, 2:3), ~.y), list(1L, 2:3))
  expect_identical(accumulate(list(1, "a"), ~.y), list(1, "a"))
})

test_that("accumulate() does fail when simplification is required yet impossible", {
  expect_snapshot(accumulate(list(1, "a"), ~.y, .simplify = TRUE), error = TRUE)
})

test_that("accumulate() won't simplify if told not to", {
  expect_identical(
    accumulate(list("foo", factor("bar")), ~.y, .simplify = FALSE),
    list("foo", factor("bar"))
  )
})

## .ptype tests ----
test_that("prototype can be specified for accumulate() to simplify to", {
  expect_identical(
    accumulate(list("foo", factor("bar")), ~.y, .ptype = factor(levels = c("foo", "bar", "baz"))),
    factor(c("foo", "bar"), levels = c("foo", "bar", "baz"))
  )
})

test_that("prototype cannot be specified for accumulate() if told not to simplify", {
  expect_snapshot(accumulate(c("b", "a"), ~.y, .simplify = FALSE, .ptype = character()), error = TRUE)
})

test_that("accumulate() fails when cannot simplify to prototype", {
  expect_snapshot(accumulate(list("foo", factor("bar")), ~.y, .ptype = factor(levels = "baz")), error = TRUE)
})

## Other tests ----
test_that("accumulate() forces arguments (#643)", {
  compose <- function(f, g) function(x) f(g(x))
  fns <- accumulate(list(identity, identity), compose)
  expect_true(every(fns, function(f) identical(f(1), 1)))
})

# reduce2 -----------------------------------------------------------------

## Basic tests ----
test_that("reduce2() works correctly in the basic case", {
  paste2 <- function(x, y, sep) paste(x, y, sep = sep)
  x <- c("a", "b", "c")
  expect_equal(reduce2(x, c("-", "."), paste2), "a-b.c")
  expect_equal(reduce2(x, c(".", "-", "."), paste2, .init = "x"), "x.a-b.c")
})

test_that("reduce2() requires .x to be 1 element longer than .y (used for initial value)", {
  expect_snapshot(reduce2(1:4, 1:4, paste), error = TRUE)
  expect_snapshot(reduce2(1:4, list(), paste), error = TRUE)
})

test_that("reduce2() extracts each element with [[", {
  expect_identical(
    reduce2(as.list(0:5), as.list(5:1), function(out, x, y) { out + x / y }),
    reduce2(0:5, 5:1, function(out, x, y) { out + x / y })
  )
})

## .init tests ----
test_that("reduce2() uses init as initial value if given", {
  expect_identical(reduce2(letters[1:4], LETTERS[1:3], paste0), "abAcBdC")
  expect_identical(reduce2(letters[2:4], LETTERS[1:3], paste0, .init = "-"), "-bAcBdC")
})

test_that("reduce2() requires .x and .y to be equal length if init given", {
  expect_snapshot(reduce2(1:4, 1:3, paste, .init = 6), error = TRUE)
})

test_that("reduce2() accepts NULL as init", {
  expect_identical(
    reduce2(1:3, 1:3, list, .init = NULL),
    list(list(list(NULL, 1L, 1L), 2L, 2L), 3L, 3L)
  )
})

test_that("if input empty, reduce2() returns error", {
  expect_snapshot(reduce2(list(), list()), error = TRUE)
})

test_that("if input empty and init given, reduce2() returns init", {
  expect_equal(reduce2(list(), list(), `+`, .init = 0), 0)
})

test_that("if input length 1, reduce2() returns the first element of .x", {
  x <- list("a")
  paste_dot <- function(out, .x, .y) { sprintf("%s..%s.%s", out, .x, .y) }
  expect_identical(reduce2(x, list(), paste_dot), x[[1]])
})

test_that("if input length 1 and init given, reduce2() reduces value with init", {
  expect_equal(reduce2(1, 2, paste0, .init = 0), "012")
})

## Early return tests ----
test_that("reduce2() can shortcircuit reduction with done()", {
  x <- c(TRUE, TRUE, FALSE, TRUE, TRUE)
  out <- reduce2(x, 1:5, ~{ if (.y) c(.x, "foo") else done(.x) }, .init = NULL)
  expect_identical(out, c("foo", "foo"))

  # Empty done box yields the same value as returning the
  # result-so-far (the last value) in a done box
  out2 <- reduce2(x, 1:5, ~{ if (.y) c(.x, "foo") else done() }, .init = NULL)
  expect_identical(out2, out)

  # Done box can also return a value that had one last transformation applied to it
  out3 <- reduce2(x, 1:5, ~{ if (.y) c(.x, "foo") else done(paste0(.x, "+")) }, .init = NULL)
  expect_identical(out3, c("foo+", "foo+"))
})

## ... tests ----
test_that("reduce2() passes ... to function", {
  expect_identical(
    reduce2(letters[1:4], LETTERS[1:3], paste, sep = "."),
    reduce2(letters[1:4], LETTERS[1:3], function(out, x, y) { paste(out, x, y, sep = ".") })
  )
})

test_that("reduce2() cannot take .acc in ... due to argument collision", {
  expect_snapshot(reduce2(1:4, 1:3, `+`, .acc = TRUE), error = TRUE)
})

## Other tests ----
test_that("reduce2() forces arguments (#643)", {
  compose <- function(f, g, ...) function(x) f(g(x))
  fns <- reduce2(list(identity, identity), "foo", compose)
  expect_identical(fns(1), 1)
})

# accumulate2 -------------------------------------------------------------

test_that("basic accumulate2() works", {
  paste2 <- function(x, y, sep) paste(x, y, sep = sep)

  x <- c("a", "b", "c")
  expect_equal(accumulate2(x, c("-", "."), paste2), c("a", "a-b", "a-b.c"))
  expect_equal(
    accumulate2(x, c(".", "-", "."), paste2, .init = "x"),
    c("x", "x.a", "x.a-b", "x.a-b.c")
  )
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
  expect_equal(accumulate2(x, c("-", "."), paste2), c("a", "a-b"))
  expect_equal(
    accumulate2(x, c(".", "-", "."), paste2, .init = "x"),
    c("x", "x.a", "x.a-b")
  )
})

test_that("accumulate2() forces arguments (#643)", {
  compose <- function(f, g, ...) function(x) f(g(x))
  fns <- accumulate2(list(identity, identity), "foo", compose)
  expect_true(every(fns, function(f) identical(f(1), 1)))
})
