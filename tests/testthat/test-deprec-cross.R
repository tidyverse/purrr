test_that("cross functions are defunct", {
  expect_snapshot(error = TRUE, {
    cross(list())
    cross2(1, 2)
    cross3(1, 2, 3)
    cross_df(list())
  })
})
