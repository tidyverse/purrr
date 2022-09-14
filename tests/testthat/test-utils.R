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
