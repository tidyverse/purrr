context("chuck")

# NULL input ----------------------------------------------------------------

test_that("trying to chuck NULL raises errors", {
  expect_error(chuck(NULL, "a"), "can't be NULL")
})

# chuck vector --------------------------------------------------------------

test_that("special indexes raise errors", {
  x <- list(a = 1, b = 2, c = 3)

  expect_error(chuck(x, NA_character_), "can't be NA")
  expect_error(chuck(x, ""), "can't be an empty string")

  expect_error(chuck(x, NA_integer_), "must be finite")

  expect_error(chuck(x, NA_real_), "must be finite")
  expect_error(chuck(x, NaN), "must be finite")
  expect_error(chuck(x, Inf), "must be finite")
  expect_error(chuck(x, -Inf), "must be finite")

  expect_bad_element_length_error(chuck(x, integer(0)), "must have length 1")
})

test_that("halts on named vector errors", {
  # unnamed input
  expect_error(chuck(1:2, "a"), "pluck from an unnamed vector")

  # name doesn't exist
  expect_error(chuck(setNames(1:2, c("a", "b")), "c"), "Can't find name")
})

test_that("indices outside of vector length raise errors", {
  # zero length input
  expect_error(chuck(integer(), 1), "must have at least one element")

  # past end
  expect_error(chuck(1:4, 10), "exceeds the length of plucked object")
  expect_error(chuck(1:4, 10L), "exceeds the length of plucked object")

  # before start
  expect_error(chuck(1:4, -1), "must be greater than 0")
  expect_error(chuck(1:4, -1L), "must be greater than 0")
})

test_that("handles weird names", {
  x <- list(1, 2, 3, 4, 5)
  names(x) <- c("a", "a", NA_character_, "", "b")

  expect_error(chuck(x, ""), "can't be an empty string")
  expect_error(chuck(x, NA_character_), "can't be NA")
})

# environments ------------------------------------------------------------

test_that("raises error with missing index", {
  expect_error(chuck(environment(), NA_character_), "can't be NA")
})

test_that("non-existent object name raises error", {
  expect_error(chuck(emptyenv(), "x"), "Can't find object")
})

# S4 ----------------------------------------------------------------------

newA <- methods::setClass("A", list(a = "numeric", b = "numeric"))
A <- newA(a = 1, b = 10)

test_that("raises error for NA index on S4 object", {
  expect_error(chuck(A, NA_character_), "can't be NA")
})

test_that("can't chuck if S4 slot doesn't exist", {
  expect_error(chuck(A, "c"), "Can't find slot")
})
