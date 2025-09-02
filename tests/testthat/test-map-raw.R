test_that("_raw funtions are deprecated", {
  expect_snapshot({
    . <- map_raw(list(), ~.x)
    . <- map2_raw(list(), list(), ~.x)
    . <- imap_raw(list(), ~.x)
    . <- pmap_raw(list(), ~.x)
    . <- flatten_raw(list())
  })
})

test_that("_raw functions still work", {
  local_options(lifecycle_verbosity = "quiet")
  expect_equal(map_raw("a", charToRaw), charToRaw("a"))
  expect_identical(map_raw(set_names(list()), identity), named(raw()))

  expect_identical(map2_raw(set_names(list()), list(), identity), named(raw()))
  expect_equal(imap_raw(as.raw(12), rawShift), rawShift(as.raw(12), 1))

  expect_bare(pmap_raw(list(1:3), as.raw), "raw")
  expect_identical(pmap_raw(list(named(list())), identity), named(raw()))

  expect_equal(flatten_raw(list(as.raw(1))), as.raw(1))
})
