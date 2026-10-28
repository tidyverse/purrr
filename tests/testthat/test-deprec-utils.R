test_that("rbernoulli() and rdunif() are defunct", {
  expect_snapshot(error = TRUE, {
    rbernoulli(1)
    rdunif(1, 1)
  })
})
