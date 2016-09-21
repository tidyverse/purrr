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

test_that("in_new_env solves the saveSize problem", {
  saveSize <- function (object) {
    tf <- tempfile(fileext = ".RData")
    on.exit(unlink(tf))
    save(object, file = tf)
    file.size(tf)
  }

  tmp_fun <- function(){
    iris_big <- lapply(1:10000, function(x) iris)
    in_new_env(lm)(Sepal.Length ~ Sepal.Width, data = iris)
  }

  obj <- tmp_fun()
  out <- saveSize(obj)
  out %>% expect_lt(60000)
})
