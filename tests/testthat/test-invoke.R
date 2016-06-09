context("invoke")

test_that("invoke_map() works with bare function", {
  data <- list(1:2, 3:4)

  expected <- invoke_map(list(paste), data)
  expect_equal(invoke_map(paste, data), expected)
  expect_equal(invoke_map("paste", data), expected)
  expect_equal(invoke_map_chr(paste, data), unlist(expected))

  expect_identical(invoke_map_dbl(`+`, data), c(3, 7))
  expect_identical(invoke_map_int(`+`, data), c(3L, 7L))
  expect_identical(invoke_map_lgl(`&&`, data), c(TRUE, TRUE))
})

test_that("invoke() evaluates expressions in the right environment", {
  shadowed_object <- letters
  shadowed_fun <- toupper
  expect_equal(invoke("shadowed_fun", list(quote(shadowed_object))), toupper(letters))
})

test_that("invoke_map() evaluates expressions in the right environment", {
  shadowed_object <- letters
  shadowed_fun <- toupper
  expect_equal(invoke_map("shadowed_fun", list(quote(shadowed_object))), list(toupper(letters)))
})

test_that("invoke() follows promises to find the evaluation env", {
  shadowed_object <- letters
  shadowed_fun <- toupper
  f1 <- function(x) {
    f2 <- function(x) purrr::invoke(x, list(quote(shadowed_object)))
    f2(x)
  }
  environment(f1) <- baseenv()
  expect_equal(f1("shadowed_fun"), toupper(letters))
})
