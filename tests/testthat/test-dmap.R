context("dmap")

test_that("dmap() returns a data frame", {
  expect_is(dmap(mtcars, mean), "data.frame")
})

test_that("dmap() works with sliced data frames", {
  df <- slice_rows(mtcars, "cyl")
  actual <- dmap(df, mean)
  expected <- by_slice(df, dmap, mean, .collate = "rows")
  expect_equal(actual, expected)
})

test_that("dmap() works with no columns to map", {
  res <- mtcars["cyl"] %>% slice_rows("cyl") %>% dmap(mean)
  expect_equal(res, mtcars["cyl"])
})

test_that("dmap() recycles only vectors of length 1", {
  expect_equal(dmap_at(mtcars, "cyl", mean)$cyl, rep(mean(mtcars$cyl), nrow(mtcars)))
  expect_error(dmap_at(mtcars, c("cyl", "am"), ~1:2), "only recycles")
})

test_that("conditional sliced mapping recycles within groups", {
  df <- mtcars %>% slice_rows(c("vs", "am"))
  expected_df <- by_slice(df, dmap, mean, .collate = "rows")

  res_at <- dmap_at(df, c("disp", "drat"), mean)
  res_if <- dmap_if(df, ~ .x[[1]] == 160, mean)

  expected <- map2(expected_df$disp, attr(df, "group_sizes"), rep) %>% flatten_dbl()
  expect_equal(res_at$disp, expected)
  expect_equal(res_if$disp, expected)
})
