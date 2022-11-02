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

