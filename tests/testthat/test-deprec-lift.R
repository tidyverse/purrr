test_that("lift functions are defunct", {
  expect_snapshot(error = TRUE, {
    lift(sum)
    lift_dl(sum)
    lift_dv(sum)
    lift_ld(sum)
    lift_lv(sum)
    lift_vd(sum)
    lift_vl(sum)
  })
})
