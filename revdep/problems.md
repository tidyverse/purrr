# casino (0.1.0)

* GitHub: <https://github.com/anthonypileggi/casino>
* Email: <mailto:apileggi20@gmail.com>
* GitHub mirror: <https://github.com/cran/casino>

Run `revdepcheck::cloud_details(, "casino")` for more info

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

# CPAT (0.1.0)

* Email: <mailto:cmiller@math.utah.edu>
* GitHub mirror: <https://github.com/cran/CPAT>

Run `revdepcheck::cloud_details(, "CPAT")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       ── Error ('test-TestStatisticsFunctions.R:124:3'): stat_de() functions properly ──
       Error in `custom_var_temp(x = dat, .lazy = FALSE, ...)`: unused argument (.lazy = FALSE)
       Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-TestStatisticsFunctions.R:124:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─CPAT:::stat_de(...)
        5.   └─CPAT:::stat_Vn(...)
        6.     └─base::vapply(1:length(dat), custom_var, FUN.VALUE = numeric(1))
        7.       └─CPAT (local) FUN(X[[i]], ...)
       ── Error ('test-TestStatisticsFunctions.R:152:3'): stat_hs() functions properly ──
       Error in `custom_var_temp(x = dat, .lazy = FALSE, ...)`: unused argument (.lazy = FALSE)
       Backtrace:
           ▆
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

# kerastuneR (0.1.0.7)

* GitHub: <https://github.com/EagerAI/kerastuneR>
* Email: <mailto:turqut.a.314@gmail.com>
* GitHub mirror: <https://github.com/cran/kerastuneR>

Run `revdepcheck::cloud_details(, "kerastuneR")` for more info

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
** this is package ‘kerastuneR’ version ‘0.1.0.7’
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
** this is package ‘kerastuneR’ version ‘0.1.0.7’
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
# quincunx (0.1.10)

* GitHub: <https://github.com/ramiromagno/quincunx>
* Email: <mailto:rmagno@pattern.institute>
* GitHub mirror: <https://github.com/cran/quincunx>

Run `revdepcheck::cloud_details(, "quincunx")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
       3. │ └─quincunx:::get_cohort_by_cohort_symbol(...)
       4. │   ├─purrr::pmap(...)
       5. │   │ └─purrr:::pmap_("list", .l, .f, ..., .progress = .progress)
       6. │   │   └─purrr:::vctrs_list_compat(.l, error_call = .purrr_error_call)
       7. │   │     └─purrr:::vctrs_vec_compat(x, user_env)
       8. │   └─purrr::map(...)
       9. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
      10. │       ├─purrr:::with_indexed_errors(...)
      11. │       │ └─base::withCallingHandlers(...)
      12. │       ├─purrr:::call_with_cleanup(...)
      13. │       └─purrr (local) .f(.x[[i]], ...)
      14. │         └─quincunx (local) f(...)
      15. │           └─quincunx:::get(...)
      16. │             └─quincunx:::request_all(...)
      17. │               └─quincunx:::is_paginated(obj$json)
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
     ...
           ▆
        1. ├─testthat::expect_false(is_paginated("{\n  \"id\": \"PGP000001\"\n }")) at test-is_paginated.R:3:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─quincunx:::is_paginated("{\n  \"id\": \"PGP000001\"\n }")
        5. │ └─quincunx:::count(json_string)
        6. └─base::loadNamespace(x)
        7.   └─base::namespaceImportFrom(...)
        8.     └─base::importIntoEnv(impenv, impnames, ns, impvars)
       ── Error ('test-is_paginated.R:13:3'): is paginated ────────────────────────────
       Error: object 'at_depth' is not exported by 'namespace:purrr'
       Backtrace:
           ▆
        1. ├─testthat::expect_true(is_paginated(txt)) at test-is_paginated.R:13:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
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

# SCORPIUS (1.0.9)

* GitHub: <https://github.com/rcannood/SCORPIUS>
* Email: <mailto:rcannood@gmail.com>
* GitHub mirror: <https://github.com/cran/SCORPIUS>

Run `revdepcheck::cloud_details(, "SCORPIUS")` for more info

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

# stoRy (0.2.2)

* GitHub: <https://github.com/theme-ontology/stoRy>
* Email: <mailto:paul.sheridan.stats@gmail.com>
* GitHub mirror: <https://github.com/cran/stoRy>

Run `revdepcheck::cloud_details(, "stoRy")` for more info

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
** this is package ‘stoRy’ version ‘0.2.2’
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
** this is package ‘stoRy’ version ‘0.2.2’
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
# tidybins (0.1.1)

* GitHub: <https://github.com/Harrison4192/tidybins>
* Email: <mailto:Harrison4192@gmail.com>
* GitHub mirror: <https://github.com/cran/tidybins>

Run `revdepcheck::cloud_details(, "tidybins")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
       3. │ └─.data %>% ...
       4. ├─framecleaner::select_otherwise(...)
       5. │ └─tidyselect::eval_select(.dots, data = .data)
       6. │   └─tidyselect::tidyselect_data_has_predicates(data)
       7. ├─tidybins::bin_cols(...)
       8. │ └─.data %>% ...
       9. ├─framecleaner::select_otherwise(...)
      10. │ └─tidyselect::eval_select(.dots, data = .data)
      11. │   └─tidyselect::tidyselect_data_has_predicates(data)
      12. ├─tidybins::bin_cols(., Sepal.Width, n_bins = 5, pretty_labels = TRUE)
      13. │ └─tidybins:::oner_wrapper(...)
      14. │   └─bin_df %>% rename_bin_lens(abbv = abbv, cols = tidyselect::everything())
      15. ├─tidybins:::rename_bin_lens(., abbv = abbv, cols = tidyselect::everything())
      16. │ └─... %>% stringr::str_c("_", abbv, .)
      17. ├─stringr::str_c("_", abbv, .)
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

# tidyjson (0.3.2)

* GitHub: <https://github.com/colearendt/tidyjson>
* Email: <mailto:cole@posit.co>
* GitHub mirror: <https://github.com/cran/tidyjson>

Run `revdepcheck::cloud_details(, "tidyjson")` for more info

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
** this is package ‘tidyjson’ version ‘0.3.2’
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
** this is package ‘tidyjson’ version ‘0.3.2’
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
