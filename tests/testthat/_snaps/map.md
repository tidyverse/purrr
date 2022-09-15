# fails on non-vectors

    Code
      map(environment(), identity)
    Condition
      Error in `withCallingHandlers()`:
      ! `.x` must be a vector, not an environment.

---

    Code
      map(quote(a), identity)
    Condition
      Error in `withCallingHandlers()`:
      ! `.x` must be a vector, not a symbol.

# all inform about location of problem

    Code
      map_int(1:3, ~ fail_at_3(.x, 2:1))
    Condition
      Error in `map_int()`:
      ! Computation failed in index 3
      Caused by error:
      ! Result must be length 1, not 2
    Code
      map_int(1:3, ~ fail_at_3("x"))
    Condition
      Error in `map_int()`:
      ! Computation failed in index 1
      Caused by error:
      ! Can't coerce from a character to a integer
    Code
      map(1:3, ~ fail_at_3(stop("Doesn't work")))
    Condition
      Error in `map()`:
      ! Computation failed in index 1
      Caused by error in `fail_at_3()`:
      ! Doesn't work

