test_that("flattening removes single layer of nesting", {
  expect_equal(list_flatten(list(list(1), list(2))), list(1, 2))
  expect_equal(list_flatten(list(list(1), list(list(2)))), list(1, list(2)))
  expect_equal(list_flatten(list(list(1), list(), list(2))), list(1, 2))
})

test_that("flattening a flat list is idempotent", {
  expect_equal(list_flatten(list(1, 2)), list(1, 2))
})

test_that("uses either inner or outer names if only one present", {
  expect_equal(list_flatten(list(x = list(1), list(y = 2))), list(x = 1, y = 2))
})

test_that("can control names if both present", {
  x <- list(a = list(x = 1))
  expect_equal(list_flatten(x), list(a_x = 1))
  expect_equal(list_flatten(x, name_spec = "{inner}"), list(x = 1))
  expect_equal(list_flatten(x, name_spec = "{outer}"), list(a = 1))
})

test_that("requires a list", {
  expect_snapshot(list_flatten(1:2), error = TRUE)
})
