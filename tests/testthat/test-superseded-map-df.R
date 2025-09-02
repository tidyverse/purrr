test_that("row and column binding work", {
  skip_if_not_installed("dplyr")
  local_name_repair_quiet()

  mtcar_mod <- mtcars |>
    split(mtcars$cyl) |>
    map(~ lm(mpg ~ wt, data = .x))

  f_coef <- function(x) as.data.frame(t(as.matrix(coef(x))))
  expect_length(mtcar_mod |> map_dfr(f_coef), 2)
  expect_length(mtcar_mod |> map_dfc(f_coef), 6)
})

test_that("data frame imap works", {
  skip_if_not_installed("dplyr")
  x <- set_names(1:3)
  expect_identical(imap_dfc(x, paste), imap_dfr(x, paste))
})

test_that("outputs are suffixes have correct type for data frames", {
  skip_if_not_installed("dplyr")
  local_name_repair_quiet()

  local_options(rlang_message_verbosity = "quiet")
  x <- 1:3
  expect_s3_class(pmap_dfr(list(x), as.data.frame), "data.frame")
  expect_s3_class(pmap_dfc(list(x), as.data.frame), "data.frame")
})
