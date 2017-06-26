context("arrays")

x <- array(1:12, c(2, 2, 3))

test_that("array_branch creates a flat list when no margin specified", {
  expect_length(array_branch(x), 12)
})

test_that("array_branch wraps array in list when margin has length 0", {
  expect_identical(array_branch(x, numeric(0)), list(x))
})

test_that("length depends on whether list is flattened or not", {
  m1 <- c(3, 1)
  m2 <- 3
  expect_length(array_branch(x, m1), prod(dim(x)[m1]))
  expect_length(array_tree(x, m1), prod(dim(x)[m2]))
})
