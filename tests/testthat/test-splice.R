context("splice")

test_that("predicate controls which elements get spliced", {
  x <- list(1, 2, list(3, 4))

  expect_equal(splice_if(x, ~ FALSE), x)
  expect_equal(splice_if(x, is.list), list(1, 2, 3, 4))
})

test_that("splice() produces correctly named lists", {
  inputs <- list(arg1 = "a", arg2 = "b")

  out1 <- splice(inputs, arg3 = c("c1", "c2"))
  expect_named(out1, c("arg1", "arg2", "arg3"))

  out2 <- splice(inputs, arg = list(arg3 = 1, arg4 = 2))
  expect_named(out2, c("arg1", "arg2", "arg3", "arg4"))
})
