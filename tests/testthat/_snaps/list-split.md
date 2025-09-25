# n validation works

    Code
      list_split(1:5, n = 0)
    Condition
      Error in `list_split()`:
      ! `n` must be a positive integer.

---

    Code
      list_split(1:5, n = -1)
    Condition
      Error in `list_split()`:
      ! `n` must be a positive integer.

---

    Code
      list_split(1:5, n = 2.5)
    Condition
      Error in `list_split()`:
      ! `n` must be a positive integer.

---

    Code
      list_split(1:5, n = c(1, 2))
    Condition
      Error in `list_split()`:
      ! `n` must be a positive integer.

---

    Code
      list_split(1:5, n = NA)
    Condition
      Error in `list_split()`:
      ! `n` must be a positive integer.

# groups validation works

    Code
      list_split(1:5, groups = 1:3)
    Condition
      Error in `list_split()`:
      ! `groups` must have the same length as `x` (5).

---

    Code
      list_split(1:5, groups = character())
    Condition
      Error in `list_split()`:
      ! `groups` must have the same length as `x` (5).

# parameter validation works

    Code
      list_split(1:5)
    Condition
      Error in `list_split()`:
      ! Must provide either `n` or `groups`.

---

    Code
      list_split(1:5, n = 2, groups = c(1, 1, 2, 2, 3))
    Condition
      Error in `list_split()`:
      ! Can't provide both `n` and `groups`.

---

    Code
      list_split("not a list or vector")
    Condition
      Error in `list_split()`:
      ! Must provide either `n` or `groups`.

# dots validation works

    Code
      list_split(1:5, n = 2, extra_arg = "bad")
    Condition
      Error in `list_split()`:
      ! `...` must be empty.
      x Problematic argument:
      * extra_arg = "bad"

