# Produce all combinations of list elements

**\[deprecated\]**

These functions were deprecated in purrr 1.0.0 because they are slow and
buggy, and we no longer think they are the right approach to solving
this problem. Please use
[`tidyr::expand_grid()`](https://tidyr.tidyverse.org/reference/expand_grid.html)
instead.

Here is an example of equivalent usages for `cross()` and
`expand_grid()`:

    data <- list(
      id = c("John", "Jane"),
      sep = c("! ", "... "),
      greeting = c("Hello.", "Bonjour.")
    )

    # With deprecated `cross()`
    data |> cross() |> map_chr(\(...) paste0(..., collapse = ""))

    # With `expand_grid()`
    tidyr::expand_grid(!!!data) |> pmap_chr(paste)

## Usage

``` r
cross(.l, .filter = NULL)

cross2(.x, .y, .filter = NULL)

cross3(.x, .y, .z, .filter = NULL)

cross_df(.l, .filter = NULL)
```

## Arguments

- .l:

  A list of lists or atomic vectors. Alternatively, a data frame.
  `cross_df()` requires all elements to be named.

- .filter:

  A predicate function that takes the same number of arguments as the
  number of variables to be combined.

- .x, .y, .z:

  Lists or atomic vectors.

## Value

`cross2()`, `cross3()` and `cross()` always return a list. `cross_df()`
always returns a data frame. `cross()` returns a list where each element
is one combination so that the list can be directly mapped over.
`cross_df()` returns a data frame where each row is one combination.

## Details

`cross2()` returns the product set of the elements of `.x` and `.y`.
`cross3()` takes an additional `.z` argument. `cross()` takes a list
`.l` and returns the cartesian product of all its elements in a list,
with one combination by element. `cross_df()` is like `cross()` but
returns a data frame, with one combination by row.

`cross()`, `cross2()` and `cross3()` return the cartesian product is
returned in wide format. This makes it more amenable to mapping
operations. `cross_df()` returns the output in long format just as
[`expand.grid()`](https://rdrr.io/r/base/expand.grid.html) does. This is
adapted to rowwise operations.

When the number of combinations is large and the individual elements are
heavy memory-wise, it is often useful to filter unwanted combinations on
the fly with `.filter`. It must be a predicate function that takes the
same number of arguments as the number of crossed objects (2 for
`cross2()`, 3 for `cross3()`, `length(.l)` for `cross()`) and returns
`TRUE` or `FALSE`. The combinations where the predicate function returns
`TRUE` will be removed from the result.

## See also

[`expand.grid()`](https://rdrr.io/r/base/expand.grid.html)

## Examples

``` r
# We build all combinations of names, greetings and separators from our
# list of data and pass each one to paste()
data <- list(
  id = c("John", "Jane"),
  greeting = c("Hello.", "Bonjour."),
  sep = c("! ", "... ")
)

data |>
  cross() |>
  map(lift(paste))
#> Warning: `cross()` was deprecated in purrr 1.0.0.
#> ℹ Please use `tidyr::expand_grid()` instead.
#> ℹ See <https://github.com/tidyverse/purrr/issues/768>.
#> Warning: `lift()` was deprecated in purrr 1.0.0.
#> [[1]]
#> [1] "John! Hello."
#> 
#> [[2]]
#> [1] "Jane! Hello."
#> 
#> [[3]]
#> [1] "John! Bonjour."
#> 
#> [[4]]
#> [1] "Jane! Bonjour."
#> 
#> [[5]]
#> [1] "John... Hello."
#> 
#> [[6]]
#> [1] "Jane... Hello."
#> 
#> [[7]]
#> [1] "John... Bonjour."
#> 
#> [[8]]
#> [1] "Jane... Bonjour."
#> 

# cross() returns the combinations in long format: many elements,
# each representing one combination. With cross_df() we'll get a
# data frame in long format: crossing three objects produces a data
# frame of three columns with each row being a particular
# combination. This is the same format that expand.grid() returns.
args <- data |> cross_df()
#> Warning: `cross_df()` was deprecated in purrr 1.0.0.
#> ℹ Please use `tidyr::expand_grid()` instead.
#> ℹ See <https://github.com/tidyverse/purrr/issues/768>.

# In case you need a list in long format (and not a data frame)
# just run as.list() after cross_df()
args |> as.list()
#> $id
#> [1] "John" "Jane" "John" "Jane" "John" "Jane" "John" "Jane"
#> 
#> $greeting
#> [1] "Hello."   "Hello."   "Bonjour." "Bonjour." "Hello."   "Hello."  
#> [7] "Bonjour." "Bonjour."
#> 
#> $sep
#> [1] "! "   "! "   "! "   "! "   "... " "... " "... " "... "
#> 

# This format is often less practical for functional programming
# because applying a function to the combinations requires a loop
out <- vector("character", length = nrow(args))
for (i in seq_along(out))
  out[[i]] <- invoke("paste", map(args, i))
#> Warning: `invoke()` was deprecated in purrr 1.0.0.
#> ℹ Please use `exec()` instead.
out
#> [1] "John! Hello."     "Jane! Hello."     "John! Bonjour."  
#> [4] "Jane! Bonjour."   "John... Hello."   "Jane... Hello."  
#> [7] "John... Bonjour." "Jane... Bonjour."

# It's easier to transpose and then use invoke_map()
args |> transpose() |> map_chr(\(x) exec(paste, !!!x))
#> [1] "John! Hello."     "Jane! Hello."     "John! Bonjour."  
#> [4] "Jane! Bonjour."   "John... Hello."   "Jane... Hello."  
#> [7] "John... Bonjour." "Jane... Bonjour."

# Unwanted combinations can be filtered out with a predicate function
filter <- function(x, y) x >= y
cross2(1:5, 1:5, .filter = filter) |> str()
#> Warning: `cross2()` was deprecated in purrr 1.0.0.
#> ℹ Please use `tidyr::expand_grid()` instead.
#> ℹ See <https://github.com/tidyverse/purrr/issues/768>.
#> List of 10
#>  $ :List of 2
#>   ..$ : int 1
#>   ..$ : int 2
#>  $ :List of 2
#>   ..$ : int 1
#>   ..$ : int 3
#>  $ :List of 2
#>   ..$ : int 2
#>   ..$ : int 3
#>  $ :List of 2
#>   ..$ : int 1
#>   ..$ : int 4
#>  $ :List of 2
#>   ..$ : int 2
#>   ..$ : int 4
#>  $ :List of 2
#>   ..$ : int 3
#>   ..$ : int 4
#>  $ :List of 2
#>   ..$ : int 1
#>   ..$ : int 5
#>  $ :List of 2
#>   ..$ : int 2
#>   ..$ : int 5
#>  $ :List of 2
#>   ..$ : int 3
#>   ..$ : int 5
#>  $ :List of 2
#>   ..$ : int 4
#>   ..$ : int 5

# To give names to the components of the combinations, we map
# setNames() on the product:
x <- seq_len(3)
cross2(x, x, .filter = `==`) |>
  map(setNames, c("x", "y"))
#> [[1]]
#> [[1]]$x
#> [1] 2
#> 
#> [[1]]$y
#> [1] 1
#> 
#> 
#> [[2]]
#> [[2]]$x
#> [1] 3
#> 
#> [[2]]$y
#> [1] 1
#> 
#> 
#> [[3]]
#> [[3]]$x
#> [1] 1
#> 
#> [[3]]$y
#> [1] 2
#> 
#> 
#> [[4]]
#> [[4]]$x
#> [1] 3
#> 
#> [[4]]$y
#> [1] 2
#> 
#> 
#> [[5]]
#> [[5]]$x
#> [1] 1
#> 
#> [[5]]$y
#> [1] 3
#> 
#> 
#> [[6]]
#> [[6]]$x
#> [1] 2
#> 
#> [[6]]$y
#> [1] 3
#> 
#> 

# Alternatively we can encapsulate the arguments in a named list
# before crossing to get named components:
list(x = x, y = x) |>
  cross(.filter = `==`)
#> [[1]]
#> [[1]]$x
#> [1] 2
#> 
#> [[1]]$y
#> [1] 1
#> 
#> 
#> [[2]]
#> [[2]]$x
#> [1] 3
#> 
#> [[2]]$y
#> [1] 1
#> 
#> 
#> [[3]]
#> [[3]]$x
#> [1] 1
#> 
#> [[3]]$y
#> [1] 2
#> 
#> 
#> [[4]]
#> [[4]]$x
#> [1] 3
#> 
#> [[4]]$y
#> [1] 2
#> 
#> 
#> [[5]]
#> [[5]]$x
#> [1] 1
#> 
#> [[5]]$y
#> [1] 3
#> 
#> 
#> [[6]]
#> [[6]]$x
#> [1] 2
#> 
#> [[6]]$y
#> [1] 3
#> 
#> 
```
