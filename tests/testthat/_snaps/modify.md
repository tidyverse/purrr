# modfiying data.frame preserves type and size

    Code
      modify(df1, ~ integer())
    Condition
      Error in `modify()`:
      ! Can't recycle `out$x` (size 0) to size 2.
    Code
      modify(df1, ~ 1:4)
    Condition
      Error in `modify()`:
      ! Can't recycle `out$x` (size 4) to size 2.
    Code
      modify_at(df1, 2, ~ integer())
    Condition
      Error in `modify_where()`:
      ! Can't recycle `out$y` (size 0) to size 2.
    Code
      modify2(df1, list(1, 1:3), ~.y)
    Condition
      Error in `modify2()`:
      ! Can't recycle `out$y` (size 3) to size 2.

# zap gives clear error

    Code
      modify_at(1, 1, ~ zap())
    Condition
      Error in `map_vec()`:
      ! `out[[1]]` must be a vector, not a <rlang_zap> object.
    Code
      modify_at(list(1), 1, ~ zap())
    Condition
      Error in `modify_at()`:
      ! Can't use `zap()` to change the size of the output.
    Code
      modify_at(data.frame(x = 1), 1, ~ zap())
    Condition
      Error in `modify_at()`:
      ! Can't use `zap()` to change the size of the output.
    Code
      modify_at(lm(mpg ~ wt, data = mtcars), 1, ~ zap())
    Condition
      Error in `modify_at()`:
      ! Can't use `zap()` to change the size of the output.

# bad type has useful error

    Code
      modify(1:3, ~"foo")
    Condition
      Error in `map_vec()`:
      ! Can't convert `<list>[[1]]` <character> to <integer>.
    Code
      modify_at(1:3, 1, ~"foo")
    Condition
      Error in `map_vec()`:
      ! Can't convert `<list>[[1]]` <character> to <integer>.
    Code
      modify_if(1:3, is_integer, ~"foo")
    Condition
      Error in `map_vec()`:
      ! Can't convert `<list>[[1]]` <character> to <integer>.
    Code
      modify2(1:3, "foo", ~.y)
    Condition
      Error in `map2_vec()`:
      ! Can't convert `<list>[[1]]` <character> to <integer>.

# modify2() recycles arguments

    Code
      modify2(1:3, integer(), `+`)
    Condition
      Error in `map2()`:
      ! Can't recycle `.x` (size 3) to match `.y` (size 0).
    Code
      modify2(1:3, 1:4, `+`)
    Condition
      Error in `map2()`:
      ! Can't recycle `.x` (size 3) to match `.y` (size 4).

# modify_if() requires predicate functions

    Code
      modify_if(list(1, 2), ~NA, ~"foo")
    Condition
      Error in `modify_if()`:
      i In index: 1.
      Caused by error:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

# user friendly error for non-supported cases

    Code
      modify(mean, identity)
    Condition
      Error in `modify()`:
      ! `.x` must be a vector, list, or data frame, not a function.
    Code
      modify_if(mean, TRUE, identity)
    Condition
      Error in `modify_if()`:
      ! `.x` must be a vector, list, or data frame, not a function.
    Code
      modify_at(mean, "x", identity)
    Condition
      Error in `modify_at()`:
      ! `.x` must be a vector, list, or data frame, not a function.
    Code
      modify2(mean, 1, identity)
    Condition
      Error in `modify2()`:
      ! `.x` must be a vector, list, or data frame, not a function.

