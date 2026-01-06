# Modify elements selectively

Unlike [`map()`](https://purrr.tidyverse.org/dev/reference/map.md) and
its variants which always return a fixed object type (list for
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md), integer
vector for
[`map_int()`](https://purrr.tidyverse.org/dev/reference/map.md), etc),
the `modify()` family always returns the same type as the input object.

- `modify()` is a shortcut for `x[[i]] <- f(x[[i]]); return(x)`.

- `modify_if()` only modifies the elements of `x` that satisfy a
  predicate and leaves the others unchanged. `modify_at()` only modifies
  elements given by names or positions.

- `modify2()` modifies the elements of `.x` but also passes the elements
  of `.y` to `.f`, just like
  [`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md).
  `imodify()` passes the names or the indices to `.f` like
  [`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md) does.

- [`modify_in()`](https://purrr.tidyverse.org/dev/reference/modify_in.md)
  modifies a single element in a
  [`pluck()`](https://purrr.tidyverse.org/dev/reference/pluck.md)
  location.

## Usage

``` r
modify(.x, .f, ...)

modify_if(.x, .p, .f, ..., .else = NULL)

modify_at(.x, .at, .f, ...)

modify2(.x, .y, .f, ...)

imodify(.x, .f, ...)
```

## Arguments

- .x:

  A vector.

- .f:

  A function specified in the same way as the corresponding map
  function.

- ...:

  Additional arguments passed on to the mapped function.

  We now generally recommend against using `...` to pass additional
  (constant) arguments to `.f`. Instead use a shorthand anonymous
  function:

      # Instead of
      x |> map(f, 1, 2, collapse = ",")
      # do:
      x |> map(\(x) f(x, 1, 2, collapse = ","))

  This makes it easier to understand which arguments belong to which
  function and will tend to yield better error messages.

- .p:

  A single predicate function, a formula describing such a predicate
  function, or a logical vector of the same length as `.x`.
  Alternatively, if the elements of `.x` are themselves lists of
  objects, a string indicating the name of a logical element in the
  inner lists. Only those elements where `.p` evaluates to `TRUE` will
  be modified.

- .else:

  A function applied to elements of `.x` for which `.p` returns `FALSE`.

- .at:

  A logical, integer, or character vector giving the elements to select.
  Alternatively, a function that takes a vector of names, and returns a
  logical, integer, or character vector of elements to select.

  **\[deprecated\]**: if the tidyselect package is installed, you can
  use [`vars()`](https://dplyr.tidyverse.org/reference/vars.html) and
  tidyselect helpers to select elements.

- .y:

  A vector, usually the same length as `.x`.

## Value

An object the same class as `.x`

## Details

Since the transformation can alter the structure of the input; it's your
responsibility to ensure that the transformation produces a valid
output. For example, if you're modifying a data frame, `.f` must
preserve the length of the input.

## Genericity

`modify()` and variants are generic over classes that implement
[`length()`](https://rdrr.io/r/base/length.html), `[[` and `[[<-`
methods. If the default implementation is not compatible for your class,
you can override them with your own methods.

If you implement your own `modify()` method, make sure it satisfies the
following invariants:

    modify(x, identity) === x
    modify(x, compose(f, g)) === modify(x, g) |> modify(f)

These invariants are known as the [functor
laws](https://wiki.haskell.org/Functor#Functor_Laws) in computer
science.

## See also

Other map variants:
[`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md),
[`lmap()`](https://purrr.tidyverse.org/dev/reference/lmap.md),
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md),
[`map_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md),
[`map_if()`](https://purrr.tidyverse.org/dev/reference/map_if.md),
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md)

Other modify variants:
[`map_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md),
[`modify_tree()`](https://purrr.tidyverse.org/dev/reference/modify_tree.md)

## Examples

``` r
# Convert factors to characters
iris |>
  modify_if(is.factor, as.character) |>
  str()
#> 'data.frame':    150 obs. of  5 variables:
#>  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#>  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#>  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#>  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#>  $ Species     : chr  "setosa" "setosa" "setosa" "setosa" ...

# Specify which columns to map with a numeric vector of positions:
mtcars |> modify_at(c(1, 4, 5), as.character) |> str()
#> 'data.frame':    32 obs. of  11 variables:
#>  $ mpg : chr  "21" "21" "22.8" "21.4" ...
#>  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
#>  $ disp: num  160 160 108 258 360 ...
#>  $ hp  : chr  "110" "110" "93" "110" ...
#>  $ drat: chr  "3.9" "3.9" "3.85" "3.08" ...
#>  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
#>  $ qsec: num  16.5 17 18.6 19.4 17 ...
#>  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
#>  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
#>  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
#>  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...

# Or with a vector of names:
mtcars |> modify_at(c("cyl", "am"), as.character) |> str()
#> 'data.frame':    32 obs. of  11 variables:
#>  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
#>  $ cyl : chr  "6" "6" "4" "6" ...
#>  $ disp: num  160 160 108 258 360 ...
#>  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
#>  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
#>  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
#>  $ qsec: num  16.5 17 18.6 19.4 17 ...
#>  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
#>  $ am  : chr  "1" "1" "1" "0" ...
#>  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
#>  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...

list(x = sample(c(TRUE, FALSE), 100, replace = TRUE), y = 1:100) |>
  list_transpose(simplify = FALSE) |>
  modify_if("x", \(l) list(x = l$x, y = l$y * 100)) |>
  list_transpose()
#> $x
#>   [1]  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE
#>  [12]  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE
#>  [23] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
#>  [34] FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE
#>  [45]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
#>  [56]  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
#>  [67] FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
#>  [78]  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE
#>  [89]  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
#> [100] FALSE
#> 
#> $y
#>   [1]  100  200  300    4  500    6  700    8  900 1000   11 1200 1300
#>  [14]   14   15 1600   17 1800   19 2000   21   22   23 2400   25   26
#>  [27]   27   28   29 3000   31   32   33   34 3500   36   37 3800   39
#>  [40] 4000   41 4200 4300   44 4500 4600   47   48   49   50   51 5200
#>  [53] 5300   54   55 5600   57   58 5900 6000 6100 6200 6300   64   65
#>  [66]   66   67 6800   69 7000   71 7200 7300 7400   75   76 7700 7800
#>  [79]   79   80 8100 8200   83   84 8500   86 8700 8800 8900 9000 9100
#>  [92]   92   93 9400 9500 9600   97 9800 9900  100
#> 

# Use modify2() to map over two vectors and preserve the type of
# the first one:
x <- c(foo = 1L, bar = 2L)
y <- c(TRUE, FALSE)
modify2(x, y, \(x, cond) if (cond) x else 0L)
#> foo bar 
#>   1   0 

# Use a predicate function to decide whether to map a function:
modify_if(iris, is.factor, as.character)
#>     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
#> 1            5.1         3.5          1.4         0.2     setosa
#> 2            4.9         3.0          1.4         0.2     setosa
#> 3            4.7         3.2          1.3         0.2     setosa
#> 4            4.6         3.1          1.5         0.2     setosa
#> 5            5.0         3.6          1.4         0.2     setosa
#> 6            5.4         3.9          1.7         0.4     setosa
#> 7            4.6         3.4          1.4         0.3     setosa
#> 8            5.0         3.4          1.5         0.2     setosa
#> 9            4.4         2.9          1.4         0.2     setosa
#> 10           4.9         3.1          1.5         0.1     setosa
#> 11           5.4         3.7          1.5         0.2     setosa
#> 12           4.8         3.4          1.6         0.2     setosa
#> 13           4.8         3.0          1.4         0.1     setosa
#> 14           4.3         3.0          1.1         0.1     setosa
#> 15           5.8         4.0          1.2         0.2     setosa
#> 16           5.7         4.4          1.5         0.4     setosa
#> 17           5.4         3.9          1.3         0.4     setosa
#> 18           5.1         3.5          1.4         0.3     setosa
#> 19           5.7         3.8          1.7         0.3     setosa
#> 20           5.1         3.8          1.5         0.3     setosa
#> 21           5.4         3.4          1.7         0.2     setosa
#> 22           5.1         3.7          1.5         0.4     setosa
#> 23           4.6         3.6          1.0         0.2     setosa
#> 24           5.1         3.3          1.7         0.5     setosa
#> 25           4.8         3.4          1.9         0.2     setosa
#> 26           5.0         3.0          1.6         0.2     setosa
#> 27           5.0         3.4          1.6         0.4     setosa
#> 28           5.2         3.5          1.5         0.2     setosa
#> 29           5.2         3.4          1.4         0.2     setosa
#> 30           4.7         3.2          1.6         0.2     setosa
#> 31           4.8         3.1          1.6         0.2     setosa
#> 32           5.4         3.4          1.5         0.4     setosa
#> 33           5.2         4.1          1.5         0.1     setosa
#> 34           5.5         4.2          1.4         0.2     setosa
#> 35           4.9         3.1          1.5         0.2     setosa
#> 36           5.0         3.2          1.2         0.2     setosa
#> 37           5.5         3.5          1.3         0.2     setosa
#> 38           4.9         3.6          1.4         0.1     setosa
#> 39           4.4         3.0          1.3         0.2     setosa
#> 40           5.1         3.4          1.5         0.2     setosa
#> 41           5.0         3.5          1.3         0.3     setosa
#> 42           4.5         2.3          1.3         0.3     setosa
#> 43           4.4         3.2          1.3         0.2     setosa
#> 44           5.0         3.5          1.6         0.6     setosa
#> 45           5.1         3.8          1.9         0.4     setosa
#> 46           4.8         3.0          1.4         0.3     setosa
#> 47           5.1         3.8          1.6         0.2     setosa
#> 48           4.6         3.2          1.4         0.2     setosa
#> 49           5.3         3.7          1.5         0.2     setosa
#> 50           5.0         3.3          1.4         0.2     setosa
#> 51           7.0         3.2          4.7         1.4 versicolor
#> 52           6.4         3.2          4.5         1.5 versicolor
#> 53           6.9         3.1          4.9         1.5 versicolor
#> 54           5.5         2.3          4.0         1.3 versicolor
#> 55           6.5         2.8          4.6         1.5 versicolor
#> 56           5.7         2.8          4.5         1.3 versicolor
#> 57           6.3         3.3          4.7         1.6 versicolor
#> 58           4.9         2.4          3.3         1.0 versicolor
#> 59           6.6         2.9          4.6         1.3 versicolor
#> 60           5.2         2.7          3.9         1.4 versicolor
#> 61           5.0         2.0          3.5         1.0 versicolor
#> 62           5.9         3.0          4.2         1.5 versicolor
#> 63           6.0         2.2          4.0         1.0 versicolor
#> 64           6.1         2.9          4.7         1.4 versicolor
#> 65           5.6         2.9          3.6         1.3 versicolor
#> 66           6.7         3.1          4.4         1.4 versicolor
#> 67           5.6         3.0          4.5         1.5 versicolor
#> 68           5.8         2.7          4.1         1.0 versicolor
#> 69           6.2         2.2          4.5         1.5 versicolor
#> 70           5.6         2.5          3.9         1.1 versicolor
#> 71           5.9         3.2          4.8         1.8 versicolor
#> 72           6.1         2.8          4.0         1.3 versicolor
#> 73           6.3         2.5          4.9         1.5 versicolor
#> 74           6.1         2.8          4.7         1.2 versicolor
#> 75           6.4         2.9          4.3         1.3 versicolor
#> 76           6.6         3.0          4.4         1.4 versicolor
#> 77           6.8         2.8          4.8         1.4 versicolor
#> 78           6.7         3.0          5.0         1.7 versicolor
#> 79           6.0         2.9          4.5         1.5 versicolor
#> 80           5.7         2.6          3.5         1.0 versicolor
#> 81           5.5         2.4          3.8         1.1 versicolor
#> 82           5.5         2.4          3.7         1.0 versicolor
#> 83           5.8         2.7          3.9         1.2 versicolor
#> 84           6.0         2.7          5.1         1.6 versicolor
#> 85           5.4         3.0          4.5         1.5 versicolor
#> 86           6.0         3.4          4.5         1.6 versicolor
#> 87           6.7         3.1          4.7         1.5 versicolor
#> 88           6.3         2.3          4.4         1.3 versicolor
#> 89           5.6         3.0          4.1         1.3 versicolor
#> 90           5.5         2.5          4.0         1.3 versicolor
#> 91           5.5         2.6          4.4         1.2 versicolor
#> 92           6.1         3.0          4.6         1.4 versicolor
#> 93           5.8         2.6          4.0         1.2 versicolor
#> 94           5.0         2.3          3.3         1.0 versicolor
#> 95           5.6         2.7          4.2         1.3 versicolor
#> 96           5.7         3.0          4.2         1.2 versicolor
#> 97           5.7         2.9          4.2         1.3 versicolor
#> 98           6.2         2.9          4.3         1.3 versicolor
#> 99           5.1         2.5          3.0         1.1 versicolor
#> 100          5.7         2.8          4.1         1.3 versicolor
#> 101          6.3         3.3          6.0         2.5  virginica
#> 102          5.8         2.7          5.1         1.9  virginica
#> 103          7.1         3.0          5.9         2.1  virginica
#> 104          6.3         2.9          5.6         1.8  virginica
#> 105          6.5         3.0          5.8         2.2  virginica
#> 106          7.6         3.0          6.6         2.1  virginica
#> 107          4.9         2.5          4.5         1.7  virginica
#> 108          7.3         2.9          6.3         1.8  virginica
#> 109          6.7         2.5          5.8         1.8  virginica
#> 110          7.2         3.6          6.1         2.5  virginica
#> 111          6.5         3.2          5.1         2.0  virginica
#> 112          6.4         2.7          5.3         1.9  virginica
#> 113          6.8         3.0          5.5         2.1  virginica
#> 114          5.7         2.5          5.0         2.0  virginica
#> 115          5.8         2.8          5.1         2.4  virginica
#> 116          6.4         3.2          5.3         2.3  virginica
#> 117          6.5         3.0          5.5         1.8  virginica
#> 118          7.7         3.8          6.7         2.2  virginica
#> 119          7.7         2.6          6.9         2.3  virginica
#> 120          6.0         2.2          5.0         1.5  virginica
#> 121          6.9         3.2          5.7         2.3  virginica
#> 122          5.6         2.8          4.9         2.0  virginica
#> 123          7.7         2.8          6.7         2.0  virginica
#> 124          6.3         2.7          4.9         1.8  virginica
#> 125          6.7         3.3          5.7         2.1  virginica
#> 126          7.2         3.2          6.0         1.8  virginica
#> 127          6.2         2.8          4.8         1.8  virginica
#> 128          6.1         3.0          4.9         1.8  virginica
#> 129          6.4         2.8          5.6         2.1  virginica
#> 130          7.2         3.0          5.8         1.6  virginica
#> 131          7.4         2.8          6.1         1.9  virginica
#> 132          7.9         3.8          6.4         2.0  virginica
#> 133          6.4         2.8          5.6         2.2  virginica
#> 134          6.3         2.8          5.1         1.5  virginica
#> 135          6.1         2.6          5.6         1.4  virginica
#> 136          7.7         3.0          6.1         2.3  virginica
#> 137          6.3         3.4          5.6         2.4  virginica
#> 138          6.4         3.1          5.5         1.8  virginica
#> 139          6.0         3.0          4.8         1.8  virginica
#> 140          6.9         3.1          5.4         2.1  virginica
#> 141          6.7         3.1          5.6         2.4  virginica
#> 142          6.9         3.1          5.1         2.3  virginica
#> 143          5.8         2.7          5.1         1.9  virginica
#> 144          6.8         3.2          5.9         2.3  virginica
#> 145          6.7         3.3          5.7         2.5  virginica
#> 146          6.7         3.0          5.2         2.3  virginica
#> 147          6.3         2.5          5.0         1.9  virginica
#> 148          6.5         3.0          5.2         2.0  virginica
#> 149          6.2         3.4          5.4         2.3  virginica
#> 150          5.9         3.0          5.1         1.8  virginica

# Specify an alternative with the `.else` argument:
modify_if(iris, is.factor, as.character, .else = as.integer)
#>     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
#> 1              5           3            1           0     setosa
#> 2              4           3            1           0     setosa
#> 3              4           3            1           0     setosa
#> 4              4           3            1           0     setosa
#> 5              5           3            1           0     setosa
#> 6              5           3            1           0     setosa
#> 7              4           3            1           0     setosa
#> 8              5           3            1           0     setosa
#> 9              4           2            1           0     setosa
#> 10             4           3            1           0     setosa
#> 11             5           3            1           0     setosa
#> 12             4           3            1           0     setosa
#> 13             4           3            1           0     setosa
#> 14             4           3            1           0     setosa
#> 15             5           4            1           0     setosa
#> 16             5           4            1           0     setosa
#> 17             5           3            1           0     setosa
#> 18             5           3            1           0     setosa
#> 19             5           3            1           0     setosa
#> 20             5           3            1           0     setosa
#> 21             5           3            1           0     setosa
#> 22             5           3            1           0     setosa
#> 23             4           3            1           0     setosa
#> 24             5           3            1           0     setosa
#> 25             4           3            1           0     setosa
#> 26             5           3            1           0     setosa
#> 27             5           3            1           0     setosa
#> 28             5           3            1           0     setosa
#> 29             5           3            1           0     setosa
#> 30             4           3            1           0     setosa
#> 31             4           3            1           0     setosa
#> 32             5           3            1           0     setosa
#> 33             5           4            1           0     setosa
#> 34             5           4            1           0     setosa
#> 35             4           3            1           0     setosa
#> 36             5           3            1           0     setosa
#> 37             5           3            1           0     setosa
#> 38             4           3            1           0     setosa
#> 39             4           3            1           0     setosa
#> 40             5           3            1           0     setosa
#> 41             5           3            1           0     setosa
#> 42             4           2            1           0     setosa
#> 43             4           3            1           0     setosa
#> 44             5           3            1           0     setosa
#> 45             5           3            1           0     setosa
#> 46             4           3            1           0     setosa
#> 47             5           3            1           0     setosa
#> 48             4           3            1           0     setosa
#> 49             5           3            1           0     setosa
#> 50             5           3            1           0     setosa
#> 51             7           3            4           1 versicolor
#> 52             6           3            4           1 versicolor
#> 53             6           3            4           1 versicolor
#> 54             5           2            4           1 versicolor
#> 55             6           2            4           1 versicolor
#> 56             5           2            4           1 versicolor
#> 57             6           3            4           1 versicolor
#> 58             4           2            3           1 versicolor
#> 59             6           2            4           1 versicolor
#> 60             5           2            3           1 versicolor
#> 61             5           2            3           1 versicolor
#> 62             5           3            4           1 versicolor
#> 63             6           2            4           1 versicolor
#> 64             6           2            4           1 versicolor
#> 65             5           2            3           1 versicolor
#> 66             6           3            4           1 versicolor
#> 67             5           3            4           1 versicolor
#> 68             5           2            4           1 versicolor
#> 69             6           2            4           1 versicolor
#> 70             5           2            3           1 versicolor
#> 71             5           3            4           1 versicolor
#> 72             6           2            4           1 versicolor
#> 73             6           2            4           1 versicolor
#> 74             6           2            4           1 versicolor
#> 75             6           2            4           1 versicolor
#> 76             6           3            4           1 versicolor
#> 77             6           2            4           1 versicolor
#> 78             6           3            5           1 versicolor
#> 79             6           2            4           1 versicolor
#> 80             5           2            3           1 versicolor
#> 81             5           2            3           1 versicolor
#> 82             5           2            3           1 versicolor
#> 83             5           2            3           1 versicolor
#> 84             6           2            5           1 versicolor
#> 85             5           3            4           1 versicolor
#> 86             6           3            4           1 versicolor
#> 87             6           3            4           1 versicolor
#> 88             6           2            4           1 versicolor
#> 89             5           3            4           1 versicolor
#> 90             5           2            4           1 versicolor
#> 91             5           2            4           1 versicolor
#> 92             6           3            4           1 versicolor
#> 93             5           2            4           1 versicolor
#> 94             5           2            3           1 versicolor
#> 95             5           2            4           1 versicolor
#> 96             5           3            4           1 versicolor
#> 97             5           2            4           1 versicolor
#> 98             6           2            4           1 versicolor
#> 99             5           2            3           1 versicolor
#> 100            5           2            4           1 versicolor
#> 101            6           3            6           2  virginica
#> 102            5           2            5           1  virginica
#> 103            7           3            5           2  virginica
#> 104            6           2            5           1  virginica
#> 105            6           3            5           2  virginica
#> 106            7           3            6           2  virginica
#> 107            4           2            4           1  virginica
#> 108            7           2            6           1  virginica
#> 109            6           2            5           1  virginica
#> 110            7           3            6           2  virginica
#> 111            6           3            5           2  virginica
#> 112            6           2            5           1  virginica
#> 113            6           3            5           2  virginica
#> 114            5           2            5           2  virginica
#> 115            5           2            5           2  virginica
#> 116            6           3            5           2  virginica
#> 117            6           3            5           1  virginica
#> 118            7           3            6           2  virginica
#> 119            7           2            6           2  virginica
#> 120            6           2            5           1  virginica
#> 121            6           3            5           2  virginica
#> 122            5           2            4           2  virginica
#> 123            7           2            6           2  virginica
#> 124            6           2            4           1  virginica
#> 125            6           3            5           2  virginica
#> 126            7           3            6           1  virginica
#> 127            6           2            4           1  virginica
#> 128            6           3            4           1  virginica
#> 129            6           2            5           2  virginica
#> 130            7           3            5           1  virginica
#> 131            7           2            6           1  virginica
#> 132            7           3            6           2  virginica
#> 133            6           2            5           2  virginica
#> 134            6           2            5           1  virginica
#> 135            6           2            5           1  virginica
#> 136            7           3            6           2  virginica
#> 137            6           3            5           2  virginica
#> 138            6           3            5           1  virginica
#> 139            6           3            4           1  virginica
#> 140            6           3            5           2  virginica
#> 141            6           3            5           2  virginica
#> 142            6           3            5           2  virginica
#> 143            5           2            5           1  virginica
#> 144            6           3            5           2  virginica
#> 145            6           3            5           2  virginica
#> 146            6           3            5           2  virginica
#> 147            6           2            5           1  virginica
#> 148            6           3            5           2  virginica
#> 149            6           3            5           2  virginica
#> 150            5           3            5           1  virginica
```
