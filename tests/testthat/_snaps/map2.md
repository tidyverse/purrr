# map2 recycles inputs

    Code
      map2(1:2, 1:3, `+`)
    Condition
      Error:
      ! Mapped vectors must have consistent lengths:
      * `.x` has length 2
      * `.y` has length 3

