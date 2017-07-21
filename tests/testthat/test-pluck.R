context("pluck")

test_that("contents must be a vector", {
  expect_error(pluck(quote(x), list(1)), "Don't know how to pluck")
})

# pluck vector --------------------------------------------------------------

test_that("can pluck by position", {
  x <- list("a", 1, c(TRUE, FALSE))

  # double
  expect_identical(pluck(x, list(1)), x[[1]])
  expect_identical(pluck(x, list(2)), x[[2]])
  expect_identical(pluck(x, list(3)), x[[3]])

  # integer
  expect_identical(pluck(x, list(1L)), x[[1]])
  expect_identical(pluck(x, list(2L)), x[[2]])
  expect_identical(pluck(x, list(3L)), x[[3]])
})

test_that("can pluck by name", {
  x <- list(a = "a", b = 1, c = c(TRUE, FALSE))

  expect_identical(pluck(x, list("a")), x[["a"]])
  expect_identical(pluck(x, list("b")), x[["b"]])
  expect_identical(pluck(x, list("c")), x[["c"]])
})

test_that("can pluck from atomic vectors", {
  expect_identical(pluck(TRUE, list(1)), TRUE)
  expect_identical(pluck(1L, list(1)), 1L)
  expect_identical(pluck(1, list(1)), 1)
  expect_identical(pluck("a", list(1)), "a")
})

test_that("can pluck by name and position", {
  x <- list(a = list(list(b = 1)))
  expect_equal(pluck(x, list("a", 1, "b")), 1)
})


test_that("require length 1 vectors", {
  expect_error(pluck(1, list(letters)), "must have length 1")
  expect_error(pluck(1, list(TRUE)), "must be a character or numeric")
})

test_that("special indexes never match", {
  x <- list(a = 1, b = 2, c = 3)

  expect_null(pluck(x, list(NA_character_)))
  expect_null(pluck(x, list("")))

  expect_null(pluck(x, list(NA_integer_)))

  expect_null(pluck(x, list(NA_real_)))
  expect_null(pluck(x, list(NaN)))
  expect_null(pluck(x, list(Inf)))
  expect_null(pluck(x, list(-Inf)))
})

test_that("special values return NULL", {
  # unnamed input
  expect_null(pluck(list(1, 2), list("a")))

  # zero length input
  expect_null(pluck(integer(), list(1)))

  # past end
  expect_null(pluck(1:4, list(10)))
  expect_null(pluck(1:4, list(10L)))
})

test_that("handles weird names", {
  x <- list(1, 2, 3, 4, 5)
  names(x) <- c("a", "a", NA, "", "b")

  expect_equal(pluck(x, list("a")), 1)
  expect_equal(pluck(x, list("b")), 5)

  expect_null(pluck(x, list("")))
  expect_null(pluck(x, list(NA_character_)))
})


# closures ----------------------------------------------------------------

test_that("can pluck attributes", {
  x <- structure(
    list(
      structure(
        list(),
        x = 1
      )
    ),
    y = 2
  )

  expect_equal(pluck(x, list(attr_getter("y"))), 2)
  expect_equal(pluck(x, list(1, attr_getter("x"))), 1)
})

test_that("attr_getter() evaluates eagerly", {
  getters <- list_len(2)
  attrs <- c("foo", "bar")
  for (i in seq_along(attrs)) {
    getters[[i]] <- attr_getter(attrs[[i]])
  }

  x <- set_attrs(list(), foo = "foo", bar = "bar")
  expect_identical(getters[[1]](x), "foo")
})

test_that("delegate error handling to Rf_eval()", {
  expect_error(pluck(letters, list(function() NULL)), "unused argument")
  expect_error(pluck(letters, list(function(x, y) y)), "missing, with no default")
})


# environments ------------------------------------------------------------

test_that("pluck errors with invalid indices", {
  expect_error(pluck(environment(), list(1)), "not a string")
  expect_error(pluck(environment(), list(letters)), "not a string")
})

test_that("pluck returns missing with missing index", {
  expect_equal(pluck(environment(), list(NA_character_)), NULL)
})

test_that("plucks by name", {
  env <- new.env(parent = emptyenv())
  env$x <- 10

  expect_equal(pluck(env, list("x")), 10)
})


# S4 ----------------------------------------------------------------------

newA <- methods::setClass("A", list(a = "numeric", b = "numeric"))
A <- newA(a = 1, b = 10)

test_that("pluck errors with invalid indices", {
  expect_error(pluck(A, list(1)), "not a string")
  expect_error(pluck(A, list(letters)), "not a string")
})

test_that("pluck returns missing with missing index", {
  expect_equal(pluck(A, list(NA_character_)), NULL)
})

test_that("plucks by name", {
  expect_equal(pluck(A, list("a")), 1)
})
