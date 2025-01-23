# Can't use `...` in a parallel map

    Code
      map(list(x = 1, y = 2), list, a = "wrong", .parallel = TRUE)
    Condition
      Error in `map()`:
      ! Don't use `...` with `.parallel = TRUE`

# all inform about location of problem

    Code
      map_int(1:3, carrier::crate(function(x, bad = 2:1) if (x == 3) bad else x),
      .parallel = TRUE)
    Condition
      Error in `map_int()`:
      ! `x[[3]]` must have size 1, not size 2.
    Code
      map_int(1:3, carrier::crate(function(x, bad = "x") if (x == 3) bad else x),
      .parallel = TRUE)
    Condition
      Error in `map_int()`:
      ! Can't convert `<list>[[3]]` <character> to <integer>.
    Code
      map(1:3, carrier::crate(function(x, bad = stop("Doesn't work")) if (x ==
      3) bad else x), .parallel = TRUE)
    Condition
      Error in `map()`:
      i In index: 3.
      Caused by error:
      ! Doesn't work

# error location uses name if present

    Code
      map_int(c(a = 1, b = 2, c = 3), carrier::crate(function(x, bad = stop(
        "Doesn't work")) if (x == 3) bad else x), .parallel = TRUE)
    Condition
      Error in `map_int()`:
      i In index: 3.
      i With name: c.
      Caused by error:
      ! Doesn't work
    Code
      map_int(c(a = 1, b = 2, 3), carrier::crate(function(x, bad = stop(
        "Doesn't work")) if (x == 3) bad else x), .parallel = TRUE)
    Condition
      Error in `map_int()`:
      i In index: 3.
      Caused by error:
      ! Doesn't work

# requires output be length 1 and have common type

    Code
      map_vec(1:2, ~ rep(1, .x), .parallel = TRUE)
    Condition
      Error in `map_vec()`:
      ! `out[[2]]` must have size 1, not size 2.
    Code
      map_vec(1:2, ~ if (.x == 1) factor("x") else 1, .parallel = TRUE)
    Condition
      Error in `map_vec()`:
      ! Can't combine `<list>[[1]]` <factor<bf275>> and `<list>[[2]]` <double>.

# can enforce .ptype

    Code
      map_vec(1:2, ~ factor("x"), .ptype = integer(), .parallel = TRUE)
    Condition
      Error in `map_vec()`:
      ! Can't convert `<list>[[1]]` <factor<bf275>> to <integer>.

# verifies result types and length

    Code
      map2_int(1, 1, ~"x", .parallel = TRUE)
    Condition
      Error in `map2_int()`:
      ! Can't convert `<list>[[1]]` <character> to <integer>.
    Code
      map2_int(1, 1, ~ 1:2, .parallel = TRUE)
    Condition
      Error in `map2_int()`:
      ! `x[[1]]` must have size 1, not size 2.
    Code
      map2_vec(1, 1, ~1, .ptype = character(), .parallel = TRUE)
    Condition
      Error in `map2_vec()`:
      ! Can't convert `<list>[[1]]` <double> to <character>.

---

    Code
      pmap_int(list(1), ~"x", .parallel = TRUE)
    Condition
      Error in `pmap_int()`:
      ! Can't convert `<list>[[1]]` <character> to <integer>.
    Code
      pmap_int(list(1), ~ 1:2, .parallel = TRUE)
    Condition
      Error in `pmap_int()`:
      ! `x[[1]]` must have size 1, not size 2.
    Code
      pmap_vec(list(1), ~1, .ptype = character(), .parallel = TRUE)
    Condition
      Error in `pmap_vec()`:
      ! Can't convert `<list>[[1]]` <double> to <character>.

# requires vector inputs

    Code
      map2(environment(), "a", identity, .parallel = TRUE)
    Condition
      Error in `map2()`:
      ! `.x` must be a vector, not an environment.
    Code
      map2("a", environment(), "a", identity, .parallel = TRUE)
    Condition
      Error in `map2()`:
      ! `.y` must be a vector, not an environment.

# recycles inputs

    Code
      map2(1:2, 1:3, `+`, .parallel = TRUE)
    Condition
      Error in `map2()`:
      ! Can't recycle `.x` (size 2) to match `.y` (size 3).
    Code
      map2(1:2, integer(), `+`, .parallel = TRUE)
    Condition
      Error in `map2()`:
      ! Can't recycle `.x` (size 2) to match `.y` (size 0).

---

    Code
      pmap(list(1:2, 1:3), `+`, .parallel = TRUE)
    Condition
      Error in `pmap()`:
      ! Can't recycle `.l[[1]]` (size 2) to match `.l[[2]]` (size 3).
    Code
      pmap(list(1:2, integer()), `+`, .parallel = TRUE)
    Condition
      Error in `pmap()`:
      ! Can't recycle `.l[[1]]` (size 2) to match `.l[[2]]` (size 0).

# requires list of vectors

    Code
      pmap(environment(), identity)
    Condition
      Error in `pmap()`:
      ! `.l` must be a list, not an environment.
    Code
      pmap(list(environment()), identity)
    Condition
      Error in `pmap()`:
      ! `.l[[1]]` must be a vector, not an environment.

