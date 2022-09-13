# validates inputs

    Code
      lmap(list(1), ~1)
    Condition
      Error in `lmap()`:
      ! `.f(.x[[1]])` must return a list, not a number.
    Code
      lmap(list(1), environment())
    Condition
      Error in `lmap()`:
      ! Can't convert `.f`, an environment, to a function.
    Code
      lmap(list(1), ~1, .else = environment())
    Condition
      Error in `lmap()`:
      ! Can't convert `.else`, an environment, to a function.

