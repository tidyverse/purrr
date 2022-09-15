# fails on non-vectors

    Code
      map(environment(), identity)
    Condition
      Error in `map()`:
      ! `.x` must be a vector, not an environment.

---

    Code
      map(quote(a), identity)
    Condition
      Error in `map()`:
      ! `.x` must be a vector, not a symbol.

# error message follows style guide when result is not length 1

    Code
      purrr::map_int(x, "a")
    Condition
      Error in `purrr::map_int()`:
      ! Result 2 must have length 1, not 2.

# requires output be length 1

    Code
      map_vec(1:2, ~ rep(1, .x))
    Condition
      Error in `map_vec()`:
      ! All elements must be size 1.
      i `out[[2]]` is size 2.

# requires common type of output

    Code
      map_vec(1:2, ~ if (.x == 1) factor("x") else 1)
    Condition
      Error:
      ! Can't combine `..1` <factor<bf275>> and `..2` <double>.

# can enforce .ptype

    Code
      map_vec(1:2, ~ factor("x"), .ptype = integer())
    Condition
      Error:
      ! Can't convert <factor<bf275>> to <integer>.

