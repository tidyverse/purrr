# where_at ------------------------------------------------------------

test_that("allows valid logical, numeric, and character vectors", {
  x <- list(a = 1, b = 1, c = 1)
  expect_equal(where_at(x, TRUE), c(TRUE, TRUE, TRUE))
  expect_equal(where_at(x, 1), c(TRUE, FALSE, FALSE))
  expect_equal(where_at(x, -2), c(TRUE, FALSE, TRUE))
  expect_equal(where_at(x, "b"), c(FALSE, TRUE, FALSE))
})

test_that("errors on invalid subsetting vectors", {
  x <- list(a = 1, b = 1, c = 1)
  expect_snapshot(error = TRUE, {
    where_at(x, c(FALSE, TRUE))
    where_at(x, NA_real_)
    where_at(x, 4)
  })
})

test_that("function at is passed names", {
  x <- list(a = 1, B = 1, c = 1)
  expect_equal(where_at(x, ~ .x %in% LETTERS), c(FALSE, TRUE, FALSE))
  expect_equal(where_at(x, ~ intersect(.x, LETTERS)), c(FALSE, TRUE, FALSE))
})

test_that("where_at works with unnamed input", {
  x <- list(1, 1, 1)
  expect_equal(where_at(x, letters), rep(FALSE, 3))
  expect_equal(where_at(x, ~ intersect(.x, LETTERS)), rep(FALSE, 3))
})

test_that("validates its inputs", {
  x <- list(a = 1, b = 1, c = 1)
  expect_snapshot(where_at(x, list()), error = TRUE)
})

test_that("tidyselect `at` is deprecated", {
  skip_if_not_installed("tidyselect")
  expect_snapshot({
    . <- where_at(data.frame(x = 1), vars("x"), user_env = globalenv())
  })
})


# vctrs compat ------------------------------------------------------------

test_that("arrays become vectors (#970)", {
  x <- matrix(1:4, nrow = 2)
  expect_equal(vctrs_vec_compat(x, globalenv()), 1:4)

  f <- factor(letters[1:4])
  dim(f) <- c(2, 2, 1)
  expect_equal(vctrs_vec_compat(f, globalenv()), factor(letters[1:4]))
})

test_that("pairlists, expressions, and calls are deprecated", {
  expect_snapshot(x <- vctrs_vec_compat(expression(1, 2), globalenv()))
  expect_equal(x, list(1, 2))

  expect_snapshot(x <- vctrs_vec_compat(pairlist(1, 2), globalenv()))
  expect_equal(x, list(1, 2))

  expect_snapshot(x <- vctrs_vec_compat(quote(f(a, b = 1)), globalenv()))
  expect_equal(x, list(quote(f), quote(a), b = 1))
})

test_that("can work with S4 vector objects", {
  foo <- methods::setClass("foo1", contains = "list", where = current_env())
  on.exit(methods::removeClass("foo1", where = current_env()), add = TRUE)

  x1 <- foo(list(1, 2, 3))
  expect_equal(map(x1, identity), list(1, 2, 3))

  x2 <- foo(list(x = 1, y = 2, z = 3))
  expect_equal(map(x2, identity), list(x = 1, y = 2, z = 3))
})

test_that("preserves names of 1d arrays", {
  v <- array(list(1, 2), dim = 2, dimnames = list(c("a", "b")))
  expect_equal(map_dbl(v, identity), c(a = 1, b = 2))
})

test_that("can work with output of by", {
  df <- data.frame(x = 1:2)

  # 1d keeps names
  x <- by(df, c("a", "b"), function(df) df$x)
  expect_equal(map_dbl(x, identity), c(a = 1, b = 2))

  x <- by(df, c("a", "b"), function(df) df$x, simplify = FALSE)
  expect_equal(map_dbl(x, identity), c(a = 1, b = 2))

  # 2d loses names
  x <- by(df, list(c("a", "b"), c("a", "b")), function(df) df$x)
  expect_equal(map_dbl(x, identity), c(1, NA, NA, 2))

  x <- by(
    df,
    list(c("a", "b"), c("a", "b")),
    function(df) df$x,
    simplify = FALSE
  )
  expect_equal(map(x, identity), list(1, NULL, NULL, 2))
})

test_that("can work with lubridate periods", {
  skip_if_not_installed("lubridate")
  days <- lubridate::days(1:2)

  expect_equal(
    map(days, identity),
    list(lubridate::days(1), lubridate::days(2))
  )
})

test_that("can't work with regular S4 objects", {
  foo <- methods::setClass(
    "foo",
    slots = list(a = "integer"),
    where = global_env()
  )
  on.exit(methods::removeClass("foo", where = global_env()), add = TRUE)

  expect_snapshot(map(foo(), identity), error = TRUE)
})
