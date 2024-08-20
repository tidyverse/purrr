# auto_browse() not intended for primitive functions

    Code
      auto_browse(log)(NULL)
    Condition
      Error in `auto_browse()`:
      ! `.f` must not be a primitive function.

---

    Code
      auto_browse(identity)(NULL)
    Output
      NULL

