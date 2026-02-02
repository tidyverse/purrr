y <- 4:10
is_odd <- function(x) x %% 2 == 1

# detect() ---------------------------------------------------------------------

## Basic functionality ----
test_that("detect() works correctly in the basic case", {
  expect_identical(detect(y, is_odd), 5L)
})

test_that("detect() returns NULL when match not found", {
  expect_null(detect(y, function(x) x > 11))
})

## .dir tests ----
test_that("direction of detect() determines which value is detected first", {
  expect_identical(detect(y, is_odd, .dir = "backward"), 9L)
})

## .default tests ----
test_that("detect() returns `.default` when specified and match not found", {
  default <- list(value = NULL, error = "encountered")

  expect_identical(detect(y, is_odd, .default = default), 5L)
  expect_identical(
    detect(y, function(x) x > 11, .default = default),
    default
  )
})

# detect_index() ---------------------------------------------------------------

## Basic functionality ----
test_that("detect functions work", {
  expect_identical(detect_index(y, is_odd), 2L)
})

test_that("detect_index() returns 0 when match not found", {
  expect_identical(detect_index(y, function(x) x > 11), 0L)
})

## .dir tests ----
test_that("direction of detect_index() determines which value is detected first", {
  expect_identical(detect_index(y, is_odd, .dir = "backward"), 6L)
})

test_that("index found when looking backward cannot be lower than when looking forward", {
  integers <- sample.int(1e6, 20)
  is_small <- function(x) x < 5e4

  expect_gte(
    detect_index(integers, is_small, .dir = "backward"),
    detect_index(integers, is_small)
  )
})

# Shared tests -----------------------------------------------------------------

## Empty size behavior ----
test_that("detect() and detect_index() have correct empty size behavior", {
  # No elements to detect in
  expect_identical(detect(list(), identity, .default = -1L), -1L)
  expect_identical(detect_index(list(), identity), 0L)
})

test_that("detect() and detect_index() work on `NULL`", {
  # No elements to detect in
  expect_identical(detect(NULL, identity, .default = -1L), -1L)
  expect_identical(detect_index(NULL, identity), 0L)
})

## .f requirements ----
test_that("detect() and detect_index() require boolean results", {
  # No coercion to `TRUE` or `FALSE`
  expect_snapshot(detect(list(1), function(x) 1), error = TRUE)
  expect_snapshot(detect_index(list(1), function(x) 1), error = TRUE)

  # `NA` is not allowed whatsoever
  expect_snapshot(detect(list(1), function(x) NA), error = TRUE)
  expect_snapshot(detect_index(list(1), function(x) NA), error = TRUE)

  # Must be length 1
  expect_snapshot(detect(list(1), function(x) c(TRUE, FALSE)), error = TRUE)
  expect_snapshot(detect_index(list(1), function(x) c(TRUE, FALSE)), error = TRUE)

  # Attributes are allowed, we ignore them
  expect_equal(detect(list(1), function(x) structure(TRUE, foo = "bar")), 1)
  expect_equal(detect_index(list(1), function(x) structure(TRUE, foo = "bar")), 1L)

  # Classes are allowed for historical reasons.
  # We probably wouldn't consider these to be logical scalars these days.
  expect_equal(detect(list(1), function(x) structure(TRUE, class = "mylgl")), 1)
  expect_equal(detect_index(list(1), function(x) structure(TRUE, class = "mylgl")), 1L)

  # We bypass any S3 `length()` methods!
  local_methods(length.mylgl = function(x) 2L)
  expect_equal(detect(list(1), function(x) structure(TRUE, class = "mylgl")), 1)
  expect_equal(detect_index(list(1), function(x) structure(TRUE, class = "mylgl")), 1L)
})

## .x requirements ----
test_that("detect() and detect_index() require vector `.x`", {
  expect_snapshot(detect(function() 1, identity), error = TRUE)
  expect_snapshot(detect_index(function() 1, identity), error = TRUE)
})

test_that("detect() and detect_index() work colwise across data frames", {
  # If it naively worked off `vec_size()` then extracted elements with `[[`,
  # this would return incorrect results. This definition is consistent with
  # `map()`.
  df <- data_frame(a = 1L, b = 2)
  expect_identical(detect(df, is.integer), 1L)
  expect_identical(detect_index(df, is.double), 2L)
})

test_that("detect() and detect_index() work on list scalars", {
  # For consistency with `map()`
  obj <- structure(list(1, "x"), class = "my_scalar")
  expect_identical(detect(obj, is.double), 1)
  expect_identical(detect_index(obj, is.character), 2L)
})

test_that("detect() and detect_index() work with vctrs records", {
  x <- new_rcrd(list(x = c(1, 2, 3), y = c("a", "b", "c")))

  out <- list()
  detect(x, function(elt) {
    out <<- append(out, list(elt))
    FALSE
  })
  expect_identical(out, vec_chop(x))

  out <- list()
  detect_index(x, function(elt) {
    out <<- append(out, list(elt))
    FALSE
  })
  expect_identical(out, vec_chop(x))
})

## ... tests ----
test_that("detect() and detect_index() pass ... to function", {
  exceeds <- function(e1, e2) e1 > e2

  expect_identical(
    detect(y, exceeds, e2 = 8),
    detect(y, function(x) { exceeds(x, e2 = 8) })
  )
  expect_identical(
    detect_index(y, exceeds, e2 = 8),
    detect_index(y, function(x) { exceeds(x, e2 = 8) })
  )
})

## Other tests ----
test_that("detect() and detect_index() force arguments", {
  test_if_is <- function(f) f(1)
  expect_identical(detect(list(is.integer, is.numeric), test_if_is), is.numeric)
  expect_identical(detect_index(list(is.integer, is.numeric), test_if_is), 2L)
})

# has_element() ----------------------------------------------------------------

test_that("has_element() checks whether a list contains an object", {
  expect_true(has_element(list(1, 2), 1))
  expect_false(has_element(list(1, 2), 3))
})
