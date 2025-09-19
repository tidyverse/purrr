test_that("splitting by chunk size works", {
  expect_equal(list_split(1:6, n = 2), list(1:2, 3:4, 5:6))
  expect_equal(list_split(1:10, n = 3), list(1:3, 4:6, 7:9, 10L))
  expect_equal(list_split(letters[1:4], n = 2), list(c("a", "b"), c("c", "d")))
})

test_that("splitting by groups works", {
  expect_equal(
    list_split(1:6, groups = c(1, 1, 2, 2, 3, 3)),
    list("1" = c(1L, 2L), "2" = c(3L, 4L), "3" = c(5L, 6L))
  )
  expect_equal(
    list_split(letters[1:4], groups = c("x", "y", "x", "y")),
    list("x" = c("a", "c"), "y" = c("b", "d"))
  )
})

test_that("splitting lists preserves structure", {
  x <- list(a = 1, b = 2, c = 3, d = 4)
  result <- list_split(x, n = 2)
  expect_equal(result, list(list(a = 1, b = 2), list(c = 3, d = 4)))
  expect_true(is.list(result[[1]]))
  expect_true(is.list(result[[2]]))
})

test_that("empty inputs work", {
  expect_equal(list_split(integer(), n = 2), list())
  expect_equal(list_split(list(), n = 1), list())
  expect_equal(list_split(integer(), groups = integer()), list())
})

test_that("single element inputs work", {
  expect_equal(list_split(1L, n = 1), list(1L))
  expect_equal(list_split(list(x = 1), n = 1), list(list(x = 1)))
  expect_equal(list_split(5L, groups = "a"), list("a" = 5L))
})

test_that("n validation works", {
  expect_snapshot(list_split(1:5, n = 0), error = TRUE)
  expect_snapshot(list_split(1:5, n = -1), error = TRUE)
  expect_snapshot(list_split(1:5, n = 2.5), error = TRUE)
  expect_snapshot(list_split(1:5, n = c(1, 2)), error = TRUE)
  expect_snapshot(list_split(1:5, n = NA), error = TRUE)
})

test_that("groups validation works", {
  expect_snapshot(list_split(1:5, groups = 1:3), error = TRUE)
  expect_snapshot(list_split(1:5, groups = character()), error = TRUE)
})

test_that("parameter validation works", {
  expect_snapshot(list_split(1:5), error = TRUE)
  expect_snapshot(
    list_split(1:5, n = 2, groups = c(1, 1, 2, 2, 3)),
    error = TRUE
  )
  expect_snapshot(list_split("not a list or vector"), error = TRUE)
})

test_that("dots validation works", {
  expect_snapshot(list_split(1:5, n = 2, extra_arg = "bad"), error = TRUE)
})

test_that("chunk size accepts numeric that converts to integer", {
  expect_equal(list_split(1:4, n = 2), list_split(1:4, n = 2L))
  expect_equal(list_split(1:4, n = 2.0), list_split(1:4, n = 2L))
})

test_that("data frames require is_node = is.list", {
  df <- data.frame(x = 1:2, y = 3:4)
  expect_error(list_split(df, n = 1), "must be a list, vector")

  # with is_node = is.list, data frames split by rows
  result <- list_split(df, n = 1, is_node = is.list)
  expect_length(result, 2) # 2 rows = 2 chunks
  expect_equal(result[[1]], data.frame(x = 1L, y = 3L))
  expect_equal(result[[2]], data.frame(x = 2L, y = 4L))
})
