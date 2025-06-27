test_that("dots are correctly placed in the signature", {
  out <- partialised_body(partial(runif, n = rpois(1, 5)))
  exp <- expr(runif(n = rpois(1, 5), ...))
  expect_identical(out, exp)
})

test_that("no lazy evaluation means arguments aren't repeatedly evaluated", {
  counter <- env(n = 0)
  lazy <- partial(list, n = {
    counter$n <- counter$n + 1
    NULL
  })
  walk(1:10, ~ lazy())
  expect_identical(counter$n, 10)

  counter <- env(n = 0)
  qq <- partial(
    list,
    n = !!{
      counter$n <- counter$n + 1
      NULL
    }
  )
  walk(1:10, ~ qq())
  expect_identical(counter$n, 1)
})

test_that("partial() still works with functions using `missing()`", {
  fn <- function(x) missing(x)
  expect_false(partial(fn, x = 3)())

  fn <- function(x, y) missing(y)
  expect_true(partial(fn)())
  expect_true(partial(fn, x = 1)())
  expect_false(partial(fn, x = 1, y = 2)())
})

test_that("partialised arguments are evaluated in their environments", {
  n <- 0

  partialised <- local({
    n <- 10
    partial(list, n = n)
  })

  expect_identical(partialised(), list(n = 10))
})

test_that("partialised function is evaluated in its environment", {
  fn <- function(...) stop("tilt")

  partialised <- local({
    fn <- function(x) x
    partial(fn, x = "foo")
  })

  expect_identical(partialised(), "foo")
})

test_that("partial() matches argument with primitives", {
  minus <- partial(`-`, .y = 5)
  expect_identical(minus(1), -4)

  minus <- partial(`-`, e2 = 5)
  expect_identical(minus(1), -4)
})

test_that("partial() squashes quosures before printing", {
  foo <- function(x, y) y
  foo <- partial(foo, y = 3)

  # Reproducible environment tag
  environment(foo) <- global_env()

  expect_snapshot(foo)
})

test_that("partial() handles primitives with named arguments after `...`", {
  expect_identical(partial(min, na.rm = TRUE)(1, NA), 1)
  expect_true(is_na(partial(min, na.rm = FALSE)(1, NA)))
})

test_that("partialised function does not infloop when given the same name (#387)", {
  fn <- function(...) "foo"
  fn <- partial(fn)
  expect_identical(fn(), "foo")
})

test_that("partial() handles `... =` arguments", {
  fn <- function(...) list(...)

  default <- partial(fn, "partial")
  expect_identical(default(1), list("partial", 1))

  after <- partial(fn, "partial", ... = )
  expect_identical(after(1), list("partial", 1))

  before <- partial(fn, ... = , "partial")
  expect_identical(before(1), list(1, "partial"))
})

test_that("partial() supports substituted arguments", {
  fn <- function(x) substitute(x)
  fn <- partial(fn, letters)
  expect_identical(fn(), quote(letters))
})

test_that("partial() supports generics (#647)", {
  expect_identical(partial(mean, na.rm = TRUE)(1), 1)

  foo <- TRUE
  expect_identical(partial(mean, na.rm = foo)(1), 1)
})

test_that("partial() supports lexically defined methods in the def env", {
  local({
    mean.purrr__foobar <- function(...) TRUE
    foobar <- structure(list(), class = "purrr__foobar")

    expect_true(partial(mean, na.rm = TRUE)(foobar))
    expect_true(partial(mean, trim = letters, na.rm = TRUE)(foobar))
  })
})

test_that("substitute() works for both partialised and non-partialised arguments", {
  fn <- function(x, y) list(substitute(x), substitute(y))
  expect_identical(partial(fn, foo)(y = bar), alist(foo, bar))
})

test_that("partial() still supports quosures and multiple environments", {
  arg <- local({
    n <- 0
    quo({
      n <<- n + 1
      n
    })
  })

  x <- "foo"

  fn <- partial(list, !!arg, x = x)
  expect_identical(fn(), list(1, x = "foo"))
  expect_identical(fn(), list(2, x = "foo"))
})

test_that("partial() preserves visibility when arguments are from the same environment (#656)", {
  fn <- partial(identity, 1)
  expect_identical(withVisible(fn()), list(value = 1, visible = TRUE))

  fn <- function(x) invisible(x)
  fn <- partial(fn, 1)
  expect_identical(withVisible(fn()), list(value = 1, visible = FALSE))
})


# Life cycle --------------------------------------------------------------

test_that("`.lazy`, `.env`, and `.first` are soft-deprecated", {
  expect_snapshot({
    . <- partial(list, "foo", .lazy = TRUE)
    . <- partial(list, "foo", .env = env())
    . <- partial(list, "foo", .first = TRUE)
  })
})

test_that("`.lazy` still works", {
  local_options(lifecycle_verbosity = "quiet")

  counter <- env(n = 0)
  eager <- partial(
    list,
    n = {
      counter$n <- counter$n + 1
      NULL
    },
    .lazy = FALSE
  )
  walk(1:10, ~ eager())
  expect_identical(counter$n, 1)
})

test_that("`.first` still works", {
  local_options(lifecycle_verbosity = "quiet")

  out <- partialised_body(partial(runif, n = rpois(1, 5), .first = FALSE))
  exp <- expr(runif(..., n = rpois(1, 5)))
  expect_identical(out, exp)

  # partial() also works without partialised arguments
  expect_identical(
    partialised_body(partial(runif, .first = TRUE)),
    expr(runif(...))
  )
  expect_identical(
    partialised_body(partial(runif, .first = FALSE)),
    expr(runif(...))
  )
})

test_that("checks inputs", {
  expect_snapshot(partial(1), error = TRUE)
})

# helpers -----------------------------------------------------------------

test_that("quo_invert() inverts quosured arguments", {
  call <- expr(list(!!quo(foo), !!quo(bar)))
  expect_identical(quo_invert(call), quo(list(foo, bar)))

  call <- expr(list(foo, !!quo(bar)))
  expect_identical(quo_invert(call), quo(list(foo, bar)))

  call <- expr(list(!!quo(foo), bar))
  expect_identical(quo_invert(call), quo(list(foo, bar)))
})

test_that("quo_invert() detects local quosures", {
  foo <- local(quo(foo))
  call <- expr(list(!!foo, !!quo(bar)))
  expect_identical(
    quo_invert(call),
    new_quosure(expr(list(foo, !!quo(bar))), quo_get_env(foo))
  )

  bar <- local(quo(bar))
  call <- expr(list(!!quo(foo), !!bar))
  expect_identical(quo_invert(call), quo(list(foo, !!bar)))
})

test_that("quo_invert() supports quosures in function position", {
  call <- expr((!!quo(list))(!!quo(foo), !!quo(bar)))
  expect_identical(quo_invert(call), quo(list(foo, bar)))

  fn <- local(quo(list))
  env <- quo_get_env(fn)
  call <- expr((!!fn)(!!quo(foo), !!new_quosure(quote(bar), env)))
  expect_identical(
    quo_invert(call),
    new_quosure(expr(list(!!quo(foo), bar)), env)
  )
})

test_that("quo_invert() supports quosures", {
  bar <- local(quo(bar))
  call <- quo(list(!!quo(foo), !!bar))
  expect_identical(quo_invert(call), quo(list(foo, !!bar)))

  foo <- quo(foo)
  call <- local(quo(list(!!foo, !!bar)))
  expect_identical(
    quo_invert(call),
    new_quosure(expr(list(!!foo, !!bar)), quo_get_env(call))
  )
})

test_that("quo_invert() unwraps constants", {
  call <- expr(foo(!!quo(NULL)))
  expect_identical(quo_invert(call), quote(foo(NULL)))

  foo <- local(quo(foo))
  call <- expr(foo(!!foo, !!quo(NULL)))
  expect_identical(
    quo_invert(call),
    new_quosure(quote(foo(foo, NULL)), quo_get_env(foo))
  )
})
