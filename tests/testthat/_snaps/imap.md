# passing .y parameter to imap() results in an error

    Code
      imap(5:1, sum, .y = 5:1)
    Condition
      Error in `map2()`:
      ! formal argument ".y" matched by multiple actual arguments

