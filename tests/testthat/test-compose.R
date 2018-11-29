context("compose")

test_that("composed functions are applied right to left by default", {
  expect_identical(!is.null(4), compose(`!`, is.null)(4))

  set.seed(1)
  x <- sample(1:4, 100, replace = TRUE)
  expect_identical(unname(sort(table(x))), compose(unname, sort, table)(x))
})

test_that("composed functions are applied in reverse order if .dir is supplied", {
  expect_identical(compose(~ .x + 100, ~ .x * 2, .rev = FALSE)(2), 204)
})

test_that("compose supports formulas", {
  round_mean <- compose(~ .x * 100, ~ round(.x, 2), ~ mean(.x, na.rm = TRUE))

  expect_is(round_mean, "function")
  expect_identical(round_mean(1:100), round( mean(1:100, na.rm = TRUE), 2) * 100 )
})

test_that("compose() supports character vectors", {
  fn <- local({
    foobar <- function(x) paste(x, "baz")
    compose("foobar", "foobar")
  })
  expect_identical(fn("quux"), "quux baz baz")
})

test_that("can splice lists of functions", {
  fns <- list(
    ~ paste(.x, "a"),
    ~ paste(.x, "b")
  )
  fn <- compose(!!!fns)
  expect_identical(fn("c"), "c b a")
})
