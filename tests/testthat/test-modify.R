context("modify")

test_that("modify returns same type as input", {
  df1 <- data.frame(x = 1:3, y = 4:6)
  expect_equal(modify(df1, length), data.frame(x = rep(3, 3), y = rep(3, 3)))
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
  df1 <- data.frame(x = "a", y = 2, stringsAsFactors = FALSE)
  expect_error(modify_at(unname(df1), "x", toupper))
})

test_that("modify_at operates on character and numeric indexing", {
  df1 <- data.frame(x = "a", y = 2, stringsAsFactors = FALSE)
  expect_error(modify_at(df1, TRUE, toupper))
})


# modify_depth ------------------------------------------------------------

test_that("modify_depth modifies values at specified depth", {
  x1 <- list(list(list(1)))

  expect_equal(modify_depth(x1, 0, length), list(1))
  expect_equal(modify_depth(x1, 1, length), list(1))
  expect_equal(modify_depth(x1, 2, length), list(list(1)))
  expect_equal(modify_depth(x1, 3, length), list(list(list(1))))
  expect_equal(modify_depth(x1, -1, length), list(list(list(1))))
  expect_error(modify_depth(x1, 4, length), "List not deep enough")
  expect_error(modify_depth(x1, -5, length), "Invalid `depth`")
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
})
