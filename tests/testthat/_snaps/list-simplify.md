# ptype is enforced

    Code
      list_simplify(list(1, 2), ptype = character())
    Condition
      Error in `list_unchop()`:
      ! Can't convert `x[[1]]` <double> to <character>.

---

    Code
      list_simplify(list(1, 2), ptype = character(), strict = FALSE)
    Condition
      Error in `list_unchop()`:
      ! Can't convert `x[[1]]` <double> to <character>.

# strict simplification will error

    Code
      list_simplify(list(mean))
    Condition
      Error in `list_simplify()`:
      ! `x[[1]]` must be a vector, not a function.
    Code
      list_simplify(list(1, "a"))
    Condition
      Error in `list_unchop()`:
      ! Can't combine `x[[1]]` <double> and `x[[2]]` <character>.
    Code
      list_simplify(list(1, 1:2))
    Condition
      Error in `list_simplify()`:
      ! All elements must be size 1.
      i `x[[2]]` is size 2.
    Code
      list_simplify(list(data.frame(x = 1), data.frame(x = 1:2)))
    Condition
      Error in `list_simplify()`:
      ! All elements must be size 1.
      i `x[[2]]` is size 2.
    Code
      list_simplify(list(1, 2), ptype = character())
    Condition
      Error in `list_unchop()`:
      ! Can't convert `x[[1]]` <double> to <character>.

# list_simplify() validates inputs

    Code
      list_simplify(1:5)
    Condition
      Error in `list_simplify()`:
      ! `x` must be a list, not an integer vector.

---

    Code
      list_simplify(list(), strict = NA)
    Condition
      Error in `list_simplify()`:
      ! `strict` must be `TRUE` or `FALSE`, not `NA`.

# list_simplify_internal() validates inputs

    Code
      list_simplify_internal(list(), simplify = 1)
    Condition
      Error:
      ! `simplify` must be `TRUE`, `FALSE`, or `NA`.

---

    Code
      list_simplify_internal(list(), simplify = FALSE, ptype = integer())
    Condition
      Error:
      ! Can't specify `ptype` when `simplify = FALSE`.

