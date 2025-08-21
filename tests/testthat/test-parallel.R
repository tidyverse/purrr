skip_if_not_installed("mirai")

test_that("All parallel map variants fall back to sequential with no daemons set", {
  expect_identical(
    map(list(x = 1, y = 2), in_parallel(\(x) list(x))),
    map(list(x = 1, y = 2), \(x) list(x))
  )
  expect_equal(map2(1, 2, in_parallel(\(x, y) x)), list(1))
  expect_identical(pmap(list(), in_parallel(~ 1)), list())
})

# set up daemons
mirai::daemons(1, dispatcher = FALSE) # ensures only 1 additional process on CRAN
on.exit(mirai::daemons(0), add = TRUE)

test_that("Can't use `...` in a parallel map", {
  expect_snapshot(error = TRUE, {
    map(list(x = 1, y = 2), in_parallel(\(x) list(x)), a = "wrong")
  })
})

test_that("Crated function environment is attached to search path", {
  # Use of `median()` without the `stats::` namespace
  expect_equal(map_dbl(1:2, in_parallel(\(x) median(c(1, 1, x)))), c(1, 1))
})

# map -----------------------------------------------------------------------

test_that("preserves names", {
  out <- map(list(x = 1, y = 2), in_parallel(\(x) identity(x)))
  expect_equal(names(out), c("x", "y"))
})

test_that("works with matrices/arrays (#970)", {
  expect_identical(
    map_int(matrix(1:4, nrow = 2), in_parallel(\(x) identity(x))),
    1:4
  )
})

test_that("all inform about location of problem", {
  skip_if_not_installed("carrier")

  expect_snapshot(error = TRUE, {
    map_int(1:3, in_parallel(\(x, bad = 2:1) if (x == 3) bad else x))
    map_int(1:3, in_parallel(\(x, bad = "x") if (x == 3) bad else x))
    map(
      1:3,
      in_parallel(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x)
    )
  })

  cnd <- catch_cnd(map(
    1:3,
    in_parallel(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x)
  ))
  expect_s3_class(cnd, "purrr_error_indexed")
  expect_equal(cnd$location, 3)
  expect_equal(cnd$name, NULL)
})

test_that("error location uses name if present", {
  skip_if_not_installed("carrier")

  expect_snapshot(error = TRUE, {
    map_int(
      c(a = 1, b = 2, c = 3),
      in_parallel(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x)
    )
    map_int(
      c(a = 1, b = 2, 3),
      in_parallel(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x)
    )
  })

  cnd <- catch_cnd(map(
    c(1, 2, c = 3),
    in_parallel(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x)
  ))
  expect_s3_class(cnd, "purrr_error_indexed")
  expect_equal(cnd$location, 3)
  expect_equal(cnd$name, "c")
})

test_that("0 length input gives 0 length output", {
  expect_equal(map(list(), in_parallel(\(x) identity(x))), list())
  expect_equal(map(NULL, in_parallel(\(x) identity(x))), list())

  expect_equal(map_lgl(NULL, in_parallel(\(x) identity(x))), logical())
})

test_that("map() always returns a list", {
  expect_bare(map(mtcars, in_parallel(\(x) mean(x))), "list")
})

test_that("types automatically coerced correctly", {
  expect_identical(
    map_lgl(c(NA, 0, 1), in_parallel(\(x) identity(x))),
    c(NA, FALSE, TRUE)
  )

  expect_identical(
    map_int(c(NA, FALSE, TRUE), in_parallel(\(x) identity(x))),
    c(NA, 0L, 1L)
  )
  expect_identical(
    map_int(c(NA, 1, 2), in_parallel(\(x) identity(x))),
    c(NA, 1L, 2L)
  )

  expect_identical(
    map_dbl(c(NA, FALSE, TRUE), in_parallel(\(x) identity(x))),
    c(NA, 0, 1)
  )
  expect_identical(
    map_dbl(c(NA, 1L, 2L), in_parallel(\(x) identity(x))),
    c(NA, 1, 2)
  )

  expect_identical(map_chr(NA, in_parallel(\(x) identity(x))), NA_character_)
})

test_that("logical and integer NA become correct double NA", {
  expect_identical(
    map_dbl(list(NA, NA_integer_), in_parallel(\(x) identity(x))),
    c(NA_real_, NA_real_)
  )
})

test_that("map forces arguments in same way as base R", {
  f_map <- map(1:2, in_parallel(\(i) \(x) x + i))
  f_base <- lapply(1:2, \(i) \(x) x + i)

  expect_equal(f_map[[1]](0), f_base[[1]](0))
  expect_equal(f_map[[2]](0), f_base[[2]](0))
})

test_that("primitive dispatch correctly", {
  skip_if_not_installed("carrier")

  method <- \(x) "dispatched!"
  x <- structure(list(), class = "test_class")
  expect_identical(
    map(
      list(x, x),
      in_parallel(\(x) as.character(x), as.character.test_class = method)
    ),
    list("dispatched!", "dispatched!")
  )
})

test_that("map() with empty input copies names", {
  named_list <- named(list())
  expect_identical(
    map(named_list, in_parallel(\(x) identity(x))),
    named(list())
  )
  expect_identical(
    map_lgl(named_list, in_parallel(\(x) identity(x))),
    named(lgl())
  )
  expect_identical(
    map_int(named_list, in_parallel(\(x) identity(x))),
    named(int())
  )
  expect_identical(
    map_dbl(named_list, in_parallel(\(x) identity(x))),
    named(dbl())
  )
  expect_identical(
    map_chr(named_list, in_parallel(\(x) identity(x))),
    named(chr())
  )
})

# map_vec ------------------------------------------------------------------

test_that("still iterates using [[", {
  df <- data.frame(x = 1, y = 2, z = 3)
  expect_equal(map_vec(df, in_parallel(\(x) length(x))), c(x = 1, y = 1, z = 1))
})

test_that("requires output be length 1 and have common type", {
  expect_snapshot(error = TRUE, {
    map_vec(1:2, in_parallel(~ rep(1, .x)))
    map_vec(1:2, in_parallel(~ if (.x == 1) factor("x") else 1))
  })
})

test_that("row-binds data frame output", {
  out <- map_vec(1:2, in_parallel(~ data.frame(x = .x)))
  expect_equal(out, data.frame(x = 1:2))
})

test_that("concatenates list output", {
  out <- map_vec(1:2, in_parallel(~ list(.x)))
  expect_equal(out, list(1, 2))
})

test_that("can enforce .ptype", {
  expect_snapshot(error = TRUE, {
    map_vec(1:2, in_parallel(~ factor("x")), .ptype = integer())
  })
})

# map2 ---------------------------------------------------------------------

test_that("x and y mapped to first and second argument", {
  expect_equal(map2(1, 2, in_parallel(\(x, y) x)), list(1))
  expect_equal(map2(1, 2, in_parallel(\(x, y) y)), list(2))
})

test_that("variants return expected types", {
  x <- list(1, 2, 3)
  expect_true(is_bare_list(map2(x, 0, in_parallel(~1))))
  expect_true(is_bare_logical(map2_lgl(x, 0, in_parallel(~TRUE))))
  expect_true(is_bare_integer(map2_int(x, 0, in_parallel(~1))))
  expect_true(is_bare_double(map2_dbl(x, 0, in_parallel(~1.5))))
  expect_true(is_bare_character(map2_chr(x, 0, in_parallel(~"x"))))
  expect_equal(walk2(x, 0, in_parallel(~"x")), x)

  x <- list(FALSE, 1L, 1)
  expect_true(is_bare_double(map2_vec(x, 0, ~.x, .parallel = TRUE)))
})

test_that("0 length input gives 0 length output", {
  expect_equal(map2(list(), list(), in_parallel(\(x) identity(x))), list())
  expect_equal(map2(NULL, NULL, in_parallel(\(x) identity(x))), list())

  expect_equal(map2_lgl(NULL, NULL, in_parallel(\(x) identity(x))), logical())
})

test_that("verifies result types and length", {
  expect_snapshot(error = TRUE, {
    map2_int(1, 1, in_parallel(~"x"))
    map2_int(1, 1, in_parallel(~ 1:2))
    map2_vec(1, 1, in_parallel(~1), .ptype = character())
  })
})

test_that("works with vctrs records (#963)", {
  x <- new_rcrd(list(x = c(1, 2), y = c("a", "b")))
  out <- list(new_rcrd(list(x = 1, y = "a")), new_rcrd(list(x = 2, y = "b")))
  expect_identical(map2(x, 1, in_parallel(~.x)), out)
})

test_that("requires vector inputs", {
  expect_snapshot(error = TRUE, {
    map2(environment(), "a", in_parallel(\(x) identity(x)))
    map2("a", environment(), "a", in_parallel(\(x) identity(x)))
  })
})

test_that("recycles inputs", {
  expect_equal(map2(1:2, 1, in_parallel(\(x, y) x + y)), list(2, 3))
  expect_equal(map2(integer(), 1, in_parallel(\(x, y) x + y)), list())
  expect_equal(map2(NULL, 1, in_parallel(\(x, y) x + y)), list())

  expect_snapshot(error = TRUE, {
    map2(1:2, 1:3, in_parallel(\(x, y) x + y))
    map2(1:2, integer(), in_parallel(\(x, y) x + y))
  })
})

test_that("only takes names from x", {
  x1 <- 1:2
  x2 <- set_names(x1, letters[1:2])
  x3 <- set_names(x1, "")

  expect_named(map2(x1, 1, in_parallel(\(x, y) x + y)), NULL)
  expect_named(map2(x2, 1, in_parallel(\(x, y) x + y)), c("a", "b"))
  expect_named(map2(x3, 1, in_parallel(\(x, y) x + y)), c("", ""))

  # recycling them if needed (#779)
  x4 <- c(a = 1)
  expect_named(map2(x4, 1:2, in_parallel(\(x, y) x + y)), c("a", "a"))
})

test_that("don't evaluate symbolic objects (#428)", {
  map2(
    exprs(1 + 2),
    NA,
    in_parallel(~ testthat::expect_identical(.x, quote(1 + 2)))
  )
  walk2(
    exprs(1 + 2),
    NA,
    in_parallel(~ testthat::expect_identical(.x, quote(1 + 2)))
  )
  expect_true(TRUE) # so the test is not deemed empty and skipped
})

# pmap ----------------------------------------------------------------------

test_that(".f called with named arguments", {
  x <- list(x = 1, 2, y = 3)
  expect_equal(pmap(x, in_parallel(\(...) list(...))), list(x))
})

# no longer tested as `...` are forbidden when `.parallel = TRUE`
#test_that("... are passed after varying argumetns", {
#  out <- pmap(list(x = 1:2), list, n = 1:2, .parallel = TRUE)
#  expect_equal(out, list(
#    list(x = 1, n = 1:2),
#    list(x = 2, n = 1:2)
#  ))
#})

test_that("variants return expected types", {
  l <- list(list(1, 2, 3))
  expect_true(is_bare_list(pmap(l, in_parallel(~1))))
  expect_true(is_bare_logical(pmap_lgl(l, in_parallel(~TRUE))))
  expect_true(is_bare_integer(pmap_int(l, in_parallel(~1))))
  expect_true(is_bare_double(pmap_dbl(l, in_parallel(~1.5))))
  expect_true(is_bare_character(pmap_chr(l, in_parallel(~"x"))))
  expect_equal(pwalk(l, in_parallel(~"x")), l)

  l <- list(list(FALSE, 1L, 1))
  expect_true(is_bare_double(pmap_vec(l, in_parallel(~.x))))
})

test_that("verifies result types and length", {
  expect_snapshot(error = TRUE, {
    pmap_int(list(1), in_parallel(~"x"))
    pmap_int(list(1), in_parallel(~ 1:2))
    pmap_vec(list(1), in_parallel(~1), .ptype = character())
  })
})

test_that("0 length input gives 0 length output", {
  expect_equal(
    pmap(list(list(), list()), in_parallel(\(x) identity(x))),
    list()
  )
  expect_equal(pmap(list(NULL, NULL), in_parallel(\(x) identity(x))), list())
  expect_equal(pmap(list(), in_parallel(\(x) identity(x))), list())
  expect_equal(pmap(NULL, in_parallel(\(x) identity(x))), list())

  expect_equal(pmap_lgl(NULL, in_parallel(\(x) identity(x))), logical())
})

test_that("requires list of vectors", {
  expect_snapshot(error = TRUE, {
    pmap(environment(), in_parallel(\(x) identity(x)))
    pmap(list(environment()), in_parallel(\(x) identity(x)))
  })
})

test_that("recycles inputs", {
  expect_equal(pmap(list(1:2, 1), in_parallel(\(x, y) x + y)), list(2, 3))
  expect_equal(pmap(list(integer(), 1), in_parallel(\(x, y) x + y)), list())
  expect_equal(pmap(list(NULL, 1), in_parallel(\(x, y) x + y)), list())

  expect_snapshot(error = TRUE, {
    pmap(list(1:2, 1:3), in_parallel(\(x, y) x + y))
    pmap(list(1:2, integer()), in_parallel(\(x, y) x + y))
  })
})

test_that("only takes names from x", {
  x1 <- 1:2
  x2 <- set_names(x1, letters[1:2])
  x3 <- set_names(x1, "")

  expect_named(pmap(list(x1, x2), in_parallel(\(x, y) x + y)), NULL)
  expect_named(pmap(list(x2, x2), in_parallel(\(x, y) x + y)), c("a", "b"))
  expect_named(pmap(list(x3, x2), in_parallel(\(x, y) x + y)), c("", ""))

  # recycling them if needed (#779)
  x4 <- c(a = 1)
  expect_named(pmap(list(x4, 1:2), in_parallel(\(x, y) x + y)), c("a", "a"))
})

test_that("avoid expensive [[ method on data frames", {
  local_bindings(
    `[[.mydf` = function(x, ...) stop("Not allowed!"),
    .env = global_env()
  )

  df <- data.frame(x = 1:2, y = 2:1)
  class(df) <- c("mydf", "data.frame")

  expect_equal(
    pmap(df, in_parallel(\(...) list(...), `[[.mydf` = `[[.mydf`)),
    list(list(x = 1, y = 2), list(x = 2, y = 1))
  )
  expect_equal(
    pmap_lgl(df, in_parallel(~TRUE, `[[.mydf` = `[[.mydf`)),
    c(TRUE, TRUE)
  )
  expect_equal(pmap_int(df, in_parallel(~2, `[[.mydf` = `[[.mydf`)), c(2, 2))
  expect_equal(
    pmap_dbl(df, in_parallel(~3.5, `[[.mydf` = `[[.mydf`)),
    c(3.5, 3.5)
  )
  expect_equal(
    pmap_chr(df, in_parallel(~"x", `[[.mydf` = `[[.mydf`)),
    c("x", "x")
  )
})

test_that("pmap works with empty lists", {
  expect_identical(pmap(list(), in_parallel(~1)), list())
})

test_that("preserves S3 class of input vectors (#358)", {
  date <- as.Date("2018-09-27")
  expect_identical(pmap(list(date), in_parallel(\(x) identity(x))), list(date))
})

test_that("works with vctrs records (#963)", {
  x <- new_rcrd(list(x = c(1, 2), y = c("a", "b")))
  out <- list(new_rcrd(list(x = 1, y = "a")), new_rcrd(list(x = 2, y = "b")))
  expect_identical(pmap(list(x, 1, 1:2), in_parallel(~.x)), out)
})

test_that("don't evaluate symbolic objects (#428)", {
  pmap(
    list(exprs(1 + 2)),
    in_parallel(~ testthat::expect_identical(.x, quote(1 + 2)))
  )
  pwalk(
    list(exprs(1 + 2)),
    in_parallel(~ testthat::expect_identical(.x, quote(1 + 2)))
  )
  expect_true(TRUE) # so the test is not deemed empty and skipped
})

# imap ----------------------------------------------------------------------

test_that("atomic vector imap works", {
  x <- 1:3 |> set_names()
  expect_true(all(imap_lgl(x, in_parallel(\(x, y) x == y))))
  expect_length(imap_chr(x, in_parallel(\(...) paste(...))), 3)
  expect_equal(imap_int(x, in_parallel(~ .x + as.integer(.y))), x * 2)
  expect_equal(imap_dbl(x, in_parallel(~ .x + as.numeric(.y))), x * 2)
  expect_equal(imap_vec(x, in_parallel(~ .x + as.numeric(.y))), x * 2)
})

# map_at --------------------------------------------------------------------

test_that("map_at() works with tidyselect", {
  skip_if_not_installed("tidyselect")
  local_options(lifecycle_verbosity = "quiet")

  x <- list(a = "b", b = "c", aa = "bb")
  one <- map_at(x, vars(a), in_parallel(\(x) toupper(x)))
  expect_identical(one$a, "B")
  expect_identical(one$aa, "bb")
  two <- map_at(
    x,
    vars(tidyselect::contains("a")),
    in_parallel(\(x) toupper(x))
  )
  expect_identical(two$a, "B")
  expect_identical(two$aa, "BB")
})

test_that("negative .at omits locations", {
  x <- c(1, 2, 3)
  out <- map_at(x, -1, in_parallel(~ .x * 2))
  expect_equal(out, list(1, 4, 6))
})

# ---------------------------------------------------------------------------

mirai::daemons(0)
