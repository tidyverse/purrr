# prepend is deprecated

    Code
      . <- prepend(1, 2)
    Condition
      Warning:
      `prepend()` was deprecated in purrr 1.0.0.
      i Please use append(after = 0) instead.

# prepend throws error if before param is neither NULL nor between 1 and length(x)

    Code
      prepend(list(), 1, before = 1)
    Condition
      Error in `prepend()`:
      ! is.null(before) || (before > 0 && before <= n) is not TRUE

---

    Code
      x %>% prepend(4, before = 0)
    Condition
      Error in `prepend()`:
      ! is.null(before) || (before > 0 && before <= n) is not TRUE

---

    Code
      x %>% prepend(4, before = 4)
    Condition
      Error in `prepend()`:
      ! is.null(before) || (before > 0 && before <= n) is not TRUE

