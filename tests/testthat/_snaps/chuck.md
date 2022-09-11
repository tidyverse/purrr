# trying to chuck NULL raises errors

    Code
      chuck(NULL, "a")
    Condition
      Error:
      ! Index 1 is attempting to pluck from an unnamed vector using a string name.

# dots must be unnamed

    Code
      chuck(1, a = 1)
    Condition
      Error in `chuck()`:
      ! Arguments in `...` must be passed by position, not name.
      x Problematic argument:
      * a = 1

# special indexes raise errors

    Code
      chuck(x, integer(0))
    Condition
      Error:
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

