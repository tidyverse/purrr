context("create_env")

test_that("new environment works for vectors", {
  x <- list(a = 1:3, b = list(iris))
  env <- x %>% create_env()
  expect_equal(env$a, 1:3)
})

test_that("new environment works for lists", {
  x <- list(b = list(iris))
  env <- x %>% create_env()
  expect_equal(env$b, list(iris))
})
