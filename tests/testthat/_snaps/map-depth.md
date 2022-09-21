# map_depth modifies values at specified depth

    Code
      map_depth(x1, 6, length)
    Condition
      Error in `.fmap()`:
      ! Can't compute index 1
      Caused by error in `.fmap()`:
      ! Can't compute index 1
      Caused by error in `.fmap()`:
      ! Can't compute index 1
      Caused by error in `map_depth()`:
      ! List not deep enough

---

    Code
      map_depth(x1, -5, length)
    Condition
      Error in `map_depth()`:
      ! Negative `.depth` (-5) must be greater than -4.

# modify_depth modifies values at specified depth

    Code
      modify_depth(x1, 5, length)
    Condition
      Error in `map()`:
      ! Can't compute index 1
      Caused by error in `map()`:
      ! Can't compute index 1
      Caused by error in `map()`:
      ! Can't compute index 1
      Caused by error in `modify_depth()`:
      ! List not deep enough

---

    Code
      modify_depth(x1, -5, length)
    Condition
      Error in `modify_depth()`:
      ! Negative `.depth` (-5) must be greater than -4.

# validates depth

    Code
      check_depth(mean)
    Condition
      Error:
      ! `.depth` must be a single number, not a function.

