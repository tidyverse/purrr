# partial() squashes quosures before printing

    Code
      foo
    Output
      <partialised>
      function (...) 
      foo(y = 3, ...)

# checks inputs

    Code
      partial(1)
    Condition
      Error in `partial()`:
      ! `.f` must be a function, not a number.

