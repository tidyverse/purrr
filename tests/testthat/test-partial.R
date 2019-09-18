context("partial")

test_that("dots are correctly placed in the signature", {
  out <- partialised_body(partial(runif, n = rpois(1, 5)))
  exp <- quo((!!runif)(n = rpois(1, 5), ...))
  expect_identical(out, exp)
})

test_that("no lazy evaluation means arguments aren't repeatedly evaluated", {
  counter <- env(n = 0)
  lazy <- partial(list, n = { counter$n <- counter$n + 1; NULL })
  walk(1:10, ~lazy())
  expect_identical(counter$n, 10)

  counter <- env(n = 0)
  qq <- partial(list, n = !!{ counter$n <- counter$n + 1; NULL })
  walk(1:10, ~qq())
  expect_identical(counter$n, 1)
})

test_that("partial() still works with functions using `missing()`", {
  fn <- function(x) missing(x)
  expect_false(partial(fn, x = 3)())
})

test_that("partialised arguments are evaluated in their environments", {
  n <- 0

  partialised <- local({
    n <- 10
    partial(list, n = n)
  })

  expect_identical(partialised(), list(n = 10))
})

test_that("partialised function is evaluated in its environment", {
  fn <- function(...) stop("tilt")

  partialised <- local({
    fn <- function(x) x
    partial(fn, x = "foo")
  })

  expect_identical(partialised(), "foo")
})

test_that("partial() supports quosures", {
  arg <- local({
    n <- 0
    quo({ n <<- n + 1; n})
  })

  fn <- partial(list, !!arg)
  expect_identical(fn(), list(1))
  expect_identical(fn(), list(2))
})

test_that("partial() matches argument with primitives", {
  minus <- partial(`-`, .y = 5)
  expect_identical(minus(1), -4)
})

test_that("partial() squashes quosures before printing", {
  expect_known_output(file = test_path("test-partial-print.txt"), {
    foo <- function(x, y) y
    print(partial(foo, y = 3))
  })
})

test_that("partial() handles primitives with named arguments after `...`", {
  expect_identical(partial(min, na.rm = TRUE)(1, NA), 1)
  expect_true(is_na(partial(min, na.rm = FALSE)(1, NA)))
})

test_that("partialised function does not infloop when given the same name (#387)", {
  fn <- function(...) "foo"
  fn <- partial(fn)
  expect_identical(fn(), "foo")
})

test_that("partial() handles `... =` arguments", {
  fn <- function(...) list(...)

  default <- partial(fn, "partial")
  expect_identical(default(1), list("partial", 1))

  after <- partial(fn, "partial", ... = )
  expect_identical(after(1), list("partial", 1))

  before <- partial(fn, ... = , "partial")
  expect_identical(before(1), list(1, "partial"))
})

test_that("partial() supports substituted arguments", {
  fn <- function(x) substitute(x)
  fn <- partial(fn, letters)
  expect_identical(fn(), quote(letters))
})

test_that("partial() supports generics (#647)", {
  expect_identical(partial(mean, na.rm = TRUE)(1), 1)

  foo <- TRUE
  expect_identical(partial(mean, na.rm = foo)(1), 1)
})

test_that("partial() supports lexically defined methods in the def env", {
  local({
    mean.purrr__foobar <- function(...) TRUE
    foobar <- structure(list(), class = "purrr__foobar")

    expect_true(partial(mean, na.rm = TRUE)(foobar))
    expect_true(partial(mean, trim = letters, na.rm = TRUE)(foobar))
  })
})


# Life cycle --------------------------------------------------------------

test_that("`.lazy`, `.env`, and `.first` are soft-deprecated", {
  scoped_lifecycle_warnings()
  expect_warning(partial(list, "foo", .lazy = TRUE), "soft-deprecated")
  expect_warning(partial(list, "foo", .env = env()), "soft-deprecated")
  expect_warning(partial(list, "foo", .first = TRUE, "soft-deprecated"))
})

test_that("`.lazy` still works", {
  scoped_options(lifecycle_disable_warnings = TRUE)
  counter <- env(n = 0)
  eager <- partial(list, n = { counter$n <- counter$n + 1; NULL }, .lazy = FALSE)
  walk(1:10, ~eager())
  expect_identical(counter$n, 1)
})

test_that("`.first` still works", {
  scoped_options(lifecycle_disable_warnings = TRUE)
  out <- partialised_body(partial(runif, n = rpois(1, 5), .first = FALSE))
  exp <- quo((!!runif)(..., n = rpois(1, 5)))
  expect_identical(out, exp)

  # partial() also works without partialised arguments
  expect_identical(partialised_body(partial(runif, .first = TRUE)), quo((!!runif)(...)))
  expect_identical(partialised_body(partial(runif, .first = FALSE)), quo((!!runif)(...)))
})

test_that("`...f` still works", {
  expect_error(partial(...f = list, x = "foo"), "renamed", class = "defunctError")
})
