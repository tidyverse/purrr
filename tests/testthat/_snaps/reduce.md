# right variants are retired

    Code
      . <- reduce_right(1:3, c)
    Condition
      Warning:
      `reduce_right()` was deprecated in purrr 0.3.0.
      Please use the `.dir` argument of `reduce()` instead.
    Code
      . <- reduce2_right(1:3, 1:2, c)
    Condition
      Warning:
      `reduce2_right()` was deprecated in purrr 0.3.0.
      Please use reverse your vectors and use `reduce2()` instead.
    Code
      . <- accumulate_right(1:3, c)
    Condition
      Warning:
      `accumulate_right()` was deprecated in purrr 0.3.0.
      Please use the `.dir` argument of `accumulate()` instead.

