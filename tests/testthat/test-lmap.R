context("lmap")

test_that("lmap output is list if input is list", {
  expect_is(lmap(as.list(mtcars), as.list), "list")
})

test_that("lmap output is tibble if input is data frame", {
  expect_is(lmap(mtcars, as.list), "tbl_df")
})

test_that("lmap_if_else() preserve-maps true and false elements", {
  out <- lmap_if_else(list(a = 1, b = "foo"), is.character, ~ list("foo", .x, .y), ~ list("bar", .x, .y), "baz")
  exp <- set_names(list("bar", list(a = 1), "baz", "foo", list(b = "foo"), "baz"), rep("", 6))
  expect_identical(out, exp)
})
