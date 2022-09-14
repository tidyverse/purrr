test_that("contents must be a vector", {
  expect_error(pluck(quote(x), list(1)), "Can't pluck from a symbol")
})

test_that("dots must be unnamed", {
  expect_snapshot(pluck(1, a = 1), error = TRUE)
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

test_that("can pluck from back", {
  x <- list(1, 2, 3)
  expect_equal(pluck(x, -1), 3)
  expect_equal(pluck(x, -2), 2)
  expect_equal(pluck(x, -3), 1)
  expect_equal(pluck(x, -4), NULL)
  expect_equal(pluck(x, -5), NULL)
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

test_that("require length 1 character/double vectors", {
  expect_snapshot(error = TRUE, {
    pluck(1, 1:2)
    pluck(1, integer())
    pluck(1, NULL)
    pluck(1, TRUE)
  })
})

test_that("validate index even when indexing NULL", {
  expect_snapshot(error = TRUE, {
    pluck(NULL, 1:2)
    pluck(NULL, TRUE)
  })

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
  # absent name
  expect_null(pluck(list(1, 2), "a"))
  expect_null(pluck(list(a = 1, b = 2), "c"))

  # outside of range
  expect_null(pluck(1:4, 0))
  expect_null(pluck(1:4, 10))
})

test_that("can pluck 0-length object", {
  expect_equal(pluck(list(integer()), 1), integer())
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
  local_bindings(.env = global_env(), levels.factor = function(...) "dispatched!")
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
  expect_snapshot(pluck(environment(), 1), error = TRUE)
  expect_snapshot(pluck(environment(), letters), error = TRUE)
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
  expect_snapshot(pluck(A, 1), error = TRUE)
  expect_snapshot(pluck(A, letters), error = TRUE)
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

test_that("can assign NULL (#636)", {
  expect_equal(
    assign_in(list(x = 1, y = 2), 1, value = NULL),
    list(x = NULL, y = 2)
  )
  expect_equal(
    assign_in(list(x = 1, y = 2), "y", value = NULL),
    list(x = 1, y = NULL)
  )
})

test_that("can remove elements with zap()", {
  expect_equal(
    assign_in(list(x = 1, y = 2), 1, value = zap()),
    list(y = 2)
  )
  expect_equal(
    assign_in(list(x = 1, y = 2), "y", value = zap()),
    list(x = 1)
  )

  # And deep indexing leaves unchanged
  expect_equal(
    assign_in(list(x = 1, y = 2), c(3, 4, 5), value = zap()),
    list(x = 1, y = 2)
  )
  expect_equal(
    assign_in(list(x = 1, y = 2), c("a", "b", "c"), value = zap()),
    list(x = 1, y = 2)
  )
})

test_that("pluck<- is an alias for assign_in()", {
  x <- list(list(bar = 1, foo = 2))
  pluck(x, 1, "foo") <- 30
  expect_identical(x, list(list(bar = 1, foo = 30)))
})

test_that("assign_in() requires at least one location", {
  x <- list("foo")
  expect_snapshot(error = TRUE, {
    assign_in(x, NULL, value = "foo")
    pluck(x) <- "foo"
  })
})

test_that("can modify non-existing locations", {
  expect_equal(assign_in(list(), "x", 1), list(x = 1))
  expect_equal(assign_in(list(), 2, 1), list(NULL, 1))

  expect_equal(assign_in(list(), c("x", "y"), 1), list(x = list(y = 1)))
  expect_equal(assign_in(list(), c(2, 1), 1), list(NULL, list(1)))

  expect_equal(assign_in(list(), list("x", 2), 1), list(x = list(NULL, 1)))
  expect_equal(assign_in(list(), list(1, "y"), 1), list(list(y = 1)))
})

# modify_in() ----------------------------------------------------------

test_that("modify_in() modifies in pluck location", {
  x <- list(list(bar = 1, foo = 2))

  out <- modify_in(x, list(1, "foo"), `+`, 100)
  expect_identical(out, list(list(bar = 1, foo = 102)))

  out <- modify_in(x, c(1, 1), `+`, 10)
  expect_identical(out, list(list(bar = 11, foo = 2)))
})

test_that("modify_in() doesn't require existing", {
  x <- list(list(x = 1, y = 2))
  expect_equal(modify_in(x, 2, ~ 10), list(list(x = 1, y = 2), 10))
  expect_equal(modify_in(x, list(1, "z"), ~ 10), list(list(x = 1, y = 2, z = 10)))
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

# chuck -------------------------------------------------------------------

test_that("trying to chuck NULL raises errors", {
  expect_snapshot(chuck(NULL, "a"), error = TRUE)
})

test_that("dots must be unnamed", {
  expect_snapshot(chuck(1, a = 1), error = TRUE)
})

test_that("special indexes raise errors", {
  x <- list(a = 1, b = 2, c = 3)

  expect_error(chuck(x, NA_character_), "can't be NA")
  expect_error(chuck(x, ""), "can't be an empty string")

  expect_error(chuck(x, NA_integer_), "must be finite")

  expect_error(chuck(x, NA_real_), "must be finite")
  expect_error(chuck(x, NaN), "must be finite")
  expect_error(chuck(x, Inf), "must be finite")
  expect_error(chuck(x, -Inf), "must be finite")

  expect_snapshot(chuck(x, integer(0)), error = TRUE)
})

test_that("halts on named vector errors", {
  # unnamed input
  expect_error(chuck(1:2, "a"), "pluck from an unnamed vector")

  # name doesn't exist
  expect_error(chuck(setNames(1:2, c("a", "b")), "c"), "Can't find name")
})

test_that("indices outside of vector length raise errors", {
  expect_snapshot(error = TRUE, {
    chuck(1:4, 10)
    chuck(1:4, 0)
    chuck(1:4, -10)
  })
})

test_that("handles weird names", {
  x <- list(1, 2, 3, 4, 5)
  names(x) <- c("a", "a", NA_character_, "", "b")

  expect_error(chuck(x, ""), "can't be an empty string")
  expect_error(chuck(x, NA_character_), "can't be NA")
})

test_that("raises error with missing index", {
  expect_error(chuck(environment(), NA_character_), "can't be NA")
})

test_that("non-existent object name raises error", {
  expect_error(chuck(emptyenv(), "x"), "Can't find object")
})

newA <- methods::setClass("A", list(a = "numeric", b = "numeric"))
A <- newA(a = 1, b = 10)

test_that("raises error for NA index on S4 object", {
  expect_error(chuck(A, NA_character_), "can't be NA")
})

test_that("can't chuck if S4 slot doesn't exist", {
  expect_error(chuck(A, "c"), "Can't find slot")
})

