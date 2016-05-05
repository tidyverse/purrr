context("reduce")

test_that("accumulate passes arguments to function", {
  tt <- c("a", "b", "c")
  expect_equal(accumulate(tt, paste, sep = "."), c("a", "a.b", "a.b.c"))
  expect_equal(accumulate_right(tt, paste, sep = "."), c("c.b.a", "c.b", "c"))
})
