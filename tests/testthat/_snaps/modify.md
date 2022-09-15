# modify() and variants implement sane coercion rules for base vectors

    Code
      modify(1:3, ~"foo")
    Condition
      Error:
      ! Can't convert <character> to <integer>.
    Code
      modify_at(1:3, 1, ~"foo")
    Condition
      Error:
      ! Can't convert <character> to <integer>.
    Code
      modify_if(1:3, is_integer, ~"foo")
    Condition
      Error:
      ! Can't convert <character> to <integer>.
    Code
      modify2(1:3, "foo", ~.y)
    Condition
      Error:
      ! Can't convert <character> to <integer>.

# modify_if() requires predicate functions

    Code
      modify_if(list(1, 2), ~NA, ~"foo")
    Condition
      Error in `modify_if()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      modify_if(1:2, ~ c(TRUE, FALSE), ~"foo")
    Condition
      Error in `modify_if()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.

# user friendly error for non-supported cases

    Code
      modify(mean, identity)
    Condition
      Error in `modify()`:
      ! Don't know how to modify a function.
    Code
      modify_if(mean, TRUE, identity)
    Condition
      Error in `modify_if()`:
      ! Don't know how to modify a function.
    Code
      modify_at(mean, "x", identity)
    Condition
      Error in `modify_at()`:
      ! Don't know how to modify a function.
    Code
      modify2(mean, 1, identity)
    Condition
      Error in `modify2()`:
      ! Don't know how to modify a function.

