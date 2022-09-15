test_that("variants return expected types", {
  x <- list(1, 2, 3)
  expect_true(is_bare_list(map2(x, 0, ~ 1)))
  expect_true(is_bare_logical(map2_lgl(x, 0, ~ TRUE)))
  expect_true(is_bare_integer(map2_int(x, 0, ~ 1)))
  expect_true(is_bare_double(map2_dbl(x, 0, ~ 1.5)))
  expect_true(is_bare_character(map2_chr(x, 0, ~ "x")))
  expect_equal(walk2(x, 0, ~ "x"), x)

  x <- list(FALSE, 1L, 1)
  expect_true(is_bare_double(map2_vec(x, 0, ~ .x)))
})

test_that("verifies result types and length", {
  expect_snapshot(error = TRUE, {
    map2_int(1, 1, ~ "x")
    map2_int(1, 1, ~ 1:2)
  })
})

test_that("requires vector inputs", {
  expect_snapshot(error = TRUE, {
    map2(environment(), "a", identity)
    map2("a", environment(), "a", identity)
  })
})

test_that("recycles inputs", {
  expect_equal(map2(1:2, 1, `+`), list(2, 3))
  expect_equal(map2(integer(), 1, `+`), list())
  expect_equal(map2(NULL, 1, `+`), list())

  expect_snapshot(map2(1:2, 1:3, `+`), error = TRUE)
})

test_that("takes only names from x", {
  x1 <- 1:2
  x2 <- set_names(x1, letters[1:2])
  x3 <- set_names(x1, "")

  expect_named(map2(x1, 1, `+`), NULL)
  expect_named(map2(x2, 1, `+`), c("a", "b"))
  expect_named(map2(x3, 1, `+`), c("", ""))

  # recycling them if needed (#779)
  x4 <- c(a = 1)
  expect_named(map2(x4, 1:2, `+`), c("a", "a"))
})
