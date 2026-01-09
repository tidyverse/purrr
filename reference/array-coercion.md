# Coerce array to list

`array_branch()` and `array_tree()` enable arrays to be used with
purrr's functionals by turning them into lists. The details of the
coercion are controlled by the `margin` argument. `array_tree()` creates
an hierarchical list (a tree) that has as many levels as dimensions
specified in `margin`, while `array_branch()` creates a flat list (by
analogy, a branch) along all mentioned dimensions.

## Usage

``` r
array_branch(array, margin = NULL)

array_tree(array, margin = NULL)
```

## Arguments

- array:

  An array to coerce into a list.

- margin:

  A numeric vector indicating the positions of the indices to be to be
  enlisted. If `NULL`, a full margin is used. If `numeric(0)`, the array
  as a whole is wrapped in a list.

## Details

When no margin is specified, all dimensions are used by default. When
`margin` is a numeric vector of length zero, the whole array is wrapped
in a list.

## Examples

``` r
# We create an array with 3 dimensions
x <- array(1:12, c(2, 2, 3))

# A full margin for such an array would be the vector 1:3. This is
# the default if you don't specify a margin

# Creating a branch along the full margin is equivalent to
# as.list(array) and produces a list of size length(x):
array_branch(x) |> str()
#> List of 12
#>  $ : int 1
#>  $ : int 2
#>  $ : int 3
#>  $ : int 4
#>  $ : int 5
#>  $ : int 6
#>  $ : int 7
#>  $ : int 8
#>  $ : int 9
#>  $ : int 10
#>  $ : int 11
#>  $ : int 12

# A branch along the first dimension yields a list of length 2
# with each element containing a 2x3 array:
array_branch(x, 1) |> str()
#> List of 2
#>  $ : int [1:2, 1:3] 1 3 5 7 9 11
#>  $ : int [1:2, 1:3] 2 4 6 8 10 12

# A branch along the first and third dimensions yields a list of
# length 2x3 whose elements contain a vector of length 2:
array_branch(x, c(1, 3)) |> str()
#> List of 6
#>  $ : int [1:2] 1 3
#>  $ : int [1:2] 2 4
#>  $ : int [1:2] 5 7
#>  $ : int [1:2] 6 8
#>  $ : int [1:2] 9 11
#>  $ : int [1:2] 10 12

# Creating a tree from the full margin creates a list of lists of
# lists:
array_tree(x) |> str()
#> List of 2
#>  $ :List of 2
#>   ..$ :List of 3
#>   .. ..$ : int 1
#>   .. ..$ : int 5
#>   .. ..$ : int 9
#>   ..$ :List of 3
#>   .. ..$ : int 3
#>   .. ..$ : int 7
#>   .. ..$ : int 11
#>  $ :List of 2
#>   ..$ :List of 3
#>   .. ..$ : int 2
#>   .. ..$ : int 6
#>   .. ..$ : int 10
#>   ..$ :List of 3
#>   .. ..$ : int 4
#>   .. ..$ : int 8
#>   .. ..$ : int 12

# The ordering and the depth of the tree are controlled by the
# margin argument:
array_tree(x, c(3, 1)) |> str()
#> List of 3
#>  $ :List of 2
#>   ..$ : int [1:2] 1 3
#>   ..$ : int [1:2] 2 4
#>  $ :List of 2
#>   ..$ : int [1:2] 5 7
#>   ..$ : int [1:2] 6 8
#>  $ :List of 2
#>   ..$ : int [1:2] 9 11
#>   ..$ : int [1:2] 10 12
```
