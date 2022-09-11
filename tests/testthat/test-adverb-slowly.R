test_that("validates inputs", {
  expect_snapshot(error = TRUE, {
    slowly(mean, 10)
  })
})
