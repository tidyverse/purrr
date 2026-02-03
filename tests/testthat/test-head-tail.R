y <- 1:100

## Basic tests ----
test_that("head_while() works", {
  out <- head_while(y, function(x) x <= 15)
  expect_length(out, 15)
  expect_identical(out, 1:15)
})

test_that("tail_while() works", {
  out <- tail_while(y, function(x) x >= 86)
  expect_length(out, 15)
  expect_identical(out, 86:100)
})

test_that("original vector returned if predicate satisfied by all elements", {
  expect_identical(head_while(y, function(x) x <= 100), y)
  expect_identical(tail_while(y, function(x) x >= 0), y)
})

## Empty size behavior ----
test_that("head_while() and tail_while() have correct empty size behavior", {
  # No elements to fail the check
  expect_identical(head_while(list(), identity), list())
  expect_identical(tail_while(list(), identity), list())
})

test_that("head_while() and tail_while() work on `NULL`", {
  # No elements to fail the check
  expect_null(head_while(NULL, identity))
  expect_null(tail_while(NULL, identity))
})

## .f requirements ----
test_that("head_while() and tail_while() require boolean results", {
  # No coercion to `TRUE` or `FALSE`
  expect_snapshot(head_while(list(1), function(x) 1), error = TRUE)
  expect_snapshot(tail_while(list(1), function(x) 1), error = TRUE)

  # `NA` is not allowed whatsoever
  expect_snapshot(head_while(list(1), function(x) NA), error = TRUE)
  expect_snapshot(tail_while(list(1), function(x) NA), error = TRUE)

  # Must be length 1
  expect_snapshot(head_while(list(1), function(x) c(TRUE, FALSE)), error = TRUE)
  expect_snapshot(tail_while(list(1), function(x) c(TRUE, FALSE)), error = TRUE)

  # Attributes are allowed, we ignore them
  expect_equal(head_while(list(1), function(x) structure(TRUE, foo = "bar")), list(1))
  expect_equal(tail_while(list(1), function(x) structure(TRUE, foo = "bar")), list(1))

  # Classes are allowed for historical reasons.
  # We probably wouldn't consider these to be logical scalars these days.
  expect_equal(head_while(list(1), function(x) structure(TRUE, class = "mylgl")), list(1))
  expect_equal(tail_while(list(1), function(x) structure(TRUE, class = "mylgl")), list(1))

  # We bypass any S3 `length()` methods!
  local_methods(length.mylgl = function(x) 2L)
  expect_equal(head_while(list(1), function(x) structure(TRUE, class = "mylgl")), list(1))
  expect_equal(tail_while(list(1), function(x) structure(TRUE, class = "mylgl")), list(1))
})

## .x requirements ----
test_that("head_while() and tail_while() require vector `.x`", {
  expect_snapshot(head_while(function() 1, identity), error = TRUE)
  expect_snapshot(tail_while(function() 1, identity), error = TRUE)
})

test_that("head_while() and tail_while() work colwise across data frames", {
  # If it naively worked off `vec_size()` then extracted elements with `[[`,
  # this would return incorrect results. This definition is consistent with
  # `map()`.
  df <- data_frame(a = 1L, b = 2)
  expect_identical(head_while(df, is.integer), df["a"])
  expect_identical(tail_while(df, is.double), df["b"])
})

test_that("head_while() and tail_while() work on list scalars", {
  # For consistency with `map()`
  obj <- structure(list(1, "x"), class = "my_scalar")
  expect_identical(head_while(obj, is.double), list(1))
  expect_identical(tail_while(obj, is.character), list("x"))
})

test_that("head_while() and tail_while() work with vctrs records", {
  x <- new_rcrd(list(x = c(1, 2, 3), y = c("a", "b", "c")))

  out <- list()
  head_while(x, function(elt) {
    out <<- append(out, list(elt))
    TRUE
  })
  expect_identical(out, vec_chop(x))

  out <- list()
  tail_while(x, function(elt) {
    out <<- append(out, list(elt))
    TRUE
  })
  expect_identical(out, rev(vec_chop(x)))
})

## ... tests ----
test_that("head_while() and tail_while() pass ... to function", {
  exceeds <- function(e1, e2) e1 > e2

  expect_identical(
    head_while(y, negate(exceeds), e2 = 8),
    head_while(y, function(x) { negate(exceeds)(x, e2 = 8) })
  )
  expect_identical(
    tail_while(y, exceeds, e2 = 91),
    tail_while(y, function(x) { exceeds(x, e2 = 91) })
  )
})

## Other tests ----
test_that("head_while() and tail_while() force arguments", {
  funcs <- list(is.integer, is.numeric, is.character, is.vector)
  test_if_is <- function(f) f(1L)

  expect_identical(head_while(funcs, test_if_is), funcs[1:2])
  expect_identical(tail_while(funcs, test_if_is), funcs[4])
})
