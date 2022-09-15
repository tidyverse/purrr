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

test_that("negative .at omits locations", {
  x <- list(1, 2, 3)
  out <- modify_at(x, -1, ~ .x * 2)
  expect_equal(out, list(1, 4, 6))
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
  expect_snapshot(error = TRUE, {
    modify(1:3, ~ "foo")
    modify_at(1:3, 1, ~ "foo")
    modify_if(1:3, is_integer, ~ "foo")
    modify2(1:3, "foo", ~ .y)
  })
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
  expect_snapshot(modify_if(list(1, 2), ~ NA, ~ "foo"), error = TRUE)
  expect_snapshot(modify_if(1:2, ~ c(TRUE, FALSE), ~ "foo"), error = TRUE)
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

test_that("modify_at() can use tidyselect", {
  skip_if_not_installed("tidyselect")
  local_options(lifecycle_verbosity = "quiet")

  one <-  modify_at(mtcars, vars(cyl, am), as.character)
  expect_bare(one$cyl, "character")
  expect_bare(one$am, "character")
  two <- modify_at(mtcars, vars(tidyselect::contains("cyl")), as.character)
  expect_bare(two$cyl, "character")
})

test_that("can still modify non-vector lists", {
  notlist <- function(...) structure(list(...), class = "notlist")
  x <- notlist(x = 1, y = "a")

  expect_equal(modify(x, ~ 2), notlist(x = 2, y = 2))
  expect_equal(modify_if(x, is.character, ~ 2), notlist(x = 1, y = 2))
  expect_equal(modify_at(x, "y", ~ 2), notlist(x = 1, y = 2))

  local_bindings(
    "[.notlist" = function(...) structure(NextMethod(), class = "notlist"),
    .env = globalenv()
  )
  expect_equal(modify2(x, list(3, 4), ~ .y), notlist(x = 3, y = 4))
  expect_equal(modify2(notlist(1), list(3, 4), ~ .y), notlist(3, 4))
})
