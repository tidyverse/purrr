# map_depth modifies values at specified depth

    Code
      map_depth(x1, 6, length)
    Condition
      Error in `.fmap()`:
      i In index: 1.
      Caused by error in `.fmap()`:
      i In index: 1.
      Caused by error in `.fmap()`:
      i In index: 1.
      Caused by error in `map_depth()`:
      ! List not deep enough

---

    Code
      map_depth(x1, -5, length)
    Condition
      Error in `map_depth()`:
      ! Negative `.depth` (-5) must be greater than -4.

# default doesn't recurse into data frames, but can customise

    Code
      map_depth(x, 2, class)
    Condition
      Error in `.fmap()`:
      i In index: 1.
      Caused by error in `map_depth()`:
      ! List not deep enough

# modify_depth modifies values at specified depth

    Code
      modify_depth(x1, 5, length)
    Condition
      Error in `map()`:
      i In index: 1.
      Caused by error in `map()`:
      i In index: 1.
      Caused by error in `map()`:
      i In index: 1.
      Caused by error in `modify_depth()`:
      ! List not deep enough

---

    Code
      modify_depth(x1, -5, length)
    Condition
      Error in `modify_depth()`:
      ! Negative `.depth` (-5) must be greater than -4.

# vectorised operations on the recursive and atomic levels yield same results

    Code
      modify_depth(x, 5, `+`, 10L)
    Condition
      Error in `map()`:
      i In index: 1.
      Caused by error in `map()`:
      i In index: 1.
      Caused by error in `map()`:
      i In index: 1.
      Caused by error in `modify_depth()`:
      ! List not deep enough

# validates depth

    Code
      check_depth(mean)
    Condition
      Error:
      ! `depth` must be a whole number, not a function.

