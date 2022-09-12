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
      ! All elements must be length-1 vectors.

# can supply `simplify` globally or individually

    Code
      list_transpose(x, simplify = list(c = FALSE))
    Condition
      Error in `list_transpose()`:
      ! `simplify` contains unknown names: "c"

# can supply `ptype` globally or individually

    Code
      list_transpose(x, ptype = list(c = integer()))
    Condition
      Error in `list_transpose()`:
      ! `ptype` contains unknown names: "c"

# can supply `default` globally or individually

    Code
      list_transpose(x, default = list(c = NA))
    Condition
      Error in `list_transpose()`:
      ! `default` contains unknown names: "c"

# validates inputs

    Code
      list_transpose(10)
    Condition
      Error in `list_transpose()`:
      ! `x` must be a list, not a number.
    Code
      list_transpose(list(1))
    Condition
      Error in `list_transpose()`:
      ! Must supply either `template` or a named `x`.
    Code
      list_transpose(list(a = 1), template = 1)
    Condition
      Error in `list_transpose()`:
      ! `template` must be a character vector.

