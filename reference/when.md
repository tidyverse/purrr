# Match/validate a set of conditions for an object and continue with the action associated with the first valid match.

**\[deprecated\]**

This function was deprecated in purrr 1.0.0 because it's not related to
the core purpose of purrr. You can pull your code out of a pipe and use
regular `if`/`else` statements instead.

`when()` is a flavour of pattern matching (or an if-else abstraction) in
which a value is matched against a sequence of condition-action sets.
When a valid match/condition is found the action is executed and the
result of the action is returned.

## Usage

``` r
when(., ...)
```

## Arguments

- .:

  the value to match against

- ...:

  formulas; each containing a condition as LHS and an action as RHS.
  named arguments will define additional values.

## Value

The value resulting from the action of the first valid match/condition
is returned. If no matches are found, and no default is given, NULL will
be returned.

Validity of the conditions are tested with `isTRUE`, or equivalently
with `identical(condition, TRUE)`. In other words conditions resulting
in more than one logical will never be valid. Note that the input value
is always treated as a single object, as opposed to the `ifelse`
function.

## Examples

``` r
1:10 |>
  when(
    sum(.) <=  50 ~ sum(.),
    sum(.) <= 100 ~ sum(.)/2,
    ~ 0
  )
#> Warning: `when()` was deprecated in purrr 1.0.0.
#> ℹ Please use `if` instead.
#> [1] 27.5

# now
x <- 1:10
if (sum(x) < 10) {
  sum(x)
} else if (sum(x) < 100) {
  sum(x) / 2
} else {
  0
}
#> [1] 27.5
```
