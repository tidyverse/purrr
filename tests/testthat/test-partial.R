context("partial")

test_that("partialised arguments are filled", {
  foo <- function(x, y, ..., z = 0) list(x, y, ..., z)

  expect_equal(
    partial(foo, x = "x")(1, 2),
    list("x", 1, 2, 0)
  )
  expect_equal(
    partial(foo, y = "y")(1, 2),
    list(1, "y", 2, 0)
  )
  expect_equal(
    partial(foo, z = "z")(1, 2),
    list(1, 2, "z")
  )
  expect_equal(
    partial(foo, x = "x", y = "y")(),
    list("x", "y", 0)
  )
  expect_equal(
    partial(foo, x = "x", z = "z")(1, 2),
    list("x", 1, 2, "z")
  )
  expect_equal(
    partial(foo, y = "y", z = "z")(1, 2),
    list(1, "y", 2, "z")
  )
  expect_equal(
    partial(foo, x = "x", y = "y", z = "z")(1, 2),
    list("x", "y", 1, 2, "z")
  )
})

test_that("position of partialised argument in call is determined by .first", {
  foo <- function(x, y) c(x, y)
  expect_identical(partial(foo, 0, .first = TRUE)(1), c(0, 1))
  expect_identical(partial(foo, 0, .first = FALSE)(1), c(1, 0))
})

test_that("partial() works with no partialised arguments", {
  alleged1 <- partial(runif, .first = TRUE)
  alleged2 <- partial(runif, .first = FALSE)
  expect_identical(alleged1, runif)
  expect_identical(alleged2, runif)
})

test_that("lazy evaluation means arguments aren't repeatedly evaluated", {
  f <- partial(runif, n = !! rpois(1, 5))
  .n <- 100
  v <- map_int(rerun(.n, f()), length)
  expect_true(table(v) == .n)
})

test_that("partialised arguments can be unquoted", {
  zero <- 0
  foo <- function(x, y) list(x, y)
  foo_partial <- partial(foo, x = !! zero)
  zero <- "reassignment cannot affect a previously unquoted object"
  expect_identical(foo_partial("y"), list(0, "y"))
})

test_that("partialised arguments can be spliced", {
  foo <- function(x, y, z) list(x, y, z)
  bar1 <- partial(foo, x = "x", z = "z")
  bar2 <- partial(foo, !!! list(x = "x", z = "z"))
  bar3 <- partial(foo, !!! list(x = "x"), z = "z")
  list("x", "y", "z") %>%
    expect_identical(bar1("y")) %>%
    expect_identical(bar2("y")) %>%
    expect_identical(bar3("y"))
})

# fixes #349
test_that("calling environment of ...f and partial(...f, ...) coincide", {
  foo <- function(...) parent.frame()
  env1 <- foo()
  env2 <- partial(foo, "x")()
  expect_identical(env1, env2)
})

test_that("'.env' and '.lazy' are deprecated", {
  expect_error(partial(identical, .env = NULL), "`.env` is deprecated")
  expect_error(partial(identical, .lazy = NULL), "`.lazy` is deprecated")
})
