test_that("auto_browse() not intended for primitive functions", {
  expect_error(auto_browse(log)(NULL), "primitive functions")
  expect_error(auto_browse(identity)(NULL), NA)
})
