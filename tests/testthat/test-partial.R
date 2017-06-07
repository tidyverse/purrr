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
  f <- partial(runif, n = rpois(1, 5), .lazy = FALSE)
  .n <- 100
  v <- map_int(rerun(.n, f()), length)
  expect_true(table(v) == .n)
})
