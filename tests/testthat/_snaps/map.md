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
      Error in `purrr:::stop_bad_element_length()`:
      ! Result 2 must have length 1, not 2

