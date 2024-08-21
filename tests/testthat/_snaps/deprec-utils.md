# rdunif and rbernoulli are deprecated

    Code
      . <- rdunif(10, 1)
    Condition
      Warning:
      `rdunif()` was deprecated in purrr 1.0.0.
    Code
      . <- rbernoulli(10)
    Condition
      Warning:
      `rbernoulli()` was deprecated in purrr 1.0.0.

# rdunif fails if a and b are not unit length numbers

    Code
      rdunif(1000, 1, "a")
    Condition
      Error in `rdunif()`:
      ! is.numeric(a) is not TRUE

---

    Code
      rdunif(1000, 1, c(0.5, 0.2))
    Condition
      Error in `rdunif()`:
      ! length(a) == 1 is not TRUE

---

    Code
      rdunif(1000, FALSE, 2)
    Condition
      Error in `rdunif()`:
      ! is.numeric(b) is not TRUE

---

    Code
      rdunif(1000, c(2, 3), 2)
    Condition
      Error in `rdunif()`:
      ! length(b) == 1 is not TRUE

