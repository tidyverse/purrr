# if input empty, reduce() returns error

    Code
      reduce(list())
    Condition
      Error in `reduce()`:
      ! Must supply `.init` when `.x` is empty.

# reduce() treats .f with as_mapper()

    Code
      reduce(1:4, NULL)
    Condition
      Error in `as_mapper()`:
      ! Can't convert `.f`, `NULL`, to a function.

# reduce() cannot take .acc in ... due to argument collision

    Code
      reduce(1:4, `+`, .acc = TRUE)
    Condition
      Error in `reduce_()`:
      ! formal argument ".acc" matched by multiple actual arguments

# if input empty, accumulate() returns error

    Code
      accumulate(list())
    Condition
      Error in `accumulate()`:
      ! Must supply `.init` when `.x` is empty.

# accumulate() treats .f with as_mapper()

    Code
      reduce(1:4, NULL)
    Condition
      Error in `as_mapper()`:
      ! Can't convert `.f`, `NULL`, to a function.

# accumulate() cannot take .acc in ... due to argument collision

    Code
      accumulate(1:4, `+`, .acc = FALSE)
    Condition
      Error in `reduce_()`:
      ! formal argument ".acc" matched by multiple actual arguments

# accumulate() does fail when simplification is required yet impossible

    Code
      accumulate(list(1, "a"), ~.y, .simplify = TRUE)
    Condition
      Error in `accumulate()`:
      ! Can't combine `res[[1]]` <double> and `res[[2]]` <character>.

# prototype cannot be specified for accumulate() if told not to simplify

    Code
      accumulate(c("b", "a"), ~.y, .simplify = FALSE, .ptype = character())
    Condition
      Error in `accumulate()`:
      ! Can't specify `ptype` when `simplify = FALSE`.

# accumulate() fails when cannot simplify to prototype

    Code
      accumulate(list("foo", factor("bar")), ~.y, .ptype = factor(levels = "baz"))
    Condition
      Error in `accumulate()`:
      ! Can't convert from `res[[1]]` <character> to <factor<3697e>> due to loss of generality.
      * Locations: 1

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

