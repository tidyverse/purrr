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

test_that("none returns TRUE if all elements are FALSE", {
  x <- list(1, 0, TRUE)
  expect_false(none(x, isTRUE))
  expect_true(none(x[1], isTRUE))
})

test_that("every() requires logical value", {
  expect_snapshot(every(list(1:3), identity), error = TRUE)
  expect_snapshot(every(list(function() NULL), identity), error = TRUE)
})

test_that("every() has the same behaviour as `&&` (#751)", {
  expect_false(every(list(NA, FALSE), identity))
  expect_false(every(list(FALSE, NA), identity))

  expect_identical(every(list(NA, TRUE), identity), NA)
  expect_identical(every(list(TRUE, NA), identity), NA)
  expect_identical(every(list(NA, NA), identity), NA)
})

test_that("some() has the same behaviour as `||`", {
  expect_true(some(list(TRUE, NA), identity))
  expect_true(some(list(NA, TRUE), identity))

  expect_identical(some(list(NA, FALSE), identity), NA)
  expect_identical(some(list(FALSE, NA), identity), NA)
  expect_identical(some(list(NA, NA), identity), NA)
})
