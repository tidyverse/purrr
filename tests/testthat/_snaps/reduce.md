# if input empty, reduce() returns error

    Code
      reduce(list(), `+`)
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
      accumulate(list(), `+`)
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

# reduce2() requires .x to be 1 element longer than .y (used for initial value)

    Code
      reduce2(1:4, 1:4, paste)
    Condition
      Error in `reduce2()`:
      ! `.y` must have length 3, not 4.

---

    Code
      reduce2(1:4, list(), paste)
    Condition
      Error in `reduce2()`:
      ! `.y` must have length 3, not 0.

# reduce2() requires .x and .y to be equal length if init given

    Code
      reduce2(1:4, 1:3, paste, .init = 6)
    Condition
      Error in `reduce2()`:
      ! `.y` must have length 4, not 3.

# if input empty, reduce2() returns error

    Code
      reduce2(list(), list(), `+`)
    Condition
      Error in `reduce2()`:
      ! Must supply `.init` when `.x` is empty.

# reduce2() cannot take .acc in ... due to argument collision

    Code
      reduce2(1:4, 1:3, `+`, .acc = TRUE)
    Condition
      Error in `reduce2_()`:
      ! formal argument ".acc" matched by multiple actual arguments

# accumulate2() requires .x to be 1 element longer than .y (used for initial value)

    Code
      accumulate2(1:4, 1:4, paste)
    Condition
      Error in `accumulate2()`:
      ! `.y` must have length 3, not 4.

---

    Code
      accumulate2(1:4, list(), paste)
    Condition
      Error in `accumulate2()`:
      ! `.y` must have length 3, not 0.

# if input empty, accumulate2() returns error

    Code
      accumulate2(list(), list(), paste)
    Condition
      Error in `accumulate2()`:
      ! Must supply `.init` when `.x` is empty.

# accumulate2() cannot take .acc in ... due to argument collision

    Code
      accumulate2(1:4, 1:3, `+`, .acc = FALSE)
    Condition
      Error in `reduce2_()`:
      ! formal argument ".acc" matched by multiple actual arguments

# accumulate2() does fail when simplification is required yet impossible

    Code
      accumulate2(list(1, "a"), 0L, ~.y, .simplify = TRUE)
    Condition
      Error in `accumulate2()`:
      ! Can't combine `res[[1]]` <double> and `res[[2]]` <character>.

# prototype cannot be specified for accumulate2() if told not to simplify

    Code
      accumulate2(c("b", "a"), 0L, ~.y, .simplify = FALSE, .ptype = character())
    Condition
      Error in `accumulate2()`:
      ! Can't specify `ptype` when `simplify = FALSE`.

# accumulate2() fails when cannot simplify to prototype

    Code
      accumulate2(list("foo", factor("bar")), 0L, ~.y, .ptype = factor(levels = "baz"))
    Condition
      Error in `accumulate2()`:
      ! Can't convert from `res[[1]]` <character> to <factor<3697e>> due to loss of generality.
      * Locations: 1

