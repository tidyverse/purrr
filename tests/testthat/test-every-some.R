context("every-some")

test_that("return NA if present", {
  expect_equal(some(1:10, ~ NA), NA)
  expect_equal(every(1:10, ~ NA), NA)
})
