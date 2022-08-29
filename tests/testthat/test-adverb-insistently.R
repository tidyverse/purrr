test_that("insistently() resets rate state", {
  fn <- insistently(compose(), rate_delay(1, max_times = 0))
  expect_error_cnd(
    fn(),
    "failed after 0 attempts",
    "purrr_error_rate_excess"
  )
  expect_error_cnd(
    fn(),
    "failed after 0 attempts",
    "purrr_error_rate_excess"
  )
})
