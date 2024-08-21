# can pluck/chuck from NULL

    Code
      chuck(NULL, 1)
    Condition
      Error in `chuck()`:
      ! Can't pluck from NULL at level 1.

# unsupported types have useful error

    Code
      pluck(quote(x), 1)
    Condition
      Error in `pluck_raw()`:
      ! Can't pluck from a symbol at level 1.
    Code
      pluck(quote(f(x, 1)), 1)
    Condition
      Error in `pluck_raw()`:
      ! Can't pluck from a call at level 1.
    Code
      pluck(expression(1), 1)
    Condition
      Error in `pluck_raw()`:
      ! Can't pluck from an expression vector at level 1.

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

# can pluck by position (positive and negative)

    Code
      chuck(x, 0)
    Condition
      Error in `chuck()`:
      ! Index 1 is zero.

---

    Code
      chuck(x, 4)
    Condition
      Error in `chuck()`:
      ! Index 1 exceeds the length of plucked object (4 > 3).

---

    Code
      chuck(x, -4)
    Condition
      Error in `chuck()`:
      ! Index 1 is zero.

---

    Code
      chuck(x, -5)
    Condition
      Error in `chuck()`:
      ! Negative index 1 must be greater than or equal to -3, not -5.

# special numbers don't match

    Code
      chuck(x, NA_integer_)
    Condition
      Error in `chuck()`:
      ! Index 1 must be finite, not NA.

---

    Code
      chuck(x, NA_real_)
    Condition
      Error in `chuck()`:
      ! Index 1 must be finite, not NA.

---

    Code
      chuck(x, NaN)
    Condition
      Error in `chuck()`:
      ! Index 1 must be finite, not NaN.

---

    Code
      chuck(x, Inf)
    Condition
      Error in `chuck()`:
      ! Index 1 must be finite, not Inf.

---

    Code
      chuck(x, -Inf)
    Condition
      Error in `chuck()`:
      ! Index 1 must be finite, not -Inf.

# can pluck by name

    Code
      chuck(x, "b")
    Condition
      Error in `chuck()`:
      ! Can't find name `b` in vector.

---

    Code
      chuck(x, NA_character_)
    Condition
      Error in `chuck()`:
      ! Index 1 can't be NA.

---

    Code
      chuck(x, "")
    Condition
      Error in `chuck()`:
      ! Index 1 can't be an empty string ("").

# even if names don't exist

    Code
      chuck(x, "a")
    Condition
      Error in `chuck()`:
      ! Index 1 is attempting to pluck from an unnamed vector using a string name.

# empty and NA names never match

    Code
      chuck(x, "")
    Condition
      Error in `chuck()`:
      ! Index 1 can't be an empty string ("").

---

    Code
      chuck(x, NA_character_)
    Condition
      Error in `chuck()`:
      ! Index 1 can't be NA.

# require length 1 character/double vectors

    Code
      pluck(1, 1:2)
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must have length 1, not 2.
    Code
      pluck(1, integer())
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must have length 1, not 0.
    Code
      pluck(1, NULL)
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must have length 1, not 0.
    Code
      pluck(1, TRUE)
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must be a character or numeric vector, not `TRUE`.

# validate index even when indexing NULL

    Code
      pluck(NULL, 1:2)
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must have length 1, not 2.
    Code
      pluck(NULL, TRUE)
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must be a character or numeric vector, not `TRUE`.

# accessors throw correct errors

    Code
      pluck(1:3, function() NULL)
    Condition
      Error:
      ! unused argument (1:3)
    Code
      pluck(1:3, function(x, y) y)
    Condition
      Error:
      ! argument "y" is missing, with no default

# can pluck/chuck environment by name

    Code
      chuck(x, "y")
    Condition
      Error in `chuck()`:
      ! Can't find object `y` in environment.

---

    Code
      chuck(x, NA_character_)
    Condition
      Error in `chuck()`:
      ! Index 1 can't be NA.

# environments error with invalid indices

    Code
      pluck(environment(), 1)
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must be a string, not a number.

---

    Code
      pluck(environment(), letters)
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must have length 1, not 26.

# can pluck/chuck from S4 objects

    Code
      chuck(A, "b")
    Condition
      Error in `chuck()`:
      ! Can't find slot `b`.

---

    Code
      chuck(A, NA_character_)
    Condition
      Error in `chuck()`:
      ! Index 1 can't be NA.

# S4 objects error with invalid indices

    Code
      pluck(A, 1)
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must be a string, not a number.

---

    Code
      pluck(A, letters)
    Condition
      Error in `pluck_raw()`:
      ! Index 1 must have length 1, not 26.

# pluck() dispatches on vector methods

    Code
      chuck(x, 1, 1)
    Condition
      Error in `chuck()`:
      ! Length of S3 object must be a scalar integer.

---

    Code
      chuck(x, 1, "b", 1)
    Condition
      Error in `chuck()`:
      ! Index 2 is attempting to pluck from an unnamed vector using a string name.

