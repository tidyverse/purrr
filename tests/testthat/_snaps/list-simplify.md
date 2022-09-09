# ptype is enforced

    Code
      list_simplify(list(1, 2), ptype = character())
    Condition
      Error in `list_simplify()`:
      ! Failed to simplify `x`.
      Caused by error:
      ! Can't convert <double> to <character>.

---

    Code
      list_simplify(list(1, 2), ptype = character(), strict = FALSE)
    Condition
      Error in `list_simplify()`:
      ! Failed to simplify `x`.
      Caused by error:
      ! Can't convert <double> to <character>.

# strict simplification will error

    Code
      list_simplify(list(1, "a"))
    Condition
      Error in `list_simplify()`:
      ! Failed to simplify `x`.
      Caused by error:
      ! Can't combine `..1` <double> and `..2` <character>.
    Code
      list_simplify(list(1, 1:2))
    Condition
      Error in `list_simplify()`:
      ! Failed to simplify `x`: not all elements vectors of length 1.
    Code
      list_simplify(list(1, 2), ptype = character())
    Condition
      Error in `list_simplify()`:
      ! Failed to simplify `x`.
      Caused by error:
      ! Can't convert <double> to <character>.

# validates inputs

    Code
      list_simplify_internal(1:5)
    Condition
      Error:
      ! `x` must be a list, not an integer vector.

---

    Code
      list_simplify_internal(list(), simplify = 1)
    Condition
      Error in `list_simplify_internal()`:
      ! `simplify` must be `TRUE`, `FALSE`, or `NA`

---

    Code
      list_simplify_internal(list(), simplify = FALSE, ptype = integer())
    Condition
      Error in `list_simplify_internal()`:
      ! Must not specify `ptype` when `simplify = FALSE`

