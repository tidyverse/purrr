# generates informative error output isn't a list

    Code
      lmap(list(1), ~1)
    Condition
      Error in `stop_bad_type()`:
      ! Element 1 must be list, not a double vector

