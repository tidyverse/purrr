# at_idx ------------------------------------------------------------

test_that("allows valid logical, numeric, and character vectors", {
  x <- list(a = 1, b = 1, c = 1)
  expect_equal(at_idx(x, TRUE), c(TRUE, TRUE, TRUE))
  expect_equal(at_idx(x, 1), c(TRUE, FALSE, FALSE))
  expect_equal(at_idx(x, -2), c(TRUE, FALSE, TRUE))
  expect_equal(at_idx(x, "b"), c(FALSE, TRUE, FALSE))
})

test_that("errors on invalid subsetting vectors", {
  x <- list(a = 1, b = 1, c = 1)
  expect_snapshot(error = TRUE, {
    at_idx(x, c(FALSE, TRUE))
    at_idx(x, NA_real_)
    at_idx(x, 4)
  })
})

test_that("function at is passed names", {
  x <- list(a = 1, B = 1, c = 1)
  expect_equal(at_idx(x, ~ .x %in% LETTERS), c(FALSE, TRUE, FALSE))
  expect_equal(at_idx(x, ~ intersect(.x, LETTERS)), c(FALSE, TRUE, FALSE))
})

test_that("validates its inputs", {
  x <- list(a = 1, b = 1, c = 1)
  expect_snapshot(at_idx(x, list()), error = TRUE)
})

test_that("tidyselect `at` is deprecated", {
  expect_snapshot({
    . <- at_idx(data.frame(x = 1), vars("x"))
  })
})
