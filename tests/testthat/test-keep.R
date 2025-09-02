test_that("can keep/discard with logical vector", {
  expect_equal(keep(1:3, c(TRUE, FALSE, TRUE)), c(1, 3))
  expect_equal(discard(1:3, c(TRUE, FALSE, TRUE)), 2)
})

test_that("can keep/discard with predicate", {
  expect_equal(keep(1:3, ~ .x != 2), c(1, 3))
  expect_equal(discard(1:3, ~ .x != 2), c(2))
})

test_that("keep() and discard() require predicate functions", {
  expect_snapshot(error = TRUE, {
    keep(1:3, ~NA)
    discard(1:3, ~NA)
  })
})

# keep_at / discard_at ----------------------------------------------------

test_that("can keep_at/discard_at with character vector", {
  x <- list(a = 1, b = 1, c = 1)
  expect_equal(keep_at(x, "b"), list(b = 1))
  expect_equal(discard_at(x, "b"), list(a = 1, c = 1))
})

test_that("can keep_at/discard_at with function", {
  x <- list(a = 1, b = 1, c = 1)
  expect_equal(keep_at(x, ~ . == "b"), list(b = 1))
  expect_equal(discard_at(x, ~ . == "b"), list(a = 1, c = 1))
})

test_that("discard_at works when nothing discarded", {
  x <- list(a = 1, b = 1, c = 1)
  expect_equal(discard_at(x, "d"), x)
})
