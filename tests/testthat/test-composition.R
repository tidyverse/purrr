context("composition")

test_that("lift_dl and lift_ld are inverses of each other", {
  expect_identical(
    sum %>%
      lift_dl(.unnamed = TRUE) %>%
      invoke(list(3, NA, 4, na.rm = TRUE)),
    sum %>%
      lift_dl() %>%
      lift_ld() %>%
      invoke(3, NA, 4, na.rm = TRUE)
  )
})

test_that("lift_dv is from ... to c(...)", {
  expect_equal(lift_dv(range, .unnamed = TRUE)(1:10), c(1, 10))
})

test_that("lift_vd is from c(...) to ...", {
  expect_equal(lift_vd(mean)(1, 2), 1.5)
})

test_that("lift_vl is from c(...) to list(...)", {
  expect_equal(lift_vl(mean)(list(1, 2)), 1.5)
})

test_that("lift_lv is from list(...) to c(...)", {
  glue <- function(l) {
    if (!is.list(l)) stop("not a list")
    l %>% invoke(paste, .)
  }
  expect_identical(lift_lv(glue)(letters), paste(letters, collapse = " "))
})
