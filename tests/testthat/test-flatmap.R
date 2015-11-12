context("flatmap")

test_that("flatmap() coerces appropriately", {
  skip("WIP")
  return_var <- function(x, type) vector(type, rpois(1, 5))

  out_dbl <- flatmap(c(mtcars), return_var, "double")
  expect_equal(typeof(out_dbl), "double")

  out_chr <- flatmap(c(mtcars), return_var, "character", .type = "character")
  expect_equal(typeof(out_chr), "character")

  expect_error(flatmap(c(mtcars), return_var, "double", .type = "character"))
  expect_error(flatmap(c(mtcars), return_var, "character", .type = "double"))
})
