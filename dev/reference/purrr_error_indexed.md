# Indexed errors (`purrr_error_indexed`)

The `purrr_error_indexed` class is thrown by
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md),
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md), and
friends. It wraps errors thrown during the processing on individual
elements with information about the location of the error.

## Structure

`purrr_error_indexed` has three important fields:

- `location`: the location of the error as a single integer.

- `name`: the name of the location as a string. If the element was not
  named, `name` will be `NULL`

- `parent`: the original error thrown by `.f`.

Let's see this in action by capturing the generated condition from a
very simple example:

    f <- function(x) {
      rlang::abort("This is an error")
    }

    cnd <- rlang::catch_cnd(map(c(1, 4, 2), f))
    class(cnd)
    #> [1] "purrr_error_indexed" "rlang_error"         "error"
    #> [4] "condition"

    cnd$location
    #> [1] 1

    cnd$name
    #> NULL

    print(cnd$parent, backtrace = FALSE)
    #> <error/rlang_error>
    #> Error in `.f()`:
    #> ! This is an error

If the input vector is named, `name` will be non-`NULL`:

    cnd <- rlang::catch_cnd(map(c(a = 1, b = 4, c = 2), f))
    cnd$name
    #> [1] "a"

## Handling errors

(This section assumes that you're familiar with the basics of error
handling in R, as described in [Advanced
R](https://adv-r.hadley.nz/conditions.html).)

This error chaining is really useful when doing interactive data
analysis, but it adds some extra complexity when handling errors with
[`tryCatch()`](https://rdrr.io/r/base/conditions.html) or
[`withCallingHandlers()`](https://rdrr.io/r/base/conditions.html). Let's
see what happens by adding a custom class to the error thrown by `f()`:

    f <- function(x) {
      rlang::abort("This is an error", class = "my_error")
    }
    map(c(1, 4, 2, 5, 3), f)
    #> Error in `map()`:
    #> i In index: 1.
    #> Caused by error in `.f()`:
    #> ! This is an error

This doesn't change the visual display, but you might be surprised if
you try to catch this error with
[`tryCatch()`](https://rdrr.io/r/base/conditions.html) or
[`withCallingHandlers()`](https://rdrr.io/r/base/conditions.html):

    tryCatch(
      map(c(1, 4, 2, 5, 3), f),
      my_error = function(err) {
        # use NULL value if error
        NULL
      }
    )
    #> Error in `map()`:
    #> i In index: 1.
    #> Caused by error in `.f()`:
    #> ! This is an error

    withCallingHandlers(
      map(c(1, 4, 2, 5, 3), f),
      my_error = function(err) {
        # throw a more informative error
        abort("Wrapped error", parent = err)
      }
    )
    #> Error in `map()`:
    #> i In index: 1.
    #> Caused by error in `.f()`:
    #> ! This is an error

That's because, as described above, the error that
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) throws will
always have class `purrr_error_indexed`:

    tryCatch(
      map(c(1, 4, 2, 5, 3), f),
      purrr_error_indexed = function(err) {
        print("Hello! I am now called :)")
      }
    )
    #> [1] "Hello! I am now called :)"

In order to handle the error thrown by `f()`, you'll need to use
[`rlang::cnd_inherits()`](https://rlang.r-lib.org/reference/cnd_inherits.html)
on the parent error:

    tryCatch(
      map(c(1, 4, 2, 5, 3), f),
      purrr_error_indexed = function(err) {
        if (rlang::cnd_inherits(err, "my_error")) {
          NULL
        } else {
          rlang::cnd_signal(err)
        }
      }
    )
    #> NULL

    withCallingHandlers(
      map(c(1, 4, 2, 5, 3), f),
      purrr_error_indexed = function(err) {
        if (rlang::cnd_inherits(err, "my_error")) {
          abort("Wrapped error", parent = err)
        }
      }
    )
    #> Error:
    #> ! Wrapped error
    #> Caused by error in `map()`:
    #> i In index: 1.
    #> Caused by error in `.f()`:
    #> ! This is an error

(The [`tryCatch()`](https://rdrr.io/r/base/conditions.html) approach is
suboptimal because we're no longer just handling errors, but also
rethrowing them. The rethrown errors won't work correctly with (e.g.)
[`recover()`](https://rdrr.io/r/utils/recover.html) and
[`traceback()`](https://rdrr.io/r/base/traceback.html), but we don't
currently have a better approach. In the future we expect to [enhance
`try_fetch()`](https://github.com/r-lib/rlang/issues/1534) to make this
easier to do 100% correctly).

Finally, if you just want to get rid of purrr's wrapper error, you can
resignal the parent error:

    withCallingHandlers(
      map(c(1, 4, 2, 5, 3), f),
      purrr_error_indexed = function(err) {
        rlang::cnd_signal(err$parent)
      }
    )
    #> Error in `.f()`:
    #> ! This is an error

Because we are resignalling an error, it's important to use
[`withCallingHandlers()`](https://rdrr.io/r/base/conditions.html) and
not [`tryCatch()`](https://rdrr.io/r/base/conditions.html) in order to
preserve the full backtrace context. That way
[`recover()`](https://rdrr.io/r/utils/recover.html),
[`traceback()`](https://rdrr.io/r/base/traceback.html), and related
tools will continue to work correctly.
