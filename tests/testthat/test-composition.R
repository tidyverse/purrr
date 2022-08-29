test_that("lift_* is deprecated", {
  expect_snapshot({
    . <- lift(mean)
    . <- lift_dv(mean)
    . <- lift_vl(mean)
    . <- lift_vd(mean)
    . <- lift_ld(mean)
    . <- lift_lv(mean)
  })
})

test_that("lift_dl and lift_ld are inverses of each other", {
  local_options(lifecycle_verbosity = "quiet")

  expect_identical(
    sum %>%
      lift_dl(.unnamed = TRUE) %>%
      do.call(list(3, NA, 4, na.rm = TRUE)),
    sum %>%
      lift_dl() %>%
      lift_ld() %>%
      exec(3, NA, 4, na.rm = TRUE)
  )
})

test_that("lift_dv is from ... to c(...)", {
  local_options(lifecycle_verbosity = "quiet")
  expect_equal(lift_dv(range, .unnamed = TRUE)(1:10), c(1, 10))
})

test_that("lift_vd is from c(...) to ...", {
  local_options(lifecycle_verbosity = "quiet")
  expect_equal(lift_vd(mean)(1, 2), 1.5)
})

test_that("lift_vl is from c(...) to list(...)", {
  local_options(lifecycle_verbosity = "quiet")
  expect_equal(lift_vl(mean)(list(1, 2)), 1.5)
})

test_that("lift_lv is from list(...) to c(...)", {
  local_options(lifecycle_verbosity = "quiet")
  glue <- function(l) {
    if (!is.list(l)) stop("not a list")
    l %>% do.call(paste, .)
  }
  expect_identical(lift_lv(glue)(letters), paste(letters, collapse = " "))
})
