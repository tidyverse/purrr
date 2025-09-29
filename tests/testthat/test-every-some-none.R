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

test_that("every(), some(), and none() have correct empty size behavior", {
  # All pass
  expect_identical(every(list(), identity), all(list()))
  # All don't pass
  expect_identical(none(list(), identity), all(list()))
  # Any pass
  expect_identical(some(list(), identity), any(list()))
})

test_that("every(), some(), and none() work on `NULL`", {
  # All pass
  expect_identical(every(NULL, identity), all(NULL))
  # All don't pass
  expect_identical(none(NULL, identity), all(NULL))
  # Any pass
  expect_identical(some(NULL, identity), any(NULL))
})

test_that("every(), some(), and none() have correct early stopping behavior", {
  expect_identical(every(list(TRUE, FALSE, TRUE), identity), FALSE)
  expect_identical(none(list(FALSE, TRUE, FALSE), identity), FALSE)
  expect_identical(some(list(FALSE, TRUE, FALSE), identity), TRUE)
})

test_that("every(), some(), and none() have correct `NA` propagation behavior", {
  # Propagates through non-early-stopping case
  expect_identical(every(list(NA, TRUE), identity), NA)
  expect_identical(none(list(NA, FALSE), identity), NA)
  expect_identical(some(list(NA, FALSE), identity), NA)

  # Overruled by early-stopping case
  expect_identical(every(list(NA, FALSE), identity), FALSE)
  expect_identical(none(list(NA, TRUE), identity), FALSE)
  expect_identical(some(list(NA, TRUE), identity), TRUE)
})

test_that("every(), some(), and none() require logical scalar predicate results", {
  # No coercion to `TRUE` or `FALSE`
  expect_snapshot(every(list(1), function(x) 1), error = TRUE)
  expect_snapshot(some(list(1), function(x) 1), error = TRUE)
  expect_snapshot(none(list(1), function(x) 1), error = TRUE)

  # `NA` must be a logical `NA`, no coercion happens for `TRUE` or `FALSE`,
  # so we also don't coerce `NA`s of any other kind
  expect_snapshot(every(list(1), function(x) NA_integer_), error = TRUE)
  expect_snapshot(some(list(1), function(x) NA_integer_), error = TRUE)
  expect_snapshot(none(list(1), function(x) NA_integer_), error = TRUE)

  # Must be length 1
  expect_snapshot(every(list(1), function(x) c(TRUE, FALSE)), error = TRUE)
  expect_snapshot(some(list(1), function(x) c(TRUE, FALSE)), error = TRUE)
  expect_snapshot(none(list(1), function(x) c(TRUE, FALSE)), error = TRUE)

  # Attributes are allowed, we ignore them
  expect_true(every(list(1), function(x) structure(TRUE, foo = "bar")))
  expect_true(some(list(1), function(x) structure(TRUE, foo = "bar")))
  expect_false(none(list(1), function(x) structure(TRUE, foo = "bar")))

  # Classes are allowed for historical reasons.
  # We probably wouldn't consider these to be logical scalars these days.
  expect_true(every(list(1), function(x) structure(TRUE, class = "mylgl")))
  expect_true(some(list(1), function(x) structure(TRUE, class = "mylgl")))
  expect_false(none(list(1), function(x) structure(TRUE, class = "mylgl")))

  # We bypass any S3 `length()` methods!
  local_methods(length.mylgl = function(x) 2L)
  expect_true(every(list(1), function(x) structure(TRUE, class = "mylgl")))
  expect_true(some(list(1), function(x) structure(TRUE, class = "mylgl")))
  expect_false(none(list(1), function(x) structure(TRUE, class = "mylgl")))
})

test_that("every(), some(), and none() require vector `.x`", {
  expect_snapshot(every(function() 1, identity), error = TRUE)
  expect_snapshot(some(function() 1, identity), error = TRUE)
  expect_snapshot(none(function() 1, identity), error = TRUE)
})

test_that("every(), some(), and none() work on atomic vectors", {
  expect_identical(every(1:3, is.integer), TRUE)
  expect_identical(none(1:3, is.integer), FALSE)
  expect_identical(some(1:3, is.integer), TRUE)
})

test_that("every(), some(), and none() work colwise across data frames", {
  # If it naively worked off `vec_size()` then extracted elements with `[[`,
  # this would return incorrect results. This definition is consistent with
  # `map()`.
  df <- data_frame(a = 1L, b = 2)
  expect_identical(every(df, is.integer), FALSE)
  expect_identical(none(df, is.double), FALSE)
  expect_identical(some(df, is.double), TRUE)
})

test_that("every(), some(), and none() work on list scalars", {
  # For consistency with `map()`
  obj <- structure(list(1, "x"), class = "my_scalar")
  expect_identical(every(obj, is.double), FALSE)
  expect_identical(none(obj, is.character), FALSE)
  expect_identical(some(obj, is.character), TRUE)
})

test_that("every(), some(), and none() work with vctrs records", {
  x <- new_rcrd(list(x = c(1, 2, 3), y = c("a", "b", "c")))

  out <- list()
  every(x, function(elt) {
    out <<- append(out, list(elt))
    TRUE
  })
  expect_identical(out, vec_chop(x))

  out <- list()
  some(x, function(elt) {
    out <<- append(out, list(elt))
    FALSE
  })
  expect_identical(out, vec_chop(x))

  out <- list()
  none(x, function(elt) {
    out <<- append(out, list(elt))
    FALSE
  })
  expect_identical(out, vec_chop(x))
})

test_that("pairlists, expressions, and calls are deprecated but work", {
  local_options(lifecycle_verbosity = "warning")

  expect_snapshot(out <- every(expression(1, 2), is.double))
  expect_true(out)

  expect_snapshot(out <- every(pairlist(1, 2), is.double))
  expect_true(out)

  expect_snapshot(x <- every(quote(f(a, b)), is.name))
  expect_true(out)
})
