# map_depth modifies values at specified depth

    Code
      map_depth(x1, 6, length)
    Condition
      Error in `map_depth()`:
      ! List not deep enough

---

    Code
      map_depth(x1, -5, length)
    Condition
      Error in `map_depth()`:
      ! Negative `.depth` must be smaller than `pluck_depth(.x)`.

# modify_depth modifies values at specified depth

    Code
      modify_depth(x1, 5, length)
    Condition
      Error in `modify_depth()`:
      ! List not deep enough

---

    Code
      modify_depth(x1, -5, length)
    Condition
      Error in `modify_depth()`:
      ! Negative `.depth` must be smaller than `pluck_depth(.x)`.

