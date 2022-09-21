test_that("can modify leaves", {
  expect_equal(
    modify_tree(c(1, 1, 1), ~ .x + 9),
    c(10, 10, 10)
  )

  expect_equal(
    modify_tree(list(1, list(1, list(1))), ~ .x + 9),
    list(10, list(10, list(10)))
  )
})

test_that("can modify nodes", {
  expect_equal(
    modify_tree(list(1, list(2, list(3))), f_post = list_flatten),
    list(1, 2, 3)
  )
})

test_that("validates inputs", {
  expect_snapshot(error = TRUE, {
    modify_tree(mean, identity)
    modify_tree(list(), p_leaf = ~ 1)
  })
})
