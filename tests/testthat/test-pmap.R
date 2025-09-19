test_that(".f called with named arguments", {
  x <- list(x = 1, 2, y = 3)
  expect_equal(pmap(x, list), list(x))
})

test_that("... are passed after varying argumetns", {
  out <- pmap(list(x = 1:2), list, n = 1:2)
  expect_equal(
    out,
    list(
      list(x = 1, n = 1:2),
      list(x = 2, n = 1:2)
    )
  )
})

test_that("variants return expected types", {
  l <- list(list(1, 2, 3))
  expect_true(is_bare_list(pmap(l, ~1)))
  expect_true(is_bare_logical(pmap_lgl(l, ~TRUE)))
  expect_true(is_bare_integer(pmap_int(l, ~1)))
  expect_true(is_bare_double(pmap_dbl(l, ~1.5)))
  expect_true(is_bare_character(pmap_chr(l, ~"x")))
  expect_equal(pwalk(l, ~"x"), l)

  l <- list(list(FALSE, 1L, 1))
  expect_true(is_bare_double(pmap_vec(l, ~.x)))
})

test_that("verifies result types and length", {
  expect_snapshot(error = TRUE, {
    pmap_int(list(1), ~"x")
    pmap_int(list(1), ~ 1:2)
    pmap_vec(list(1), ~1, .ptype = character())
  })
})

test_that("0 length input gives 0 length output", {
  expect_equal(pmap(list(list(), list()), identity), list())
  expect_equal(pmap(list(NULL, NULL), identity), list())
  expect_equal(pmap(list(), identity), list())
  expect_equal(pmap(NULL, identity), list())

  expect_equal(pmap_lgl(NULL, identity), logical())
})


test_that("requires list of vectors", {
  expect_snapshot(error = TRUE, {
    pmap(environment(), identity)
    pmap(list(environment()), identity)
  })
})

test_that("recycles inputs", {
  expect_equal(pmap(list(1:2, 1), `+`), list(2, 3))
  expect_equal(pmap(list(integer(), 1), `+`), list())
  expect_equal(pmap(list(NULL, 1), `+`), list())

  expect_snapshot(error = TRUE, {
    pmap(list(1:2, 1:3), `+`)
    pmap(list(1:2, integer()), `+`)
  })
})

test_that("only takes names from x", {
  x1 <- 1:2
  x2 <- set_names(x1, letters[1:2])
  x3 <- set_names(x1, "")

  expect_named(pmap(list(x1, x2), `+`), NULL)
  expect_named(pmap(list(x2, x2), `+`), c("a", "b"))
  expect_named(pmap(list(x3, x2), `+`), c("", ""))

  # recycling them if needed (#779)
  x4 <- c(a = 1)
  expect_named(pmap(list(x4, 1:2), `+`), c("a", "a"))
})

test_that("avoid expensive [[ method on data frames", {
  local_bindings(
    `[[.mydf` = function(x, ...) stop("Not allowed!"),
    .env = global_env()
  )

  df <- data.frame(x = 1:2, y = 2:1)
  class(df) <- c("mydf", "data.frame")

  expect_equal(pmap(df, list), list(list(x = 1, y = 2), list(x = 2, y = 1)))
  expect_equal(pmap_lgl(df, ~TRUE), c(TRUE, TRUE))
  expect_equal(pmap_int(df, ~2), c(2, 2))
  expect_equal(pmap_dbl(df, ~3.5), c(3.5, 3.5))
  expect_equal(pmap_chr(df, ~"x"), c("x", "x"))
})

test_that("pmap works with empty lists", {
  expect_identical(pmap(list(), ~1), list())
})

test_that("preserves S3 class of input vectors (#358)", {
  date <- as.Date("2018-09-27")
  expect_equal(pmap(list(date), identity), list(date))
  expect_output(pwalk(list(date), print), format(date))
})

test_that("works with vctrs records (#963)", {
  x <- new_rcrd(list(x = c(1, 2), y = c("a", "b")))
  out <- list(new_rcrd(list(x = 1, y = "a")), new_rcrd(list(x = 2, y = "b")))
  expect_identical(pmap(list(x, 1, 1:2), ~.x), out)
})

test_that("don't evaluate symbolic objects (#428)", {
  pmap(list(exprs(1 + 2)), ~ expect_identical(.x, quote(1 + 2)))
  pwalk(list(exprs(1 + 2)), ~ expect_identical(.x, quote(1 + 2)))
})
