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
  expect_equal(
    out,
    list(
      result = 4,
      output = "1",
      warnings = "3",
      messages = "2"
    )
  )
})
