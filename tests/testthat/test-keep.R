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
    keep(1:3, ~ NA)
    discard(1:3, ~ NA)
  })
})
