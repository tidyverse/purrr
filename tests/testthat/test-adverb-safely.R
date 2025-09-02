test_that("safely has NULL error when successful", {
  out <- safely(log10)(10)
  expect_equal(out, list(result = 1, error = NULL))
})

test_that("safely has NULL result on failure", {
  out <- safely(log10)("a")
  expect_equal(out$result, NULL)
  expect_equal(
    out$error$message,
    "non-numeric argument to mathematical function"
  )
})
