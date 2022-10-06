# is deprecated

    Code
      . <- rerun(5, rnorm(1))
    Condition
      Warning:
      `rerun()` was deprecated in purrr 1.0.0.
      i Please use `map()` instead.
        # Previously
        rerun(5, rnorm(1))
      
        # Now
        map(1:5, ~ rnorm(1))
    Code
      . <- rerun(5, rnorm(1), rnorm(2))
    Condition
      Warning:
      `rerun()` was deprecated in purrr 1.0.0.
      i Please use `map()` instead.
        # Previously
        rerun(5, rnorm(1), rnorm(2))
      
        # Now
        map(1:5, ~ list(rnorm(1), rnorm(2)))

