# dots must be unnamed

    Code
      pluck(1, a = 1)
    Condition
      Error in `pluck()`:
      ! Arguments in `...` must be passed by position, not name.
      x Problematic argument:
      * a = 1

---

    Code
      chuck(1, a = 1)
    Condition
      Error in `chuck()`:
      ! Arguments in `...` must be passed by position, not name.
      x Problematic argument:
      * a = 1

# require length 1 character/double vectors

    Code
      pluck(1, 1:2)
    Condition
      Error in `pluck()`:
      ! Index 1 must have length 1, not 2.
    Code
      pluck(1, integer())
    Condition
      Error in `pluck()`:
      ! Index 1 must have length 1, not 0.
    Code
      pluck(1, NULL)
    Condition
      Error in `pluck()`:
      ! Index 1 must have length 1, not 0.
    Code
      pluck(1, TRUE)
    Condition
      Error in `pluck()`:
      ! Index 1 must be a character or numeric vector, not `TRUE`.

# validate index even when indexing NULL

    Code
      pluck(NULL, 1:2)
    Condition
      Error in `pluck()`:
      ! Index 1 must have length 1, not 2.
    Code
      pluck(NULL, TRUE)
    Condition
      Error in `pluck()`:
      ! Index 1 must be a character or numeric vector, not `TRUE`.

# pluck errors with invalid indices

    Code
      pluck(environment(), 1)
    Condition
      Error in `pluck()`:
      ! Index 1 must be a string, not a number.

---

    Code
      pluck(environment(), letters)
    Condition
      Error in `pluck()`:
      ! Index 1 must have length 1, not 26.

---

    Code
      pluck(A, 1)
    Condition
      Error in `pluck()`:
      ! Index 1 must be a string, not a number.

---

    Code
      pluck(A, letters)
    Condition
      Error in `pluck()`:
      ! Index 1 must have length 1, not 26.

# assign_in() requires at least one location

    Code
      assign_in(x, NULL, value = "foo")
    Condition
      Error in `assign_in()`:
      ! `where` must contain at least one element.
    Code
      pluck(x) <- "foo"
    Condition
      Error in `assign_in()`:
      ! `where` must contain at least one element.

# trying to chuck NULL raises errors

    Code
      chuck(NULL, "a")
    Condition
      Error:
      ! Index 1 is attempting to pluck from an unnamed vector using a string name.

# special indexes raise errors

    Code
      chuck(x, integer(0))
    Condition
      Error in `chuck()`:
      ! Index 1 must have length 1, not 0.

# indices outside of vector length raise errors

    Code
      chuck(1:4, 10)
    Condition
      Error:
      ! Index 1 exceeds the length of plucked object (10 > 4).
    Code
      chuck(1:4, 0)
    Condition
      Error:
      ! Index 1 is zero.
    Code
      chuck(1:4, -10)
    Condition
      Error:
      ! Negative index 1 must be greater than or equal to -4, not -10.

