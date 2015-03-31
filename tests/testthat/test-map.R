context("map")

test_that("map() returns a data frame when given one", {
  df <- data.frame(a = c("a", "b"), b = c("a", "b"))

  out1 <- map(df, as.character)
  out2 <- map(df, `[[`, 1)

  expect_is(out1, "data.frame")
  expect_is(out2, "data.frame")
})

test_that("map2() and map3() return a data frame when given one", {
  df <- data.frame(a = c("a", "b"), b = c("a", "b"))

  out_map2 <- map2(df, names(df), function(x, y) paste(x, y))
  out_map3 <- map3(df, names(df), c("1", "2"), function(x, y, z) paste(x, y, z))

  expect_is(out_map2, "data.frame")
  expect_is(out_map3, "data.frame")
})

test_that("map2, map3, map_n recognise ...", {
  ll <- list(x = c(1,2,3), y = c(4,5,6))
  foo <- function(x, y, z) {
    return(x + y + mean(z))
  }
  out_map <- map_n(ll, foo, z = c(1:100))
  expect_is(out_map, "list")
  expect_equal(length(out_map), 3)
  expect_equal(sum(unlist(list(55.5, 57.5, 59.5))), 172.5)
})
