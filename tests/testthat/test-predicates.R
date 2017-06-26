context("predicates")

test_that("predicate-based functionals work with logical vectors", {
  expect_equal(keep(as.list(1:3), c(TRUE, FALSE, TRUE)), list(1, 3))
  expect_equal(discard(as.list(1:3), c(TRUE, FALSE, TRUE)), list(2))
  expect_equal(
    modify_if(as.list(1:3), c(TRUE, FALSE, TRUE), as.character),
    list("1", 2, "3")
  )
  expect_equal(
    lmap_if(as.list(1:3), c(TRUE, FALSE, TRUE), ~list(as.character(.x[[1]]))),
    list("1", 2, "3")
  )
})
