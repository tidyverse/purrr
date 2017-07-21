context("as_mapper")


# formulas ----------------------------------------------------------------

test_that("can refer to first argument in three ways", {
  expect_equal(map_dbl(1, ~ . + 1), 2)
  expect_equal(map_dbl(1, ~ .x + 1), 2)
  expect_equal(map_dbl(1, ~ ..1 + 1), 2)
})

test_that("can refer to second arg in two ways", {
  expect_equal(map2_dbl(1, 2, ~ .x + .y + 1), 4)
  expect_equal(map2_dbl(1, 2, ~ ..1 + ..2 + 1), 4)
})

# vectors --------------------------------------------------------------

# test_that(".null generates warning", {
#   expect_warning(map(1, 2, .null = NA), "`.null` is deprecated")
# })

test_that(".default replaces absent values", {
  x <- list(
    list(a = 1, b = 2, c = 3),
    list(a = 1, c = 2),
    NULL
  )

  expect_equal(map_dbl(x, 3, .default = NA), c(3, NA, NA))
  expect_equal(map_dbl(x, "b", .default = NA), c(2, NA, NA))
})

test_that(".default replaces elements with length 0", {
  x <- list(
    list(a = 1),
    list(a = NULL),
    list(a = numeric())
  )
  expect_equal(map_dbl(x, "a", .default = NA), c(1, NA, NA))
})

test_that("Additional arguments are ignored", {
  expect_equal(as_mapper(function() NULL, foo = "bar", foobar), function() NULL)
})

test_that("can supply length > 1 vectors", {
  expect_identical(as_mapper(1:2)(list(list("a", "b"))), "b")
  expect_identical(as_mapper(c("a", "b"))(list(a = list("a", b = "b"))), "b")
})


# primitive functions --------------------------------------------------

test_that("primitive functions are wrapped", {
  expect_identical(as_mapper(`-`)(.y = 10, .x = 5), -5)
  expect_identical(as_mapper(`c`)(1, 3, 5), c(1, 3, 5))
})

test_that("syntactic primitives are wrapped", {
  expect_identical(as_mapper(`[[`)(mtcars, "cyl"), mtcars$cyl)
  expect_identical(as_mapper(`$`)(mtcars, cyl), mtcars$cyl)
})


# lists ------------------------------------------------------------------

test_that("lists are wrapped", {
  mapper_list <- as_mapper(list("mpg", 5))(mtcars)
  base_list <- mtcars[["mpg"]][[5]]
  expect_identical(mapper_list, base_list)
})

test_that("raw and complex types aren't supported for indexing", {
  expect_error(as_mapper(1)(raw(2)))
  expect_error(as_mapper(1)(complex(2)))
})
