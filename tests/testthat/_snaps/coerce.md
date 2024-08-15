# can coerce to logical vectors

    Code
      coerce_lgl(2L)
    Condition
      Error:
      ! Can't coerce from an integer to a logical.

---

    Code
      coerce_lgl(1.5)
    Condition
      Error:
      ! Can't coerce from a number to a logical.

---

    Code
      coerce_lgl("true")
    Condition
      Error:
      ! Can't coerce from a string to a logical.

# can coerce to integer vectors

    Code
      coerce_int(1.5)
    Condition
      Error:
      ! Can't coerce from a number to an integer.

---

    Code
      coerce_int("1")
    Condition
      Error:
      ! Can't coerce from a string to an integer.

# can coerce to double vctrs

    Code
      coerce_dbl("1.5")
    Condition
      Error:
      ! Can't coerce from a string to a double.

# can coerce to character vectors

    Code
      expect_equal(coerce_chr(TRUE), "TRUE")
    Condition
      Warning:
      Automatic coercion from logical to character was deprecated in purrr 1.0.0.
      i Please use an explicit call to `as.character()` within `map_chr()` instead.
    Code
      expect_equal(coerce_chr(1L), "1")
    Condition
      Warning:
      Automatic coercion from integer to character was deprecated in purrr 1.0.0.
      i Please use an explicit call to `as.character()` within `map_chr()` instead.
    Code
      expect_equal(coerce_chr(1.5), "1.500000")
    Condition
      Warning:
      Automatic coercion from double to character was deprecated in purrr 1.0.0.
      i Please use an explicit call to `as.character()` within `map_chr()` instead.

# error captures correct env

    Code
      map_chr(1:4, identity)
    Condition
      Warning:
      Automatic coercion from integer to character was deprecated in purrr 1.0.0.
      i Please use an explicit call to `as.character()` within `map_chr()` instead.
    Output
      [1] "1" "2" "3" "4"
    Code
      indirect()
    Output
      [1] "1" "2" "3" "4"

# can't coerce to expressions

    Code
      coerce(list(1), "expression")
    Condition
      Error:
      ! Can't coerce from a list to expression.

