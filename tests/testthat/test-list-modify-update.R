context("list_update")

test_that("can modify element called x", {
  expect_equal(list_update(list(), x = 1), list(x = 1))
})

test_that("quosures are evaluated", {
  expect_equal(list_update(list(x = 1), y = quo(x + 1)), list(x = 1, y = 2))
})

test_that("any symbolic argument is evaluated", {
  expect_equal(list_update(list(x = 1), y = quote(x + 1)), list(x = 1, y = 2))
})


# list_modify -------------------------------------------------------------

test_that("named lists have values replaced by name", {
  expect_equal(list_modify(list(a = 1), list(b = 2)), list(a = 1, b = 2))
  expect_equal(list_modify(list(a = 1), list(a = 2)), list(a = 2))
  expect_equal(list_modify(list(a = 1, b = 2), list(b = NULL)), list(a = 1))
})

test_that("unnamed lists are replaced by position", {
  expect_equal(list_modify(list(3), list(1, 2)), list(1, 2))
  expect_equal(list_modify(list(1, 2, 3), list(4)), list(4, 2, 3))
  expect_equal(list_modify(list(1, 2, 3), list(NULL, NULL)), list(3))
})

test_that("error if one named and the other is not", {
  expect_error(
    list_modify(list(a = 1), list(2)),
    "must be either both named or both unnamed"
  )
})

test_that("lists are replaced recursively", {
  expect_equal(
    list_modify(
      list(a = list(x = 1)),
      list(a = list(x = 2))
    ),
    list(a = list(x = 2))
  )

  expect_equal(
    list_modify(
      list(a = list(x = 1)),
      list(a = list(y = 2))
    ),
    list(a = list(x = 1, y = 2))
  )
})

