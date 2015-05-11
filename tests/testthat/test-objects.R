context("objects")

test_that("splice() produces correctly named lists", {
  inputs <- list(arg1 = "a", arg2 = "b")

  out1 <- splice(inputs, arg3 = c("c1", "c2")) %>% names()
  out2 <- splice(inputs, arg = list(arg3 = 1, arg4 = 2)) %>% names()

  expect_equal(out1, c("arg1", "arg2", "arg3"))
  expect_equal(out2, c("arg1", "arg2", "arg3", "arg4"))
})
