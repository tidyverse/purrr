test_that("rerun() is defunct", {
  expect_snapshot(error = TRUE, {
    rerun(5, rnorm(1))
    rerun(5, rnorm(1), rnorm(2))
  })
})
