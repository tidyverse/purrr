context("prepend")

test_that("prepend is clearer version of merging with c()", {
  x <- 1:3
  expect_identical(
    x %>% prepend(4),
    x %>% c(4, .)
  )
  expect_identical(
    x %>% prepend(4, before = 3),
    x %>% {
      c(.[1:2], 4, .[3])
    }
  )
})

test_that("prepend appends at the beginning for empty list by default", {
  x <- list()
  expect_identical(
    x %>% prepend(1),
    x %>% c(1, .)
  )
})

test_that("prepend throws error if before param is neither NULL nor between 1 and length(x)", {
  expect_error(
    prepend(list(), 1, before = 1),
    "is.null(before) || (before > 0 && before <= n) is not TRUE"
  )
  x <- as.list(1:3)
  expect_error(
    x %>% prepend(4, before = 0),
    "is.null(before) || (before > 0 && before <= n) is not TRUE"
  )
  expect_error(
    x %>% prepend(4, before = 4),
    "is.null(before) || (before > 0 && before <= n) is not TRUE"
  )
})
