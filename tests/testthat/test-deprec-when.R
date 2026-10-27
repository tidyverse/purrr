test_that("when() is defunct", {
  expect_snapshot(when(1, TRUE ~ 1), error = TRUE)
})
