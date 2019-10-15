context("pluck")

test_that("contents must be a vector", {
  expect_error(pluck(quote(x), list(1)), "Can't pluck from a symbol")
})

# pluck vector --------------------------------------------------------------

test_that("can pluck by position", {
  x <- list("a", 1, c(TRUE, FALSE))

  # double
  expect_identical(pluck(x, 1), x[[1]])
  expect_identical(pluck(x, 2), x[[2]])
  expect_identical(pluck(x, 3), x[[3]])

  # integer
  expect_identical(pluck(x, 1L), x[[1]])
  expect_identical(pluck(x, 2L), x[[2]])
  expect_identical(pluck(x, 3L), x[[3]])
})

test_that("can pluck by name", {
  x <- list(a = "a", b = 1, c = c(TRUE, FALSE))

  expect_identical(pluck(x, "a"), x[["a"]])
  expect_identical(pluck(x, "b"), x[["b"]])
  expect_identical(pluck(x, "c"), x[["c"]])
})

test_that("can pluck from atomic vectors", {
  expect_identical(pluck(TRUE, 1), TRUE)
  expect_identical(pluck(1L, 1), 1L)
  expect_identical(pluck(1, 1), 1)
  expect_identical(pluck("a", 1), "a")
})

test_that("can pluck by name and position", {
  x <- list(a = list(list(b = 1)))
  expect_equal(pluck(x, "a", 1, "b"), 1)
})


test_that("require length 1 vectors", {
  expect_bad_element_length_error(pluck(1, letters), "must have length 1")
  expect_bad_element_type_error(pluck(1, TRUE), "Index 1 must be a character or numeric vector")
})

test_that("special indexes never match", {
  x <- list(a = 1, b = 2, c = 3)

  expect_null(pluck(x, NA_character_))
  expect_null(pluck(x, ""))

  expect_null(pluck(x, NA_integer_))

  expect_null(pluck(x, NA_real_))
  expect_null(pluck(x, NaN))
  expect_null(pluck(x, Inf))
  expect_null(pluck(x, -Inf))
})

test_that("special values return NULL", {
  # unnamed input
  expect_null(pluck(list(1, 2), "a"))

  # zero length input
  expect_null(pluck(integer(), 1))

  # past end
  expect_null(pluck(1:4, 10))
  expect_null(pluck(1:4, 10L))
})

test_that("handles weird names", {
  x <- list(1, 2, 3, 4, 5)
  names(x) <- c("a", "a", NA, "", "b")

  expect_equal(pluck(x, "a"), 1)
  expect_equal(pluck(x, "b"), 5)

  expect_null(pluck(x, ""))
  expect_null(pluck(x, NA_character_))
})

test_that("supports splicing", {
  x <- list(list(bar = 1, foo = 2))
  idx <- list(1, "foo")
  expect_identical(pluck(x, !!!idx), 2)
})


# functions ---------------------------------------------------------------

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

  expect_equal(pluck(x, attr_getter("y")), 2)
  expect_equal(pluck(x, 1, attr_getter("x")), 1)
})

test_that("attr_getter() evaluates eagerly", {
  getters <- new_list(2)
  attrs <- c("foo", "bar")
  for (i in seq_along(attrs)) {
    getters[[i]] <- attr_getter(attrs[[i]])
  }

  x <- structure(list(), foo = "foo", bar = "bar")
  expect_identical(getters[[1]](x), "foo")
})

test_that("delegate error handling to Rf_eval()", {
  expect_error(pluck(letters, function() NULL), "unused argument")
  expect_error(pluck(letters, function(x, y) y), "missing, with no default")
})

test_that("pluck() dispatches on base getters", {
  expect_identical(pluck(iris, "Species", levels), levels(iris$Species))
})

test_that("pluck() dispatches on global methods", {
  scoped_bindings(.env = global_env(), levels.factor = function(...) "dispatched!")
  expect_identical(pluck(iris, "Species", levels), levels(iris$Species))
})

test_that("pluck() supports primitive functions (#404)", {
  x <- list(a = "apple", n = 3, v = 1:5)
  expect_identical(pluck(x, "n", as.character), "3")
})


# attribute extraction ----------------------------------------------------

test_that("attr_getter() uses exact (non-partial) matching", {
  x <- 1
  attr(x, "labels") <- "foo"

  expect_identical(attr_getter("labels")(x), "foo")
  expect_identical(attr_getter("label")(x), NULL)
})


# environments ------------------------------------------------------------

test_that("pluck errors with invalid indices", {
  expect_bad_element_vector_error(pluck(environment(), 1), "Index 1 must be a single string, not a single double")
  expect_bad_element_vector_error(pluck(environment(), letters), "Index 1 must be a single string, not a character vector of length 26")
})

test_that("pluck returns missing with missing index", {
  expect_equal(pluck(environment(), NA_character_), NULL)
})

test_that("plucks by name", {
  env <- new.env(parent = emptyenv())
  env$x <- 10

  expect_equal(pluck(env, "x"), 10)
})


# S4 ----------------------------------------------------------------------

newA <- methods::setClass("A", list(a = "numeric", b = "numeric"))
A <- newA(a = 1, b = 10)

test_that("pluck errors with invalid indices", {
  expect_bad_element_vector_error(pluck(A, 1), "Index 1 must be a single string, not a single double")
  expect_bad_element_vector_error(pluck(A, letters), "Index 1 must be a single string, not a character vector of length 26")
})

test_that("pluck returns missing with missing index", {
  expect_equal(pluck(A, NA_character_), NULL)
})

test_that("plucks by name", {
  expect_equal(pluck(A, "a"), 1)
})

test_that("can't pluck from complex", {
  expect_error( pluck( 1+2i, 1 ), "Don't know how to index object of type complex at level 1" )
})


# assign_in() ----------------------------------------------------------

test_that("reduce_subset_call() type-checks", {
  expect_identical(reduce_subset_call(NA, list(1, 4, "foo", 3)), quote(NA[[1]][[4]][["foo"]][[3]]))
  expect_error(reduce_subset_call(NA, list(1, attr_getter("foo"), 3)), "must be names or positions, not a function")
})

test_that("assign_in() doesn't assign in the caller environment", {
  x <- list(list(bar = 1, foo = 2))
  assign_in(x, list(1, "foo"), value = 20)
  expect_identical(x, list(list(bar = 1, foo = 2)))
})

test_that("assign_in() assigns", {
  x <- list(list(bar = 1, foo = 2))
  out <- assign_in(x, list(1, "foo"), value = 20)
  expect_identical(out, list(list(bar = 1, foo = 20)))
})

test_that("pluck<- is an alias for assign_in()", {
  x <- list(list(bar = 1, foo = 2))
  pluck(x, 1, "foo") <- 30
  expect_identical(x, list(list(bar = 1, foo = 30)))
})

test_that("assign_in() requires at least one location", {
  x <- list("foo")
  expect_error(assign_in(x, NULL, value = "foo"), "without pluck locations")
  expect_error(pluck(x) <- "foo", "without pluck locations")
})

test_that("assign_in() requires existing location", {
  x <- list(list(bar = 1, foo = 2))
  expect_error(assign_in(x, 2, 10), "exceeds the length")
  expect_error(assign_in(x, list(1, "baz"), 10), "Can't find name `baz`")
})


# modify_in() ----------------------------------------------------------

test_that("modify_in() modifies in pluck location", {
  x <- list(list(bar = 1, foo = 2))

  out <- modify_in(x, list(1, "foo"), `+`, 100)
  expect_identical(out, list(list(bar = 1, foo = 102)))

  out <- modify_in(x, c(1, 1), `+`, 10)
  expect_identical(out, list(list(bar = 11, foo = 2)))
})

test_that("modify_in() requires existing location", {
  x <- list(list(bar = 1, foo = 2))
  expect_error(modify_in(x, 2, `+`, 10), "exceeds the length")
  expect_error(modify_in(x, list(1, "baz"), `+`, 10), "Can't find name `baz`")
})


# S3 ----------------------------------------------------------------------

test_that("pluck() dispatches on vector methods", {
  new_test_pluck <- function(x) {
    structure(list(x), class = "test_pluck")
  }

  inner <- list(a = "foo", b = list("bar"))
  x <- list(new_test_pluck(inner))

  with_bindings(.env = global_env(),
    `[[.test_pluck` = function(x, i) .subset2(x, 1)[[i]],
    names.test_pluck = function(x) names(.subset2(x, 1)),
    length.test_pluck = function(x) length(.subset2(x, 1)),
    {
      expect_identical(pluck(x, 1, 1), "foo")
      expect_identical(pluck(x, 1, "b", 1), "bar")
      expect_identical(chuck(x, 1, 1), "foo")
      expect_identical(chuck(x, 1, "b", 1), "bar")
    }
  )

  # With faulty length() method
  with_bindings(.env = global_env(),
    `[[.test_pluck` = function(x, i) .subset2(x, 1)[[i]],
    length.test_pluck = function(x) NA,
    {
      expect_null(pluck(x, 1, 1))
      expect_error(chuck(x, 1, 1), "Length of S3 object must be a scalar integer")
    }
  )

  # With faulty names() method
  with_bindings(.env = global_env(),
    `[[.test_pluck` = function(x, i) .subset2(x, 1)[[i]],
    names.test_pluck = function(x) NA,
    length.test_pluck = function(x) length(.subset2(x, 1)),
    {
      expect_null(pluck(x, 1, "b", 1))
      expect_error(chuck(x, 1, "b", 1), "unnamed vector")
    }
  )
})
