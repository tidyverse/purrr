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

test_that("modify_depth modifies values at specified depth", {
  x1 <- list(list(list(1)))
  x2 <- list(list(list(2)))

  expect_equal(modify_depth(x1, 3, ~ . + 1), x2)
})
