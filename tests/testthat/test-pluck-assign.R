# assign_in() ----------------------------------------------------------

test_that("assign_in() doesn't assign in the caller environment", {
  x <- list(list(bar = 1, foo = 2))
  assign_in(x, list(1, "foo"), value = 20)
  expect_identical(x, list(list(bar = 1, foo = 2)))
})

test_that("assign_in() assigns", {
  x <- list(list(bar = 1, foo = 2))
  out <- assign_in(x, list(1, "foo"), value = 20)
  expect_identical(out, list(list(bar = 1, foo = 20)))
})

test_that("can assign NULL (#636)", {
  expect_equal(
    assign_in(list(x = 1, y = 2), 1, value = NULL),
    list(x = NULL, y = 2)
  )
  expect_equal(
    assign_in(list(x = 1, y = 2), "y", value = NULL),
    list(x = 1, y = NULL)
  )
})

test_that("can remove elements with zap()", {
  expect_equal(
    assign_in(list(x = 1, y = 2), 1, value = zap()),
    list(y = 2)
  )
  expect_equal(
    assign_in(list(x = 1, y = 2), "y", value = zap()),
    list(x = 1)
  )

  # And deep indexing leaves unchanged
  expect_equal(
    assign_in(list(x = 1, y = 2), c(3, 4, 5), value = zap()),
    list(x = 1, y = 2)
  )
  expect_equal(
    assign_in(list(x = 1, y = 2), c("a", "b", "c"), value = zap()),
    list(x = 1, y = 2)
  )
})

test_that("assign_in() requires at least one location", {
  x <- list("foo")
  expect_snapshot(error = TRUE, {
    assign_in(x, NULL, value = "foo")
  })
})

test_that("can modify non-existing locations", {
  expect_equal(assign_in(list(), "x", 1), list(x = 1))
  expect_equal(assign_in(list(), 2, 1), list(NULL, 1))

  expect_equal(assign_in(list(), c("x", "y"), 1), list(x = list(y = 1)))
  expect_equal(assign_in(list(), c(2, 1), 1), list(NULL, list(1)))

  expect_equal(assign_in(list(), list("x", 2), 1), list(x = list(NULL, 1)))
  expect_equal(assign_in(list(), list(1, "y"), 1), list(list(y = 1)))
})

# modify_in() ----------------------------------------------------------

test_that("modify_in() modifies in pluck location", {
  x <- list(list(bar = 1, foo = 2))

  out <- modify_in(x, list(1, "foo"), `+`, 100)
  expect_identical(out, list(list(bar = 1, foo = 102)))

  out <- modify_in(x, c(1, 1), `+`, 10)
  expect_identical(out, list(list(bar = 11, foo = 2)))
})

test_that("modify_in() doesn't require existing", {
  x <- list(list(x = 1, y = 2))
  expect_equal(modify_in(x, 2, ~10), list(list(x = 1, y = 2), 10))
  expect_equal(
    modify_in(x, list(1, "z"), ~10),
    list(list(x = 1, y = 2, z = 10))
  )
})
