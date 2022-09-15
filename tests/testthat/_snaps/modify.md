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

