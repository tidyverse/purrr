# empty input returns init or error

    Code
      reduce(list())
    Condition
      Error in `reduce()`:
      ! Must supply `.init` when `.x` is empty.

# accumulate() does fail when simpification is required

    Code
      accumulate(list(1, "a"), ~.y, .simplify = TRUE)
    Condition
      Error in `accumulate()`:
      ! Can't combine `res[[1]]` <double> and `res[[2]]` <character>.

# requires equal length vectors

    Code
      reduce2(1:3, 1, `+`)
    Condition
      Error in `reduce2()`:
      ! `.y` must have length 2, not 1.

# requires init if `.x` is empty

    Code
      reduce2(list())
    Condition
      Error in `reduce2()`:
      ! Must supply `.init` when `.x` is empty.

# right variants are retired

    Code
      . <- reduce_right(1:3, c)
    Condition
      Warning:
      `reduce_right()` was deprecated in purrr 0.3.0.
      i Please use the `.dir` argument of `reduce()` instead.
    Code
      . <- reduce2_right(1:3, 1:2, c)
    Condition
      Warning:
      `reduce2_right()` was deprecated in purrr 0.3.0.
      i Please use reverse your vectors and use `reduce2()` instead.
    Code
      . <- accumulate_right(1:3, c)
    Condition
      Warning:
      `accumulate_right()` was deprecated in purrr 0.3.0.
      i Please use the `.dir` argument of `accumulate()` instead.

