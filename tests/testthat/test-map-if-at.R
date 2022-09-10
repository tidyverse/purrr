test_that("map_if() and map_at() always return a list", {
  skip_if_not_installed("tibble")
  df <- tibble::tibble(x = 1, y = "a")
  expect_identical(map_if(df, is.character, ~"out"), list(x = 1, y = "out"))
  expect_identical(map_at(df, 1, ~"out"), list(x = "out", y = "a"))
})

test_that("map_at() works with tidyselect", {
  skip_if_not_installed("tidyselect")
  local_options(lifecycle_verbosity = "quiet")

  x <- list(a = "b", b = "c", aa = "bb")
  one <- map_at(x, vars(a), toupper)
  expect_identical(one$a, "B")
  expect_identical(one$aa, "bb")
  two <- map_at(x, vars(tidyselect::contains("a")), toupper)
  expect_identical(two$a, "B")
  expect_identical(two$aa, "BB")
})

test_that("negative .at omits locations", {
  x <- c(1, 2, 3)
  out <- map_at(x, -1, ~ .x * 2)
  expect_equal(out, list(1, 4, 6))
})

test_that("map_if requires predicate functions", {
  expect_snapshot(map_if(1:3, ~ NA, ~ "foo"), error = TRUE)
})

test_that("`.else` maps false elements", {
  expect_identical(map_if(-1:1, ~ .x > 0, paste, .else = ~ "bar", "suffix"), list("bar", "bar", "1 suffix"))
})


test_that("map_depth modifies values at specified depth", {
  x1 <- list(list(list(1:3, 4:6)))

  expect_equal(map_depth(x1, 0, length), 1)
  expect_equal(map_depth(x1, 1, length), list(1))
  expect_equal(map_depth(x1, 2, length), list(list(2)))
  expect_equal(map_depth(x1, 3, length), list(list(list(3, 3))))
  expect_equal(map_depth(x1, -1, length), list(list(list(3, 3))))
  expect_equal(map_depth(x1, 4, length), list(list(list(list(1, 1, 1), list(1, 1, 1)))))
  expect_error(map_depth(x1, 5, length), "List not deep enough") #FIXME
  expect_error(map_depth(x1, 6, length), "List not deep enough")
  expect_error(map_depth(x1, -5, length), "Invalid depth")
})

test_that("map_depth() with .ragged = TRUE operates on leaves", {
  x1 <- list(
    list(1),
    list(list(2))
  )
  exp <- list(
    list(list(2)),
    list(list(3))
  )

  expect_equal(map_depth(x1, 3, ~ . + 1, .ragged = TRUE), exp)
  expect_equal(map_depth(x1, -1, ~ . + 1, .ragged = TRUE), exp)
  # .ragged should be TRUE is .depth < 0
  expect_equal(map_depth(x1, -1, ~ . + 1), exp)
})
