test_that("input must be a list", {
  local_options(lifecycle_verbosity = "quiet")

  expect_snapshot(flatten(1), error = TRUE)
  expect_snapshot(flatten_dbl(1), error = TRUE)
})

test_that("contents of list must be supported types", {
  local_options(lifecycle_verbosity = "quiet")

  expect_snapshot(flatten(list(quote(a))), error = TRUE)
  expect_snapshot(flatten(list(expression(a))), error = TRUE)
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
  local_options(lifecycle_verbosity = "quiet")

  expect_snapshot(flatten_lgl(1), error = TRUE)
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


# data frame flatten ------------------------------------------------------

test_that("can flatten to a data frame with named lists", {
  skip_if_not_installed("dplyr")

  dfs <- list(c(a = 1), c(b = 2))
  expect_equal(flatten_dfr(dfs), tibble::tibble(a = 1, b = 2))
  expect_equal(flatten_dfc(dfs), tibble::tibble(a = 1, b = 2))
})
