# ptype is checked

    Code
      list_simplify(list(1, 2), ptype = character())
    Condition
      Error:
      ! Can't convert <double> to <character>.

# x must be a list

    Code
      list_simplify(1:5)
    Condition
      Error in `list_simplify()`:
      ! `x` must be a vector with type <list>.
      Instead, it has type <integer>.

# verifies simplify and ptype

    Code
      check_ptype_simplify(NULL, 1)
    Condition
      Error in `check_ptype_simplify()`:
      ! `simplify` must be `TRUE` or `FALSE`, not a number.
    Code
      check_ptype_simplify(integer(), FALSE)
    Condition
      Error in `check_ptype_simplify()`:
      ! Must not specific `ptype` when `simplify = FALSE`

