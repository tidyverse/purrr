# map_depth ------------------------------------------------------------

test_that("map_depth modifies values at specified depth", {
  x1 <- list(list(list(1:3, 4:6)))

  expect_equal(map_depth(x1, 0, length), 1)
  expect_equal(map_depth(x1, 1, length), list(1))
  expect_equal(map_depth(x1, 2, length), list(list(2)))
  expect_equal(map_depth(x1, 3, length), list(list(list(3, 3))))
  expect_equal(map_depth(x1, -1, length), list(list(list(3, 3))))
  expect_snapshot(map_depth(x1, 6, length), error = TRUE)
  expect_snapshot(map_depth(x1, -5, length), error = TRUE)
})

test_that("default doesn't recurse into data frames, but can customise", {
  x <- list(data.frame(x = 1), data.frame(y = 2))
  expect_snapshot(map_depth(x, 2, class), error = TRUE)

  x <- list(data.frame(x = 1), data.frame(y = 1))
  expect_equal(
    map_depth(x, 2, class, .is_node = is.list),
    list(list(x = "numeric"), list(y = "numeric"))
  )
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
  expect_snapshot(modify_depth(x1, 5, length), error = TRUE)
  expect_snapshot(modify_depth(x1, -5, length), error = TRUE)
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
  expect_snapshot(modify_depth(x, 5, `+`, 10L), error = TRUE)
})

test_that("modify_depth() treats NULLs correctly", {
  ll <- list(a = NULL, b = list(b1 = NULL, b2 = "hello"))
  expect_equal(modify_depth(ll, .depth = 2, identity, .ragged = TRUE), ll)
  expect_equal(
    modify_depth(ll, .depth = 2, is.character, .ragged = TRUE),
    list(a = NULL, b = list(b1 = FALSE, b2 = TRUE))
  )
})


# check_depth -------------------------------------------------------------

test_that("validates depth", {
  expect_snapshot(check_depth(mean), error = TRUE)
})
