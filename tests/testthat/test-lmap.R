context("lmap")

test_that("lmap output is list if input is list", {
  expect_is(lmap(as.list(mtcars), as.list), "list")
})

test_that("lmap output is tibble if input is data frame", {
  expect_is(lmap(mtcars, as.list), "tbl_df")
})
