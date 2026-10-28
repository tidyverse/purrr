test_that("splice() is defunct", {
  expect_snapshot(splice(1, 2), error = TRUE)
})
