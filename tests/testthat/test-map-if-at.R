test_that("map_if() and map_at() always return a list", {
  skip_if_not_installed("tibble")
  df <- tibble::tibble(x = 1, y = "a")
  expect_identical(
    map_if(df, is.character, \(.x) "out"),
    list(x = 1, y = "out")
  )
  expect_identical(map_at(df, 1, \(.x) "out"), list(x = "out", y = "a"))
})

test_that("negative .at omits locations", {
  x <- c(1, 2, 3)
  out <- map_at(x, -1, \(.x) .x * 2)
  expect_equal(out, list(1, 4, 6))
})

test_that("map_if requires predicate functions", {
  expect_snapshot(map_if(1:3, \(.x) NA, \(.x) "foo"), error = TRUE)
})

test_that("`.else` maps false elements", {
  expect_identical(
    map_if(-1:1, \(.x) .x > 0, paste, .else = \(.x, ...) "bar", "suffix"),
    list("bar", "bar", "1 suffix")
  )
})

test_that("map_if() shows progress", {
  expect_no_error(map_if(1:3, is.numeric, identity, .progress = TRUE))
})
