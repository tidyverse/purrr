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

