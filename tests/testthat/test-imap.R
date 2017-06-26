context("imap")

x <- 1:3 %>% set_names()

test_that("imap is special case of map2", {
  expect_identical(imap(x, paste), map2(x, names(x), paste))
})

test_that("imap always returns a list", {
  expect_is(imap(x, paste), "list")
})

test_that("atomic vector imap works", {
  expect_true(all(imap_lgl(x, `==`)))
  expect_length(imap_chr(x, paste), 3)
  expect_equal(imap_int(x, ~ .x + as.integer(.y)), x * 2)
  expect_equal(imap_dbl(x, ~ .x + as.numeric(.y)), x * 2)
})

test_that("data frame imap works", {
  expect_identical(imap_dfc(x, paste), imap_dfr(x, paste))
})

test_that("iwalk returns invisibly", {
  expect_output(iwalk(mtcars, ~ cat(.y, ": ", median(.x), "\n", sep = "")))
})
