context("output")

test_that("safely has NULL error when successful", {
  out <- safely(log10)(10)
  expect_equal(out, list(result = 1, error = NULL))
})

test_that("safely has NULL result on failure", {
  out <- safely(log10)("a")
  expect_equal(out$result, NULL)
  expect_equal(out$error$message,
    "non-numeric argument to mathematical function")
})


test_that("quietly captures output", {
  f <- function() {
    cat(1)
    message(2, appendLF = FALSE)
    warning(3)
    4
  }
  expect_output(quietly(f)(), NA)
  expect_message(quietly(f)(), NA)
  expect_warning(quietly(f)(), NA)

  out <- quietly(f)()
  expect_equal(out, list(
    result = 4,
    output = "1",
    warnings = "3",
    messages = "2"
  ))
})

test_that("possibly returns default value on failure", {
  expect_identical(possibly(log, NA_real_)("a"), NA_real_)
})

test_that("auto_browse() not intended for primitive functions", {
  expect_error(auto_browse(log)(NULL), "primitive functions")
  expect_error(auto_browse(identity)(NULL), NA)
})
