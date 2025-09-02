test_that("x and y mapped to first and second argument", {
  expect_equal(map2(1, 2, function(x, y) x), list(1))
  expect_equal(map2(1, 2, function(x, y) y), list(2))
})

test_that("variants return expected types", {
  x <- list(1, 2, 3)
  expect_true(is_bare_list(map2(x, 0, ~1)))
  expect_true(is_bare_logical(map2_lgl(x, 0, ~TRUE)))
  expect_true(is_bare_integer(map2_int(x, 0, ~1)))
  expect_true(is_bare_double(map2_dbl(x, 0, ~1.5)))
  expect_true(is_bare_character(map2_chr(x, 0, ~"x")))
  expect_equal(walk2(x, 0, ~"x"), x)

  x <- list(FALSE, 1L, 1)
  expect_true(is_bare_double(map2_vec(x, 0, ~.x)))
})

test_that("0 length input gives 0 length output", {
  expect_equal(map2(list(), list(), identity), list())
  expect_equal(map2(NULL, NULL, identity), list())

  expect_equal(map2_lgl(NULL, NULL, identity), logical())
})

test_that("verifies result types and length", {
  expect_snapshot(error = TRUE, {
    map2_int(1, 1, ~"x")
    map2_int(1, 1, ~ 1:2)
    map2_vec(1, 1, ~1, .ptype = character())
  })
})

test_that("works with vctrs records (#963)", {
  x <- new_rcrd(list(x = c(1, 2), y = c("a", "b")))
  out <- list(new_rcrd(list(x = 1, y = "a")), new_rcrd(list(x = 2, y = "b")))
  expect_identical(map2(x, 1, ~.x), out)
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

  expect_snapshot(error = TRUE, {
    map2(1:2, 1:3, `+`)
    map2(1:2, integer(), `+`)
  })
})

test_that("only takes names from x", {
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

test_that("don't evaluate symbolic objects (#428)", {
  map2(exprs(1 + 2), NA, ~ expect_identical(.x, quote(1 + 2)))
  walk2(exprs(1 + 2), NA, ~ expect_identical(.x, quote(1 + 2)))
})
