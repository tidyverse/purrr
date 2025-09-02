test_that("lmap output is list if input is list", {
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

test_that("lmap() returns a data frame if input is a data frame", {
  df <- data.frame(x = 1, y = 2)

  # as.data.frame() handles repeated names
  out <- lmap(df, function(x) as.data.frame(rep(x, 2)))
  expect_equal(out, data.frame(x = 1, x.1 = 1, y = 2, y.1 = 2))

  # even if we return bare lists
  out <- lmap(df, function(x) as.list(rep(x, 2)))
  expect_equal(out, data.frame(x = 1, x.1 = 1, y = 2, y.1 = 2))
})

test_that("lmap() can increase and decrease elements", {
  out <- lmap(list(0, 1, 2), ~ as.list(rep(.x, .x)))
  expect_equal(out, list(1, 2, 2))
})

test_that("lmap_at() only affects selected elements", {
  out <- lmap_at(list(0, 1, 2), c(1, 3), ~ as.list(rep(.x, .x)))
  expect_equal(out, list(1, 2, 2))

  out <- lmap_at(list(0, 1, 2), c(2, 3), ~ as.list(rep(.x, .x)))
  expect_equal(out, list(0, 1, 2, 2))
})

test_that("lmap_at can use tidyselect", {
  skip_if_not_installed("tidyselect")
  local_options(lifecycle_verbosity = "quiet")

  x <- lmap_at(mtcars, vars(tidyselect::contains("vs")), ~ .x + 10)
  expect_equal(x$vs[1], 10)
})

test_that("`.else` preserves false elements", {
  x <- list("a", 99)
  out <- lmap_if(x, is.character, ~ list(1, 2), .else = ~ list(3, 4))
  expect_equal(out, list(1, 2, 3, 4))
})

test_that("validates inputs", {
  expect_snapshot(error = TRUE, {
    lmap(list(1), ~1)
    lmap(list(1), environment())
    lmap(list(1), ~1, .else = environment())
  })
})
