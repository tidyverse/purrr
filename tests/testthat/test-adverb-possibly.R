test_that("possibly returns default value on failure", {
  expect_identical(possibly(log, NA_real_)("a"), NA_real_)
})

test_that("possibly emits a message on failure if quiet = FALSE", {
  f <- function(...) stop("tilt")
  expect_message(
    {
      possibly(f, NA_real_, quiet = FALSE)()
    },
    regexp = "tilt"
  )
})
