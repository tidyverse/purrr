context("map")

test_that("preserves names", {
  out <- map(list(x = 1, y = 2), identity)
  expect_equal(names(out), c("x", "y"))
})

test_that("creates simple call", {
  out <- map(1, function(x) sys.call())[[1]]
  expect_identical(out, quote(.f(.x[[i]], ...)))
})

test_that("fails on non-vectors", {
  expect_error(map(environment(), identity), "not a vector")
  expect_error(map(quote("a"), identity), "not a vector")
})

test_that("0 length input gives 0 length output", {
  out <- map(list(), identity)
  expect_equal(out, list())
})

test_that("map() returns a data frame when given one", {
  df <- data.frame(a = c("a", "b"), b = c("a", "b"))

  out1 <- map(df, as.character)
  out2 <- map(df, `[[`, 1)

  expect_is(out1, "data.frame")
  expect_is(out2, "data.frame")
})

test_that("map2() and map3() return a data frame when given one", {
  df <- data.frame(a = c("a", "b"), b = c("a", "b"))

  out_map2 <- map2(df, names(df), function(x, y) paste(x, y))
  out_map3 <- map3(df, names(df), c("1", "2"), function(x, y, z) paste(x, y, z))

  expect_is(out_map2, "data.frame")
  expect_is(out_map3, "data.frame")
})

test_that("map_n() is not vectorized over additional arguments (see #54)", {
  f <- function(x, y, zs) zs
  actual <- list(1:3, 1:3)
  alleged1 <- map2(1:2, 1:2, f, zs = 1:3)
  alleged2 <- map2(1:2, 1:2, f, 1:3)
  expect_equal(actual, alleged1)
  expect_equal(actual, alleged2)
})

test_that("flatmap() coerces appropriately", {
  return_var <- function(x, type) vector(type, rpois(1, 5))

  out_dbl <- flatmap(c(mtcars), return_var, "double")
  expect_equal(typeof(out_dbl), "double")

  out_chr <- flatmap(c(mtcars), return_var, "character", .type = "character")
  expect_equal(typeof(out_chr), "character")

  expect_error(flatmap(c(mtcars), return_var, "double", .type = "character"))
  expect_error(flatmap(c(mtcars), return_var, "character", .type = "double"))
})
