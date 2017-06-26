context("find-position")

y <- 4:10

test_that("detect functions work", {
  is_odd <- function(x) x %% 2 == 1
  expect_equal(detect(y, is_odd), 5)
  expect_equal(detect_index(y, is_odd), 2)
  expect_equal(detect(y, is_odd, .right = TRUE), 9)
  expect_equal(detect_index(y, is_odd, .right = TRUE), 6)
})

test_that("detect returns NULL when match not found", {
  expect_null(detect(y, function(x) x > 11))
})

test_that("detect_index returns 0 when match not found", {
  expect_equal(detect_index(y, function(x) x > 11), 0)
})

test_that("has_element checks whether a list contains an object", {
  expect_true(has_element(list(1, 2), 1))
  expect_false(has_element(list(1, 2), 3))
})
