# list_assign -------------------------------------------------------------

test_that("can modify named lists by name or position", {
  expect_equal(list_assign(list(a = 1), b = 2), list(a = 1, b = 2))
  expect_equal(list_assign(list(a = 1), a = 2), list(a = 2))
  expect_equal(list_assign(list(a = 1), a = NULL), list(a = NULL))
  expect_equal(list_assign(list(a = 1, b = 2), b = zap()), list(a = 1))

  expect_equal(list_assign(list(a = 1), 2), list(a = 2))
  expect_equal(list_assign(list(a = 1, b = 2), zap()), list(b = 2))
})

test_that("can modify unnamed lists by name or position", {
  expect_equal(list_assign(list(3), 1, 2), list(1, 2))
  expect_equal(list_assign(list(3), NULL), list(NULL))
  expect_equal(list_assign(list(3), zap()), list())
  expect_equal(list_assign(list(3), zap(), zap()), list())

  expect_equal(list_assign(list(1), a = 2), list(1, a = 2))
  expect_equal(list_assign(list(1), a = NULL), list(1, a = NULL))
  expect_equal(list_assign(list(1), a = zap()), list(1))
})

test_that("doesn't replace recursively", {
  x <- list(y = list(a = 1))
  expect_equal(list_assign(x, y = list(b = 1)), list(y = list(b = 1)))
})

# list_modify -------------------------------------------------------------

test_that("named lists have values replaced by name", {
  expect_equal(list_modify(list(a = 1), b = 2), list(a = 1, b = 2))
  expect_equal(list_modify(list(a = 1), a = 2), list(a = 2))
  expect_equal(list_modify(list(a = 1), a = NULL), list(a = NULL))
  expect_equal(list_modify(list(a = 1, b = 2), b = zap()), list(a = 1))
})

test_that("unnamed lists are replaced by position", {
  expect_equal(list_modify(list(3), 1, 2), list(1, 2))
  expect_equal(list_modify(list(3), NULL), list(NULL))

  expect_equal(list_modify(list(3), zap()), list())
  expect_equal(list_modify(list(3), zap(), zap()), list())

  expect_equal(list_modify(list(1, 2, 3), 4), list(4, 2, 3))
})

test_that("can update unnamed lists with named inputs", {
  expect_identical(list_modify(list(1), a = 2), list(1, a = 2))
  expect_identical(list_modify(list(1), a = NULL), list(1, a = NULL))
  expect_identical(list_modify(list(1), a = zap()), list(1))
})

test_that("can update named lists with unnamed inputs", {
  expect_identical(list_modify(list(a = 1, b = 2), 2), list(a = 2, b = 2))
  expect_identical(list_modify(list(a = 1, b = 2), zap()), list(b = 2))
  expect_identical(
    list_modify(list(a = 1, b = 2), 2, 3, 4),
    list(a = 2, b = 3, 4)
  )
})

test_that("lists are replaced recursively", {
  expect_equal(
    list_modify(
      list(a = list(x = 1)),
      a = list(x = 2),
    ),
    list(a = list(x = 2))
  )

  expect_equal(
    list_modify(
      list(a = list(x = 1)),
      a = list(y = 2)
    ),
    list(a = list(x = 1, y = 2))
  )
})

test_that("but data.frames are not", {
  x1 <- list(x = data.frame(x = 1))
  x2 <- list(x = data.frame(y = 2))
  out <- list_modify(x1, !!!x2)
  expect_equal(out, x2)

  # unless you really want it
  out <- list_modify(x1, !!!x2, .is_node = is.list)
  expect_equal(out, list(x = data.frame(x = 1, y = 2)))
})

test_that("list_modify() validates inputs", {
  expect_snapshot(list_modify(1:3), error = TRUE)
  expect_snapshot(list_modify(list(a = 1), 2, a = 2), error = TRUE)
  expect_snapshot(list_modify(list(x = 1), x = 2, x = 3), error = TRUE)
})

test_that("list_modify() preserves class & attributes", {
  x <- structure(list(a = 1, b = 2), x = 10, class = "foo")
  expect_equal(
    list_modify(x, a = 10, b = 20),
    structure(list(a = 10, b = 20), x = 10, class = "foo")
  )
})

# list_merge --------------------------------------------------------------

test_that("list_merge concatenates values from two lists", {
  l1 <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
  l2 <- list(x = 11, z = list(a = 2:5, c = 3))
  l <- list_merge(l1, !!!l2)
  expect_equal(l$x, c(l1$x, l2$x))
  expect_equal(l$y, c(l1$y, l2$y))
  expect_equal(l$z$a, c(l1$z$a, l2$z$a))
  expect_equal(l$z$b, c(l1$z$b, l2$z$b))
  expect_equal(l$z$c, c(l1$z$c, l2$z$c))
})

test_that("list_merge concatenates without needing names", {
  l1 <- list(1:10, 4, list(1, 2))
  l2 <- list(11, 5, list(2:5, 3))
  expect_length(list_merge(l1, !!!l2), 3)
})

test_that("list_merge returns the non-empty list", {
  expect_equal(list_merge(list(3)), list(3))
  expect_equal(list_merge(list(), 2), list(2))
})

test_that("merge() validates inputs", {
  expect_snapshot(list_merge(1:3), error = TRUE)
  expect_snapshot(list_merge(list(x = 1), x = 2, x = 3), error = TRUE)
})

# update_list ------------------------------------------------------------

test_that("update_list() is deprecated", {
  expect_snapshot({
    . <- update_list(list())
  })
})

test_that("can modify element called x", {
  local_options(lifecycle_verbosity = "quiet")
  expect_equal(update_list(list(), x = 1), list(x = 1))
})

test_that("quosures and formulas are evaluated", {
  local_options(lifecycle_verbosity = "quiet")
  expect_identical(update_list(list(x = 1), y = quo(x + 1)), list(x = 1, y = 2))
  expect_identical(update_list(list(x = 1), y = ~ x + 1), list(x = 1, y = 2))
})
