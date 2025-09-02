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

test_that("works with vctrs records (#963)", {
  x <- new_rcrd(list(x = c(1, 2), y = c("a", "b")))
  out <- list(new_rcrd(list(x = 1, y = "a")), new_rcrd(list(x = 2, y = "b")))
  expect_identical(map(x, identity), out)
})

test_that("works with matrices/arrays (#970)", {
  expect_identical(
    map_int(matrix(1:4, nrow = 2), identity),
    1:4
  )
})

test_that("all inform about location of problem", {
  fail_at_3 <- function(x, bad) {
    if (x == 3) bad else x
  }

  expect_snapshot(error = TRUE, {
    map_int(1:3, ~ fail_at_3(.x, 2:1))
    map_int(1:3, ~ fail_at_3(.x, "x"))
    map(1:3, ~ fail_at_3(.x, stop("Doesn't work")))
  })

  cnd <- catch_cnd(map(1:3, ~ fail_at_3(.x, stop("Doesn't work"))))
  expect_s3_class(cnd, "purrr_error_indexed")
  expect_equal(cnd$location, 3)
  expect_equal(cnd$name, NULL)
})

test_that("error location uses name if present", {
  fail_at_3 <- function(x, bad) {
    if (x == 3) bad else x
  }

  expect_snapshot(error = TRUE, {
    map_int(c(a = 1, b = 2, c = 3), ~ fail_at_3(.x, stop("Error")))
    map_int(c(a = 1, b = 2, 3), ~ fail_at_3(.x, stop("Error")))
  })

  cnd <- catch_cnd(map(c(1, 2, c = 3), ~ fail_at_3(.x, stop("Doesn't work"))))
  expect_s3_class(cnd, "purrr_error_indexed")
  expect_equal(cnd$location, 3)
  expect_equal(cnd$name, "c")
})

test_that("0 length input gives 0 length output", {
  expect_equal(map(list(), identity), list())
  expect_equal(map(NULL, identity), list())

  expect_equal(map_lgl(NULL, identity), logical())
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

test_that("primitive dispatch correctly", {
  local_bindings(.env = global_env(), as.character.test_class = function(x) {
    "dispatched!"
  })
  x <- structure(list(), class = "test_class")
  expect_identical(
    map(list(x, x), as.character),
    list("dispatched!", "dispatched!")
  )
})

test_that("map() with empty input copies names", {
  named_list <- named(list())
  expect_identical(map(named_list, identity), named(list()))
  expect_identical(map_lgl(named_list, identity), named(lgl()))
  expect_identical(map_int(named_list, identity), named(int()))
  expect_identical(map_dbl(named_list, identity), named(dbl()))
  expect_identical(map_chr(named_list, identity), named(chr()))
})


# map_vec -----------------------------------------------------------------

test_that("still iterates using [[", {
  df <- data.frame(x = 1, y = 2, z = 3)
  expect_equal(map_vec(df, length), c(x = 1, y = 1, z = 1))
})

test_that("requires output be length 1 and have common type", {
  expect_snapshot(error = TRUE, {
    map_vec(1:2, ~ rep(1, .x))
    map_vec(1:2, ~ if (.x == 1) factor("x") else 1)
  })
})

test_that("row-binds data frame output", {
  out <- map_vec(1:2, ~ data.frame(x = .x))
  expect_equal(out, data.frame(x = 1:2))
})

test_that("concatenates list output", {
  out <- map_vec(1:2, ~ list(.x))
  expect_equal(out, list(1, 2))
})

test_that("can enforce .ptype", {
  expect_snapshot(error = TRUE, {
    map_vec(1:2, ~ factor("x"), .ptype = integer())
  })
})
