test_that("prepend() is defunct", {
  expect_snapshot(prepend(1, 2), error = TRUE)
})
