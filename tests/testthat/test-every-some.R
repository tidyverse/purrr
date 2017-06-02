context("every-some")

test_that("return NA if present", {
  expect_equal(some(1:10, ~ NA), NA)
  expect_equal(every(1:10, ~ NA), NA)
})

test_that("every returns TRUE if all elements are TRUE", {
  x <- list(0, 1, TRUE)
  expect_false(every(x, isTRUE))
  expect_true(every(x[3], isTRUE))
})

test_that("some returns FALSE if all elements are FALSE", {
  x <- list(1, 0, FALSE)
  expect_false(some(x, isTRUE))
  expect_true(some(x[1], negate(isTRUE)))
})
