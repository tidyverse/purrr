context("list_modify")

# list_modify -------------------------------------------------------------

test_that("named lists have values replaced by name", {
  expect_equal(list_modify(list(a = 1), b = 2), list(a = 1, b = 2))
  expect_equal(list_modify(list(a = 1), a = 2), list(a = 2))
  expect_equal(list_modify(list(a = 1, b = 2), b = NULL), list(a = 1))
})

test_that("unnamed lists are replaced by position", {
  expect_equal(list_modify(list(3), 1, 2), list(1, 2))
  expect_equal(list_modify(list(1, 2, 3), 4), list(4, 2, 3))
  expect_equal(list_modify(list(1, 2, 3), NULL, NULL), list(3))
})

test_that("error if one named and the other is not", {
  expect_error(
    list_modify(list(a = 1), 2),
    "must be either both named or both unnamed"
  )
})

test_that("lists are replaced recursively", {
  expect_equal(
    list_modify(
      list(a = list(x = 1)),
      a = list(x = 2)
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


# list_merge --------------------------------------------------------------

test_that("list_merge concatenates values from two lists", {
  l1 <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
  l2 <- list(x = 11, z = list(a = 2:5, c = 3))
  l <- list_merge(l1, !!! l2)
  expect_equal(l$x, c(l1$x, l2$x))
  expect_equal(l$y, c(l1$y, l2$y))
  expect_equal(l$z$a, c(l1$z$a, l2$z$a))
  expect_equal(l$z$b, c(l1$z$b, l2$z$b))
  expect_equal(l$z$c, c(l1$z$c, l2$z$c))
})

test_that("list_merge concatenates without needing names", {
  l1 <- list(1:10, 4, list(1, 2))
  l2 <- list(11, 5, list(2:5, 3))
  expect_length(list_merge(l1, !!! l2), 3)
})

test_that("list_merge returns the non-empty list", {
  expect_equal(list_merge(list(3)), list(3))
  expect_equal(list_merge(list(), 2), set_names(list(2), ""))
})


# update_list ------------------------------------------------------------

test_that("can modify element called x", {
  expect_equal(update_list(list(), x = 1), list(x = 1))
})

test_that("quosures and formulas are evaluated", {
  expect_identical(update_list(list(x = 1), y = quo(x + 1)), list(x = 1, y = 2))
  expect_identical(update_list(list(x = 1), y = ~x + 1), list(x = 1, y = 2))
})
