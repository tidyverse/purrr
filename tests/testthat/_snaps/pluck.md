# require length 1 character/double vectors

    Code
      pluck(1, 1:2)
    Condition
      Error in `stop_bad_length()`:
      ! Index 1 must have length 1, not 2
    Code
      pluck(1, integer())
    Condition
      Error in `stop_bad_length()`:
      ! Index 1 must have length 1, not 0
    Code
      pluck(1, NULL)
    Condition
      Error in `stop_bad_length()`:
      ! Index 1 must have length 1, not 0
    Code
      pluck(1, TRUE)
    Condition
      Error in `stop_bad_type()`:
      ! Index 1 must be a character or numeric vector, not a logical vector

# validate index even when indexing NULL

    Code
      pluck(NULL, 1:2)
    Condition
      Error in `stop_bad_length()`:
      ! Index 1 must have length 1, not 2
    Code
      pluck(NULL, TRUE)
    Condition
      Error in `stop_bad_type()`:
      ! Index 1 must be a character or numeric vector, not a logical vector

