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
