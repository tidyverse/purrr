# generates informative error output isn't a list

    Code
      lmap(list(1), ~1)
    Condition
      Error in `lmap_helper()`:
      ! Element 1 must be list, not a number.

