context("chuck")

# NULL input ----------------------------------------------------------------

test_that("trying to chuck NULL raises errors", {
  expect_error(chuck(NULL, list("a")), "must not be NULL")
})

# chuck vector --------------------------------------------------------------

test_that("special indexes raise errors", {
  x <- list(a = 1, b = 2, c = 3)

  expect_error(chuck(x, list(NA_character_)), "must be finite")
  expect_error(chuck(x, list("")), "must not be an empty string")

  expect_error(chuck(x, list(NA_integer_)), "must be finite")

  expect_error(chuck(x, list(NA_real_)), "must be finite")
  expect_error(chuck(x, list(NaN)), "must be finite")
  expect_error(chuck(x, list(Inf)), "must be finite")
  expect_error(chuck(x, list(-Inf)), "must be finite")

  expect_error(chuck(x, integer(0)), "must have length 1")
})

test_that("halts on named vector errors", {
  # unnamed input
  expect_error(chuck(1:2, list("a")), "pluck from an unnamed vector")

  # name doesn't exist
  expect_error(chuck(setNames(1:2, c("a", "b")), "c"), "Can't find name")
})

test_that("indices outside of vector length raise errors", {
  # zero length input
  expect_error(chuck(integer(), list(1)), "must have at least one element")

  # past end
  expect_error(chuck(1:4, list(10)), "exceeds the length of object")
  expect_error(chuck(1:4, list(10L)), "exceeds the length of object")

  # before start
  expect_error(chuck(1:4, list(-1)), "must be greater than 0")
  expect_error(chuck(1:4, list(-1L)), "must be greater than 0")
})

test_that("handles weird names", {
  x <- list(1, 2, 3, 4, 5)
  names(x) <- c("a", "a", NA_character_, "", "b")

  expect_error(chuck(x, list("")), "must not be an empty string")
  expect_error(chuck(x, list(NA_character_)), "must be finite")
})

# environments ------------------------------------------------------------

test_that("raises error with missing index", {
  expect_error(chuck(environment(), list(NA_character_)), "must not be NA")
})

test_that("non-existent object name raises error", {
  expect_error(chuck(emptyenv(), list("x")), "Can't find object")
})

# S4 ----------------------------------------------------------------------

newA <- methods::setClass("A", list(a = "numeric", b = "numeric"))
A <- newA(a = 1, b = 10)

test_that("raises error for NA index on S4 object", {
  expect_error(chuck(A, list(NA_character_)), "must not be NA")
})

test_that("can't chuck if S4 slot doesn't exist", {
  expect_error(chuck(A, list("c")), "Can't find slot")
})
