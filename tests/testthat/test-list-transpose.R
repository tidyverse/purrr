test_that("can transpose homogenous list", {
  x <- list(x = list(a = 1, b = 2), y = list(a = 3, b = 4))
  out <- list_transpose(x)
  expect_equal(out, list(a = c(x = 1, y = 3), b = c(x = 2, y = 4)))
})

test_that("can't transpose data frames", {
  df <- data.frame(x = 1:2, y = 4:5)

  # i.e. be consistent with other `list_*()` functions from purrr/vctrs
  expect_snapshot(error = TRUE, list_transpose(df))
})

test_that("transposing empty list returns empty list", {
  expect_equal(list_transpose(list()), list())
})

test_that("can use character template", {
  x <- list(list(a = 1, b = 2), list(b = 3, c = 4))
  # Default:
  expect_equal(
    list_transpose(x, default = NA),
    list(a = c(1, NA), b = c(2, 3), c = c(NA, 4))
  )

  # Change order
  expect_equal(
    list_transpose(x, template = c("b", "a"), default = NA),
    list(b = c(2, 3), a = c(1, NA))
  )
  # Remove
  expect_equal(
    list_transpose(x, template = "b", default = NA),
    list(b = c(2, 3))
  )
  # Add
  expect_equal(
    list_transpose(x, template = c("a", "b", "c"), default = NA),
    list(a = c(1, NA), b = c(2, 3), c = c(NA, 4))
  )
})

test_that("can use integer template", {
  x <- list(list(1, 2, 3), list(4, 5))
  # Default:
  expect_equal(
    list_transpose(x, default = NA),
    list(c(1, 4), c(2, 5), c(3, NA))
  )

  # Change order
  expect_equal(
    list_transpose(x, template = c(3, 2, 1), default = NA),
    list(c(3, NA), c(2, 5), c(1, 4))
  )
  # Remove
  expect_equal(
    list_transpose(x, template = 2, default = NA),
    list(c(2, 5))
  )
  # Add
  expect_equal(
    list_transpose(x, template = 1:4, default = NA),
    list(c(1, 4), c(2, 5), c(3, NA), c(NA, NA))
  )
})

test_that("integer template requires exact length of list() simplify etc", {
  x <- list(list(1, 2), list(3, 4))

  expect_snapshot(list_transpose(x, ptype = list()), error = TRUE)
  expect_snapshot(list_transpose(x, ptype = list(integer())), error = TRUE)
  expect_identical(
    list_transpose(x, ptype = list(integer(), integer())),
    list(c(1L, 3L), c(2L, 4L))
  )
})

test_that("simplification fails silently unless requested", {
  expect_equal(
    list_transpose(list(list(x = 1), list(x = "b"))),
    list(x = list(1, "b"))
  )
  expect_equal(
    list_transpose(list(list(x = 1), list(x = 2:3))),
    list(x = list(1, 2:3))
  )

  expect_snapshot(error = TRUE, {
    list_transpose(list(list(x = 1), list(x = "b")), simplify = TRUE)
    list_transpose(list(list(x = 1), list(x = 2:3)), simplify = TRUE)
  })
})

test_that("can supply `simplify` globally or individually", {
  x <- list(list(a = 1, b = 2), list(a = 3, b = 4))
  expect_equal(
    list_transpose(x, simplify = FALSE),
    list(a = list(1, 3), b = list(2, 4))
  )
  expect_equal(
    list_transpose(x, simplify = list(a = FALSE)),
    list(a = list(1, 3), b = c(2, 4))
  )
  expect_snapshot(list_transpose(x, simplify = list(c = FALSE)), error = TRUE)
})

test_that("can supply `ptype` globally or individually", {
  x <- list(list(a = 1, b = 2), list(a = 3, b = 4))
  expect_identical(
    list_transpose(x, ptype = integer()),
    list(a = c(1L, 3L), b = c(2L, 4L))
  )
  expect_identical(
    list_transpose(x, ptype = list(a = integer())),
    list(a = c(1L, 3L), b = c(2, 4))
  )
  expect_snapshot(list_transpose(x, ptype = list(c = integer())), error = TRUE)
})

test_that("can supply `default` globally or individually", {
  x <- list(list(x = 1), list(y = "a"))
  expect_equal(
    list_transpose(x, template = c("x", "y"), default = NA),
    list(x = c(1, NA), y = c(NA, "a"))
  )
  expect_equal(
    list_transpose(x, template = c("x", "y"), default = list(x = NA, y = "")),
    list(x = c(1, NA), y = c("", "a"))
  )
  expect_snapshot(list_transpose(x, default = list(c = NA)), error = TRUE)
})

test_that("validates inputs", {
  expect_snapshot(error = TRUE, {
    list_transpose(10)
    list_transpose(list(1), template = mean)
  })
})

test_that("fail mixing named and unnamed vectors", {
  test_list_transpose <- function() {
    x <- list(list(a = 1, b = 2), list(a = 3, b = 4))
    list_transpose(list(x = list(a = 1, b = 2), y = list(3, 4)))
  }
  expect_snapshot(error = TRUE, {
    test_list_transpose()
  })
})
