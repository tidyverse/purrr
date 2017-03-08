context("update_list")

test_that("can modify element called x", {
  expect_equal(update_list(list(), x = 1), list(x = 1))
})

test_that("quosures are evaluated", {
  expect_equal(update_list(list(x = 1), y = ~ x + 1), list(x = 1, y = 2))
})


# modify_list -------------------------------------------------------------

test_that("named lists have values replaced by name", {
  expect_equal(modify_list(list(a = 1), list(b = 2)), list(a = 1, b = 2))
  expect_equal(modify_list(list(a = 1), list(a = 2)), list(a = 2))
  expect_equal(modify_list(list(a = 1, b = 2), list(b = NULL)), list(a = 1))
})

test_that("unnamed lists are replaced by position", {
  expect_equal(modify_list(list(3), list(1, 2)), list(1, 2))
  expect_equal(modify_list(list(1, 2, 3), list(4)), list(4, 2, 3))
  expect_equal(modify_list(list(1, 2, 3), list(NULL, NULL)), list(3))
})

test_that("error if one named and the other is not", {
  expect_error(
    modify_list(list(a = 1), list(2)),
    "must be either both named or both unnamed"
  )
})

test_that("lists are replaced recursively", {
  expect_equal(
    modify_list(
      list(a = list(x = 1)),
      list(a = list(x = 2))
    ),
    list(a = list(x = 2))
  )

  expect_equal(
    modify_list(
      list(a = list(x = 1)),
      list(a = list(y = 2))
    ),
    list(a = list(x = 1, y = 2))
  )
})

