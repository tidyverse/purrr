test_that("can pluck/chuck from NULL", {
  expect_equal(pluck(NULL, 1), NULL)
  expect_snapshot(chuck(NULL, 1), error = TRUE)
})

test_that("can pluck vector types ", {
  x <- list(
    lgl = c(TRUE, FALSE),
    int = 1:2,
    dbl = c(1, 2.5),
    chr = c("a", "b"),
    cpx = c(1 + 1i, 2 + 2i),
    raw = charToRaw("ab"),
    lst = list(1, 2)
  )

  expect_equal(pluck(x, "lgl", 2), FALSE)
  expect_identical(pluck(x, "int", 2), 2L)
  expect_equal(pluck(x, "dbl", 2), 2.5)
  expect_equal(pluck(x, "chr", 2), "b")
  expect_equal(pluck(x, "cpx", 2), 2 + 2i)
  expect_equal(pluck(x, "raw", 2), charToRaw("b"))
  expect_equal(pluck(x, "lst", 2), 2)
})

test_that("unsupported types have useful error", {
  expect_snapshot(error = TRUE, {
    pluck(quote(x), 1)
    pluck(quote(f(x, 1)), 1)
    pluck(expression(1), 1)
  })
})

test_that("dots must be unnamed", {
  expect_snapshot(pluck(1, a = 1), error = TRUE)
  expect_snapshot(chuck(1, a = 1), error = TRUE)
})

test_that("can pluck by position (positive and negative)", {
  x <- list("a", "b", "c")

  expect_equal(pluck(x, 1), "a")
  expect_equal(pluck(x, -1), "c")

  expect_equal(pluck(x, 0), NULL)
  expect_equal(pluck(x, 4), NULL)
  expect_equal(pluck(x, -4), NULL)
  expect_equal(pluck(x, -5), NULL)

  expect_snapshot(chuck(x, 0), error = TRUE)
  expect_snapshot(chuck(x, 4), error = TRUE)
  expect_snapshot(chuck(x, -4), error = TRUE)
  expect_snapshot(chuck(x, -5), error = TRUE)
})

test_that("special numbers don't match", {
  x <- list()

  expect_equal(pluck(x, NA_integer_), NULL)
  expect_equal(pluck(x, NA_real_), NULL)
  expect_equal(pluck(x, NaN), NULL)
  expect_equal(pluck(x, Inf), NULL)
  expect_equal(pluck(x, -Inf), NULL)

  expect_snapshot(chuck(x, NA_integer_), error = TRUE)
  expect_snapshot(chuck(x, NA_real_), error = TRUE)
  expect_snapshot(chuck(x, NaN), error = TRUE)
  expect_snapshot(chuck(x, Inf), error = TRUE)
  expect_snapshot(chuck(x, -Inf), error = TRUE)
})

test_that("can pluck by name", {
  x <- list(a = "a")

  expect_equal(pluck(x, "a"), "a")

  expect_equal(pluck(x, "b"), NULL)
  expect_equal(pluck(x, NA_character_), NULL)
  expect_equal(pluck(x, ""), NULL)

  expect_snapshot(chuck(x, "b"), error = TRUE)
  expect_snapshot(chuck(x, NA_character_), error = TRUE)
  expect_snapshot(chuck(x, ""), error = TRUE)
})

test_that("even if names don't exist", {
  x <- list("a")

  expect_equal(pluck(x, "a"), NULL)
  expect_snapshot(chuck(x, "a"), error = TRUE)
})

test_that("matches first name if duplicated", {
  x <- list(1, 2, 3, 4, 5)
  names(x) <- c("a", "a", NA, "", "b")

  expect_equal(pluck(x, "a"), 1)
})

test_that("empty and NA names never match", {
  x <- list(1, 2, 3)
  names(x) <- c("", NA, "x")

  expect_equal(pluck(x, "x"), 3)

  expect_equal(pluck(x, ""), NULL)
  expect_equal(pluck(x, NA_character_), NULL)

  expect_snapshot(chuck(x, ""), error = TRUE)
  expect_snapshot(chuck(x, NA_character_), error = TRUE)
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

test_that("can pluck 0-length object", {
  expect_equal(pluck(list(integer()), 1), integer())
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

test_that("attr_getter() uses exact (non-partial) matching", {
  x <- 1
  attr(x, "labels") <- "foo"

  expect_identical(attr_getter("labels")(x), "foo")
  expect_identical(attr_getter("label")(x), NULL)
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

test_that("accessors throw correct errors", {
  expect_snapshot(error = TRUE, {
    pluck(1:3, function() NULL)
    pluck(1:3, function(x, y) y)
  })
})

test_that("pluck() functions dispatch on base getters", {
  expect_identical(pluck(iris, "Species", levels), levels(iris$Species))
})

test_that("pluck() supports primitive and built-in functions (#404)", {
  x <- list(1:2)
  expect_equal(pluck(x, 1, as.character), c("1", "2"))
  expect_equal(pluck(x, 1, sum), 3)
})

# environments ------------------------------------------------------------

test_that("can pluck/chuck environment by name", {
  x <- new_environment(list(x = 10))

  expect_equal(pluck(x, "x"), 10)
  expect_equal(pluck(x, "y"), NULL)
  expect_equal(pluck(x, NA_character_), NULL)

  expect_snapshot(chuck(x, "y"), error = TRUE)
  expect_snapshot(chuck(x, NA_character_), error = TRUE)
})

test_that("environments error with invalid indices", {
  expect_snapshot(pluck(environment(), 1), error = TRUE)
  expect_snapshot(pluck(environment(), letters), error = TRUE)
})

# S4 ----------------------------------------------------------------------

newA <- methods::setClass("A", list(a = "numeric"))

test_that("can pluck/chuck from S4 objects", {
  A <- newA(a = 1)
  expect_equal(pluck(A, "a"), 1)
  expect_equal(pluck(A, "b"), NULL)
  expect_equal(pluck(A, NA_character_), NULL)

  expect_snapshot(chuck(A, "b"), error = TRUE)
  expect_snapshot(chuck(A, NA_character_), error = TRUE)
})

test_that("S4 objects error with invalid indices", {
  A <- newA(a = 1)
  expect_snapshot(pluck(A, 1), error = TRUE)
  expect_snapshot(pluck(A, letters), error = TRUE)
})

# S3 ----------------------------------------------------------------------

test_that("pluck() dispatches on vector methods", {
  new_test_pluck <- function(x) {
    structure(list(x), class = "test_pluck")
  }

  inner <- list(a = "foo", b = list("bar"))
  x <- list(new_test_pluck(inner))

  with_bindings(
    .env = global_env(),
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
  with_bindings(
    .env = global_env(),
    `[[.test_pluck` = function(x, i) .subset2(x, 1)[[i]],
    length.test_pluck = function(x) NA,
    {
      expect_null(pluck(x, 1, 1))
      expect_snapshot(chuck(x, 1, 1), error = TRUE)
    }
  )

  # With faulty names() method
  with_bindings(
    .env = global_env(),
    `[[.test_pluck` = function(x, i) .subset2(x, 1)[[i]],
    names.test_pluck = function(x) NA,
    length.test_pluck = function(x) length(.subset2(x, 1)),
    {
      expect_null(pluck(x, 1, "b", 1))
      expect_snapshot(chuck(x, 1, "b", 1), error = TRUE)
    }
  )
})

# Setting -----------------------------------------------------------------

test_that("pluck<- is an alias for assign_in()", {
  x <- list(list(bar = 1, foo = 2))
  pluck(x, 1, "foo") <- 30
  expect_identical(x, list(list(bar = 1, foo = 30)))
})
