context("rows")

test_that("ungrouped data frames are handled", {
  out <- mtcars %>% by_slice(list)
  expect_equal(out, list(mtcars))
})

test_that("zero-length outputs are handled", {
  out1 <- mtcars %>% slice_rows("cyl") %>% by_slice(function (...) list())
  out2 <- mtcars %>% slice_rows("cyl") %>% by_slice(function (...) NULL)
  expect_equal(out1$.out, rep(list(list()), 3))
  expect_equal(out2$.out, vector("list", 3))
})

test_that("by_slice() does not replicate trace rows with list-column output", {
  out1 <- mtcars %>% slice_rows("cyl") %>% by_slice(list)
  out2 <- mtcars %>% slice_rows("cyl") %>% by_slice(~ list(.x, .x))
  expect_equal(nrow(out1), 3)
  expect_equal(nrow(out2), 3)
})

test_that("rowwise mapping works with outputs of length > 1", {
  f <- function(...) letters[1:3]

  index <- rep(seq_len(nrow(mtcars)), each = 3)
  out1 <- map_rows(mtcars, f)
  out2 <- by_row(mtcars, f)

  expect_equal(out1$.row, index)
  expect_equal(out2$.row, index)
})

test_that("output column is named according to .to", {
  output1 <- mtcars %>%
    slice_rows("cyl") %>%
    by_slice(~ list(NULL), .to = "my_col", .labels = FALSE)
  expect_equal(names(output1), "my_col")

  output2 <- mtcars %>%
    by_row(~ list(NULL), .to = "my_col", .labels = FALSE)
  expect_equal(names(output2), "my_col")

  output3 <- mtcars %>%
    map_rows(function(...) list(3), .to = "my_col", .labels = FALSE)
  expect_equal(names(output3), "my_col")
})
