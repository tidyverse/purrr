# stop_bad_type() constructs default `what`

    Code
      stop_bad_type(NA, "`NULL`")
    Condition
      Error:
      ! Object must be `NULL`, not `NA`.

---

    Code
      stop_bad_type(NA, "`NULL`", arg = ".foo")
    Condition
      Error:
      ! `.foo` must be `NULL`, not `NA`.

---

    Code
      stop_bad_type(NA, "`NULL`", arg = quote(.foo))
    Condition
      Error in `what_bad_object()`:
      ! `arg` must be `NULL` or a string, not a symbol.

# stop_bad_element_type() constructs type errors

    Code
      stop_bad_element_type(1:3, 3, "a foobaz")
    Condition
      Error:
      ! Element 3 must be a foobaz, not an integer vector.

---

    Code
      stop_bad_element_type(1:3, 3, "a foobaz", actual = "a quux")
    Condition
      Error:
      ! Element 3 must be a foobaz, not an integer vector.

---

    Code
      stop_bad_element_type(1:3, 3, "a foobaz", arg = "..arg")
    Condition
      Error:
      ! `..arg[[3]]` must be a foobaz, not an integer vector.

# stop_bad_element_type() accepts `what`

    Code
      stop_bad_element_type(1:3, 3, "a foobaz", what = "Result")
    Condition
      Error:
      ! Result 3 must be a foobaz, not an integer vector.

# stop_bad_element_length() constructs error message

    Code
      stop_bad_element_length(1:3, 8, 10)
    Condition
      Error:
      ! Element 8 must have length 10, not 3.

---

    Code
      stop_bad_element_length(1:3, 8, 10, arg = ".foo")
    Condition
      Error:
      ! `.foo[[8]]` must have length 10, not 3.

---

    Code
      stop_bad_element_length(1:3, 8, 10, arg = ".foo", what = "Result")
    Condition
      Error:
      ! `.foo[[8]]` must have length 10, not 3.

---

    Code
      stop_bad_element_length(1:3, 8, 10, arg = ".foo", what = "Result", recycle = TRUE)
    Condition
      Error:
      ! `.foo[[8]]` must have length 1 or 10, not 3.

