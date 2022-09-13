test_that("list-along is deprecated", {
  expect_snapshot({
    . <- list_along(1:4)
  })
})

test_that("list_along works", {
  local_options(lifecycle_verbosity = "quiet")

  x <- 1:5
  expect_identical(list_along(x), vector("list", 5))
})

test_that("rep_along works", {
  local_options(lifecycle_verbosity = "quiet")

  expect_equal(
    rep_along(c("c", "b", "a"), 1:3),
    rep_along(c("d", "f", "e"), 1:3)
  )
})
