context("recycle_args")

test_that("rejects uneven lengths", {
  args <- list(1, c(1:2), NULL)
  expect_error(purrr:::recycle_args(args), "lengths == 1L \\| lengths == n")
})


test_that("recycles single values and preserves longer ones", {
  args <- list(1, 1:12,  month.name, "a")
  recycled <- purrr:::recycle_args(args)

  expect_equal(recycled[[1]], rep(1, 12))
  expect_equal(recycled[[2]], 1:12)
  expect_equal(recycled[[3]], month.name)
  expect_equal(recycled[[4]], rep("a", 12))
})

test_that("will not recycle non-vectors", {
  args <- list(1:12,  identity)
  expect_error(
    purrr:::recycle_args(args),
    "replicate an object of type 'closure'"
  )
})
