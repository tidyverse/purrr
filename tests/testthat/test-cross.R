context("cross")

test_that("data frame is returned when given one to cross", {
  l <- list(a = 1:3, b = 4:6)
  df <- data.frame(a = 1:3, b = 4:6)

  out1 <- cross_n(l) %>% setNames(seq_along(.))
  out2 <- cross_n(df) %>% as.list()

  expect_equal(out1, out2)
})

test_that("long format corresponds to expand.grid output", {
  x <- data.frame(a = 1:3, b = 4:9)

  out1 <- cross_n(x, .wide = FALSE) %>% as.data.frame()
  out2 <- expand.grid(x, KEEP.OUT.ATTRS = FALSE)

  expect_equal(out1, out2)
})

test_that("filtering works", {
  filter <- function(x, y) x >= y
  out <- cross(1:3, 1:3, .filter = filter)
  expect_equal(out, list(list(1, 2), list(1, 3), list(2, 3)))
})
