context("rows")

df <- mtcars[1:3, c("wt", "qsec")]
df[[2]] <- as.character(df[[2]])
grouped <- slice_rows(mtcars[1:2], "cyl")

gen_alternatives <- function(first, alt) {
  prev_alt <- TRUE
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
  output2 <- mtcars %>% by_row(~ list(NULL), .to = "my_col", .labels = FALSE)
  output3 <- mtcars %>% invoke_rows(.f = function(...) list(NULL), .collate = "list", .to = "my_col", .labels = FALSE)

  expect_equal(names(output1), "my_col")
  expect_equal(names(output2), "my_col")
  expect_equal(names(output3), "my_col")
})

test_that("empty", {
  empty <- function(...) numeric(0)
  rows_collation <- invoke_rows(empty, mtcars[1:2], .collate = "rows")
  cols_collation <- invoke_rows(empty, mtcars[1:2], .collate = "cols")
  list_collation <- invoke_rows(empty, mtcars[1:2], .collate = "list")

  expect_equal(rows_collation$.out, numeric(0))
  expect_equal(cols_collation$.out, numeric(0))
  expect_equal(list_collation$.out, rerun(32, numeric(0)))

  expect_equal(dim(rows_collation), c(0, 3))
  expect_equal(dim(cols_collation), c(0, 3))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("all nulls fail, except with list-collation", {
  all_nulls <- function(...) NULL

  expect_error(invoke_rows(all_nulls, mtcars[1:2], .collate = "rows"))
  expect_error(invoke_rows(all_nulls, mtcars[1:2], .collate = "cols"))

  list_collation <- invoke_rows(all_nulls, mtcars[1:2], .collate = "list")
  expect_equal(list_collation$.out, vector("list", 32))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("scalars", {
  scalars <- function(...) paste("a", ..1)
  rows_collation <- invoke_rows(scalars, mtcars[1:2], .collate = "rows")
  cols_collation <- invoke_rows(scalars, mtcars[1:2], .collate = "cols")
  list_collation <- invoke_rows(scalars, mtcars[1:2], .collate = "list")

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
  rows_collation <- invoke_rows(scalar_nulls, mtcars[1:2], .collate = "rows")
  cols_collation <- invoke_rows(scalar_nulls, mtcars[1:2], .collate = "cols")
  list_collation <- invoke_rows(scalar_nulls, mtcars[1:2], .collate = "list")

  expect_equal(rows_collation$.out, rep(1, 16))
  expect_equal(cols_collation$.out, rep(1, 16))
  expect_equal(list_collation$.out, rep(list(1L, NULL), 16))

  expect_equal(dim(rows_collation), c(16, 3))
  expect_equal(dim(cols_collation), c(16, 3))
  expect_equal(dim(list_collation), c(32, 3))

  # Make sure properties are well inferred when first result is NULL
  scalar_first_nulls <- gen_alternatives(NULL, 1L)
  rows_collation <- invoke_rows(scalar_first_nulls, mtcars[1:2], .collate = "rows")
  expect_equal(rows_collation$.out, rep(1, 16))
})

test_that("labels are correctly subsetted", {
  scalar_first_nulls <- gen_alternatives(NULL, 1L)
  rows_collation <- invoke_rows(scalar_first_nulls, mtcars[1:2], .collate = "rows")
  expect_equal(rows_collation[1:2], mtcars[seq(2, 32, 2), 1:2])
})

test_that("vectors", {
  vectors <- function(...) paste(letters[1:2], c(...))
  rows_collation <- invoke_rows(vectors, mtcars[1:2], .collate = "rows")
  cols_collation <- invoke_rows(vectors, mtcars[1:2], .collate = "cols")
  list_collation <- invoke_rows(vectors, mtcars[1:2], .collate = "list")

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
  rows_collation <- invoke_rows(dataframes, mtcars[1:2], .collate = "rows")
  cols_collation <- invoke_rows(dataframes, mtcars[1:2], .collate = "cols")
  list_collation <- invoke_rows(dataframes, mtcars[1:2], .collate = "list")

  expect_equal(rows_collation$.row, rep(1:32, each = 3))
  expect_equal(rows_collation[4:5], dplyr::bind_rows(rerun(32, df)))
  expect_equal(cols_collation[[3]], rep(df[[1]][1], 32))
  expect_equal(cols_collation[[8]], rep(df[[2]][3], 32))
  expect_equal(list_collation$.out, rerun(32, df))

  expect_equal(dim(rows_collation), c(96, 5))
  expect_equal(dim(cols_collation), c(32, 8))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("data frames with some nulls/empty", {
  dataframes_nulls <- gen_alternatives(df, NULL)
  rows_collation <- invoke_rows(dataframes_nulls, mtcars[1:2], .collate = "rows")
  cols_collation <- invoke_rows(dataframes_nulls, mtcars[1:2], .collate = "cols")
  list_collation <- invoke_rows(dataframes_nulls, mtcars[1:2], .collate = "list")

  expect_equal(rows_collation[4:5], dplyr::bind_rows(rerun(16, df)))
  expect_equal(list_collation$.out, rep(list(df, NULL), 16))

  expect_equal(dim(rows_collation), c(48, 5))
  expect_equal(dim(cols_collation), c(16, 8))
  expect_equal(dim(list_collation), c(32, 3))
})

test_that("empty data frames", {
  empty_dataframes <- function(...) df[0, ]
  rows_collation_by_row <- invoke_rows(empty_dataframes, mtcars[1:2], .collate = "rows")
  rows_collation_by_slice <- by_slice(grouped, empty_dataframes, .collate = "rows")

  expect_equal(rows_collation_by_row[4:5], dplyr::tbl_df(df[0, ]))
  expect_equal(rows_collation_by_slice[2:3], dplyr::tbl_df(df[0, ]))

  expect_equal(dim(rows_collation_by_row), c(0, 5))
  expect_equal(dim(rows_collation_by_slice), c(0, 3))
})

test_that("some empty data frames", {
  some_empty_dataframes <- gen_alternatives(df, df[0, ])
  rows_collation_by_row <- invoke_rows(some_empty_dataframes, mtcars[1:2], .collate = "rows")
  rows_collation_by_slice <- by_slice(grouped, some_empty_dataframes, .collate = "rows")

  expect_equal(rows_collation_by_row[4:5], dplyr::bind_rows(rerun(16, df)))
  expect_equal(rows_collation_by_slice[2:3], dplyr::bind_rows(rerun(2, df)))

  expect_equal(dim(rows_collation_by_row), c(48, 5))
  expect_equal(dim(rows_collation_by_slice), c(6, 3))
})

test_that("unconsistent data frames fail", {
  unconsistent_names <- gen_alternatives(df, set_names(df, 1:2))
  unconsistent_types <- gen_alternatives(df, map(df, as.character))

  expect_error(invoke_rows(unconsistent_names, mtcars[1:2], .collate = "rows"), "consistent names")
  expect_error(invoke_rows(unconsistent_types, mtcars[1:2], .collate = "rows"), "must return either data frames or vectors")
})

test_that("objects", {
  objects <- function(...) function() {}
  list_collation <- invoke_rows(objects, mtcars[1:2], .collate = "list")

  expect_equal(list_collation$.out, rep(list(function() {}), 32))
  expect_equal(dim(list_collation), c(32, 3))

  expect_error(invoke_rows(objects, mtcars[1:2], .collate = "rows"))
  expect_error(invoke_rows(objects, mtcars[1:2], .collate = "cols"))
})

test_that("collation of ragged objects on cols fails", {
  ragged_dataframes <- gen_alternatives(df, rbind(df, df))
  ragged_vectors <- gen_alternatives(letters[1:2], rep(letters[1:2], 2))
  expect_error(invoke_rows(ragged_dataframes, mtcars[1:2], .collate = "cols"))
  expect_error(invoke_rows(ragged_vectors, mtcars[1:2], .collate = "cols"))
})

test_that("by_slice() works with slicers of different types", {
  df1 <- slice_rows(mtcars, "cyl")
  df2 <- dmap_at(mtcars, "cyl", as.character) %>% slice_rows("cyl")
  out1 <- by_slice(df1, map, mean)
  out2 <- by_slice(df2, map, mean)
  expect_identical(out1[-1], out2[-1])
  expect_equal(typeof(out1$cyl), "double")
  expect_equal(typeof(out2$cyl), "character")
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

test_that("by_row() creates indices with c++ style indexing", {
  out <- mtcars[1:5, 1:2] %>% by_row(~ .$cyl[1])
  expect_equal(out$.out[[5]], 8)
})

test_that("error is thrown when no columns to map", {
  expect_error(mtcars["cyl"] %>% slice_rows("cyl") %>% by_slice(list), "empty")
  expect_error(dplyr::data_frame() %>% invoke_rows(.f = c), "empty")
  expect_error(dplyr::data_frame() %>% by_row(c), "empty")
})
