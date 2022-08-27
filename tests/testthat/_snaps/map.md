# requires output be length 1

    Code
      map_vec(1:2, ~ rep(1, .x))
    Condition
      Error in `stop_bad_type()`:
      ! Result 2 must be a single double, not a double vector of length 2

# requires common type of output

    Code
      map_vec(1:2, ~ if (.x == 1) factor("x") else 1)
    Condition
      Error in `map_vec()`:
      ! Can't combine `..1` <factor<bf275>> and `..2` <double>.

# can enforce .ptype

    Code
      map_vec(1:2, ~ factor("x"), .ptype = integer())
    Condition
      Error:
      ! Can't convert <factor<bf275>> to <integer>.

