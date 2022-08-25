test_that("lmap output is list if input is list", {
  expect_bare(lmap(as.list(mtcars), as.list), "list")

  x <- list(a = 1:4, b = letters[5:7], c = 8:9, d = letters[10])
  maybe_rep <- function(x) {
    n <- rpois(1, 2)
    out <- rep_len(x, n)
    if (length(out) > 0) {
      names(out) <- paste0(names(x), seq_len(n))
    }
    out
  }
  expect_bare(lmap_at(x, "a", maybe_rep), "list")
})

test_that("lmap output is tibble if input is data frame", {
  skip_if_not_installed("tibble")
  expect_s3_class(lmap(mtcars, as.list), "tbl_df")

  expect_s3_class(lmap_at(mtcars, "mpg", ~ .x * 10), "tbl_df")
})

test_that("lmap_at can use tidyselect", {
  skip_if_not_installed("tidyselect")
  options(lifecycle_verbosity = "quiet")

  skip_if_not_installed("tidyselect")
  x <- lmap_at(mtcars, vars(tidyselect::contains("vs")), ~ .x + 10)
  expect_equal(x$vs[1], 10)
})

test_that("`.else` preserve-maps false elements", {
  out <- lmap_if(list(a = 1, b = "foo"), is.character, ~ list("foo", .x, .y), .else = ~ list("bar", .x, .y), "baz")
  exp <- set_names(list("bar", list(a = 1), "baz", "foo", list(b = "foo"), "baz"), rep("", 6))
  expect_identical(out, exp)
})
