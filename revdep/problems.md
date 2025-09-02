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

# CPAT

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/CPAT
* Date/Publication: 2018-12-25 22:40:08 UTC
* Number of recursive dependencies: 63

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

# kerastuneR

<details>

* Version: 0.1.0.7
* GitHub: https://github.com/EagerAI/kerastuneR
* Source code: https://github.com/cran/kerastuneR
* Date/Publication: 2024-04-13 13:20:02 UTC
* Number of recursive dependencies: 109

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
# LTFGRS

<details>

* Version: 1.0.0
* GitHub: https://github.com/EmilMiP/LTFGRS
* Source code: https://github.com/cran/LTFGRS
* Date/Publication: 2025-07-07 08:30:05 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "LTFGRS")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
      actual vs expected
                            [,1]       [,2]
      - actual[1, ]   0.30179338 0.01965999
      + expected[1, ] 0.29925194 0.01748031
      - actual[2, ]   0.01965999 0.14791812
      + expected[2, ] 0.01748031 0.14918673
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 131 ]
      Error: Test failures
      Execution halted
    ```

# PopED

<details>

* Version: 0.7.0
* GitHub: https://github.com/andrewhooker/PopED
* Source code: https://github.com/cran/PopED
* Date/Publication: 2024-10-07 19:30:02 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "PopED")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        doc    1.4Mb
        test   1.1Mb
    ```

# quincunx

<details>

* Version: 0.1.10
* GitHub: https://github.com/ramiromagno/quincunx
* Source code: https://github.com/cran/quincunx
* Date/Publication: 2025-05-31 17:10:02 UTC
* Number of recursive dependencies: 89

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

# rbmi

<details>

* Version: 1.4.1
* GitHub: https://github.com/insightsengineering/rbmi
* Source code: https://github.com/cran/rbmi
* Date/Publication: 2025-03-03 20:10:02 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "rbmi")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(rbmi)
      > 
      > if (Sys.getenv("NOT_CRAN") != "true") {
      +     Sys.setenv(RBMI_ENABLE_CACHE = "false")
      +     options(rbmi.enable_cache = FALSE)
      + }
    ...
       [6] 1.7771      - 0.8439        [6]             
       [7] -0.4643     - -1.3740       [7]             
       [8] -0.1738     - -1.7117       [8]             
       [9] -0.4040     - -0.1313       [9]             
      [10] 1.4148      - 1.2642        [10]            
       ... ...           ...           and 190 more ...
      
      [ FAIL 1 | WARN 0 | SKIP 15 | PASS 1278 ]
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

# stoRy

<details>

* Version: 0.2.2
* GitHub: https://github.com/theme-ontology/stoRy
* Source code: https://github.com/cran/stoRy
* Date/Publication: 2023-06-13 23:10:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "stoRy")` for more info

</details>

## Newly broken

*   checking whether package ‘stoRy’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/stoRy/new/stoRy.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘stoRy’ ...
** package ‘stoRy’ successfully unpacked and MD5 sums checked
** using staged installation
** R
Warning: namespace ‘stoRy’ is not available and has been replaced
by .GlobalEnv when processing object ‘background_collection’
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘stoRy’
* removing ‘/tmp/workdir/stoRy/new/stoRy.Rcheck/stoRy’


```
### CRAN

```
* installing *source* package ‘stoRy’ ...
** package ‘stoRy’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (stoRy)


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

# tidyjson

<details>

* Version: 0.3.2
* GitHub: https://github.com/colearendt/tidyjson
* Source code: https://github.com/cran/tidyjson
* Date/Publication: 2023-01-07 00:20:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "tidyjson")` for more info

</details>

## Newly broken

*   checking whether package ‘tidyjson’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/tidyjson/new/tidyjson.Rcheck/00install.out’ for details.
    ```

## Newly fixed

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) json_schema.Rd:33: Lost braces; missing escapes or markup?
        33 |   \item object  -> {"name": <type>} e.g., {"age": 32} -> {"age": "number"}
           |                    ^
    checkRd: (-1) json_schema.Rd:33: Lost braces; missing escapes or markup?
        33 |   \item object  -> {"name": <type>} e.g., {"age": 32} -> {"age": "number"}
           |                                           ^
    checkRd: (-1) json_schema.Rd:33: Lost braces; missing escapes or markup?
        33 |   \item object  -> {"name": <type>} e.g., {"age": 32} -> {"age": "number"}
           |                                                          ^
    ```

## Installation

### Devel

```
* installing *source* package ‘tidyjson’ ...
** package ‘tidyjson’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘tidyjson’
* removing ‘/tmp/workdir/tidyjson/new/tidyjson.Rcheck/tidyjson’


```
### CRAN

```
* installing *source* package ‘tidyjson’ ...
** package ‘tidyjson’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (tidyjson)


```
