context("rows")

df <- mtcars[1:3, c("wt", "qsec")]
df[[2]] <- as.character(df[[2]])

gen_alternatives <- function(first, alt) {
  prev_alt <- FALSE
  function(...) {
    if (prev_alt) {
      out <- first
    } else {
      out <- alt
    }
    prev_alt <<- !prev_alt
    out
  }
}

test_that("output column is named according to .to", {
  output1 <- mtcars %>% slice_rows("cyl") %>% by_slice(~ list(NULL), .to = "my_col", .labels = FALSE)
  expect_equal(names(output1), "my_col")

  output2 <- mtcars %>% by_row(~ list(NULL), .to = "my_col", .labels = FALSE)
  expect_equal(names(output2), "my_col")

  output3 <- mtcars %>% map_rows(function(...) list(3), .collate = "list", .to = "my_col", .labels = FALSE)
  expect_equal(names(output3), "my_col")
})

test_that("empty", {
  empty <- function(...) numeric(0)
  rows_collation <- map_rows(mtcars[1:2], empty, .collate = "rows")
  cols_collation <- map_rows(mtcars[1:2], empty, .collate = "cols")
  list_collation <- map_rows(mtcars[1:2], empty, .collate = "list")

  expect_equal(rows_collation$.out, numeric(0))
  expect_equal(cols_collation$.out, numeric(0))
  expect_equal(list_collation$.out, rerun(32, numeric(0)))

  expect_equal(dim(rows_collation), c(0, 3))
  expect_equal(dim(cols_collation), c(0, 3))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("all nulls", {
  all_nulls <- function(...) NULL
  rows_collation <- map_rows(mtcars[1:2], all_nulls, .collate = "rows")
  cols_collation <- map_rows(mtcars[1:2], all_nulls, .collate = "cols")
  list_collation <- map_rows(mtcars[1:2], all_nulls, .collate = "list")

  expect_equal(rows_collation$.out, NULL)
  expect_equal(cols_collation$.out, NULL)
  expect_equal(list_collation$.out, vector("list", 32))

  expect_equal(dim(rows_collation), c(0, 3))
  expect_equal(dim(cols_collation), c(0, 3))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("scalars", {
  scalars <- function(...) paste("a", ..1)
  rows_collation <- map_rows(mtcars[1:2], scalars, .collate = "rows")
  cols_collation <- map_rows(mtcars[1:2], scalars, .collate = "cols")
  list_collation <- map_rows(mtcars[1:2], scalars, .collate = "list")

  out <- paste("a", mtcars$mpg)

  expect_equal(rows_collation$.out, out)
  expect_equal(cols_collation$.out, out)
  expect_equal(list_collation$.out, as.list(out))

  expect_equal(dim(rows_collation), c(32, 3))
  expect_equal(dim(cols_collation), c(32, 3))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("scalars with some nulls", {
  scalar_nulls <- gen_alternatives(1L, NULL)
  rows_collation <- map_rows(mtcars[1:2], scalar_nulls, .collate = "rows")
  cols_collation <- map_rows(mtcars[1:2], scalar_nulls, .collate = "cols")
  list_collation <- map_rows(mtcars[1:2], scalar_nulls, .collate = "list")

  expect_equal(rows_collation$.out, rep(1, 16))
  expect_equal(cols_collation$.out, rep(1, 16))
  expect_equal(list_collation$.out, rep(list(NULL, 1L), 16))

  expect_equal(dim(rows_collation), c(16, 3))
  expect_equal(dim(cols_collation), c(16, 3))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("vectors", {
  vectors <- function(...) paste(letters[1:2], c(...))
  rows_collation <- map_rows(mtcars[1:2], vectors, .collate = "rows")
  cols_collation <- map_rows(mtcars[1:2], vectors, .collate = "cols")
  list_collation <- map_rows(mtcars[1:2], vectors, .collate = "list")

  data <- dplyr::rowwise(mtcars[1:2])
  out <- dplyr::do(data, .out = paste(c("a", "b"), c(.$mpg, .$cyl)))[[1]]

  expect_equal(rows_collation$.row, rep(1:32, each = 2))
  expect_equal(rows_collation$.out, unlist(out))

  expect_equal(cols_collation$.out1, paste("a", mtcars$mpg))
  expect_equal(cols_collation$.out2, paste("b", mtcars$cyl))
  expect_equal(list_collation$.out, out)

  expect_equal(dim(rows_collation), c(64, 4))
  expect_equal(dim(cols_collation), c(32, 4))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("data frames", {
  dataframes <- function(...) df
  rows_collation <- map_rows(mtcars[1:2], dataframes, .collate = "rows")
  cols_collation <- map_rows(mtcars[1:2], dataframes, .collate = "cols")
  list_collation <- map_rows(mtcars[1:2], dataframes, .collate = "list")

  expect_equal(rows_collation$.row, rep(1:32, each = 3))
  expect_equal(rows_collation[4:5], dplyr::bind_rows(rerun(32, df)))
  expect_equal(cols_collation[[3]], rep(df[[1]][1], 32))
  expect_equal(cols_collation[[8]], rep(df[[2]][3], 32))
  expect_equal(list_collation$.out, rerun(32, df))

  expect_equal(dim(rows_collation), c(96, 5))
  expect_equal(dim(cols_collation), c(32, 8))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("data frames with some nulls", {
  dataframes_nulls <- gen_alternatives(df, NULL)
  rows_collation <- map_rows(mtcars[1:2], dataframes_nulls, .collate = "rows")
  cols_collation <- map_rows(mtcars[1:2], dataframes_nulls, .collate = "cols")
  list_collation <- map_rows(mtcars[1:2], dataframes_nulls, .collate = "list")

  expect_equal(rows_collation[4:5], dplyr::bind_rows(rerun(16, df)))
  expect_equal(list_collation$.out, rep(list(NULL, df), 16))

  expect_equal(dim(rows_collation), c(48, 5))
  expect_equal(dim(cols_collation), c(16, 8))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("objects", {
  objects <- function(...) function() {}
  list_collation <- map_rows(mtcars[1:2], objects, .collate = "list")

  expect_equal(list_collation$.out, rep(list(function() {}), 32))
  expect_equal(dim(list_collation), c(32, 3))

  expect_error(map_rows(mtcars[1:2], objects, .collate = "rows"))
  expect_error(map_rows(mtcars[1:2], objects, .collate = "cols"))
})

test_that("collation of ragged objects on cols fails", {
  ragged_dataframes <- gen_alternatives(df, rbind(df, df))
  ragged_vectors <- gen_alternatives(letters[1:2], rep(letters[1:2], 2))
  expect_error(map_rows(mtcars[1:2], ragged_dataframes, .collate = "cols"))
  expect_error(map_rows(mtcars[1:2], ragged_vectors, .collate = "cols"))
})

test_that("by_slice() does not create .row column", {
  data <- slice_rows(mtcars[1:2], "cyl")

  rows_vectors <- by_slice(data, function(x) 1:3, .collate = "rows")
  expect_equal(dim(rows_vectors), c(9, 2))
  expect_equal(names(rows_vectors), c("cyl", ".out"))

  rows_dfs <- by_slice(data, function(x) df, .collate = "rows")
  expect_equal(dim(rows_dfs), c(9, 3))
  expect_equal(names(rows_dfs), c("cyl", "wt", "qsec"))
})

test_that("by_slice() fails with ungrouped data frames", {
  expect_error(by_slice(mtcars, list))
})
