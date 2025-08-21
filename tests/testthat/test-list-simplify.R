test_that("simplifies using vctrs principles", {
  expect_identical(list_simplify(list(1, 2L)), c(1, 2))
  expect_equal(list_simplify(list("x", factor("y"))), c("x", "y"))

  x <- list(data.frame(x = 1), data.frame(y = 2))
  expect_equal(list_simplify(x), data.frame(x = c(1, NA), y = c(NA, 2)))
})

test_that("only uses outer names", {
  out <- list_simplify(list(a = 1, c(b = 1), c = c(d = 1)))
  expect_named(out, c("a", "", "c"))
})

test_that("ptype is enforced", {
  expect_equal(list_simplify(list(1, 2), ptype = double()), c(1, 2))
  expect_snapshot(list_simplify(list(1, 2), ptype = character()), error = TRUE)
  # even if `strict = FALSE`
  expect_snapshot(
    list_simplify(list(1, 2), ptype = character(), strict = FALSE),
    error = TRUE
  )
})

test_that("strict simplification will error", {
  expect_snapshot(error = TRUE, {
    list_simplify(list(mean))
    list_simplify(list(1, "a"))
    list_simplify(list(1, 1:2))
    list_simplify(list(data.frame(x = 1), data.frame(x = 1:2)))
    list_simplify(list(1, 2), ptype = character())
  })
})

test_that("simplification requires length-1 vectors with common type", {
  expect_equal(list_simplify(list(mean), strict = FALSE), list(mean))
  expect_equal(list_simplify(list(1, 2:3), strict = FALSE), list(1, 2:3))
  expect_equal(list_simplify(list(1, "a"), strict = FALSE), list(1, "a"))
})

# argument checking -------------------------------------------------------

test_that("list_simplify() validates inputs", {
  expect_snapshot(list_simplify(1:5), error = TRUE)
  expect_snapshot(list_simplify(list(), strict = NA), error = TRUE)
})

test_that("list_simplify_internal() validates inputs", {
  expect_snapshot(list_simplify_internal(list(), simplify = 1), error = TRUE)
  expect_snapshot(
    list_simplify_internal(list(), simplify = FALSE, ptype = integer()),
    error = TRUE
  )
})
