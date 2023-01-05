# ast2ast

<details>

* Version: 0.2.1
* GitHub: https://github.com/Konrad1991/ast2ast
* Source code: https://github.com/cran/ast2ast
* Date/Publication: 2022-10-19 07:25:07 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "ast2ast")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > if ( requireNamespace("tinytest", quietly=TRUE) ){
      + tinytest::test_package("ast2ast")
      + }
      
      test_all.R....................    0 tests    
      test_all.R....................    0 tests    
      test_all.R....................    0 tests    
      test_all.R....................    0 tests    Error: C stack usage  9962948 is too close to the limit
      Execution halted
    ```

# openalexR

<details>

* Version: 1.0.0
* GitHub: https://github.com/massimoaria/openalexR
* Source code: https://github.com/cran/openalexR
* Date/Publication: 2022-10-06 10:40:02 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "openalexR")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘A_Brief_Introduction_to_openalexR.Rmd’ using rmarkdown
    Quitting from lines 237-251 (A_Brief_Introduction_to_openalexR.Rmd) 
    Error: processing vignette 'A_Brief_Introduction_to_openalexR.Rmd' failed with diagnostics:
    $ operator is invalid for atomic vectors
    --- failed re-building ‘A_Brief_Introduction_to_openalexR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘A_Brief_Introduction_to_openalexR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rearrr

<details>

* Version: 0.3.2
* GitHub: https://github.com/ludvigolsen/rearrr
* Source code: https://github.com/cran/rearrr
* Date/Publication: 2022-11-24 09:40:02 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "rearrr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      xpectr::strip(side_effects_16117[["error_class"]]) not equal to xpectr::strip(c(purrr_error, "error", "condition")).
      Lengths differ: 4 is not 3
      ── Failure ('test_swirl_3d.R:1554'): fuzz testing swirl_3d() ───────────────────
      xpectr::strip(side_effects_19735[["error_class"]]) not equal to xpectr::strip(c(purrr_error, "error", "condition")).
      Lengths differ: 4 is not 3
      ── Failure ('test_swirl_3d.R:1584'): fuzz testing swirl_3d() ───────────────────
      xpectr::strip(side_effects_19575[["error_class"]]) not equal to xpectr::strip(c(purrr_error, "error", "condition")).
      Lengths differ: 4 is not 3
      ── Failure ('test_swirl_3d.R:1988'): fuzz testing swirl_3d() ───────────────────
      xpectr::strip(side_effects_10389[["error_class"]]) not equal to xpectr::strip(c(purrr_error, "error", "condition")).
      Lengths differ: 4 is not 3
      
      [ FAIL 78 | WARN 0 | SKIP 0 | PASS 7265 ]
      Error: Test failures
      Execution halted
    ```

