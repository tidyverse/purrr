test_that("invoke_* is defunct", {
  expect_snapshot(error = TRUE, {
    invoke(identity, 1)
    invoke_map(identity, list())
    invoke_map_lgl(identity, list())
    invoke_map_int(identity, list())
    invoke_map_dbl(identity, list())
    invoke_map_chr(identity, list())
    invoke_map_raw(identity, list())
    invoke_map_dfr(identity, list())
  })
})

test_that("invoke_map_df() and invoke_map_dfc() are deprecated", {
  expect_snapshot({
    . <- invoke_map_df(identity, list())
    . <- invoke_map_dfc(identity, list())
  })
})

test_that("invoke_map_dfc() works with bare function with data frames", {
  local_options(lifecycle_verbosity = "quiet")
  skip_if_not_installed("dplyr")

  data <- list(1:2, 3:4)
  ops <- set_names(c(`+`, `-`), c("a", "b"))
  expect_identical(invoke_map_df(ops, data), tibble::tibble(a = 3L, b = -1L))
  expect_identical(invoke_map_dfc(ops, data), tibble::tibble(a = 3L, b = -1L))
})
