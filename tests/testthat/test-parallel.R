skip_if_not_installed("mirai")

test_that("Can't parallel map without first setting daemons", {
  expect_snapshot(error = TRUE, {
    map(list(x = 1, y = 2), parallelize(\(x) list(x)))
  })
})

# set up daemons
mirai::daemons(1, dispatcher = FALSE) # ensures only 1 additional process on CRAN
on.exit(mirai::daemons(0), add = TRUE)

test_that("Can't use `...` in a parallel map", {
  expect_snapshot(error = TRUE, {
    map(list(x = 1, y = 2), parallelize(\(x) list(x)), a = "wrong")
  })
})

# map -----------------------------------------------------------------------

test_that("preserves names", {
  out <- map(list(x = 1, y = 2), parallelize(\(x) identity(x)))
  expect_equal(names(out), c("x", "y"))
})

test_that("works with matrices/arrays (#970)", {
  expect_identical(
    map_int(matrix(1:4, nrow = 2), parallelize(\(x) identity(x))),
    1:4
  )
})

test_that("all inform about location of problem", {
  skip_if_not_installed("carrier")

  expect_snapshot(error = TRUE, {
    map_int(1:3, parallelize(\(x, bad = 2:1) if (x == 3) bad else x))
    map_int(1:3, parallelize(\(x, bad = "x") if (x == 3) bad else x))
    map(1:3, parallelize(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x))
  })

  cnd <- catch_cnd(map(1:3, parallelize(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x)))
  expect_s3_class(cnd, "purrr_error_indexed")
  expect_equal(cnd$location, 3)
  expect_equal(cnd$name, NULL)
})

test_that("error location uses name if present", {
  skip_if_not_installed("carrier")

  expect_snapshot(error = TRUE, {
    map_int(c(a = 1, b = 2, c = 3), parallelize(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x))
    map_int(c(a = 1, b = 2, 3), parallelize(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x))
  })

  cnd <- catch_cnd(map(c(1, 2, c = 3), parallelize(\(x, bad = stop("Doesn't work")) if (x == 3) bad else x)))
  expect_s3_class(cnd, "purrr_error_indexed")
  expect_equal(cnd$location, 3)
  expect_equal(cnd$name, "c")
})

test_that("0 length input gives 0 length output", {
  expect_equal(map(list(), parallelize(\(x) identity(x))), list())
  expect_equal(map(NULL, parallelize(\(x) identity(x))), list())

  expect_equal(map_lgl(NULL, parallelize(\(x) identity(x))), logical())
})

test_that("map() always returns a list", {
  expect_bare(map(mtcars, parallelize(\(x) mean(x))), "list")
})

test_that("types automatically coerced correctly", {
  expect_identical(map_lgl(c(NA, 0, 1), parallelize(\(x) identity(x))), c(NA, FALSE, TRUE))

  expect_identical(map_int(c(NA, FALSE, TRUE), parallelize(\(x) identity(x))), c(NA, 0L, 1L))
  expect_identical(map_int(c(NA, 1, 2), parallelize(\(x) identity(x))), c(NA, 1L, 2L))

  expect_identical(map_dbl(c(NA, FALSE, TRUE), parallelize(\(x) identity(x))), c(NA, 0, 1))
  expect_identical(map_dbl(c(NA, 1L, 2L), parallelize(\(x) identity(x))), c(NA, 1, 2))

  expect_identical(map_chr(NA, parallelize(\(x) identity(x))), NA_character_)
})

test_that("logical and integer NA become correct double NA", {
  expect_identical(
    map_dbl(list(NA, NA_integer_), parallelize(\(x) identity(x))),
    c(NA_real_, NA_real_)
  )
})

test_that("map forces arguments in same way as base R", {
  f_map <- map(1:2, parallelize(\(i) \(x) x + i))
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
      parallelize(\(x) as.character(x), as.character.test_class = method)
    ),
    list("dispatched!", "dispatched!")
  )
})

test_that("map() with empty input copies names", {
  named_list <- named(list())
  expect_identical(    map(named_list, parallelize(\(x) identity(x))), named(list()))
  expect_identical(map_lgl(named_list, parallelize(\(x) identity(x))), named(lgl()))
  expect_identical(map_int(named_list, parallelize(\(x) identity(x))), named(int()))
  expect_identical(map_dbl(named_list, parallelize(\(x) identity(x))), named(dbl()))
  expect_identical(map_chr(named_list, parallelize(\(x) identity(x))), named(chr()))
})

# map_vec ------------------------------------------------------------------

test_that("still iterates using [[", {
  df <- data.frame(x = 1, y = 2, z = 3)
  expect_equal(map_vec(df, parallelize(\(x) length(x))), c(x = 1, y = 1, z = 1))
})

test_that("requires output be length 1 and have common type", {
  expect_snapshot(error = TRUE, {
    map_vec(1:2, parallelize(~ rep(1, .x)))
    map_vec(1:2, parallelize(~ if (.x == 1) factor("x") else 1))
  })
})

test_that("row-binds data frame output", {
  out <- map_vec(1:2, parallelize(~ data.frame(x = .x)))
  expect_equal(out, data.frame(x = 1:2))
})

test_that("concatenates list output", {
  out <- map_vec(1:2, parallelize(~ list(.x)))
  expect_equal(out, list(1, 2))
})

test_that("can enforce .ptype", {
  expect_snapshot(error = TRUE, {
    map_vec(1:2, parallelize(~ factor("x")), .ptype = integer())
  })
})

# map2 ---------------------------------------------------------------------

test_that("x and y mapped to first and second argument", {
  expect_equal(map2(1, 2, parallelize(\(x, y) x)), list(1))
  expect_equal(map2(1, 2, parallelize(\(x, y) y)), list(2))
})

test_that("variants return expected types", {
  x <- list(1, 2, 3)
  expect_true(is_bare_list(map2(x, 0, parallelize(~ 1))))
  expect_true(is_bare_logical(map2_lgl(x, 0, parallelize(~ TRUE))))
  expect_true(is_bare_integer(map2_int(x, 0, parallelize(~ 1))))
  expect_true(is_bare_double(map2_dbl(x, 0, parallelize(~ 1.5))))
  expect_true(is_bare_character(map2_chr(x, 0, parallelize(~ "x"))))
  expect_equal(walk2(x, 0, parallelize(~ "x")), x)

  x <- list(FALSE, 1L, 1)
  expect_true(is_bare_double(map2_vec(x, 0, ~ .x, .parallel = TRUE)))
})

test_that("0 length input gives 0 length output", {
  expect_equal(map2(list(), list(), parallelize(\(x) identity(x))), list())
  expect_equal(map2(NULL, NULL, parallelize(\(x) identity(x))), list())

  expect_equal(map2_lgl(NULL, NULL, parallelize(\(x) identity(x))), logical())
})

test_that("verifies result types and length", {
  expect_snapshot(error = TRUE, {
    map2_int(1, 1, parallelize(~ "x"))
    map2_int(1, 1, parallelize(~ 1:2))
    map2_vec(1, 1, parallelize(~ 1), .ptype = character())
  })
})

test_that("works with vctrs records (#963)", {
  x <- new_rcrd(list(x = c(1, 2), y = c("a", "b")))
  out <- list(new_rcrd(list(x = 1, y = "a")), new_rcrd(list(x = 2, y = "b")))
  expect_identical(map2(x, 1, parallelize(~ .x)), out)
})

test_that("requires vector inputs", {
  expect_snapshot(error = TRUE, {
    map2(environment(), "a", parallelize(\(x) identity(x)))
    map2("a", environment(), "a", parallelize(\(x) identity(x)))
  })
})

test_that("recycles inputs", {
  expect_equal(map2(1:2, 1, parallelize(\(x, y) x + y)), list(2, 3))
  expect_equal(map2(integer(), 1,  parallelize(\(x, y) x + y)), list())
  expect_equal(map2(NULL, 1,  parallelize(\(x, y) x + y)), list())

  expect_snapshot(error = TRUE, {
    map2(1:2, 1:3, parallelize(\(x, y) x + y))
    map2(1:2, integer(), parallelize(\(x, y) x + y))
  })
})

test_that("only takes names from x", {
  x1 <- 1:2
  x2 <- set_names(x1, letters[1:2])
  x3 <- set_names(x1, "")

  expect_named(map2(x1, 1, parallelize(\(x, y) x + y)), NULL)
  expect_named(map2(x2, 1, parallelize(\(x, y) x + y)), c("a", "b"))
  expect_named(map2(x3, 1, parallelize(\(x, y) x + y)), c("", ""))

  # recycling them if needed (#779)
  x4 <- c(a = 1)
  expect_named(map2(x4, 1:2, parallelize(\(x, y) x + y)), c("a", "a"))
})

test_that("don't evaluate symbolic objects (#428)", {
  map2(exprs(1 + 2), NA, parallelize(~ testthat::expect_identical(.x, quote(1 + 2))))
  walk2(exprs(1 + 2), NA, parallelize(~ testthat::expect_identical(.x, quote(1 + 2))))
  expect_true(TRUE) # so the test is not deemed empty and skipped
})

# pmap ----------------------------------------------------------------------

test_that(".f called with named arguments", {
  x <- list(x = 1, 2, y = 3)
  expect_equal(pmap(x, parallelize(\(...) list(...))), list(x))
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
  expect_true(is_bare_list(pmap(l, parallelize(~ 1))))
  expect_true(is_bare_logical(pmap_lgl(l, parallelize(~ TRUE))))
  expect_true(is_bare_integer(pmap_int(l, parallelize(~ 1))))
  expect_true(is_bare_double(pmap_dbl(l, parallelize(~ 1.5))))
  expect_true(is_bare_character(pmap_chr(l, parallelize(~ "x"))))
  expect_equal(pwalk(l, parallelize(~ "x")), l)

  l <- list(list(FALSE, 1L, 1))
  expect_true(is_bare_double(pmap_vec(l, parallelize(~ .x))))
})

test_that("verifies result types and length", {
  expect_snapshot(error = TRUE, {
    pmap_int(list(1), parallelize(~ "x"))
    pmap_int(list(1), parallelize(~ 1:2))
    pmap_vec(list(1), parallelize(~ 1), .ptype = character())
  })
})

test_that("0 length input gives 0 length output", {
  expect_equal(pmap(list(list(), list()), parallelize(\(x) identity(x))), list())
  expect_equal(pmap(list(NULL, NULL), parallelize(\(x) identity(x))), list())
  expect_equal(pmap(list(), parallelize(\(x) identity(x))), list())
  expect_equal(pmap(NULL, parallelize(\(x) identity(x))), list())

  expect_equal(pmap_lgl(NULL, parallelize(\(x) identity(x))), logical())
})

test_that("requires list of vectors", {
  expect_snapshot(error = TRUE, {
    pmap(environment(), parallelize(\(x) identity(x)))
    pmap(list(environment()), parallelize(\(x) identity(x)))
  })
})

test_that("recycles inputs", {
  expect_equal(pmap(list(1:2, 1), parallelize(\(x, y) x + y)), list(2, 3))
  expect_equal(pmap(list(integer(), 1), parallelize(\(x, y) x + y)), list())
  expect_equal(pmap(list(NULL, 1), parallelize(\(x, y) x + y)), list())

  expect_snapshot(error = TRUE, {
    pmap(list(1:2, 1:3), parallelize(\(x, y) x + y))
    pmap(list(1:2, integer()), parallelize(\(x, y) x + y))
  })
})

test_that("only takes names from x", {
  x1 <- 1:2
  x2 <- set_names(x1, letters[1:2])
  x3 <- set_names(x1, "")

  expect_named(pmap(list(x1, x2), parallelize(\(x, y) x + y)), NULL)
  expect_named(pmap(list(x2, x2), parallelize(\(x, y) x + y)), c("a", "b"))
  expect_named(pmap(list(x3, x2), parallelize(\(x, y) x + y)), c("", ""))

  # recycling them if needed (#779)
  x4 <- c(a = 1)
  expect_named(pmap(list(x4, 1:2), parallelize(\(x, y) x + y)), c("a", "a"))
})

test_that("avoid expensive [[ method on data frames", {
  local_bindings(
    `[[.mydf` = function(x, ...) stop("Not allowed!"),
    .env = global_env()
  )

  df <- data.frame(x = 1:2, y = 2:1)
  class(df) <- c("mydf", "data.frame")

  expect_equal(pmap(df, parallelize(\(...) list(...), `[[.mydf` = `[[.mydf`)), list(list(x = 1, y = 2), list(x = 2, y = 1)))
  expect_equal(pmap_lgl(df, parallelize(~ TRUE, `[[.mydf` = `[[.mydf`)), c(TRUE, TRUE))
  expect_equal(pmap_int(df, parallelize(~ 2, `[[.mydf` = `[[.mydf`)), c(2, 2))
  expect_equal(pmap_dbl(df, parallelize(~ 3.5, `[[.mydf` = `[[.mydf`)), c(3.5, 3.5))
  expect_equal(pmap_chr(df, parallelize(~ "x", `[[.mydf` = `[[.mydf`)), c("x", "x"))
})

test_that("pmap works with empty lists", {
  expect_identical(pmap(list(), parallelize(~ 1)), list())
})

test_that("preserves S3 class of input vectors (#358)", {
  date <- as.Date("2018-09-27")
  expect_identical(pmap(list(date), parallelize(\(x) identity(x))), list(date))
})

test_that("works with vctrs records (#963)", {
  x <- new_rcrd(list(x = c(1, 2), y = c("a", "b")))
  out <- list(new_rcrd(list(x = 1, y = "a")), new_rcrd(list(x = 2, y = "b")))
  expect_identical(pmap(list(x, 1, 1:2), parallelize(~ .x)), out)
})

test_that("don't evaluate symbolic objects (#428)", {
  pmap(list(exprs(1 + 2)), parallelize(~ testthat::expect_identical(.x, quote(1 + 2))))
  pwalk(list(exprs(1 + 2)), parallelize(~ testthat::expect_identical(.x, quote(1 + 2))))
  expect_true(TRUE) # so the test is not deemed empty and skipped
})

# imap ----------------------------------------------------------------------

test_that("atomic vector imap works", {
  x <- 1:3 %>% set_names()
  expect_true(all(imap_lgl(x, parallelize(\(x, y) x == y))))
  expect_length(imap_chr(x, parallelize(\(...) paste(...))), 3)
  expect_equal(imap_int(x, parallelize(~ .x + as.integer(.y))), x * 2)
  expect_equal(imap_dbl(x, parallelize(~ .x + as.numeric(.y))), x * 2)
  expect_equal(imap_vec(x, parallelize(~ .x + as.numeric(.y))), x * 2)
})

# map_at --------------------------------------------------------------------

test_that("map_at() works with tidyselect", {
  skip_if_not_installed("tidyselect")
  local_options(lifecycle_verbosity = "quiet")

  x <- list(a = "b", b = "c", aa = "bb")
  one <- map_at(x, vars(a), parallelize(\(x) toupper(x)))
  expect_identical(one$a, "B")
  expect_identical(one$aa, "bb")
  two <- map_at(x, vars(tidyselect::contains("a")), parallelize(\(x) toupper(x)))
  expect_identical(two$a, "B")
  expect_identical(two$aa, "BB")
})

test_that("negative .at omits locations", {
  x <- c(1, 2, 3)
  out <- map_at(x, -1, parallelize(~ .x * 2))
  expect_equal(out, list(1, 4, 6))
})

# ---------------------------------------------------------------------------

mirai::daemons(0)
