context("map_if/map_at")

test_that("map_if/map_at preserve input class", {
  df1 <- data.frame(x = "a", y = 2, stringsAsFactors = FALSE)
  exp <- data.frame(x = "A", y = 2, stringsAsFactors = FALSE)

  df2a <- map_if(df1, is.character, toupper)
  expect_equal(df2a, exp)

  df2b <- map_at(df1, "x", toupper)
  expect_equal(df2b, exp)
})
