test_that("rdunif and rbernoulli are deprecated", {
  expect_snapshot({
    . <- rdunif(10, 1)
    . <- rbernoulli(10)
  })
})

test_that("rbernoulli is a special case of rbinom", {
  local_options(lifecycle_verbosity = "quiet")

  set.seed(1)
  x <- rbernoulli(10)

  set.seed(1)
  y <- ifelse(rbinom(10, 1, 0.5) == 1, TRUE, FALSE)

  expect_equal(x, y)
})

test_that("rdunif works", {
  local_options(lifecycle_verbosity = "quiet")

  expect_length(rdunif(100, 10), 100)
})

test_that("rdunif fails if a and b are not unit length numbers", {
  local_options(lifecycle_verbosity = "quiet")

  expect_error(rdunif(1000, 1, "a"))
  expect_error(rdunif(1000, 1, c(0.5, 0.2)))
  expect_error(rdunif(1000, FALSE, 2))
  expect_error(rdunif(1000, c(2, 3), 2))
})

# at_selection ------------------------------------------------------------

test_that("allows valid logical, numeric, and character vectors", {
  x <- list(a = 1, b = 1, c = 1)
  expect_equal(at_selection(x, TRUE), c(1, 2, 3))
  expect_equal(at_selection(x, 1), 1)
  expect_equal(at_selection(x, -2), c(1, 3))
  expect_equal(at_selection(x, "b"), 2)
})

test_that("errors on invalid subsetting vectors", {
  x <- list(a = 1, b = 1, c = 1)
  expect_snapshot(error = TRUE, {
    at_selection(x, c(FALSE, TRUE))
    at_selection(x, NA_real_)
    at_selection(x, 4)
  })
})

test_that("function at is passed names", {
  x <- list(a = 1, B = 1, c = 1)
  expect_equal(at_selection(x, ~ .x %in% LETTERS), 2)
  expect_equal(at_selection(x, ~ intersect(.x, LETTERS)), 2)
})

test_that("validates its inputs", {
  x <- list(a = 1, b = 1, c = 1)
  expect_snapshot(at_selection(x, list()), error = TRUE)
})

test_that("tidyselect `at` is deprecated", {
  expect_snapshot({
    . <- at_selection(data.frame(x = 1), vars("x"))
  })
})

# Lifecycle ---------------------------------------------------------------

test_that("%@% is an infix attribute accessor", {
  local_options(lifecycle_verbosity = "quiet")
  expect_identical(mtcars %@% "names", attr(mtcars, "names"))
})

