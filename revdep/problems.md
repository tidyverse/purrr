# casino

<details>

* Version: 0.1.0
* GitHub: https://github.com/anthonypileggi/casino
* Source code: https://github.com/cran/casino
* Date/Publication: 2019-01-17 17:40:03 UTC
* Number of recursive dependencies: 53

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

# CPAT

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/CPAT
* Date/Publication: 2018-12-25 22:40:08 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "CPAT")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(CPAT)
      Package 'CPAT' version 0.1.0
      Type citation("CPAT") for citing this R package in publications
      > 
      > test_check("CPAT")
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 97 ]
    ...
       1. ├─testthat::expect_equal(...) at test-TestStatisticsFunctions.R:152:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─CPAT:::stat_hs(...)
       5.   └─base::vapply(1:length(dat), custom_var, FUN.VALUE = numeric(1))
       6.     └─CPAT (local) FUN(X[[i]], ...)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 97 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rdpack’ ‘grDevices’
      All declared Imports should be used.
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
* Number of recursive dependencies: 201

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

# kerastuneR

<details>

* Version: 0.1.0.7
* GitHub: https://github.com/EagerAI/kerastuneR
* Source code: https://github.com/cran/kerastuneR
* Date/Publication: 2024-04-13 13:20:02 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::cloud_details(, "kerastuneR")` for more info

</details>

## Newly broken

*   checking whether package ‘kerastuneR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/kerastuneR/new/kerastuneR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘kerastuneR’ ...
** package ‘kerastuneR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘kerastuneR’
* removing ‘/tmp/workdir/kerastuneR/new/kerastuneR.Rcheck/kerastuneR’


```
### CRAN

```
* installing *source* package ‘kerastuneR’ ...
** package ‘kerastuneR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (kerastuneR)


```
# meta

<details>

* Version: 8.2-1
* GitHub: https://github.com/guido-s/meta
* Source code: https://github.com/cran/meta
* Date/Publication: 2025-09-01 17:00:13 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "meta")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        R      3.5Mb
        help   1.5Mb
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘metasens’, ‘robumeta’
    ```

# moranajp

<details>

* Version: 0.9.7
* GitHub: https://github.com/matutosi/moranajp
* Source code: https://github.com/cran/moranajp
* Date/Publication: 2024-08-01 08:40:02 UTC
* Number of recursive dependencies: 126

Run `revdepcheck::cloud_details(, "moranajp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘moranajp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: out_cols_chamame
    > ### Title: Morphological analysis for Japanese text by web chamame
    > ### Aliases: out_cols_chamame web_chamame html_radio_set is_radio
    > 
    > ### ** Examples
    > 
    > text <-
    ...
      8. │     └─purrr::map_chr(fields, `$`, "type")
      9. │       └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
     10. │         ├─purrr:::with_indexed_errors(...)
     11. │         │ └─base::withCallingHandlers(...)
     12. │         └─purrr:::call_with_cleanup(...)
     13. └─base::.handleSimpleError(...)
     14.   └─purrr (local) h(simpleError(msg, call))
     15.     └─cli::cli_abort(...)
     16.       └─rlang::abort(...)
    Execution halted
    ```

# quincunx

<details>

* Version: 0.1.10
* GitHub: https://github.com/ramiromagno/quincunx
* Source code: https://github.com/cran/quincunx
* Date/Publication: 2025-05-31 17:10:02 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "quincunx")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘quincunx-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_cohorts
    > ### Title: Get PGS Catalog Cohorts
    > ### Aliases: get_cohorts
    > 
    > ### ** Examples
    > 
    > # Get information about specific cohorts by their symbols (acronyms)
    ...
     18. │                 └─quincunx:::count(json_string)
     19. ├─base::loadNamespace(x)
     20. │ └─base::namespaceImportFrom(...)
     21. │   └─base::importIntoEnv(impenv, impnames, ns, impvars)
     22. │     └─base::stop(...)
     23. └─base::.handleSimpleError(...)
     24.   └─purrr (local) h(simpleError(msg, call))
     25.     └─cli::cli_abort(...)
     26.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(quincunx)
      > 
      > test_check("quincunx")
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 12 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─quincunx:::is_paginated(txt)
       5. │ └─quincunx:::count(json_string)
       6. └─base::loadNamespace(x)
       7.   └─base::namespaceImportFrom(...)
       8.     └─base::importIntoEnv(impenv, impnames, ns, impvars)
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
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

