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
  expect_snapshot(map_if(1:3, ~NA, ~"foo"), error = TRUE)
})

test_that("`.else` maps false elements", {
  expect_identical(
    map_if(-1:1, ~ .x > 0, paste, .else = ~"bar", "suffix"),
    list("bar", "bar", "1 suffix")
  )
})
