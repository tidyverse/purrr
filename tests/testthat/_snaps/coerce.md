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

# can't coerce to character vectors

    Code
      expect_equal(coerce_chr(TRUE), "TRUE")
    Condition
      Error:
      ! Can't coerce from a logical value to a string.
    Code
      expect_equal(coerce_chr(1L), "1")
    Condition
      Error:
      ! Can't coerce from an integer to a string.
    Code
      expect_equal(coerce_chr(1.5), "1.500000")
    Condition
      Error:
      ! Can't coerce from a number to a string.

# can't coerce to expressions

    Code
      coerce(list(1), "expression")
    Condition
      Error:
      ! Can't coerce from a list to expression.

