test_that("preserves names", {
  out <- map(list(x = 1, y = 2), identity)
  expect_equal(names(out), c("x", "y"))
})

test_that("creates simple call", {
  out <- map(1, function(x) sys.call())[[1]]
  expect_equal(out, quote(.f(.x[[i]], ...)))
})

test_that("fails on non-vectors", {
  expect_snapshot(map(environment(), identity), error = TRUE)
  expect_snapshot(map(quote(a), identity), error = TRUE)
})

test_that("0 length input gives 0 length output", {
  out1 <- map(list(), identity)
  expect_equal(out1, list())

  out2 <- map(NULL, identity)
  expect_equal(out2, list())
})

test_that("map() always returns a list", {
  expect_bare(map(mtcars, mean), "list")
})

test_that("types automatically coerced correctly", {
  expect_identical(map_lgl(c(NA, 0, 1), identity), c(NA, FALSE, TRUE))

  expect_identical(map_int(c(NA, FALSE, TRUE), identity), c(NA, 0L, 1L))
  expect_identical(map_int(c(NA, 1, 2), identity), c(NA, 1L, 2L))

  expect_identical(map_dbl(c(NA, FALSE, TRUE), identity), c(NA, 0, 1))
  expect_identical(map_dbl(c(NA, 1L, 2L), identity), c(NA, 1, 2))

  expect_identical(map_chr(NA, identity), NA_character_)
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

test_that("walk is used for side-effects", {
  expect_output(walk(1:3, str))
})

test_that("map works with calls and pairlists", {
  out <- map(quote(f(x)), ~ quote(z))
  expect_equal(out, list(quote(z), quote(z)))

  out <- map(pairlist(1, 2), ~ . + 1)
  expect_equal(out, list(2, 3))
})

test_that("primitive dispatch correctly", {
  local_bindings(.env = global_env(),
    as.character.test_class = function(x) "dispatched!"
  )
  x <- structure(list(), class = "test_class")
  expect_identical(map(list(x, x), as.character), list("dispatched!", "dispatched!"))
})


test_that("error message follows style guide when result is not length 1", {
  x <- list(list(a = 1L), list(a = 2:3))
  expect_snapshot(purrr::map_int(x, "a"), error = TRUE)
})

test_that("map() with empty input copies names", {
  named_list <- named(list())
  expect_identical(    map(named_list, identity), named(list()))
  expect_identical(map_lgl(named_list, identity), named(lgl()))
  expect_identical(map_int(named_list, identity), named(int()))
  expect_identical(map_dbl(named_list, identity), named(dbl()))
  expect_identical(map_chr(named_list, identity), named(chr()))
})
