test_that("can modify leaves", {
  expect_equal(
    modify_tree(c(1, 1, 1), leaf = ~ .x + 9),
    c(10, 10, 10)
  )

  expect_equal(
    modify_tree(list(1, list(1, list(1))), leaf = ~ .x + 9),
    list(10, list(10, list(10)))
  )
})

test_that("can modify nodes", {
  expect_equal(
    modify_tree(list(1, list(2, list(3))), post = list_flatten),
    list(1, 2, 3)
  )
})

test_that("default doesn't recurse into data frames, but can customise", {
  local_options(stringsAsFactors = FALSE)

  x <- list(data.frame(x = 1), data.frame(y = 2))
  expect_equal(
    modify_tree(x, leaf = class),
    list("data.frame", "data.frame")
  )
  expect_equal(
    modify_tree(x, leaf = class, is_node = is.list),
    list(data.frame(x = "numeric"), data.frame(y = "numeric"))
  )
})

test_that("leaf() is applied to non-node input", {
  expect_equal(modify_tree(1:3, leaf = identity), 1:3)
})

test_that("validates inputs", {
  expect_snapshot(error = TRUE, {
    modify_tree(list(), is_node = ~1)
    modify_tree(list(), is_node = 1)
  })
})
