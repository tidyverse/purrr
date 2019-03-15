context("compose")

test_that("composed functions are applied right to left by default", {
  expect_identical(!is.null(4), compose(`!`, is.null)(4))

  set.seed(1)
  x <- sample(1:4, 100, replace = TRUE)
  expect_identical(unname(sort(table(x))), compose(unname, sort, table)(x))
})

test_that("composed functions are applied in reverse order if .dir is supplied", {
  expect_identical(compose(~ .x + 100, ~ .x * 2, .dir = "forward")(2), 204)
})

test_that("compose supports formulas", {
  round_mean <- compose(~ .x * 100, ~ round(.x, 2), ~ mean(.x, na.rm = TRUE))

  expect_is(round_mean, "purrr_function_compose")
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

test_that("compose() works with generic functions (#629)", {
  purrr__gen <- function(x) UseMethod("purrr__gen")

  local({
    purrr__gen.default <- function(x) x + 1
    expect_identical(compose(~ purrr__gen(.x))(0), 1)
    expect_identical(compose(~ purrr__gen(.x), ~ purrr__gen(.x))(0), 2)

    expect_identical(compose(purrr__gen)(0), 1)
    expect_identical(compose(purrr__gen, purrr__gen)(0), 2)
  })
})

test_that("compose() works with generic functions (#639)", {
  n_unique <- purrr::compose(length, unique)
  expect_identical(n_unique(iris$Species), 3L)
})

test_that("compose() works with argument matching functions", {
  # They inspect their dynamic context via sys.function()
  fn <- function(x = c("foo", "bar")) match.arg(x)
  expect_identical(compose(fn)("f"), "foo")
  expect_identical(compose(fn, fn)("f"), "foo")
})

test_that("compose() works with non-local exits", {
  fn <- function(x) return(x)
  expect_identical(compose(fn)("foo"), "foo")
  expect_identical(compose(fn, fn)("foo"), "foo")
  expect_identical(compose(~ return(paste(.x, "foo")), ~ return("bar"))(), "bar foo")
})

test_that("compose() preserves lexical environment", {
  fn <- local({
    `_foo` <- "foo"
    function(...) `_foo`
  })
  expect_identical(compose(fn)(), "foo")
  expect_identical(compose(fn, fn)(), "foo")
})

test_that("compose() can take dots from multiple environments", {
  f <- function(...) {
    `_foo` <- "foo"
    g(`_foo`, ...)
  }
  g <- function(...) {
    `_bar` <- "bar"
    h(`_bar`, ...)
  }
  h <- function(...) {
    `_baz` <- "baz"
    fn(`_baz`, ...)
  }
  `_quux` <- "quux"

  # By value
  fn <- compose(function(...) c(...))
  expect_identical(f(`_quux`), c("baz", "bar", "foo", "quux"))

  # By expression (base)
  fn <- compose(function(...) substitute(...()))
  expect_identical(f(`_quux`), as.pairlist(exprs(`_baz`, `_bar`, `_foo`, `_quux`)))

  # By expression (rlang)
  fn <- compose(function(...) enquos(...))
  quos <- f(`_quux`)

  frame <- current_env()
  expect_true(is_reference(quo_get_env(quos[[4]]), frame))
  expect_false(is_reference(quo_get_env(quos[[3]]), frame))

  expect_identical(unname(map_chr(quos, as_name)), c("_baz", "_bar", "_foo", "_quux"))
})

test_that("compose() does not inline functions in call stack", {
  expect_equal(compose(~ sys.call())(), quote(`_fn`()))
})
