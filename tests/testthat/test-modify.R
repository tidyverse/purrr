test_that("modify returns same type as input", {
  df1 <- data.frame(x = 1:3, y = 4:6)
  df2 <- data.frame(x = 2:4, y = 5:7)
  expect_equal(modify(df1, ~ .x + 1), df2)

  x1 <- vctrs::list_of(c(1, 2), c(3, 6, 9))
  x2 <- vctrs::list_of(c(2, 3), c(4, 7, 10))
  expect_equal(modify(x1, ~ .x + 1), x2)
})

test_that("modify_if/modify_at return same type as input", {
  df1 <- data.frame(x = "a", y = 2, stringsAsFactors = FALSE)
  exp <- data.frame(x = "A", y = 2, stringsAsFactors = FALSE)

  df2a <- modify_if(df1, is.character, toupper)
  expect_equal(df2a, exp)

  df2b <- modify_at(df1, "x", toupper)
  expect_equal(df2b, exp)
})

test_that("modify_at requires a named object", {
  expect_snapshot(modify_at(list(), "x", toupper), error = TRUE)
})

test_that("negative .at omits locations", {
  x <- list(1, 2, 3)
  out <- modify_at(x, -1, ~ .x * 2)
  expect_equal(out, list(1, 4, 6))
})

test_that("modify works with calls and pairlists", {
  out <- modify(quote(f(x)), ~ quote(z))
  expect_equal(out, quote(z(z)))

  out <- modify(pairlist(1, 2), ~ . + 1)
  expect_equal(out, pairlist(2, 3))
})

test_that("modify{,_at,_if} preserves atomic vector classes", {
  expect_type(modify("a", identity), "character")
  expect_type(modify(1L,  identity), "integer")
  expect_type(modify(1,   identity), "double")
  expect_type(modify(TRUE, identity), "logical")

  expect_type(modify_at("a",   1L, identity), "character")
  expect_type(modify_at(1L,    1L, identity), "integer")
  expect_type(modify_at(1,     1L, identity), "double")
  expect_type(modify_at(TRUE,  1L, identity), "logical")

  expect_type(modify_if("a",   TRUE, identity), "character")
  expect_type(modify_if(1L,    TRUE, identity), "integer")
  expect_type(modify_if(1,     TRUE, identity), "double")
  expect_type(modify_if(TRUE,  TRUE, identity), "logical")
})

test_that("modify() and variants implement sane coercion rules for base vectors", {
  expect_error(modify(1:3, ~ "foo"), "Can't coerce")
  expect_error(modify_at(1:3, 1, ~ "foo"), "Can't coerce")
  expect_error(modify_if(1:3, is_integer, ~ "foo"), "Can't coerce")
  expect_error(modify2(1:3, "foo", ~ .y), "Can't coerce")
})

test_that("modify2() and imodify() preserve type of first input", {
  x <- c(foo = 1L, bar = 2L)
  y <- c(TRUE, FALSE)
  expect_identical(modify2(x, y, ~ if (.y) .x else 0L), c(foo = 1L, bar = 0L))

  out <- imodify(mtcars, paste)
  expect_s3_class(out, "data.frame")
  expect_identical(out$vs, paste(mtcars$vs, "vs"))
})

test_that("modify2() recycles arguments", {
  expect_identical(modify2(1:3, 1L, `+`), int(2, 3, 4))
  expect_identical(modify2(1, 1:3, `+`), dbl(2, 3, 4))
  expect_identical(modify2(mtcars, seq_along(mtcars), `+`)$carb, mtcars$carb + ncol(mtcars))
  expect_identical(modify2(mtcars, 1, `+`)$carb, mtcars$carb + 1L)
})

test_that("modify_if() requires predicate functions", {
  expect_error(modify_if(list(1, 2), ~ NA, ~ "foo"), ", not a missing value")
  expect_error(modify_if(1:2, ~ c(TRUE, FALSE), ~ "foo"), ", not a logical vector of length 2")
})

test_that("`.else` modifies false elements", {
  exp <- modify_if(iris, negate(is.factor), as.integer)
  exp <- modify_if(exp, is.factor, as.character)
  expect_identical(modify_if(iris, is.factor, as.character, .else = as.integer), exp)

  expect_equal(modify_if(c(TRUE, FALSE), ~ .x, ~ FALSE, .else = ~ TRUE), c(FALSE, TRUE))
  expect_equal(modify_if(1:2, ~ .x == 1, ~ 3L, .else = ~ 4L), c(3, 4))
  expect_equal(modify_if(c(1, 10), ~ .x < 5, ~ .x * 10, .else = ~ .x / 2), c(10, 5))
  expect_equal(modify_if(c("a", "b"), ~ .x == "a", ~ "A", .else = ~ "B"), c("A", "B"))
})

test_that("modify family preserves NULLs", {
  l <- list(a = 1, b = NULL, c = 3)
  expect_equal(modify(l, identity), l)
  expect_equal(modify_at(l, "b", identity), l)
  expect_equal(modify_if(l, is.null, identity), l)
  expect_equal(
    modify(l, ~ if (!is.null(.x)) .x + .y, 10),
    list(a = 11, b = NULL, c = 13)
  )
  expect_equal(
    modify_if(list(1, 2), ~ .x == 2, ~NULL),
    list(1, NULL)
  )
})


# modify_depth ------------------------------------------------------------

test_that("modify_depth modifies values at specified depth", {
  x1 <- list(list(list(1:3, 4:6)))

  expect_equal(modify_depth(x1, 0, length), list(1))
  expect_equal(modify_depth(x1, 1, length), list(1))
  expect_equal(modify_depth(x1, 2, length), list(list(2)))
  expect_equal(modify_depth(x1, 3, length), list(list(list(3, 3))))
  expect_equal(modify_depth(x1, -1, length), list(list(list(3, 3))))
  expect_equal(modify_depth(x1, 4, length), list(list(list(c(1, 1, 1), c(1, 1, 1)))))
  expect_error(modify_depth(x1, 5, length), "List not deep enough")
  expect_error(modify_depth(x1, 6, length), "List not deep enough")
  expect_error(modify_depth(x1, -5, length), "Invalid depth")
})

test_that(".ragged = TRUE operates on leaves", {
  x1 <- list(
    list(1),
    list(list(2))
  )
  x2 <- list(
    list(2),
    list(list(3))
  )

  expect_equal(modify_depth(x1, 3, ~ . + 1, .ragged = TRUE), x2)
  expect_equal(modify_depth(x1, -1, ~ . + 1, .ragged = TRUE), x2)
  # .ragged should be TRUE is .depth < 0
  expect_equal(modify_depth(x1, -1, ~ . + 1), x2)
})

test_that("vectorised operations on the recursive and atomic levels yield same results", {
  x <- list(list(list(1:3, 4:6)))
  exp <- list(list(list(11:13, 14:16)))
  expect_identical(modify_depth(x, 3, `+`, 10L), exp)
  expect_identical(modify_depth(x, 4, `+`, 10L), exp)
  expect_error(modify_depth(x, 5, `+`, 10L), "not deep enough")
})

test_that("modify_at() can use tidyselect", {
  skip_if_not_installed("tidyselect")
  local_options(lifecycle_verbosity = "quiet")

  one <-  modify_at(mtcars, vars(cyl, am), as.character)
  expect_bare(one$cyl, "character")
  expect_bare(one$am, "character")
  two <- modify_at(mtcars, vars(tidyselect::contains("cyl")), as.character)
  expect_bare(two$cyl, "character")
})

test_that("modify_depth() treats NULLs correctly", {
  ll <- list(a = NULL, b = list(b1 = NULL, b2 = "hello"))
  expect_equal(modify_depth(ll, .depth = 2, identity, .ragged = TRUE), ll)
  expect_equal(
    modify_depth(ll, .depth = 2, is.character, .ragged = TRUE),
    list(a = NULL, b = list(b1 = FALSE, b2 = TRUE))
  )
})
