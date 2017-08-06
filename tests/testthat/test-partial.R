context("partial")

test_that("dots are correctly placed in the signature", {
  dots_last_actual <- call("runif", n = call("rpois", 1, 5), quote(...))
  dots_last_alleged <- partial(runif, n = rpois(1, 5)) %>% body()
  expect_identical(dots_last_actual, dots_last_alleged)

  # Also tests that argument names are not eaten when .dots_first = TRUE
  dots_first_actual <- call("runif", quote(...), n = call("rpois", 1, 5))
  dots_first_alleged <- partial(runif, n = rpois(1, 5), .first = FALSE) %>%
    body()
  expect_identical(dots_first_actual, dots_first_alleged)
})

test_that("partial() works with no partialised arguments", {
  actual <- call("runif", quote(...))
  alleged1 <- partial(runif, .first = TRUE) %>% body()
  alleged2 <- partial(runif, .first = FALSE) %>% body()
  expect_identical(actual, alleged1)
  expect_identical(actual, alleged2)
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
