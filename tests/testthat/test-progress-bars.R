test_that("useful for bad progress spec", {
  # Test map() to make sure we're passing the caller env correctly
  expect_snapshot(map(1, .progress = 1), error = TRUE)
})
