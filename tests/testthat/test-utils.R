context("utils")

test_that("rbernoulli is a special case of rbinom", {
  set.seed(1)
  x <- rbernoulli(10)

  set.seed(1)
  y <- ifelse(rbinom(10, 1, 0.5) == 1, TRUE, FALSE)

  expect_equal(x, y)
})

test_that("rdunif works", {
  expect_length(rdunif(100, 10), 100)
})

test_that("rdunif fails if a and b are not unit length numbers", {
  expect_error(rdunif(1000, 1, "a"))
  expect_error(rdunif(1000, 1, c(0.5, 0.2)))
  expect_error(rdunif(1000, FALSE, 2))
  expect_error(rdunif(1000, c(2, 3), 2))
})

test_that("has_names returns vector of logicals", {
  expect_equal(has_names(letters %>% set_names()), rep_along(letters, TRUE))
  expect_equal(has_names(letters), rep_along(letters, FALSE))
})

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
  expect_identical(quo_invert(call), new_quosure(expr(list(foo, !!quo(bar))), quo_get_env(foo)))

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
  expect_identical(quo_invert(call), new_quosure(expr(list(!!quo(foo), bar)), env))
})

test_that("quo_invert() supports quosures", {
  bar <- local(quo(bar))
  call <- quo(list(!!quo(foo), !!bar))
  expect_identical(quo_invert(call), quo(list(foo, !!bar)))

  foo <- quo(foo)
  call <- local(quo(list(!!foo, !!bar)))
  expect_identical(quo_invert(call), new_quosure(expr(list(!!foo, !!bar)), quo_get_env(call)))
})

test_that("quo_invert() unwraps constants", {
  call <- expr(foo(!!quo(NULL)))
  expect_identical(quo_invert(call), quote(foo(NULL)))

  foo <- local(quo(foo))
  call <- expr(foo(!!foo, !!quo(NULL)))
  expect_identical(quo_invert(call), new_quosure(quote(foo(foo, NULL)), quo_get_env(foo)))
})


# Lifecycle ---------------------------------------------------------------

test_that("%@% is an infix attribute accessor", {
  scoped_lifecycle_silence()
  expect_identical(mtcars %@% "names", attr(mtcars, "names"))
})
