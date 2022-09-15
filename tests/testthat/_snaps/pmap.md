# verifies result types and length

    Code
      pmap_int(list(1), ~"x")
    Condition
      Error:
      ! Can't coerce element 1 from a character to a integer
    Code
      pmap_int(list(1), ~ 1:2)
    Condition
      Error in `pmap_int()`:
      ! Result 1 must have length 1, not 2.

# requires list of vectors

    Code
      pmap(environment(), identity)
    Condition
      Error in `pmap()`:
      ! `.l` must be a list, not an environment.
    Code
      pmap(list(environment()), identity)
    Condition
      Error in `pmap()`:
      ! `.l[[1]]` must be a vector, not an environment.

# recycles inputs

    Code
      pmap(list(1:2, 1:3), `+`)
    Condition
      Error in `pmap()`:
      ! `.l[[2]]` must have length 1 or 2, not 3.
    Code
      pmap(list(1:2, integer()), `+`)
    Condition
      Error in `pmap()`:
      ! `.l[[2]]` must have length 1 or 2, not 0.

