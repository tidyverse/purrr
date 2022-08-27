# indices outside of vector length raise errors

    Code
      chuck(1:4, 10)
    Condition
      Error:
      ! Index 1 exceeds the length of plucked object (10 > 4)
    Code
      chuck(1:4, 0)
    Condition
      Error:
      ! Index 1 is zero
    Code
      chuck(1:4, -10)
    Condition
      Error:
      ! Negative index 1 must be greater than or equal to -4, not -9

