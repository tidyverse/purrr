# integer template requires exact length of list() simplify etc

    Code
      list_transpose(x, ptype = list())
    Condition
      Error:
      ! Can't convert <double> to <list>.

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
      Error:
      ! Can't combine `..1` <double> and `..2` <character>.
    Code
      list_transpose(list(list(x = 1), list(x = 2:3)), simplify = TRUE)
    Condition
      Error in `list_transpose()`:
      ! All elements must be length 1
      i `result$x[[2]]` is length 2.

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
      ! `x` must be a list, not a number.
    Code
      list_transpose(list(1), template = mean)
    Condition
      Error in `list_transpose()`:
      ! `template` must be a character or numeric vector, not a function.

