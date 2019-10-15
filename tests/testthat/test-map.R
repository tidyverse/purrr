context("map")

test_that("preserves names", {
  out <- map(list(x = 1, y = 2), identity)
  expect_equal(names(out), c("x", "y"))
})

test_that("creates simple call", {
  out <- map(1, function(x) sys.call())[[1]]
  expect_equal(out, quote(.f(.x[[i]], ...)))
})

test_that("fails on non-vectors", {
  expect_bad_type_error(map(environment(), identity), "`.x` must be a vector, not an environment")
  expect_bad_type_error(map(quote(a), identity), "`.x` must be a vector, not a symbol")
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
  expect_identical(map_int(as.raw(0:1), identity), 0:1)

  expect_identical(map_dbl(c(FALSE, TRUE), identity), c(0, 1))
  expect_identical(map_dbl(c(1L, 2L), identity), c(1, 2))
  expect_identical(map_dbl(as.raw(0:1), identity), c(0, 1))

  expect_identical(map_chr(c(FALSE, TRUE), identity), c("FALSE", "TRUE"))
  expect_identical(map_chr(c(1L, 2L), identity), c("1", "2"))
  expect_identical(map_chr(c(1.5, 2.5), identity), c("1.500000", "2.500000"))
  expect_identical(map_chr(as.raw(0:255), identity), as.character(as.raw(0:255)))
})

test_that("map_raw",{
  expect_equal(map_raw("a", charToRaw), charToRaw("a"))
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
  skip_if_not_installed("dplyr")
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
  skip_if_not_installed("tibble")
  df <- tibble::tibble(x = 1, y = "a")
  expect_identical(map_if(df, is.character, ~"out"), list(x = 1, y = "out"))
  expect_identical(map_at(df, 1, ~"out"), list(x = "out", y = "a"))
})

test_that("map_at() works with tidyselect", {
  skip_if_not_installed("tidyselect")
  x <- list(a = "b", b = "c", aa = "bb")
  one <- map_at(x, vars(a), toupper)
  expect_identical(one$a, "B")
  expect_identical(one$aa, "bb")
  two <- map_at(x, vars(tidyselect::contains("a")), toupper)
  expect_identical(two$a, "B")
  expect_identical(two$aa, "BB")
})

test_that("negative .at omits locations", {
  x <- c(1, 2, 3)
  out <- map_at(x, -1, ~ .x * 2)
  expect_equal(out, list(1, 4, 6))
})

test_that("map works with calls and pairlists", {
  out <- map(quote(f(x)), ~ quote(z))
  expect_equal(out, list(quote(z), quote(z)))

  out <- map(pairlist(1, 2), ~ . + 1)
  expect_equal(out, list(2, 3))
})

test_that("primitive dispatch correctly", {
  scoped_bindings(.env = global_env(),
    as.character.test_class = function(x) "dispatched!"
  )
  x <- structure(list(), class = "test_class")
  expect_identical(map(list(x, x), as.character), list("dispatched!", "dispatched!"))
})

test_that("map_if requires predicate functions", {
  expect_error(map_if(1:3, ~ NA, ~ "foo"), ", not a missing value")
})

test_that("`.else` maps false elements", {
  expect_identical(map_if(-1:1, ~ .x > 0, paste, .else = ~ "bar", "suffix"), list("bar", "bar", "1 suffix"))
})

test_that("map_depth modifies values at specified depth", {
  x1 <- list(list(list(1:3, 4:6)))

  expect_equal(map_depth(x1, 0, length), 1)
  expect_equal(map_depth(x1, 1, length), list(1))
  expect_equal(map_depth(x1, 2, length), list(list(2)))
  expect_equal(map_depth(x1, 3, length), list(list(list(3, 3))))
  expect_equal(map_depth(x1, -1, length), list(list(list(3, 3))))
  expect_equal(map_depth(x1, 4, length), list(list(list(list(1, 1, 1), list(1, 1, 1)))))
  expect_error(map_depth(x1, 5, length), "List not deep enough") #FIXME
  expect_error(map_depth(x1, 6, length), "List not deep enough")
  expect_error(map_depth(x1, -5, length), "Invalid depth")
})

test_that("map_depth() with .ragged = TRUE operates on leaves", {
  x1 <- list(
    list(1),
    list(list(2))
  )
  exp <- list(
    list(list(2)),
    list(list(3))
  )

  expect_equal(map_depth(x1, 3, ~ . + 1, .ragged = TRUE), exp)
  expect_equal(map_depth(x1, -1, ~ . + 1, .ragged = TRUE), exp)
  # .ragged should be TRUE is .depth < 0
  expect_equal(map_depth(x1, -1, ~ . + 1), exp)
})

test_that("error message follows style guide when result is not length 1", {
  x <- list(list(a = 1L), list(a = 2:3))
  expect_bad_element_vector_error(
    purrr::map_int(x, "a"),
    "Result 2 must be a single integer, not an integer vector of length 2"
  )
})

test_that("map() with empty input copies names", {
  named_list <- named(list())
  expect_identical(    map(named_list, identity), named(list()))
  expect_identical(map_lgl(named_list, identity), named(lgl()))
  expect_identical(map_int(named_list, identity), named(int()))
  expect_identical(map_dbl(named_list, identity), named(dbl()))
  expect_identical(map_chr(named_list, identity), named(chr()))
  expect_identical(map_raw(named_list, identity), named(raw()))
})
