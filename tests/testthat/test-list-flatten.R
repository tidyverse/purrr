test_that("flattening removes single layer of nesting", {
  expect_equal(list_flatten(list(list(1), list(2))), list(1, 2))
  expect_equal(list_flatten(list(list(1), list(list(2)))), list(1, list(2)))
  expect_equal(list_flatten(list(list(1), list(), list(2))), list(1, 2))
})

test_that("flattening a flat list is idempotent", {
  expect_equal(list_flatten(list(1, 2)), list(1, 2))
})

test_that("uses either inner or outer names if only one present", {
  expect_equal(list_flatten(list(x = list(1), list(y = 2))), list(x = 1, y = 2))
})

test_that("can control names if both present", {
  x <- list(a = list(x = 1))
  expect_equal(list_flatten(x), list(a_x = 1))
  expect_equal(list_flatten(x, name_spec = "{inner}"), list(x = 1))
  expect_equal(list_flatten(x, name_spec = "{outer}"), list(a = 1))
})

test_that("requires a list", {
  expect_snapshot(list_flatten(1:2), error = TRUE)
})

test_that("list_flatten() restores", {
  # This simulates a recursive list-of type
  my_num_list <- function(...) {
    new_my_num_list(list2(...))
  }
  new_my_num_list <- function(xs) {
    stopifnot(
      every(xs, function(x) {
        is_null(x) || is.numeric(x) || inherits(x, "my_num_list")
      })
    )
    new_vctr(xs, class = "my_num_list")
  }

  local_methods(
    vec_restore.my_num_list = function(x, to, ...) {
      new_my_num_list(x)
    }
  )

  xs <- my_num_list(1, 2, my_num_list(3:4))
  expect_equal(
    list_flatten(xs),
    my_num_list(1, 2, 3:4)
  )
})

test_that("list_flatten() supports strict types", {
  local_methods(
    vec_cast.list.my_strict_list = function(x, to, ...) {
      abort("Can't coerce to list.")
    }
  )

  x <- structure(list(1), class = c("my_strict_list", "list"))

  expect_equal(
    list_flatten(list(x)),
    list(1)
  )
})

test_that("list_flatten() works with vctrs::list_of()", {
  # Currently only with flat lists because list_of can't be recursive
  expect_equal(
    list_flatten(list_of(1, 2, 3)),
    list_of(1, 2, 3)
  )
})
