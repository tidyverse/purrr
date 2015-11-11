context("map2")


test_that("map2 inputs must be same length", {
  expect_error(map2(1:3, 2:3, identity), "different lengths")
})

test_that("map2 vectorised inputs of length 1", {
  expect_equal(map2(1:2, 1, `+`), list(2, 3))
  expect_equal(map2(1, 1:2, `+`), list(2, 3))
})

test_that("map2 takes names from x, then y", {
  x1 <- 1:3
  x2 <- set_names(x1)

  expect_equal(names(map2(x1, x2, `+`)), names(x2))
  expect_equal(names(map2(x2, x1, `+`)), names(x2))
})

test_that("map2() and map3() return a data frame when given one", {
  df <- data.frame(a = c("a", "b"), b = c("a", "b"))

  out_map2 <- map2(df, names(df), function(x, y) paste(x, y))
  out_map3 <- map3(df, names(df), c("1", "2"), function(x, y, z) paste(x, y, z))

  expect_is(out_map2, "data.frame")
  expect_is(out_map3, "data.frame")
})
