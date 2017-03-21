context("partial")

test_that("dots are correctly placed in the signature", {
  skip("outdated tests")
  dots_last_expected <- call("runif", n = call("rpois", 1, 5), quote(...))
  dots_last_alleged <- partial(runif, n = rpois(1, 5)) %>% body()
  expect_identical(dots_last_expected, dots_last_alleged)

  # Also tests that argument names are not eaten when .dots_first = TRUE
  dots_first_expected <- call("runif", quote(...), n = call("rpois", 1, 5))
  dots_first_alleged <- partial(runif, n = rpois(1, 5), .first = FALSE) %>% body()
  expect_identical(dots_first_expected, dots_first_alleged)
})

test_that("partial() works with no partialised arguments", {
  skip("outdated tests")
  expected <- call("runif", quote(...))
  alleged1 <- partial(runif, .first = TRUE) %>% body()
  alleged2 <- partial(runif, .first = FALSE) %>% body()
  expect_identical(expected, alleged1)
  expect_identical(expected, alleged2)
})

test_that("partial() works with primitive functions", {
  minus1 <- partial(`-`, e1 = 10)
  minus2 <- partial(`-`, e2 = 10, .lazy = FALSE)
  expect_identical(minus1(3), 7)
  expect_identical(minus2(3), -7)
})
