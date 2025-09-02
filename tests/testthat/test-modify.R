# Input types, ordered by apperance

test_that("modifying vectors list preserves type", {
  x1 <- vctrs::list_of(c(1, 2), c(3, 6, 9))
  x2 <- vctrs::list_of(c(2, 3), c(4, 7, 10))
  expect_equal(modify(x1, ~ .x + 1), x2)
})

test_that("modfiying data.frame preserves type and size", {
  df1 <- data.frame(x = 1:2, y = 2:1)
  expect_equal(modify(df1, ~1), data.frame(x = c(1, 1), y = c(1, 1)))
  expect_equal(modify_at(df1, 1, ~1), data.frame(x = c(1, 1), y = 2:1))
  expect_equal(
    modify2(df1, df1, ~ .x + .y),
    data.frame(x = c(2, 4), y = c(4, 2))
  )

  df2 <- new_data_frame(n = 5L)
  expect_equal(modify(df2, ~1), df2)

  expect_snapshot(error = TRUE, {
    modify(df1, ~ integer())
    modify(df1, ~ 1:4)

    modify_at(df1, 2, ~ integer())
    modify2(df1, list(1, 1:3), ~.y)
  })
})

test_that("zap gives clear error", {
  expect_snapshot(error = TRUE, {
    modify_at(1, 1, ~ zap())
    modify_at(list(1), 1, ~ zap())
    modify_at(data.frame(x = 1), 1, ~ zap())
    modify_at(lm(mpg ~ wt, data = mtcars), 1, ~ zap())
  })
})

test_that("data.frames are modified by column, not row", {
  df1 <- data.frame(x = 1:3, y = letters[1:3])
  df2 <- data.frame(x = 2:4, y = letters[1:3])

  expect_equal(modify(df1, ~ if (is.numeric(.x)) .x + 1 else .x), df2)
  expect_equal(modify_at(df1, "x", ~ .x + 1), df2)
})

test_that("modifying vectors preserves type", {
  expect_identical(modify(1:3, ~ .x + 1), 2:4)
  expect_equal(modify("a", ~ factor("b")), "b")

  expect_identical(modify_if(1:2, ~ .x %% 2 == 0, ~3), c(1L, 3L))
  expect_identical(modify_at(1:2, 2, ~3), c(1L, 3L))
  expect_identical(modify2(1:2, c(0, 1), `+`), c(1L, 3L))
})

test_that("bad type has useful error", {
  expect_snapshot(error = TRUE, {
    modify(1:3, ~"foo")
    modify_at(1:3, 1, ~"foo")
    modify_if(1:3, is_integer, ~"foo")
    modify2(1:3, "foo", ~.y)
  })
})

test_that("modifying lists preserves NULLs", {
  l <- list(a = 1, b = NULL, c = 3)
  expect_equal(modify(l, identity), l)
  expect_equal(modify_at(l, "b", identity), l)
  expect_equal(modify_if(l, is.null, identity), l)
  expect_equal(
    modify2(l, list(NULL, 1, NULL), ~.y),
    list(a = NULL, b = 1, c = NULL)
  )
})

test_that("can modify non-vector lists", {
  notlist <- function(...) structure(list(...), class = "notlist")
  x <- notlist(x = 1, y = "a")

  expect_equal(modify(x, ~2), notlist(x = 2, y = 2))
  expect_equal(modify_if(x, is.character, ~2), notlist(x = 1, y = 2))
  expect_equal(modify_at(x, "y", ~2), notlist(x = 1, y = 2))

  local_bindings(
    "[.notlist" = function(...) structure(NextMethod(), class = "notlist"),
    .env = globalenv()
  )
  expect_equal(modify2(x, list(3, 4), ~.y), notlist(x = 3, y = 4))
  expect_equal(modify2(notlist(1), list(3, 4), ~.y), notlist(3, 4))
})

test_that("modifying data frame ignores [<- methods", {
  df <- function(...) structure(data_frame(...), class = c("df", "data.frame"))
  local_bindings(
    "[<-.df" = function(...) stop("Forbidden"),
    .env = globalenv()
  )

  x <- df(x = 1, y = "x")
  expect_equal(modify(x, ~2), df(x = 2, y = 2))
  expect_equal(modify_if(x, is.character, ~2), df(x = 1, y = 2))
  expect_equal(modify_at(x, "y", ~2), df(x = 1, y = 2))
  expect_equal(modify2(x, list(2, 3), ~.y), df(x = 2, y = 3))
})

# other properties --------------------------------------------------------

test_that("`.else` modifies false elements", {
  exp <- modify_if(iris, negate(is.factor), as.integer)
  exp <- modify_if(exp, is.factor, as.character)
  expect_identical(
    modify_if(iris, is.factor, as.character, .else = as.integer),
    exp
  )

  expect_equal(
    modify_if(c(TRUE, FALSE), ~.x, ~FALSE, .else = ~TRUE),
    c(FALSE, TRUE)
  )
  expect_equal(modify_if(1:2, ~ .x == 1, ~3L, .else = ~4L), c(3, 4))
  expect_equal(
    modify_if(c(1, 10), ~ .x < 5, ~ .x * 10, .else = ~ .x / 2),
    c(10, 5)
  )
  expect_equal(
    modify_if(c("a", "b"), ~ .x == "a", ~"A", .else = ~"B"),
    c("A", "B")
  )
})

test_that("modify_at() can use tidyselect", {
  skip_if_not_installed("tidyselect")
  local_options(lifecycle_verbosity = "quiet")

  df <- data.frame(x = 1, y = 3)
  expect_equal(
    modify_at(df, vars(x), ~2),
    data.frame(x = 2, y = 3)
  )
})

test_that("imodify uses index", {
  expect_equal(imodify(list(2), ~.y), list(1))
  expect_equal(imodify(list(a = 2), ~.y), list(a = "a"))
})

# input validation --------------------------------------------------------

test_that("modify2() recycles arguments", {
  expect_equal(modify2(1:3, 1L, `+`), c(2, 3, 4))
  expect_equal(modify2(1, 1:3, `+`), c(2, 3, 4))

  expect_snapshot(error = TRUE, {
    modify2(1:3, integer(), `+`)
    modify2(1:3, 1:4, `+`)
  })
})

test_that("modify_if() requires predicate functions", {
  expect_snapshot(error = TRUE, {
    modify_if(list(1, 2), ~NA, ~"foo")
  })
})

test_that("user friendly error for non-supported cases", {
  expect_snapshot(error = TRUE, {
    modify(mean, identity)
    modify_if(mean, TRUE, identity)
    modify_at(mean, "x", identity)
    modify2(mean, 1, identity)
  })
})
