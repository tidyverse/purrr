# list_c() concatenates vctrs of compatible types

    Code
      list_c(list("a", 1))
    Condition
      Error in `list_c()`:
      ! Can't combine `x[[1]]` <character> and `x[[2]]` <double>.

# list_c() can enforce ptype

    Code
      list_c(list("a"), ptype = integer())
    Condition
      Error in `list_c()`:
      ! Can't convert `x[[1]]` <character> to <integer>.

# list_cbind() column-binds compatible data frames

    Code
      list_cbind(list(df1, df3))
    Condition
      Error in `list_cbind()`:
      ! Can't recycle `..1` (size 2) to match `..2` (size 3).

# list_cbind() can enforce size

    Code
      list_cbind(list(df1), size = 3)
    Condition
      Error:
      ! Can't recycle input of size 2 to size 3.

# list_rbind() row-binds compatible data.frames

    Code
      list_rbind(list(df1, df3))
    Condition
      Error in `list_rbind()`:
      ! Can't combine `..1$x` <double> and `..2$x` <character>.

# list_rbind() can enforce ptype

    Code
      ptype <- data.frame(x = character(), stringsAsFactors = FALSE)
      list_rbind(list(df1), ptype = ptype)
    Condition
      Error in `list_rbind()`:
      ! Can't convert `..1$x` <double> to match type of `x` <character>.

# assert input is a list

    Code
      list_c(1)
    Condition
      Error in `list_c()`:
      ! `x` must be a list, not the number 1.
    Code
      list_rbind(1)
    Condition
      Error in `list_rbind()`:
      ! `x` must be a list, not the number 1.
    Code
      list_cbind(1)
    Condition
      Error in `list_cbind()`:
      ! `x` must be a list, not the number 1.

---

    Code
      list_c(mtcars)
    Condition
      Error in `list_c()`:
      ! `x` must be a list, not a <data.frame> object.
    Code
      list_rbind(mtcars)
    Condition
      Error in `list_rbind()`:
      ! `x` must be a list, not a <data.frame> object.
    Code
      list_cbind(mtcars)
    Condition
      Error in `list_cbind()`:
      ! `x` must be a list, not a <data.frame> object.

# assert input is list of data frames

    Code
      list_rbind(list(1, mtcars, 3))
    Condition
      Error in `list_rbind()`:
      ! Each element of `x` must be either a data frame or `NULL`.
      i Elements 1 and 3 are not.
    Code
      list_cbind(list(1, mtcars, 3))
    Condition
      Error in `list_cbind()`:
      ! Each element of `x` must be either a data frame or `NULL`.
      i Elements 1 and 3 are not.

