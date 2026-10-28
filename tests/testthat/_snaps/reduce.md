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

