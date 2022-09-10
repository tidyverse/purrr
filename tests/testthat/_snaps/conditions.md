# stop_bad_type() constructs default `what`

    Code
      stop_bad_type(NA, "`NULL`")
    Condition
      Error in `stop_bad_type()`:
      ! Object must be `NULL`, not `NA`

---

    Code
      stop_bad_type(NA, "`NULL`", arg = ".foo")
    Condition
      Error in `stop_bad_type()`:
      ! `.foo` must be `NULL`, not `NA`

---

    Code
      stop_bad_type(NA, "`NULL`", arg = quote(.foo))
    Condition
      Error in `stop_bad_type()`:
      ! `arg` must be `NULL` or a string, not a symbol

# stop_bad_element_type() constructs type errors

    Code
      stop_bad_element_type(1:3, 3, "a foobaz")
    Condition
      Error in `stop_bad_element_type()`:
      ! Element 3 must be a foobaz, not an integer vector

---

    Code
      stop_bad_element_type(1:3, 3, "a foobaz", actual = "a quux")
    Condition
      Error in `stop_bad_element_type()`:
      ! Element 3 must be a foobaz, not an integer vector

---

    Code
      stop_bad_element_type(1:3, 3, "a foobaz", arg = "..arg")
    Condition
      Error in `stop_bad_element_type()`:
      ! `..arg[[3]]` must be a foobaz, not an integer vector

# stop_bad_element_type() accepts `what`

    Code
      stop_bad_element_type(1:3, 3, "a foobaz", what = "Result")
    Condition
      Error in `stop_bad_element_type()`:
      ! Result 3 must be a foobaz, not an integer vector

# stop_bad_element_length() constructs error message

    Code
      stop_bad_element_length(1:3, 8, 10)
    Condition
      Error in `stop_bad_element_length()`:
      ! Element 8 must have length 10, not 3

---

    Code
      stop_bad_element_length(1:3, 8, 10, arg = ".foo")
    Condition
      Error in `stop_bad_element_length()`:
      ! `.foo[[8]]` must have length 10, not 3

---

    Code
      stop_bad_element_length(1:3, 8, 10, arg = ".foo", what = "Result")
    Condition
      Error in `stop_bad_element_length()`:
      ! `.foo[[8]]` must have length 10, not 3

---

    Code
      stop_bad_element_length(1:3, 8, 10, arg = ".foo", what = "Result", recycle = TRUE)
    Condition
      Error in `stop_bad_element_length()`:
      ! `.foo[[8]]` must have length 1 or 10, not 3

