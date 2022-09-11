# generates informative error output isn't a list

    Code
      lmap(list(1), ~1)
    Condition
      Error in `lmap_helper()`:
      ! `.f(.x[[1}]])` must return a list, not a number

