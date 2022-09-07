test_that("can transpose homogenous list", {
  x <- list(x = list(a = 1, b = 2), y = list(a = 3, b = 4))
  out <- list_transpose(x)
  expect_equal(out, list(a = c(x = 1, y = 3), b = c(x = 2, y = 4)))
})

test_that("transposing empty list returns empty list", {
  expect_equal(list_transpose(list()), list())
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
  expect_equal(
    list_transpose(x, ptype = list(a = integer())),
    list(a = c(1L, 3L), b = c(2, 4))
  )
  expect_snapshot(list_transpose(x, ptype = list(c = integer())), error = TRUE)
})

test_that("can supply `default` globally or individually", {
  x <- list(list(x = 1), list(y = "a"))
  expect_equal(
    list_transpose(x, c("x", "y"), default = NA),
    list(x = c(1, NA), y = c(NA, "a"))
  )
  expect_equal(
    list_transpose(x, c("x", "y"), default = list(x = NA, y = "")),
    list(x = c(1, NA), y = c("", "a"))
  )
  expect_snapshot(list_transpose(x, default = list(c = NA)), error = TRUE)
})

test_that("validates inputs", {
  expect_snapshot(error = TRUE, {
    list_transpose(10)
    list_transpose(list(1))
    list_transpose(list(a = 1), template = 1)
  })
})
