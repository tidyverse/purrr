y <- 1:100

test_that("head_while works", {
  expect_length(head_while(y, function(x) x <= 15), 15)
})

test_that("tail_while works", {
  expect_length(tail_while(y, function(x) x >= 86), 15)
})

test_that("original vector returned if predicate satisfied by all elements", {
  expect_identical(head_while(y, function(x) x <= 100), y)
  expect_identical(tail_while(y, function(x) x >= 0), y)
})

test_that("head_while and tail_while require predicate function", {
  expect_snapshot(head_while(1:3, ~NA), error = TRUE)
  expect_snapshot(tail_while(1:3, ~ c(TRUE, FALSE)), error = TRUE)
})

test_that(".f parameter passed to head_while()/tail_while() doesn't override .p parameter", {
  expect_snapshot(head_while(5:-5, .f = function(x, ...) x < 3), error = TRUE)
  expect_snapshot(tail_while(5:-5, .f = function(x, ...) x > 3), error = TRUE)
})

test_that("passing .dir parameter to head_while()/tail_while() results in an error", {
  expect_snapshot(head_while(5:-5, function(x) x < 0, .dir = "backward"), error = TRUE)
  expect_snapshot(tail_while(5:-5, function(x) x > 0, .dir = "forward"), error = TRUE)
})
