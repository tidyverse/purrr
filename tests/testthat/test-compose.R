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

  expect_is(round_mean, "purrr_composed_fn")
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

test_that("composed function has formals of first function called", {
  fn <- function(x, y = 1) NULL
  expect_identical(formals(compose(identity, fn)), formals(fn))
})

test_that("can compose primitive functions", {
  expect_identical(compose(is.character, as.character)(3), TRUE)
  expect_identical(compose(`-`, `/`)(4, 2), -2)
})

test_that("composed function prints informatively", {
  fn1 <- set_env(function(x) x + 1, global_env())
  fn2 <- set_env(function(x) x / 1, global_env())
  expect_known_output(file = test_path("compose-print.txt"), {
    cat("Single input:\n\n")
    print(compose(fn1))

    cat("Multiple inputs:\n\n")
    print(compose(fn1, fn2))
  })
})

test_that("compose() with 0 inputs returns the identity", {
  expect_identical(compose()(mtcars), mtcars)
})

test_that("compose() with 1 input is a noop", {
  expect_identical(compose(toupper)(letters), toupper(letters))
})
