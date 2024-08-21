# filtering requires a predicate function

    Code
      cross2(1:3, 1:3, .filter = ~ c(TRUE, TRUE))
    Condition
      Error in `cross()`:
      ! The filter function must return a single `TRUE` or `FALSE`, not a logical vector.

# filtering fails when filter function doesn't return a logical

    Code
      cross3(1:3, 1:3, 1:3, .filter = filter)
    Condition
      Error in `cross()`:
      ! The filter function must return a single `TRUE` or `FALSE`, not an integer.

