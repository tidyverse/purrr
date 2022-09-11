test_that("insistently() resets rate state", {
  fn <- insistently(compose(), rate_delay(1, max_times = 0))
  expect_snapshot_error(fn(), class = "purrr_error_rate_excess")
  expect_snapshot_error(fn(), class = "purrr_error_rate_excess")
})

test_that("validates inputs", {
  expect_snapshot(error = TRUE, {
    insistently(mean, 10)
  })
})
