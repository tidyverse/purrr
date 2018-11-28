context("arrays")

x <- array(1:12, c(2, 2, 3), dimnames = list(letters[1:2], LETTERS[1:2], NULL))

test_that("array_branch creates a flat list when no margin specified", {
  expect_length(array_branch(x), 12)
})

test_that("array_branch wraps array in list when margin has length 0", {
  expect_identical(array_branch(x, numeric(0)), list(x))
})

test_that("array_branch works on vectors", {
  expect_identical(array_branch(1:3), list(1L, 2L, 3L))
  expect_identical(array_branch(1:3, 1), list(1L, 2L, 3L))
})

test_that("array_branch throws an error for wrong margins on a vector", {
  expect_error(array_branch(1:3, 2), "must be `NULL` or `1`")
})

test_that("length depends on whether list is flattened or not", {
  m1 <- c(3, 1)
  m2 <- 3
  expect_length(array_branch(x, m1), prod(dim(x)[m1]))
  expect_length(array_tree(x, m1), prod(dim(x)[m2]))
})

test_that("array_branch retains dimnames when going over one dimension", {
  expect_identical(names(array_branch(x, 1)), letters[1:2])
  expect_identical(names(array_branch(x, 2)), LETTERS[1:2])
  expect_identical(names(array_branch(x, 2:3)[[1]]), letters[1:2])
})
