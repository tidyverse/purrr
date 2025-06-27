# autothresholdr

<details>

* Version: 1.4.2
* GitHub: https://github.com/rorynolan/autothresholdr
* Source code: https://github.com/cran/autothresholdr
* Date/Publication: 2023-12-13 06:00:02 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "autothresholdr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘finding-thresholds.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        doc    1.8Mb
        libs   2.5Mb
    ```

# casino

<details>

* Version: 0.1.0
* GitHub: https://github.com/anthonypileggi/casino
* Source code: https://github.com/cran/casino
* Date/Publication: 2019-01-17 17:40:03 UTC
* Number of recursive dependencies: 57

Run `revdepcheck::cloud_details(, "casino")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘persistent_player_profiles.Rmd’ using rmarkdown
    
    Quitting from persistent_player_profiles.Rmd:23-34 [unnamed-chunk-1]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'persistent_player_profiles.Rmd' failed with diagnostics:
    ...
    ℹ In index: 1.
    Caused by error:
    ! Can't coerce from a number to a string.
    --- failed re-building ‘persistent_player_profiles.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘persistent_player_profiles.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘crayon’ ‘dplyr’ ‘tidyr’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# egor

<details>

* Version: 1.24.2
* GitHub: https://github.com/tilltnet/egor
* Source code: https://github.com/cran/egor
* Date/Publication: 2024-02-02 05:30:02 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "egor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘egor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: twofiles_to_egor
    > ### Title: Import ego-centered network data from two file format
    > ### Aliases: twofiles_to_egor
    > ### Keywords: import
    > 
    > ### ** Examples
    > 
    ...
      5. │     └─purrr::map_chr(x, function(x) is.double(x))
      6. │       └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
      7. │         ├─purrr:::with_indexed_errors(...)
      8. │         │ └─base::withCallingHandlers(...)
      9. │         └─purrr:::call_with_cleanup(...)
     10. └─base::.handleSimpleError(...)
     11.   └─purrr (local) h(simpleError(msg, call))
     12.     └─cli::cli_abort(...)
     13.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(egor)
      Loading required package: dplyr
      
      Attaching package: 'dplyr'
      
      The following object is masked from 'package:testthat':
    ...
       13. │         │ └─base::withCallingHandlers(...)
       14. │         └─purrr:::call_with_cleanup(...)
       15. └─base::.handleSimpleError(...)
       16.   └─purrr (local) h(simpleError(msg, call))
       17.     └─cli::cli_abort(...)
       18.       └─rlang::abort(...)
      
      [ FAIL 4 | WARN 6 | SKIP 15 | PASS 205 ]
      Error: Test failures
      Execution halted
    ```

# immunarch

<details>

* Version: 0.9.1
* GitHub: https://github.com/immunomind/immunarch
* Source code: https://github.com/cran/immunarch
* Date/Publication: 2024-03-18 19:10:06 UTC
* Number of recursive dependencies: 200

Run `revdepcheck::cloud_details(, "immunarch")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘immunarch-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: seqCluster
    > ### Title: Function for assigning clusters based on sequences similarity
    > ### Aliases: seqCluster
    > 
    > ### ** Examples
    > 
    > 
    ...
     27. ├─purrr::map_chr(.y, ~ifelse(all(.x == .x[1]), yes = .x[1], no = glue("range_{min(.x)}:{max(.x)}")))
     28. │ └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
     29. │   ├─purrr:::with_indexed_errors(...)
     30. │   │ └─base::withCallingHandlers(...)
     31. │   └─purrr:::call_with_cleanup(...)
     32. └─base::.handleSimpleError(...)
     33.   └─purrr (local) h(simpleError(msg, call))
     34.     └─cli::cli_abort(...)
     35.       └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.7Mb
      sub-directories of 1Mb or more:
        data   5.5Mb
        doc    1.6Mb
    ```

# SCORPIUS

<details>

* Version: 1.0.9
* GitHub: https://github.com/rcannood/SCORPIUS
* Source code: https://github.com/cran/SCORPIUS
* Date/Publication: 2023-08-07 17:30:05 UTC
* Number of recursive dependencies: 198

Run `revdepcheck::cloud_details(, "SCORPIUS")` for more info

</details>

## Newly broken

*   checking whether package ‘SCORPIUS’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: `invoke()` was deprecated in purrr 1.0.0.
    See ‘/tmp/workdir/SCORPIUS/new/SCORPIUS.Rcheck/00install.out’ for details.
    ```

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) reduce_dimensionality.Rd:19: Lost braces
        19 | \item{ndim}{the maximum dimension of the space which the data are to be represented in; must be in {1, 2, \ldots, n-1}.}
           |                                                                                                    ^
    checkRd: (-1) ti_scorpius.Rd:18: Lost braces; missing escapes or markup?
        18 | \item{distance_method}{A character string indicating which correlationcoefficient (or covariance) is to be computed. One of "pearson", "spearman" (default), or "cosine". Domain: {spearman, pearson, cosine}. Default: spearman. Format: character.}
           |                                                                                                                                                                                   ^
    checkRd: (-1) ti_scorpius.Rd:30: Lost braces; missing escapes or markup?
        30 | \item{smoother}{\code{principal_curve} parameter; choice of smoother. Domain: {smooth_spline, lowess, periodic_lowess}. Default: smooth_spline. Format: character.}
           |                                                                               ^
    ```

# tfrmt

<details>

* Version: 0.1.3
* GitHub: https://github.com/GSK-Biostatistics/tfrmt
* Source code: https://github.com/cran/tfrmt
* Date/Publication: 2024-10-15 21:30:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "tfrmt")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tfrmt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: display_val_frmts
    > ### Title: Display formatted values
    > ### Aliases: display_val_frmts
    > 
    > ### ** Examples
    > 
    >  tf_spec <- tfrmt(
    ...
     24. ├─purrr::map_chr(., f_lhs)
     25. │ └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
     26. │   ├─purrr:::with_indexed_errors(...)
     27. │   │ └─base::withCallingHandlers(...)
     28. │   └─purrr:::call_with_cleanup(...)
     29. └─base::.handleSimpleError(...)
     30.   └─purrr (local) h(simpleError(msg, call))
     31.     └─cli::cli_abort(...)
     32.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(tfrmt)
      > 
      > test_check("tfrmt")
      The following rows of the given dataset have no format applied to them 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36
      The following rows of the given dataset have no format applied to them 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
      [ FAIL 9 | WARN 0 | SKIP 10 | PASS 520 ]
    ...
       54. │   └─rlang::abort(...)
       55. │     └─rlang:::signal_abort(cnd, .file)
       56. │       └─base::signalCondition(cnd)
       57. └─purrr (local) `<fn>`(`<prrr_rr_>`)
       58.   └─cli::cli_abort(...)
       59.     └─rlang::abort(...)
      
      [ FAIL 9 | WARN 0 | SKIP 10 | PASS 520 ]
      Error: Test failures
      Execution halted
    ```

# tidybins

<details>

* Version: 0.1.1
* GitHub: https://github.com/Harrison4192/tidybins
* Source code: https://github.com/cran/tidybins
* Date/Publication: 2024-06-12 04:50:02 UTC
* Number of recursive dependencies: 222

Run `revdepcheck::cloud_details(, "tidybins")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidybins-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bin_cols
    > ### Title: Bin Cols
    > ### Aliases: bin_cols
    > 
    > ### ** Examples
    > 
    > 
    ...
     18. ├─purrr::map_chr(., 1)
     19. │ └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
     20. │   ├─purrr:::with_indexed_errors(...)
     21. │   │ └─base::withCallingHandlers(...)
     22. │   └─purrr:::call_with_cleanup(...)
     23. └─base::.handleSimpleError(...)
     24.   └─purrr (local) h(simpleError(msg, call))
     25.     └─cli::cli_abort(...)
     26.       └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘badger’ ‘ggplot2’ ‘lubridate’ ‘scales’ ‘xgboost’
      All declared Imports should be used.
    ```

