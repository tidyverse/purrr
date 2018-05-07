context("map_flat")

test_that("map function and flatten one level", {
  expect_equal(map_flat(list(1:2, 3:6), `*`, 2), list(2, 4, 6, 8, 10, 12))
})

test_that("map_flat variants are correct types", {
  set.seed(45)
  return_var <- function(x, type) vector(type, rpois(1, 5))
  expect_type(map_flat_dbl(c(mtcars), return_var, "double"), "double")
  expect_type(map_flat_chr(c(mtcars), return_var, "character"), "character")
  expect_type(map_flat_int(c(mtcars), return_var, "integer"), "integer")
  expect_type(map_flat_lgl(c(mtcars), return_var, "logical"), "logical")
  expect_type(map_flat_raw(c(mtcars), return_var, "raw"), "raw")
})

test_that("row and column binding work", {
  mtcar_mod <- mtcars %>%
    split(.$cyl) %>%
    map(~ lm(mpg ~ wt, data = .x))
  f_coef <- function(x) as.data.frame(t(as.matrix(coef(x))))
  expect_length(mtcar_mod %>% map_flat_dfr(f_coef), 2)
  expect_length(mtcar_mod %>% map_flat_dfr(f_coef, .id = "col"), 3)
  expect_length(mtcar_mod %>% map_flat_dfc(f_coef), 6)
})
