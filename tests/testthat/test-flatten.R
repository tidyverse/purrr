context("flatten")

test_that("input must be a list", {
  expect_bad_type_error(flatten(1), "`.x` must be a list, not a double vector")
  expect_error(flatten_dbl(1), "must be")
})

test_that("contents of list must be supported types", {
  expect_bad_element_type_error(flatten(list(quote(a))), "Element 1 of `.x` must be a vector, not a symbol")
  expect_bad_element_type_error(flatten(list(expression(a))), "Element 1 of `.x` must be a vector, not an expression vector")
})

test_that("each second level element becomes first level element", {
  expect_equal(flatten(list(1:2)), list(1, 2))
  expect_equal(flatten(list(1, 2)), list(1, 2))
})

test_that("can flatten all atomic vectors", {
  expect_equal(flatten(list(F)), list(F))
  expect_equal(flatten(list(1L)), list(1L))
  expect_equal(flatten(list(1)), list(1))
  expect_equal(flatten(list("a")), list("a"))
  expect_equal(flatten(list(as.raw(1))), list(as.raw(1)))
  expect_equal(flatten(list(1i)), list(1i))
  expect_equal(flatten_raw(list(as.raw(1))), as.raw(1))
})

test_that("NULLs are silently dropped", {
  expect_equal(flatten(list(NULL, NULL)), list())
  expect_equal(flatten(list(NULL, 1)), list(1))
  expect_equal(flatten(list(1, NULL)), list(1))
})

test_that("names are preserved", {
  expect_equal(flatten(list(list(x = 1), list(y = 1))), list(x = 1, y = 1))
  expect_equal(flatten(list(list(a = 1, b = 2), 3)), list(a = 1, b = 2, 3))
})

test_that("names of 'scalar' elements are preserved", {
  out <- flatten(list(a = list(1), b = list(2)))
  expect_equal(out, list(a = 1, b = 2))

  out <- flatten(list(a = list(1), b = 2:3))
  expect_equal(out, list(a = 1, 2, 3))

  out <- flatten(list(list(a = 1, b = 2), c = 3))
  expect_equal(out, list(a = 1, b = 2, c = 3))
})

test_that("child names beat parent names", {
  out <- flatten(list(a = list(x = 1), b = list(y = 2)))
  expect_equal(out, list(x = 1, y = 2))
})


# atomic flatten ----------------------------------------------------------

test_that("must be a list", {
  expect_error(flatten_lgl(1), "must be")
})

test_that("can flatten all atomic vectors", {
  expect_equal(flatten_lgl(list(F)), F)
  expect_equal(flatten_int(list(1L)), 1L)
  expect_equal(flatten_dbl(list(1)), 1)
  expect_equal(flatten_chr(list("a")), "a")
})

test_that("preserves inner names", {
  expect_equal(
    flatten_dbl(list(c(a = 1), c(b = 2))),
    c(a = 1, b = 2)
  )
})

test_that("uses vctrs coercions", {
  expect_identical(flatten_int(list(FALSE, 1)), 0:1)
  expect_identical(flatten_chr(list("foo", factor("bar"))), c("foo", "bar"))
  expect_error(flatten_int(list(FALSE, 1.5)), class = "vctrs_error_cast_lossy")
})

test_that("can flatten data frames for compatibility", {
  expect_identical(flatten_dbl(mtcars), unlist(unstructure(mtcars)))
})

test_that("can still flatten with historical coercion", {
  expect_error(
    with_lifecycle_errors(flatten_chr(list("", 1)))
  )
  expect_true(
    with_lifecycle_silence(is_character(flatten_chr(list("", 1)), n = 2))
  )
})

test_that("outer names are dropped by default for compatibility", {
  expect_identical(
    flatten_int(list(x = c(foo = 1L, bar = 2L), baz = 3L)),
    set_names(1:3, c("foo", "bar", "baz"))
  )
  expect_identical(
    flatten_int(list(x = c(foo = 1L, bar = 2L), baz = 3L), name_spec = "{outer}_{inner}"),
    set_names(1:3, c("x_foo", "x_bar", "baz"))
  )
})

test_that("inner names may be unnamed", {
  expect_identical(
    flatten_int(list(c(1L, 2L), 3L)),
    1:3
  )
  expect_identical(
    flatten_int(list(x = c(1L, 2L), 3L)),
    named(1:3) # FIXME: Should we allow zapping names from a name-spec?
  )
  expect_identical(
    flatten_int(list(x = c(1L, 2L), baz = 3L)),
    c(1L, 2L, baz = 3L)
  )
})


# data frame flatten ------------------------------------------------------

test_that("can flatten to a data frame with named lists", {
  skip_if_not_installed("dplyr")

  dfs <- list(c(a = 1), c(b = 2))
  expect_equal(flatten_dfr(dfs), tibble::tibble(a = 1, b = 2))
  expect_equal(flatten_dfc(dfs), tibble::tibble(a = 1, b = 2))
})
