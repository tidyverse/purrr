# Create an attribute getter function

`attr_getter()` generates an attribute accessor function; i.e., it
generates a function for extracting an attribute with a given name.
Unlike the base R [`attr()`](https://rdrr.io/r/base/attr.html) function
with default options, it doesn't use partial matching.

## Usage

``` r
attr_getter(attr)
```

## Arguments

- attr:

  An attribute name as string.

## See also

[`pluck()`](https://purrr.tidyverse.org/dev/reference/pluck.md)

## Examples

``` r
# attr_getter() takes an attribute name and returns a function to
# access the attribute:
get_rownames <- attr_getter("row.names")
get_rownames(mtcars)
#>  [1] "Mazda RX4"           "Mazda RX4 Wag"       "Datsun 710"         
#>  [4] "Hornet 4 Drive"      "Hornet Sportabout"   "Valiant"            
#>  [7] "Duster 360"          "Merc 240D"           "Merc 230"           
#> [10] "Merc 280"            "Merc 280C"           "Merc 450SE"         
#> [13] "Merc 450SL"          "Merc 450SLC"         "Cadillac Fleetwood" 
#> [16] "Lincoln Continental" "Chrysler Imperial"   "Fiat 128"           
#> [19] "Honda Civic"         "Toyota Corolla"      "Toyota Corona"      
#> [22] "Dodge Challenger"    "AMC Javelin"         "Camaro Z28"         
#> [25] "Pontiac Firebird"    "Fiat X1-9"           "Porsche 914-2"      
#> [28] "Lotus Europa"        "Ford Pantera L"      "Ferrari Dino"       
#> [31] "Maserati Bora"       "Volvo 142E"         

# These getter functions are handy in conjunction with pluck() for
# extracting deeply into a data structure. Here we'll first
# extract by position, then by attribute:
obj1 <- structure("obj", obj_attr = "foo")
obj2 <- structure("obj", obj_attr = "bar")
x <- list(obj1, obj2)

pluck(x, 1, attr_getter("obj_attr"))  # From first object
#> [1] "foo"
pluck(x, 2, attr_getter("obj_attr"))  # From second object
#> [1] "bar"
```
