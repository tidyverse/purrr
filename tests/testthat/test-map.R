context("map")

test_that("preserves names", {
  out <- map(list(x = 1, y = 2), identity)
  expect_equal(names(out), c("x", "y"))
})

test_that("creates simple call", {
  out <- map(1, function(x) sys.call())[[1]]
  expect_identical(out, quote(.f(.x[[i]], ...)))
})

test_that("fails on non-vectors", {
  expect_error(map(environment(), identity), "not a vector")
  expect_error(map(quote(a), identity), "not a vector")
})

test_that("0 length input gives 0 length output", {
  out1 <- map(list(), identity)
  expect_equal(out1, list())

  out2 <- map(NULL, identity)
  expect_equal(out2, list())
})

test_that("map() always returns a list", {
  expect_is(map(mtcars, mean), "list")
})

test_that("types automatically coerced upwards", {
  expect_identical(map_int(c(FALSE, TRUE), identity), c(0L, 1L))

  expect_identical(map_dbl(c(FALSE, TRUE), identity), c(0, 1))
  expect_identical(map_dbl(c(1L, 2L), identity), c(1, 2))

  expect_identical(map_chr(c(FALSE, TRUE), identity), c("FALSE", "TRUE"))
  expect_identical(map_chr(c(1L, 2L), identity), c("1", "2"))
  expect_identical(map_chr(c(1.5, 2.5), identity), c("1.500000", "2.500000"))
})

test_that("logical and integer NA become correct double NA", {
  expect_identical(
    map_dbl(list(NA, NA_integer_), identity),
    c(NA_real_, NA_real_)
  )
})

test_that("map forces arguments in same way as base R", {
  f_map <- map(1:2, function(i) function(x) x + i)
  f_base <- lapply(1:2, function(i) function(x) x + i)

  expect_equal(f_map[[1]](0), f_base[[1]](0))
  expect_equal(f_map[[2]](0), f_base[[2]](0))
})

test_that("row and column binding work", {
  mtcar_mod <- mtcars %>%
    split(.$cyl) %>%
    map(~ lm(mpg ~ wt, data = .x))
  f_coef <- function(x) as.data.frame(t(as.matrix(coef(x))))
  expect_length(mtcar_mod %>% map_dfr(f_coef), 2)
  expect_length(mtcar_mod %>% map_dfc(f_coef), 6)
})

test_that("walk is used for side-effects", {
  expect_output(walk(1:3, str))
})

test_that("map_if() and map_at() always return a list", {
  df <- tibble::tibble(x = 1, y = "a")
  expect_identical(map_if(df, is.character, ~"out"), list(x = 1, y = "out"))
  expect_identical(map_at(df, 1, ~"out"), list(x = "out", y = "a"))
})
