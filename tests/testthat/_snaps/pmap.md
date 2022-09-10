# inputs are recycled

    Code
      pmap(list(1:2, 1:3), identity)
    Condition
      Error in `purrr:::stop_bad_element_length()`:
      ! Element 2 of `.l` must have length 1 or 2, not 3

---

    Code
      pmap(list(1:2, integer()), identity)
    Condition
      Error in `purrr:::stop_bad_element_length()`:
      ! Element 2 of `.l` must have length 1 or 2, not 0

