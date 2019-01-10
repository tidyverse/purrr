context("head-tail")

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
  expect_error(head_while(1:3, ~ NA), ", not a missing value")
  expect_error(tail_while(1:3, ~ c(TRUE, FALSE)), ", not a logical vector of length 2")
})
