test_that("prepend is deprecated", {
  expect_snapshot({
    . <- prepend(1, 2)
  })
})

test_that("prepend is clearer version of merging with c()", {
  local_options(lifecycle_verbosity = "quiet")

  x <- 1:3
  expect_identical(
    x %>% prepend(4),
    x %>% c(4, .)
  )
  expect_identical(
    x %>% prepend(4, before = 3),
    x %>%
      {
        c(.[1:2], 4, .[3])
      }
  )
})

test_that("prepend appends at the beginning for empty list by default", {
  local_options(lifecycle_verbosity = "quiet")

  x <- list()
  expect_identical(
    x %>% prepend(1),
    x %>% c(1, .)
  )
})

test_that("prepend throws error if before param is neither NULL nor between 1 and length(x)", {
  local_options(lifecycle_verbosity = "quiet")

  expect_snapshot(prepend(list(), 1, before = 1), error = TRUE)
  x <- as.list(1:3)
  expect_snapshot(x %>% prepend(4, before = 0), error = TRUE)
  expect_snapshot(x %>% prepend(4, before = 4), error = TRUE)
})
