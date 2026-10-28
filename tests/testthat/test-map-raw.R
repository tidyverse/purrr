test_that("_raw functions are defunct", {
  expect_snapshot(error = TRUE, {
    map_raw(1, identity)
    map2_raw(1, 1, identity)
    imap_raw(1, identity)
    pmap_raw(list(1), identity)
    flatten_raw(list())
  })
})
