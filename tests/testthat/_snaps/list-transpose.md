# can't transpose data frames

    Code
      list_transpose(df)
    Condition
      Error in `list_transpose()`:
      ! `x` must be a list, not a <data.frame> object.

# integer template requires exact length of list() simplify etc

    Code
      list_transpose(x, ptype = list())
    Condition
      Error in `list_transpose()`:
      ! Can't convert `result[[1]][[1]]` <double> to <list>.

---

    Code
      list_transpose(x, ptype = list(integer()))
    Condition
      Error in `list_transpose()`:
      ! Length of `ptype` (1) and `template` (2) must be the same when transposing by position.

# simplification fails silently unless requested

    Code
      list_transpose(list(list(x = 1), list(x = "b")), simplify = TRUE)
    Condition
      Error in `list_transpose()`:
      ! Can't combine `result$x[[1]]` <double> and `result$x[[2]]` <character>.
    Code
      list_transpose(list(list(x = 1), list(x = 2:3)), simplify = TRUE)
    Condition
      Error in `list_transpose()`:
      ! `result$x[[2]]` must have size 1, not size 2.

# can supply `simplify` globally or individually

    Code
      list_transpose(x, simplify = list(c = FALSE))
    Condition
      Error in `list_transpose()`:
      ! `simplify` contains unknown names: "c".

# can supply `ptype` globally or individually

    Code
      list_transpose(x, ptype = list(c = integer()))
    Condition
      Error in `list_transpose()`:
      ! `ptype` contains unknown names: "c".

# can supply `default` globally or individually

    Code
      list_transpose(x, default = list(c = NA))
    Condition
      Error in `list_transpose()`:
      ! `default` contains unknown names: "c".

# validates inputs

    Code
      list_transpose(10)
    Condition
      Error in `list_transpose()`:
      ! `x` must be a list, not the number 10.
    Code
      list_transpose(list(1), template = mean)
    Condition
      Error in `list_transpose()`:
      ! `template` must be a character or numeric vector, not a function.

# fail mixing named and unnamed vectors

    Code
      test_list_transpose()
    Condition
      Error in `list_transpose()`:
      ! Can't combine named and unnamed vectors.

