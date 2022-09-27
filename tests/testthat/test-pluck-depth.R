test_that("depth of non-vectors is 0", {
  expect_equal(pluck_depth(NULL), 0L)
  expect_equal(pluck_depth(mean), 0L)
})

test_that("depth of atomic vector is 1", {
  expect_equal(pluck_depth(1:10), 1)
  expect_equal(pluck_depth(letters), 1)
  expect_equal(pluck_depth(c(TRUE, FALSE)), 1)
})

test_that("depth of nested is depth of deepest element + 1", {
  x <- list(
    NULL,
    list(),
    list(list())
  )

  depths <- map_int(x, pluck_depth)
  expect_equal(depths, c(0, 1, 2))
  expect_equal(pluck_depth(x), 3)
})

test_that("vec_depth() is deprecated", {
  expect_snapshot({
    . <- vec_depth(list())
  })
})
