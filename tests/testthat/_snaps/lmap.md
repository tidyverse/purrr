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

# passing .ind parameter to lmap() results in an error

    Code
      lmap(1, .ind = FALSE)
    Condition
      Error in `lmap_helper()`:
      ! formal argument ".ind" matched by multiple actual arguments

# passing .else parameter to lmap_at() results in an error

    Code
      lmap_at(x, "c", function(x) list(1), .else = function(x) list(NULL))
    Condition
      Error in `lmap_helper()`:
      ! formal argument ".else" matched by multiple actual arguments

