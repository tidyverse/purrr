# fails on non-vectors

    Code
      map(environment(), identity)
    Condition
      Error in `purrr:::stop_bad_type()`:
      ! `.x` must be a vector, not an environment

---

    Code
      map(quote(a), identity)
    Condition
      Error in `purrr:::stop_bad_type()`:
      ! `.x` must be a vector, not a symbol

# error message follows style guide when result is not length 1

    Code
      purrr::map_int(x, "a")
    Condition
      Error in `stop_bad_type()`:
      ! Result 2 must be a single integer, not an integer vector of length 2

