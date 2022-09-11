# map_depth ------------------------------------------------------------

test_that("map_depth modifies values at specified depth", {
  x1 <- list(list(list(1:3, 4:6)))

  expect_equal(map_depth(x1, 0, length), 1)
  expect_equal(map_depth(x1, 1, length), list(1))
  expect_equal(map_depth(x1, 2, length), list(list(2)))
  expect_equal(map_depth(x1, 3, length), list(list(list(3, 3))))
  expect_equal(map_depth(x1, -1, length), list(list(list(3, 3))))
  expect_equal(map_depth(x1, 4, length), list(list(list(list(1, 1, 1), list(1, 1, 1)))))
  expect_error(map_depth(x1, 5, length), "List not deep enough") #FIXME
  expect_error(map_depth(x1, 6, length), "List not deep enough")
  expect_error(map_depth(x1, -5, length), "Invalid depth")
})

test_that("map_depth() with .ragged = TRUE operates on leaves", {
  x1 <- list(
    list(1),
    list(list(2))
  )
  exp <- list(
    list(list(2)),
    list(list(3))
  )

  expect_equal(map_depth(x1, 3, ~ . + 1, .ragged = TRUE), exp)
  expect_equal(map_depth(x1, -1, ~ . + 1, .ragged = TRUE), exp)
  # .ragged should be TRUE is .depth < 0
  expect_equal(map_depth(x1, -1, ~ . + 1), exp)
})

# modify_depth ------------------------------------------------------------

test_that("modify_depth modifies values at specified depth", {
  x1 <- list(list(list(1:3, 4:6)))

  expect_equal(modify_depth(x1, 0, length), list(1))
  expect_equal(modify_depth(x1, 1, length), list(1))
  expect_equal(modify_depth(x1, 2, length), list(list(2)))
  expect_equal(modify_depth(x1, 3, length), list(list(list(3, 3))))
  expect_equal(modify_depth(x1, -1, length), list(list(list(3, 3))))
  expect_equal(modify_depth(x1, 4, length), list(list(list(c(1, 1, 1), c(1, 1, 1)))))
  expect_error(modify_depth(x1, 5, length), "List not deep enough")
  expect_error(modify_depth(x1, 6, length), "List not deep enough")
  expect_error(modify_depth(x1, -5, length), "Invalid depth")
})

test_that(".ragged = TRUE operates on leaves", {
  x1 <- list(
    list(1),
    list(list(2))
  )
  x2 <- list(
    list(2),
    list(list(3))
  )

  expect_equal(modify_depth(x1, 3, ~ . + 1, .ragged = TRUE), x2)
  expect_equal(modify_depth(x1, -1, ~ . + 1, .ragged = TRUE), x2)
  # .ragged should be TRUE is .depth < 0
  expect_equal(modify_depth(x1, -1, ~ . + 1), x2)
})

test_that("vectorised operations on the recursive and atomic levels yield same results", {
  x <- list(list(list(1:3, 4:6)))
  exp <- list(list(list(11:13, 14:16)))
  expect_identical(modify_depth(x, 3, `+`, 10L), exp)
  expect_identical(modify_depth(x, 4, `+`, 10L), exp)
  expect_error(modify_depth(x, 5, `+`, 10L), "not deep enough")
})

test_that("modify_depth() treats NULLs correctly", {
  ll <- list(a = NULL, b = list(b1 = NULL, b2 = "hello"))
  expect_equal(modify_depth(ll, .depth = 2, identity, .ragged = TRUE), ll)
  expect_equal(
    modify_depth(ll, .depth = 2, is.character, .ragged = TRUE),
    list(a = NULL, b = list(b1 = FALSE, b2 = TRUE))
  )
})
