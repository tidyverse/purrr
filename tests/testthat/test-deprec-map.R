test_that("at_depth is defunct", {
  expect_snapshot(at_depth(), error = TRUE)
})
