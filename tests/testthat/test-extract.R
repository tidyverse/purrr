context("extract")

test_that("index must be a list", {
  expect_error(extract(1:10, 1), "must be a list")
})

test_that("contents must be a vector", {
  expect_error(extract(quote(x), list(1)), "Don't know how to extract")
})

# extract vector --------------------------------------------------------------

test_that("can extract by position", {
  x <- list("a", 1, c(TRUE, FALSE))

  # double
  expect_identical(extract(x, list(1)), x[[1]])
  expect_identical(extract(x, list(2)), x[[2]])
  expect_identical(extract(x, list(3)), x[[3]])

  # integer
  expect_identical(extract(x, list(1L)), x[[1]])
  expect_identical(extract(x, list(2L)), x[[2]])
  expect_identical(extract(x, list(3L)), x[[3]])
})

test_that("can extract by name", {
  x <- list(a = "a", b = 1, c = c(TRUE, FALSE))

  expect_identical(extract(x, list("a")), x[["a"]])
  expect_identical(extract(x, list("b")), x[["b"]])
  expect_identical(extract(x, list("c")), x[["c"]])
})

test_that("can extract from atomic vectors", {
  expect_identical(extract(TRUE, list(1)), TRUE)
  expect_identical(extract(1L, list(1)), 1L)
  expect_identical(extract(1, list(1)), 1)
  expect_identical(extract("a", list(1)), "a")
})

test_that("can extract by name and position", {
  x <- list(a = list(list(b = 1)))
  expect_equal(extract(x, list("a", 1, "b")), 1)
})


test_that("require length 1 vectors", {
  expect_error(extract(1, list(letters)), "must have length 1")
  expect_error(extract(1, list(TRUE)), "must be a character or numeric")
})

test_that("special indexes never match", {
  x <- list(a = 1, b = 2, c = 3)

  expect_null(extract(x, list(NA_character_)))
  expect_null(extract(x, list("")))

  expect_null(extract(x, list(NA_integer_)))

  expect_null(extract(x, list(NA_real_)))
  expect_null(extract(x, list(NaN)))
  expect_null(extract(x, list(Inf)))
  expect_null(extract(x, list(-Inf)))
})

test_that("special values return NULL", {
  # unnamed input
  expect_null(extract(list(1, 2), list("a")))

  # zero length input
  expect_null(extract(integer(), list(1)))

  # past end
  expect_null(extract(1:4, list(10)))
  expect_null(extract(1:4, list(10L)))
})

test_that("handles weird names", {
  x <- list(1, 2, 3, 4, 5)
  names(x) <- c("a", "a", NA, "", "b")

  expect_equal(extract(x, list("a")), 1)
  expect_equal(extract(x, list("b")), 5)

  expect_null(extract(x, list("")))
  expect_null(extract(x, list(NA_character_)))
})

# attributes --------------------------------------------------------------

test_that("can extract attributes", {
  x <- structure(
    list(
      structure(
        list(),
        x = 1
      )
    ),
    y = 2
  )

  expect_equal(extract(x, list(get_attr("y"))), 2)
  expect_equal(extract(x, list(1, get_attr("x"))), 1)
})

# environments ------------------------------------------------------------

test_that("extract errors with invalid indices", {
  expect_error(extract(environment(), list(1)), "not a string")
  expect_error(extract(environment(), list(letters)), "not a string")
})

test_that("extract returns missing with missing index", {
  expect_equal(extract(environment(), list(NA_character_)), NULL)
})

test_that("extracts by name", {
  env <- new.env(parent = emptyenv())
  env$x <- 10

  expect_equal(extract(env, list("x")), 10)
})


# S4 ----------------------------------------------------------------------

newA <- methods::setClass("A", list(a = "numeric", b = "numeric"))
A <- newA(a = 1, b = 10)

test_that("extract errors with invalid indices", {
  expect_error(extract(A, list(1)), "not a string")
  expect_error(extract(A, list(letters)), "not a string")
})

test_that("extract returns missing with missing index", {
  expect_equal(extract(A, list(NA_character_)), NULL)
})

test_that("extracts by name", {
  expect_equal(extract(A, list("a")), 1)
})
