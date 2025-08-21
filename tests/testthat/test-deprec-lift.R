test_that("lift_dl and lift_ld are inverses of each other", {
  options(lifecycle_verbosity = "quiet")

  expect_identical(
    sum |>
      lift_dl(.unnamed = TRUE) |>
      do.call(list(3, NA, 4, na.rm = TRUE)),
    sum |>
      lift_dl() |>
      lift_ld() |>
      exec(3, NA, 4, na.rm = TRUE)
  )
})

test_that("lift_dv is from ... to c(...)", {
  options(lifecycle_verbosity = "quiet")

  expect_equal(lift_dv(range, .unnamed = TRUE)(1:10), c(1, 10))
})

test_that("lift_vd is from c(...) to ...", {
  options(lifecycle_verbosity = "quiet")

  expect_equal(lift_vd(mean)(1, 2), 1.5)
})

test_that("lift_vl is from c(...) to list(...)", {
  options(lifecycle_verbosity = "quiet")

  expect_equal(lift_vl(mean)(list(1, 2)), 1.5)
})

test_that("lift_lv is from list(...) to c(...)", {
  options(lifecycle_verbosity = "quiet")

  glue <- function(l) {
    if (!is.list(l)) {
      stop("not a list")
    }
    do.call(paste, l)
  }
  expect_identical(lift_lv(glue)(letters), paste(letters, collapse = " "))
})


test_that("lift functions are deprecated", {
  expect_snapshot({
    . <- lift_dl(function() {})
    . <- lift_dv(function() {})
    . <- lift_vl(function() {})
    . <- lift_vd(function() {})
    . <- lift_ld(function() {})
    . <- lift_lv(function() {})
  })
})
