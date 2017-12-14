context("compose")

test_that("composed functions are applied right to left", {
  expect_identical(!is.null(4), compose(`!`, is.null)(4))

  set.seed(1)
  x <- sample(1:4, 100, replace = TRUE)
  expect_identical(unname(sort(table(x))), compose(unname, sort, table)(x))
})

test_that("functions, mappers and characters can be used", {
  expect_identical(!is.null(4), compose(`!`, "is.null")(4))
  expect_identical(!is.null(4), compose(`!`, is.null)(4))
  expect_identical(!is.null(4), compose(`!`, function(x) is.null(x))(4))
  expect_identical(!is.null(4), compose(`!`, ~ is.null(.x))(4))
})
