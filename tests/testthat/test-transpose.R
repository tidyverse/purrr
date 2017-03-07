context("transpose")

test_that("input must be a list", {
  expect_error(transpose(1:3), "is not a list")
})

test_that("elements of input must be vectors", {
  expect_error(transpose(list(environment())), "is not a vector")
  expect_error(transpose(list(list(), environment())), "is not a vector")
})

test_that("empty list returns empty list", {
  expect_equal(transpose(list()), list())
})

test_that("transpose switches order of first & second idnex", {
  x <- list(list(1, 3), list(2, 4))
  expect_equal(transpose(x), list(list(1, 2), list(3, 4)))
})

test_that("inside names become outside names", {
  x <- list(list(x = 1), list(x = 2))
  expect_equal(transpose(x), list(x = list(1, 2)))
})

test_that("outside names become inside names", {
  x <- list(x = list(1, 3), y = list(2, 4))
  expect_equal(transpose(x), list(list(x = 1, y = 2), list(x = 3, y = 4)))
})

test_that("warns if element too short", {
  x <- list(list(1, 2), list(1))
  expect_warning(out <- transpose(x), "Element 2 has length 1")
  expect_equal(out, list(list(1, 1), list(2, NULL)))
})
test_that("warns if element too long", {
  x <- list(list(1, 2), list(1, 2, 3))
  expect_warning(out <- transpose(x), "Element 2 has length 3")
  expect_equal(out, list(list(1, 1), list(2, 2)))
})

test_that("can transpose list of lists of  atomic vectors", {
  x <- list(list(TRUE, 1L, 1, "1"))
  expect_equal(transpose(x), list(list(TRUE), list(1L), list(1), list("1")))
})

test_that("can transpose lists of atomic vectors", {
  expect_equal(transpose(list(TRUE, FALSE)), list(list(TRUE, FALSE)))
  expect_equal(transpose(list(1L, 2L)), list(list(1L, 2L)))
  expect_equal(transpose(list(1, 2)), list(list(1, 2)))
  expect_equal(transpose(list("a", "b")), list(list("a", "b")))
})

test_that("can't transpose expressions", {
  expect_error(transpose(list(expression(a))), "Unsupported type")
})

# Named based matching ----------------------------------------------------

test_that("can override default names", {
  x <- list(
    list(x = 1),
    list(y = 2, x = 1)
  )
  tx <- transpose(x, c("x", "y"))

  expect_equal(tx, list(
    x = list(1, 1),
    y = list(NULL, 2)
  ))
})

test_that("if present, names are used", {
  x <- list(
    list(x = 1, y = 2),
    list(y = 2, x = 1)
  )
  tx <- transpose(x)

  expect_equal(tx$x, list(1, 1))
  expect_equal(tx$y, list(2, 2))
})

test_that("if missing elements, filled with NULL", {
  x <- list(
    list(x = 1, y = 2),
    list(x = 1)
  )
  tx <- transpose(x)
  expect_equal(tx$y, list(2, NULL))
})

# Position based matching -------------------------------------------------

test_that("warning if too short", {
  x <- list(
    list(1, 2),
    list(1)
  )
  expect_warning(tx <- transpose(x), "has length 1 not 2")
  expect_equal(tx, list(list(1, 1), list(2, NULL)))
})

test_that("warning if too long", {
  x <- list(
    list(1),
    list(1, 2)
  )
  expect_warning(tx <- transpose(x), "has length 2 not 1")
  expect_equal(tx, list(list(1, 1)))
})
