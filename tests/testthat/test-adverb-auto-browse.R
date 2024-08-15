test_that("auto_browse() not intended for primitive functions", {
  expect_snapshot(auto_browse(log)(NULL), error = TRUE)
  expect_no_error(auto_browse(identity)(NULL))
})
