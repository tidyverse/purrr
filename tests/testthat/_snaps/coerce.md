# can coerce to character vectors

    Code
      expect_equal(coerce_chr(TRUE), "TRUE")
    Condition
      Warning:
      Automatic coercion from type to character was deprecated in purrr 1.0.0.
      Please use an explicit call to as.character() within map_chr() instead.
    Code
      expect_equal(coerce_chr(1L), "1")
    Condition
      Warning:
      Automatic coercion from type to character was deprecated in purrr 1.0.0.
      Please use an explicit call to as.character() within map_chr() instead.
    Code
      expect_equal(coerce_chr(1.5), "1.500000")
    Condition
      Warning:
      Automatic coercion from type to character was deprecated in purrr 1.0.0.
      Please use an explicit call to as.character() within map_chr() instead.

