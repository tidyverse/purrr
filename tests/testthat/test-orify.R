library(functools)
context("Orify()")

is_character_or_factor <- Orify(is.character, is.factor)
test_that("Produces the correct output.", {
  expect_equal(is_character_or_factor(letters), TRUE)
  expect_equal(is_character_or_factor(factor(state.abb)), TRUE)
  expect_equal(is_character_or_factor(1:100), FALSE)
})

test_that("Produces the correct output type.", {
  expect_is(is_character_or_factor, "function")
})

test_that("Produces the correct errors.", {
  expect_error(Orify())
})
