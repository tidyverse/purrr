context("isolate")

test_that("index must be a list", {
  expect_error(isolate(1:10, 1), "must be a list")
})

test_that("contents must be a vector", {
  expect_error(isolate(quote(x), list(1)), "Don't know how to isolate")
})

# isolate vector --------------------------------------------------------------

test_that("can isolate by position", {
  x <- list("a", 1, c(TRUE, FALSE))

  # double
  expect_identical(isolate(x, list(1)), x[[1]])
  expect_identical(isolate(x, list(2)), x[[2]])
  expect_identical(isolate(x, list(3)), x[[3]])

  # integer
  expect_identical(isolate(x, list(1L)), x[[1]])
  expect_identical(isolate(x, list(2L)), x[[2]])
  expect_identical(isolate(x, list(3L)), x[[3]])
})

test_that("can isolate by name", {
  x <- list(a = "a", b = 1, c = c(TRUE, FALSE))

  expect_identical(isolate(x, list("a")), x[["a"]])
  expect_identical(isolate(x, list("b")), x[["b"]])
  expect_identical(isolate(x, list("c")), x[["c"]])
})

test_that("can isolate from atomic vectors", {
  expect_identical(isolate(TRUE, list(1)), TRUE)
  expect_identical(isolate(1L, list(1)), 1L)
  expect_identical(isolate(1, list(1)), 1)
  expect_identical(isolate("a", list(1)), "a")
})

test_that("can isolate by name and position", {
  x <- list(a = list(list(b = 1)))
  expect_equal(isolate(x, list("a", 1, "b")), 1)
})


test_that("require length 1 vectors", {
  expect_error(isolate(1, list(letters)), "must have length 1")
  expect_error(isolate(1, list(TRUE)), "must be a character or numeric")
})

test_that("special indexes never match", {
  x <- list(a = 1, b = 2, c = 3)

  expect_null(isolate(x, list(NA_character_)))
  expect_null(isolate(x, list("")))

  expect_null(isolate(x, list(NA_integer_)))

  expect_null(isolate(x, list(NA_real_)))
  expect_null(isolate(x, list(NaN)))
  expect_null(isolate(x, list(Inf)))
  expect_null(isolate(x, list(-Inf)))
})

test_that("special values return NULL", {
  # unnamed input
  expect_null(isolate(list(1, 2), list("a")))

  # zero length input
  expect_null(isolate(integer(), list(1)))

  # past end
  expect_null(isolate(1:4, list(10)))
  expect_null(isolate(1:4, list(10L)))
})

test_that("handles weird names", {
  x <- list(1, 2, 3, 4, 5)
  names(x) <- c("a", "a", NA, "", "b")

  expect_equal(isolate(x, list("a")), 1)
  expect_equal(isolate(x, list("b")), 5)

  expect_null(isolate(x, list("")))
  expect_null(isolate(x, list(NA_character_)))
})

# attributes --------------------------------------------------------------

test_that("can isolate attributes", {
  x <- structure(
    list(
      structure(
        list(),
        x = 1
      )
    ),
    y = 2
  )

  expect_equal(isolate(x, list(get_attr("y"))), 2)
  expect_equal(isolate(x, list(1, get_attr("x"))), 1)
})

# environments ------------------------------------------------------------

test_that("isolate errors with invalid indices", {
  expect_error(isolate(environment(), list(1)), "not a string")
  expect_error(isolate(environment(), list(letters)), "not a string")
})

test_that("isolate returns missing with missing index", {
  expect_equal(isolate(environment(), list(NA_character_)), NULL)
})

test_that("isolates by name", {
  env <- new.env(parent = emptyenv())
  env$x <- 10

  expect_equal(isolate(env, list("x")), 10)
})


# S4 ----------------------------------------------------------------------

newA <- methods::setClass("A", list(a = "numeric", b = "numeric"))
A <- newA(a = 1, b = 10)

test_that("isolate errors with invalid indices", {
  expect_error(isolate(A, list(1)), "not a string")
  expect_error(isolate(A, list(letters)), "not a string")
})

test_that("isolate returns missing with missing index", {
  expect_equal(isolate(A, list(NA_character_)), NULL)
})

test_that("isolates by name", {
  expect_equal(isolate(A, list("a")), 1)
})
