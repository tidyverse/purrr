context("lmap")

test_that("lmap output is list if input is list", {
  expect_is(lmap(as.list(mtcars), as.list), "list")
  skip_if_not_installed("tidyselect")
  x <- list(a = 1:4, b = letters[5:7], c = 8:9, d = letters[10])
  maybe_rep <- function(x) {
    n <- rpois(1, 2)
    out <- rep_len(x, n)
    if (length(out) > 0) {
      names(out) <- paste0(names(x), seq_len(n))
    }
    out
  }
  expect_is(lmap_at(x, vars(tidyselect::contains("a")), maybe_rep), "list")
})

test_that("lmap output is tibble if input is data frame", {
  skip_if_not_installed("tibble")
  expect_is(lmap(mtcars, as.list), "tbl_df")

  skip_if_not_installed("tidyselect")
  expect_is(lmap_at(mtcars, vars(tidyselect::contains("mpg")), ~ .x * 10), "tbl_df")
})

test_that("lmap_at can use tidyselect", {
  skip_if_not_installed("tidyselect")
  x <- lmap_at(mtcars, vars(tidyselect::contains("vs")), ~ .x + 10)
  expect_equal(x$vs[1], 10)
})

test_that("`.else` preserve-maps false elements", {
  out <- lmap_if(list(a = 1, b = "foo"), is.character, ~ list("foo", .x, .y), .else = ~ list("bar", .x, .y), "baz")
  exp <- set_names(list("bar", list(a = 1), "baz", "foo", list(b = "foo"), "baz"), rep("", 6))
  expect_identical(out, exp)
})
