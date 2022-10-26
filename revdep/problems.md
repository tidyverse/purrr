# broom.helpers

<details>

* Version: 1.9.0
* GitHub: https://github.com/larmarange/broom.helpers
* Source code: https://github.com/cran/broom.helpers
* Date/Publication: 2022-09-23 20:00:09 UTC
* Number of recursive dependencies: 205

Run `cloud_details(, "broom.helpers")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       15.             └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       16.               └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       17.                 └─value[[3L]](cond)
      ── Error ('test-tidy_parameters.R:26'): tidy_parameters() works for basic models ──
      Error in `identical(res1$conf.low, res2$conf.low)`: object 'res1' not found
      Backtrace:
          ▆
       1. ├─testthat::expect_false(identical(res1$conf.low, res2$conf.low)) at test-tidy_parameters.R:26:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─base::identical(res1$conf.low, res2$conf.low)
      
      [ FAIL 12 | WARN 0 | SKIP 51 | PASS 438 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘tidy.Rmd’ using rmarkdown
    #BlackLivesMatter
    
    Attaching package: 'gtsummary'
    
    The following object is masked from 'package:broom.helpers':
    
        all_continuous
    
    ...
    Error: processing vignette 'tidy.Rmd' failed with diagnostics:
    `version` must be `NULL` or a vector of versions the same length as
    `pkg`.
    --- failed re-building ‘tidy.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tidy.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# cattonum

<details>

* Version: 0.0.5
* GitHub: https://github.com/bfgray3/cattonum
* Source code: https://github.com/cran/cattonum
* Date/Publication: 2020-06-15 04:50:06 UTC
* Number of recursive dependencies: 78

Run `cloud_details(, "cattonum")` for more info

</details>

## Newly broken

*   checking R code for possible problems ... NOTE
    ```
    catto_median.data.frame : <anonymous>: no visible global function
      definition for ‘median’
    Undefined global functions or variables:
      median
    Consider adding
      importFrom("stats", "median")
    to your NAMESPACE file.
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# cheese

<details>

* Version: 0.1.1
* GitHub: https://github.com/zajichek/cheese
* Source code: https://github.com/cran/cheese
* Date/Publication: 2020-10-19 17:40:09 UTC
* Number of recursive dependencies: 66

Run `cloud_details(, "cheese")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cheese-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: descriptives
    > ### Title: Compute descriptive statistics on columns of a data frame
    > ### Aliases: descriptives
    > 
    > ### ** Examples
    > 
    > #Default
    ...
     18.   └─purrr:::map_depth_rec(...)
     19.     └─purrr (local) .fmap(...)
     20.       └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
     21.         ├─purrr:::with_indexed_errors(...)
     22.         │ └─base::withCallingHandlers(...)
     23.         └─purrr (local) .f(.x[[i]], ...)
     24.           └─purrr:::map_depth_rec(...)
     25.             └─cli::cli_abort("List not deep enough", call = .error_call)
     26.               └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘cheese.Rmd’ using rmarkdown
    Quitting from lines 434-436 (cheese.Rmd) 
    Error: processing vignette 'cheese.Rmd' failed with diagnostics:
    ℹ In index: 4.
    Caused by error in `purrr::map_depth()`:
    ! List not deep enough
    --- failed re-building ‘cheese.Rmd’
    
    ...
    ℹ In index: 4.
    Caused by error in `purrr::map_depth()`:
    ! List not deep enough
    --- failed re-building ‘describe.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘cheese.Rmd’ ‘describe.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# codebook

<details>

* Version: 0.9.2
* GitHub: https://github.com/rubenarslan/codebook
* Source code: https://github.com/cran/codebook
* Date/Publication: 2020-06-06 23:40:03 UTC
* Number of recursive dependencies: 154

Run `cloud_details(, "codebook")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘codebook.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Could not summarise item age. Error in `dplyr::mutate_at()`:
    ! Column `min` not found in `.data`.
    
    --- failed re-building ‘codebook_tutorial.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘codebook.Rmd’ ‘codebook_tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘userfriendlyscience’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘graphics’ ‘jsonlite’ ‘rlang’ ‘tidyselect’ ‘vctrs’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 65 marked UTF-8 strings
    ```

# connectapi

<details>

* Version: 0.1.2
* GitHub: https://github.com/rstudio/connectapi
* Source code: https://github.com/cran/connectapi
* Date/Publication: 2022-09-30 20:10:01 UTC
* Number of recursive dependencies: 134

Run `cloud_details(, "connectapi")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘test-integrated.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ────────────────────────────────────────────────────────────────────────────────
      
      ══ Results ═════════════════════════════════════════════════════════════════════
      Duration: 0.9 s
      
    ...
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      • Ahh! this fails presently. Are double -> POSIXct conversions allowed? (1)
      • On CRAN (1)
      • failing currently (2)
      • not implemented yet (1)
      • not tested yet (1)
      
      [ FAIL 1 | WARN 1 | SKIP 6 | PASS 116 ]
      Error: Test failures
      Execution halted
    ```

# crosstable

<details>

* Version: 0.5.0
* GitHub: https://github.com/DanChaltiel/crosstable
* Source code: https://github.com/cran/crosstable
* Date/Publication: 2022-08-16 10:40:02 UTC
* Number of recursive dependencies: 120

Run `cloud_details(, "crosstable")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘crosstable-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_flextable.crosstable
    > ### Title: Turns a 'crosstable' object into a formatted 'flextable'
    > ### Aliases: as_flextable.crosstable ctf cross_to_flextable to_flextable
    > ###   as_flextable af
    > ### Keywords: internal
    > 
    > ### ** Examples
    ...
     15. ├─dplyr::mutate(...)
     16. ├─tidyr::pivot_wider(., names_from = "by")
     17. ├─purrr::imap_dfr(...)
     18. │ └─purrr::map2(.x, vec_index(.x), .f, ...)
     19. │   └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
     20. │     └─vctrs::vec_size_common(.x = .x, .y = .y, .call = ..error_call)
     21. └─vctrs:::stop_scalar_type(`<fn>`(`<by>`), ".x", `<env>`)
     22.   └─vctrs:::stop_vctrs(...)
     23.     └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `map2(.x, vec_index(.x), .f, ...)`: i In index: 1.
      Caused by error in `map2()`:
      ! `.x` must be a vector, not a <by> object.
      ── Error ('test-selection.R:170'): crosstable with formula ─────────────────────
      Error in `map2(.x, vec_index(.x), .f, ...)`: i In index: 1.
      Caused by error in `map2()`:
      ! `.x` must be a vector, not a <by> object.
      ── Error ('test-selection.R:250'): crosstable limit tests: deprecated features ──
      Error in `map2(.x, vec_index(.x), .f, ...)`: i In index: 1.
      Caused by error in `map2()`:
      ! `.x` must be a vector, not a <by> object.
      
      [ FAIL 33 | WARN 402 | SKIP 20 | PASS 202 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘crosstable-install.Rmd’ using rmarkdown
    --- finished re-building ‘crosstable-install.Rmd’
    
    --- re-building ‘crosstable-report.Rmd’ using rmarkdown
    Quitting from lines 51-90 (crosstable-report.Rmd) 
    Error: processing vignette 'crosstable-report.Rmd' failed with diagnostics:
    ℹ In index: 1.
    Caused by error in `map2()`:
    ! `.x` must be a vector, not a <by> object.
    ...
    ℹ In index: 1.
    Caused by error in `map2()`:
    ! `.x` must be a vector, not a <by> object.
    --- failed re-building ‘crosstable.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘crosstable-report.Rmd’ ‘crosstable-selection.Rmd’ ‘crosstable.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘expss’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘expss’
    ```

# csvwr

<details>

* Version: 0.1.6
* GitHub: https://github.com/Robsteranium/csvwr
* Source code: https://github.com/cran/csvwr
* Date/Publication: 2021-11-09 10:50:02 UTC
* Number of recursive dependencies: 62

Run `cloud_details(, "csvwr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘csvw-tests-helpers.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       13.                         └─purrr::lmap(le[[1]], m)
       14.                           └─purrr:::lmap_helper(.x, rep(TRUE, length(.x)), .f, ...)
       15.                             └─csvwr (local) .f(.x[i], ...)
       16.                               └─purrr::lmap(le[[1]], m)
       17.                                 └─purrr:::lmap_helper(.x, rep(TRUE, length(.x)), .f, ...)
       18.                                   └─purrr::list_cbind(x = out)
       19.                                     └─purrr:::check_list_of_data_frames(x)
       20.                                       └─cli::cli_abort(...)
       21.                                         └─rlang::abort(...)
      ── Failure ('test-util.R:45'): vec_depth doesn't attempt to measure the depth of errors ──
      `purrr::vec_depth(err)` did not throw the expected error.
      
      [ FAIL 48 | WARN 68 | SKIP 0 | PASS 34 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘read-write-csvw.Rmd’ using rmarkdown
    Quitting from lines 59-60 (read-write-csvw.Rmd) 
    Error: processing vignette 'read-write-csvw.Rmd' failed with diagnostics:
    Each element of `x` must be either a data frame or `NULL`.
    ℹ Elements 1, 2, 3, 4, and 5 are not.
    --- failed re-building ‘read-write-csvw.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘read-write-csvw.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# cubelyr

<details>

* Version: 1.0.1
* GitHub: https://github.com/hadley/cubelyr
* Source code: https://github.com/cran/cubelyr
* Date/Publication: 2020-11-24 09:50:03 UTC
* Number of recursive dependencies: 45

Run `cloud_details(, "cubelyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(cubelyr)
      > 
      > test_check("cubelyr")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 29 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-cube.R:87'): filter ──────────────────────────────────────────
      `filter(nasa, month == 1 & year == 2000)` threw an error with unexpected message.
      Expected match: "`month == 1 & year == 2000` must refer to exactly one dimension, not `month`, `year`"
      Actual message: "ℹ In index: 1.\nCaused by error in `map_chr()`:\n! `.x` must be a vector, not a <quosure> object."
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 29 ]
      Error: Test failures
      Execution halted
    ```

# DataFakeR

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/DataFakeR
* Date/Publication: 2021-09-23 18:10:06 UTC
* Number of recursive dependencies: 83

Run `cloud_details(, "DataFakeR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       31. │           └─purrr::modify(expr, prepare_expression)
       32. │             └─cli::cli_abort("{.arg .x} must be a vector, list, or data frame, not {.obj_type_friendly {.x}}.")
       33. │               └─rlang::abort(...)
       34. │                 └─rlang:::signal_abort(cnd, .file)
       35. │                   └─base::signalCondition(cnd)
       36. ├─dplyr (local) `<fn>`(`<rlng_rrr>`)
       37. │ └─rlang::abort(...)
       38. │   └─rlang:::signal_abort(cnd, .file)
       39. │     └─base::signalCondition(cnd)
       40. └─dplyr (local) `<fn>`(`<dply:::_>`)
       41.   └─rlang::abort(...)
      
      [ FAIL 4 | WARN 2 | SKIP 1 | PASS 47 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘datafaker_workflow.Rmd’ using rmarkdown
    --- finished re-building ‘datafaker_workflow.Rmd’
    
    --- re-building ‘extra_parameters.Rmd’ using rmarkdown
    Quitting from lines 68-71 (extra_parameters.Rmd) 
    Error: processing vignette 'extra_parameters.Rmd' failed with diagnostics:
    Problem while computing `state = tidygraph::map_bfs(...)`.
    Caused by error in `mutate()`:
    ! Problem while computing `state = tidygraph::map_bfs(...)`.
    ...
    --- finished re-building ‘simulation_options.Rmd’
    
    --- re-building ‘structure_from_db.Rmd’ using rmarkdown
    --- finished re-building ‘structure_from_db.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘extra_parameters.Rmd’ ‘simulation_methods.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# dibble

<details>

* Version: 0.2.1
* GitHub: https://github.com/UchidaMizuki/dibble
* Source code: https://github.com/cran/dibble
* Date/Publication: 2022-08-07 14:20:02 UTC
* Number of recursive dependencies: 50

Run `cloud_details(, "dibble")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       10. │   │ ├─base::withVisible(eval(mc, parent.frame()))
       11. │   │ └─base::eval(mc, parent.frame())
       12. │   │   └─base::eval(mc, parent.frame())
       13. │   └─dibble (local) `<fn>`(...)
       14. │     └─purrr::map2(...)
       15. │       └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
       16. │         └─vctrs::vec_size_common(.x = .x, .y = .y, .call = ..error_call)
       17. └─vctrs::stop_incompatible_size(...)
       18.   └─vctrs:::stop_incompatible(...)
       19.     └─vctrs:::stop_vctrs(...)
       20.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 61 ]
      Error: Test failures
      Execution halted
    ```

# ffscrapr

<details>

* Version: 1.4.7
* GitHub: https://github.com/ffverse/ffscrapr
* Source code: https://github.com/cran/ffscrapr
* Date/Publication: 2021-11-10 06:00:07 UTC
* Number of recursive dependencies: 70

Run `cloud_details(, "ffscrapr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       30. │   └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
       31. │     └─rlang::abort(...)
       32. │       └─rlang:::signal_abort(cnd, .file)
       33. │         └─base::signalCondition(cnd)
       34. ├─dplyr (local) `<fn>`(`<rlng_rrr>`)
       35. │ └─rlang::abort(...)
       36. │   └─rlang:::signal_abort(cnd, .file)
       37. │     └─base::signalCondition(cnd)
       38. └─purrr (local) `<fn>`(`<dply:::_>`)
       39.   └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
       40.     └─rlang::abort(...)
      
      [ FAIL 5 | WARN 40 | SKIP 1 | PASS 105 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘espn_authentication.Rmd’ using rmarkdown
    --- finished re-building ‘espn_authentication.Rmd’
    
    --- re-building ‘espn_basics.Rmd’ using rmarkdown
    trying URL 'https://github.com/ffverse/ffscrapr-tests/archive/1.4.7.zip'
    downloaded 9.8 MB
    
    
    Attaching package: 'dplyr'
    ...
    
        intersect, setdiff, setequal, union
    
    --- finished re-building ‘sleeper_getendpoint.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘fleaflicker_getendpoint.Rmd’ ‘mfl_basics.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘nflreadr’
      All declared Imports should be used.
    ```

# flexsurv

<details>

* Version: 2.2
* GitHub: https://github.com/chjackson/flexsurv-dev
* Source code: https://github.com/cran/flexsurv
* Date/Publication: 2022-06-17 23:10:08 UTC
* Number of recursive dependencies: 132

Run `cloud_details(, "flexsurv")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘flexsurv-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tidy.flexsurvreg
    > ### Title: Tidy a flexsurv model object
    > ### Aliases: tidy.flexsurvreg
    > 
    > ### ** Examples
    > 
    > 
    ...
     1. ├─generics::tidy(fitg)
     2. ├─flexsurv:::tidy.flexsurvreg(fitg)
     3. │ └─purrr::map2_dbl(...)
     4. │   └─purrr:::map2_("double", .x, .y, .f, ..., .progress = .progress)
     5. │     └─vctrs::vec_size_common(.x = .x, .y = .y, .call = ..error_call)
     6. └─vctrs::stop_incompatible_size(...)
     7.   └─vctrs:::stop_incompatible(...)
     8.     └─vctrs:::stop_vctrs(...)
     9.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        doc    1.1Mb
        libs   4.3Mb
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘standsurv.Rmd’ using rmarkdown
    Loading required package: survival
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
                        [T1]{fontenc}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘flexsurv-examples.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘flexsurv.Rnw’ ‘multistate.Rnw’ ‘distributions.Rnw’
      ‘flexsurv-examples.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# grizbayr

<details>

* Version: 1.3.2
* GitHub: NA
* Source code: https://github.com/cran/grizbayr
* Date/Publication: 2022-08-15 18:30:02 UTC
* Number of recursive dependencies: 59

Run `cloud_details(, "grizbayr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-sample_from_posterior.R:45'): sample_from_posterior returns correct dataframe shape for all types ──
      Error in `purrr::every(output, ~colnames(.x) == expected_col_names)`: `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.
      Backtrace:
          ▆
       1. ├─testthat::expect_true(purrr::every(output, ~colnames(.x) == expected_col_names)) at test-sample_from_posterior.R:45:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─purrr::every(.p = ~colnames(.x) == expected_col_names)
       5.   └─purrr (local) .p(.x[[i]], ...)
       6.     └─cli::cli_abort(...)
       7.       └─rlang::abort(...)
      
      [ FAIL 1 | WARN 16 | SKIP 0 | PASS 245 ]
      Error: Test failures
      Execution halted
    ```

# gtreg

<details>

* Version: 0.2.0
* GitHub: https://github.com/shannonpileggi/gtreg
* Source code: https://github.com/cran/gtreg
* Date/Publication: 2022-10-18 15:25:09 UTC
* Number of recursive dependencies: 101

Run `cloud_details(, "gtreg")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─testthat::expect_error(...) at test-style_xxx.R:52:2
        2. │ └─testthat:::expect_condition_matching(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. ├─... %>% modify_spanning_header(all_ae_cols() ~ "**N = xx**")
        8. ├─gtsummary::modify_spanning_header(., all_ae_cols() ~ "**N = xx**")
        9. ├─gtreg::tbl_ae_focus(...)
       10. │ └─... %>% gtsummary::tbl_merge(tab_spanner = FALSE)
       11. └─gtsummary::tbl_merge(., tab_spanner = FALSE)
      
      [ FAIL 3 | WARN 2 | SKIP 6 | PASS 56 ]
      Error: Test failures
      Execution halted
    ```

# gtsummary

<details>

* Version: 1.6.2
* GitHub: https://github.com/ddsjoberg/gtsummary
* Source code: https://github.com/cran/gtsummary
* Date/Publication: 2022-09-30 14:10:02 UTC
* Number of recursive dependencies: 181

Run `cloud_details(, "gtsummary")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `actual[[5]]` is NULL
      `expected[[5]]` is absent
      
      `actual[[6]]` is NULL
      `expected[[6]]` is absent
      
      `actual[[7]]` is NULL
      `expected[[7]]` is absent
      
      `actual[[8]]` is NULL
      `expected[[8]]` is absent
      
      [ FAIL 3 | WARN 20 | SKIP 74 | PASS 11 ]
      Error: Test failures
      Execution halted
    ```

# gwasrapidd

<details>

* Version: 0.99.13
* GitHub: https://github.com/ramiromagno/gwasrapidd
* Source code: https://github.com/cran/gwasrapidd
* Date/Publication: 2022-08-11 22:20:02 UTC
* Number of recursive dependencies: 79

Run `cloud_details(, "gwasrapidd")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       10. │       ├─purrr:::with_indexed_errors(...)
       11. │       │ └─base::withCallingHandlers(...)
       12. │       └─gwasrapidd (local) .f(.x[[i]], ...)
       13. │         └─gwasrapidd::get_variants(efo_id = .x, verbose = verbose, warnings = warnings)
       14. │           └─gwasrapidd:::get_variants_by_efo_id(...)
       15. │             └─gwasrapidd:::get_variants_by_efo_trait(...)
       16. │               └─assertthat::assert_that(...)
       17. │                 └─base::stop(assertError(attr(res, "msg")))
       18. └─purrr (local) `<fn>`(`<assrtErr>`)
       19.   └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
       20.     └─rlang::abort(...)
      
      [ FAIL 1 | WARN 2 | SKIP 1 | PASS 720 ]
      Error: Test failures
      Execution halted
    ```

# healthcareai

<details>

* Version: 2.5.1
* GitHub: https://github.com/HealthCatalyst/healthcareai-r
* Source code: https://github.com/cran/healthcareai
* Date/Publication: 2022-09-05 14:50:02 UTC
* Number of recursive dependencies: 126

Run `cloud_details(, "healthcareai")` for more info

</details>

## Newly broken

*   checking R code for possible problems ... NOTE
    ```
    setup_training: no visible binding for global variable ‘is_numeric’
    Undefined global functions or variables:
      is_numeric
    ```

# ipmr

<details>

* Version: 0.0.5
* GitHub: https://github.com/levisc8/ipmr
* Source code: https://github.com/cran/ipmr
* Date/Publication: 2022-04-28 13:40:08 UTC
* Number of recursive dependencies: 76

Run `cloud_details(, "ipmr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [ FAIL 1 | WARN 110 | SKIP 1 | PASS 367 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-generics.R:1644'): warnings are produced correctly ───────────
      grepl(...) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      
      [ FAIL 1 | WARN 110 | SKIP 1 | PASS 367 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        doc    1.3Mb
        libs   2.6Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Rpadrino’
    ```

# jpmesh

<details>

* Version: 2.1.0
* GitHub: https://github.com/uribo/jpmesh
* Source code: https://github.com/cran/jpmesh
* Date/Publication: 2022-01-10 03:32:41 UTC
* Number of recursive dependencies: 108

Run `cloud_details(, "jpmesh")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jpmesh-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: export_mesh
    > ### Title: Export meshcode to geometry
    > ### Aliases: export_mesh export_meshes
    > 
    > ### ** Examples
    > 
    > export_mesh("6441427712")
    ...
      4. │ └─purrr:::modify_where(.x, where, .f, ...)
      5. │   ├─base::`[<-`(`*tmp*`, .where, value = `<named list>`)
      6. │   └─tibble:::`[<-.tbl_df`(`*tmp*`, .where, value = `<named list>`)
      7. │     └─tibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
      8. │       └─tibble:::vectbl_as_new_col_index(j, x, j_arg, names2(value), value_arg)
      9. │         └─vctrs::vec_recycle(names, length(j), x_arg = as_label(value_arg))
     10. └─vctrs:::stop_recycle_incompatible_size(...)
     11.   └─vctrs:::stop_vctrs(...)
     12.     └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Deleting unused snapshots:
      • administration_mesh/administration-10kmmesh-pref33-34.svg
      • administration_mesh/administration-10kmmesh-pref35.svg
      • administration_mesh/administration-1kmmesh-city08220-08221.svg
      • administration_mesh/administration-1kmmesh-city08220.svg
      • administration_mesh/administration-1kmmesh-city35201.svg
      • administration_mesh/administration-80kmmesh-pref08.svg
      • find/neighbor-mesh-10km-6meshes.svg
      • find/neighbor-mesh-1km-self-contains-false.svg
      • find/neighbor-mesh-1km-self-contains-true.svg
      • find/neighbor-mesh-80km-7meshes.svg
      • fine_separate/fine-separate-10km.svg
      • fine_separate/fine-separate-1km.svg
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘usage.Rmd’ using rmarkdown
    Linking to GEOS 3.8.0, GDAL 3.0.4, PROJ 6.3.1; sf_use_s2() is TRUE
    Quitting from lines 70-73 (usage.Rmd) 
    Error: processing vignette 'usage.Rmd' failed with diagnostics:
    Can't recycle `vec_recycle_common(!!!new, .size = size, .arg = "out")` (size 2) to size 1.
    --- failed re-building ‘usage.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘usage.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 176 marked UTF-8 strings
    ```

# partialised

<details>

* Version: 0.1.0
* GitHub: https://github.com/UchidaMizuki/partialised
* Source code: https://github.com/cran/partialised
* Date/Publication: 2022-05-04 12:20:02 UTC
* Number of recursive dependencies: 32

Run `cloud_details(, "partialised")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          }
          structure(fn, class = c("purrr_function_partial", "function"), 
              body = call)
      })(.Primitive("quote")(.fn), x = 6)`: `.f` must be a function, not .fn.
      Backtrace:
          ▆
       1. └─partialised::`arguments<-`(`*tmp*`, value = `<named list>`) at test-partialised.R:12:2
       2.   ├─rlang::exec(purrr::partial, partialised_fn(x), !!!value)
       3.   └─purrr (local) `<fn>`(.f = `<fn>`(.fn))
       4.     └─cli::cli_abort(...)
       5.       └─rlang::abort(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1 ]
      Error: Test failures
      Execution halted
    ```

# PHEindicatormethods

<details>

* Version: 1.4.1
* GitHub: https://github.com/PublicHealthEngland/PHEindicatormethods
* Source code: https://github.com/cran/PHEindicatormethods
* Date/Publication: 2022-08-08 11:40:17 UTC
* Number of recursive dependencies: 77

Run `cloud_details(, "PHEindicatormethods")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PHEindicatormethods-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: phe_life_expectancy
    > ### Title: Calculate Life Expectancy using phe_life_expectancy
    > ### Aliases: phe_life_expectancy
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
      3. │ └─lapply(data, is.factor) %>% purrr::map_chr(c)
      4. ├─purrr::map_chr(., c)
      5. │ └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
      6. │   └─purrr:::with_indexed_errors(...)
      7. │     └─base::withCallingHandlers(...)
      8. └─base::.handleSimpleError(...)
      9.   └─purrr (local) h(simpleError(msg, call))
     10.     └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
     11.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─df1 %>% mutate(area = "test") %>% group_by(area) %>% ... at testLifeExpectancy.R:189:0
        2. ├─PHEindicatormethods::phe_life_expectancy(., deaths, pops, startage)
        3. │ └─lapply(data, is.factor) %>% purrr::map_chr(c)
        4. ├─purrr::map_chr(., c)
        5. │ └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
        6. │   └─purrr:::with_indexed_errors(...)
        7. │     └─base::withCallingHandlers(...)
        8. └─base::.handleSimpleError(...)
        9.   └─purrr (local) h(simpleError(msg, call))
       10.     └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
       11.       └─rlang::abort(...)
      
      [ FAIL 1 | WARN 2 | SKIP 0 | PASS 405 ]
      Error: Test failures
      Execution halted
    ```

# RCLabels

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/RCLabels
* Date/Publication: 2022-03-05 16:00:02 UTC
* Number of recursive dependencies: 94

Run `cloud_details(, "RCLabels")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [3] "g [noun NULL of h in GBR]"        - "g [of h in GBR]"        [3]
      ── Failure ('test-utilities.R:223'): replace_by_pattern() works for nouns and prepositions ──
      replace_by_pattern(...) (`actual`) not equal to c("Production [of b in c]", "d [of Coal in f]", "g [of h in USupercalifragilisticexpialidocious]") (`expected`).
      
      actual vs expected
      - "Production [noun NULL of b in c]"
      + "Production [of b in c]"
      - "d [noun NULL of Coal in f]"
      + "d [of Coal in f]"
      - "g [noun NULL of h in USupercalifragilisticexpialidocious]"
      + "g [of h in USupercalifragilisticexpialidocious]"
      
      [ FAIL 28 | WARN 1 | SKIP 0 | PASS 197 ]
      Error: Test failures
      Execution halted
    ```

# rearrr

<details>

* Version: 0.3.1
* GitHub: https://github.com/ludvigolsen/rearrr
* Source code: https://github.com/cran/rearrr
* Date/Publication: 2022-08-28 15:10:02 UTC
* Number of recursive dependencies: 83

Run `cloud_details(, "rearrr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1/1 mismatches
      x[1]: "ℹ In index 1Caused by error in map2ℹ In index 1Caused by error in mapℹ In
      x[1]:  index 1Caused by error in mapℹ In index 1Caused by error in map2ℹ In inde
      x[1]: x 1Caused by error in adddimensions Adding these dimensions would overwrit
      x[1]: e existing columns x y z"
      y[1]: "Adding these dimensions would overwrite existing columns x y z"
      ── Failure ('test_swirl_3d.R:1988'): fuzz testing swirl_3d() ───────────────────
      xpectr::strip(side_effects_10389[["error_class"]]) not equal to xpectr::strip(c("simpleError", "error", "condition")).
      1/3 mismatches
      x[1]: "rlangerror"
      y[1]: "simpleError"
      
      [ FAIL 156 | WARN 3 | SKIP 0 | PASS 7187 ]
      Error: Test failures
      Execution halted
    ```

# recipes

<details>

* Version: 1.0.2
* GitHub: https://github.com/tidymodels/recipes
* Source code: https://github.com/cran/recipes
* Date/Publication: 2022-10-16 00:20:25 UTC
* Number of recursive dependencies: 130

Run `cloud_details(, "recipes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘recipes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: step_dummy_extract
    > ### Title: Extract patterns from nominal data
    > ### Aliases: step_dummy_extract
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
      9. │ ├─recipes::prep(x$steps[[i]], training = training, info = x$term_info)
     10. │ └─recipes:::prep.step_dummy_extract(...)
     11. │   └─purrr::map2(lvls, as.double(wts), ~rep(.y, length(.x)))
     12. │     └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
     13. │       └─vctrs::vec_size_common(.x = .x, .y = .y, .call = ..error_call)
     14. └─vctrs::stop_incompatible_size(...)
     15.   └─vctrs:::stop_incompatible(...)
     16.     └─vctrs:::stop_vctrs(...)
     17.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─recipes::prep(dummy) at test_dummies_extract.R:337:2
        2. ├─recipes:::prep.recipe(dummy)
        3. │ ├─recipes::prep(x$steps[[i]], training = training, info = x$term_info)
        4. │ └─recipes:::prep.step_dummy_extract(...)
        5. │   └─purrr::map2(lvls, as.double(wts), ~rep(.y, length(.x)))
        6. │     └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
        7. │       └─vctrs::vec_size_common(.x = .x, .y = .y, .call = ..error_call)
        8. └─vctrs::stop_incompatible_size(...)
        9.   └─vctrs:::stop_incompatible(...)
       10.     └─vctrs:::stop_vctrs(...)
       11.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 5 | WARN 37 | SKIP 401 | PASS 1855 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘fastICA’, ‘dimRed’
    ```

# ruta

<details>

* Version: 1.1.0
* GitHub: https://github.com/fdavidcl/ruta
* Source code: https://github.com/cran/ruta
* Date/Publication: 2019-03-18 13:10:02 UTC
* Number of recursive dependencies: 70

Run `cloud_details(, "ruta")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ruta-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_network
    > ### Title: Coercion to ruta_network
    > ### Aliases: as_network as_network.ruta_layer as_network.ruta_network
    > ###   as_network.numeric as_network.integer
    > 
    > ### ** Examples
    > 
    ...
     15.       └─ruta:::make_atomic_network(ruta_layer_dense, units = units, activation = activation)
     16.         ├─ruta::as_network(new_layer(cl, ...))
     17.         └─ruta:::as_network.ruta_layer(new_layer(cl, ...))
     18.           └─ruta::new_network(x)
     19.             ├─base::stopifnot(every(args, ~class(.) == ruta_layer))
     20.             └─purrr::every(.p = ~class(.) == ruta_layer)
     21.               └─purrr (local) .p(.x[[i]], ...)
     22.                 └─cli::cli_abort(...)
     23.                   └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        7.     └─ruta:::as_network.ruta_layer(new_layer(cl, ...))
        8.       └─ruta::new_network(x)
        9.         ├─base::stopifnot(every(args, ~class(.) == ruta_layer))
       10.         └─purrr::every(.p = ~class(.) == ruta_layer)
       11.           └─purrr (local) .p(.x[[i]], ...)
       12.             └─cli::cli_abort(...)
       13.               └─rlang::abort(...)
      ── Error ('test-layers.R:21'): networks can be built from integers ─────────────
      Error in `map(., dense)`: ℹ In index: 1.
      Caused by error in `every()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.
      
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘architectures.Rmd’ using rmarkdown
    Quitting from lines 23-28 (architectures.Rmd) 
    Error: processing vignette 'architectures.Rmd' failed with diagnostics:
    ℹ In index: 1.
    Caused by error in `every()`:
    ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.
    --- failed re-building ‘architectures.Rmd’
    
    --- re-building ‘troubleshooting.Rmd’ using rmarkdown
    --- finished re-building ‘troubleshooting.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘architectures.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# sbm

<details>

* Version: 0.4.4
* GitHub: https://github.com/GrossSBM/sbm
* Source code: https://github.com/cran/sbm
* Date/Publication: 2022-08-24 17:40:02 UTC
* Number of recursive dependencies: 104

Run `cloud_details(, "sbm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...6c6
    < NULL
    ---
    > All Done!
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
    ...
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1050 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-MultipartiteSBM.R:35'): initializing Multipartite SBM works ──
      myMBM$blockProp not equivalent to list(NULL, list(numeric(0), numeric(0))).
      Component 1: target is numeric, current is NULL
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1050 ]
      Error: Test failures
      Execution halted
    ```

# scImmuneGraph

<details>

* Version: 1.1.3
* GitHub: https://github.com/zff-excellent/scImmuneGraph
* Source code: https://github.com/cran/scImmuneGraph
* Date/Publication: 2021-12-10 09:00:23 UTC
* Number of recursive dependencies: 152

Run `cloud_details(, "scImmuneGraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘scImmuneGraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: BCR.CDR3ntLengthDistribution
    > ### Title: CDR3 nucleic acid length distribution in the sample
    > ### Aliases: BCR.CDR3ntLengthDistribution
    > 
    > ### ** Examples
    > 
    > 
    ...
      2. │ ├─... %>% purrr::set_names(sampleName)
      3. │ └─purrr::pmap(list(datasetDir, sampleName, groupName), CreateList)
      4. │   └─purrr:::pmap_("list", .l, .f, ..., .progress = .progress)
      5. │     └─vctrs::vec_size_common(!!!.l, .arg = ".l", .call = ..error_call)
      6. ├─purrr::set_names(., sampleName)
      7. └─vctrs::stop_incompatible_size(...)
      8.   └─vctrs:::stop_incompatible(...)
      9.     └─vctrs:::stop_vctrs(...)
     10.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘BiocStyle’ ‘cowplot’ ‘easypackages’ ‘plyr’ ‘readr’ ‘stringr’
      ‘tidyverse’
      All declared Imports should be used.
    ```

# scrutiny

<details>

* Version: 0.2.2
* GitHub: https://github.com/lhdjung/scrutiny
* Source code: https://github.com/cran/scrutiny
* Date/Publication: 2022-08-22 09:40:02 UTC
* Number of recursive dependencies: 121

Run `cloud_details(, "scrutiny")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘scrutiny-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: debit_map_seq
    > ### Title: Using DEBIT with dispersed inputs
    > ### Aliases: debit_map_seq
    > 
    > ### ** Examples
    > 
    > # `debit_map_seq()` can take any input
    ...
     21.   └─vctrs::vec_default_cast(...)
     22.     ├─base::withRestarts(...)
     23.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
     24.     │   └─base (local) doWithOneRestart(return(expr), restart)
     25.     └─vctrs::stop_incompatible_cast(...)
     26.       └─vctrs::stop_incompatible_type(...)
     27.         └─vctrs:::stop_incompatible(...)
     28.           └─vctrs:::stop_vctrs(...)
     29.             └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘consistency-tests.Rmd’ using rmarkdown
    --- finished re-building ‘consistency-tests.Rmd’
    
    --- re-building ‘debit.Rmd’ using rmarkdown
    Quitting from lines 188-189 (debit.Rmd) 
    Error: processing vignette 'debit.Rmd' failed with diagnostics:
    Problem while computing `..1 = dplyr::across(...)`.
    Caused by error in `across()`:
    ! Problem while computing column `hits_n`.
    ...
    --- finished re-building ‘rounding.Rmd’
    
    --- re-building ‘wrangling.Rmd’ using rmarkdown
    --- finished re-building ‘wrangling.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘debit.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# simpr

<details>

* Version: 0.2.2
* GitHub: https://github.com/statisfactions/simpr
* Source code: https://github.com/cran/simpr
* Date/Publication: 2022-02-13 00:40:02 UTC
* Number of recursive dependencies: 77

Run `cloud_details(, "simpr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Failure ('test_errors.R:17'): errors produce new column ─────────────────────
      all(na.omit(err_out$.sim_error) == "Error in errgt(x1): x < 3 are not all TRUE\n") is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      ── Failure ('test_generate.R:17'): .quiet, .warn_on_error, .stop_on_error options work as expected ──
      `generate(buggy_spec, 1, .warn_on_error = FALSE, .quiet = FALSE)` produced unexpected messages.
      Expected match: invalid arguments
      Actual values:
      * Error: In index: 1.
      
      
      [ FAIL 3 | WARN 1 | SKIP 0 | PASS 44 ]
      Error: Test failures
      Execution halted
    ```

# skimr

<details>

* Version: 2.1.4
* GitHub: https://github.com/ropensci/skimr
* Source code: https://github.com/cran/skimr
* Date/Publication: 2022-04-15 02:20:02 UTC
* Number of recursive dependencies: 81

Run `cloud_details(, "skimr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘skimr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: skim
    > ### Title: Skim a data frame, getting useful summary statistics
    > ### Aliases: skim skim_tee skim_without_charts
    > 
    > ### ** Examples
    > 
    > skim(iris)
    ...
     18.       └─dplyr:::summarise.data.frame(data, dplyr::across(variable_names, mangled_skimmers$funs))
     19.         └─dplyr:::summarise_cols(.data, dplyr_quosures(...), caller_env = caller_env())
     20.           ├─base::withCallingHandlers(...)
     21.           └─dplyr:::expand_across(dots[[i]])
     22.             └─dplyr:::as_across_fn_call(fns[[j]], var, env, mask)
     23.               ├─rlang::call2(as_function(fn), sym(var))
     24.               └─rlang::as_function(fn)
     25.                 └─rlang:::abort_coercion(x, "a function", arg = arg)
     26.                   └─rlang::abort(msg, call = call)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Component "numeric": Lengths (8, 7) differ (string compare on first 7)
      ── Error ('test-skim_with.R:175'): Defining an integer sfl changes behavior ────
      Error in `dplyr::summarize(grouped, skimmed = purrr::map2(.data$skimmers, 
          .data$skim_variable, skim_by_type, data))`: Problem while computing `skimmed = purrr::map2(...)`.
      Caused by error in `purrr::map2()`:
      ℹ In index: 1.
      Caused by error in `dplyr::summarize()`:
      ! Problem while computing `..1 = dplyr::across(variable_names,
        mangled_skimmers$funs)`.
      Caused by error in `as_across_fn_call()`:
      ! Can't convert `fn`, NULL, to a function.
      
      [ FAIL 7 | WARN 6 | SKIP 24 | PASS 623 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Skimr_defaults.Rmd’ using rmarkdown
    --- finished re-building ‘Skimr_defaults.Rmd’
    
    --- re-building ‘Using_fonts.Rmd’ using rmarkdown
    --- finished re-building ‘Using_fonts.Rmd’
    
    --- re-building ‘extending_skimr.Rmd’ using rmarkdown
    --- finished re-building ‘extending_skimr.Rmd’
    
    ...
      mangled_skimmers$funs)`.
    Caused by error in `as_across_fn_call()`:
    ! Can't convert `fn`, NULL, to a function.
    --- failed re-building ‘skimr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘skimr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidycmprsk

<details>

* Version: 0.2.0
* GitHub: https://github.com/MSKCC-Epi-Bio/tidycmprsk
* Source code: https://github.com/cran/tidycmprsk
* Date/Publication: 2022-10-03 07:20:02 UTC
* Number of recursive dependencies: 100

Run `cloud_details(, "tidycmprsk")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidycmprsk-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_cuminc
    > ### Title: Additional Functions for 'tbl_cuminc()'
    > ### Aliases: add_cuminc add_p.tbl_cuminc add_n.tbl_cuminc
    > ###   add_nevent.tbl_cuminc inline_text.tbl_cuminc
    > 
    > ### ** Examples
    > 
    ...
    > # Example 1 ----------------------------------
    > add_cuminc_ex1 <-
    +   cuminc(Surv(ttdeath, death_cr) ~ 1, trial) %>%
    +   tbl_cuminc(times = c(12, 24), label_header = "**Month {time}**") %>%
    +   add_nevent() %>%
    +   add_n()
    Error in UseMethod("tbl_cuminc") : 
      no applicable method for 'tbl_cuminc' applied to an object of class "list"
    Calls: %>% -> add_n -> add_nevent -> tbl_cuminc
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        8. ├─gtsummary::add_n(., location = c("label", "level"))
        9. ├─gtsummary::add_nevent(., location = c("label", "level"))
       10. └─tidycmprsk::tbl_cuminc(., times = c(12, 24), label_header = "**Month {time}**")
      ── Error ('test-tbl_cuminc.R:10'): tbl_cuminc() works ──────────────────────────
      Error in `inline_text(tbl0, time = 12)`: object 'tbl0' not found
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(inline_text(tbl0, time = 12), "6.0% (3.3%, 9.9%)") at test-tbl_cuminc.R:10:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─gtsummary::inline_text(tbl0, time = 12)
      
      [ FAIL 8 | WARN 0 | SKIP 0 | PASS 44 ]
      Error: Test failures
      Execution halted
    ```

# tidypredict

<details>

* Version: 0.4.9
* GitHub: https://github.com/tidymodels/tidypredict
* Source code: https://github.com/cran/tidypredict
* Date/Publication: 2022-05-25 19:20:02 UTC
* Number of recursive dependencies: 114

Run `cloud_details(, "tidypredict")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       26. │     └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
       27. │       └─rlang:::signal_abort(cnd, .file)
       28. │         └─base::signalCondition(cnd)
       29. ├─purrr (local) `<fn>`(`<vctrs___>`)
       30. │ └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
       31. │   └─rlang::abort(...)
       32. │     └─rlang:::signal_abort(cnd, .file)
       33. │       └─base::signalCondition(cnd)
       34. └─purrr (local) `<fn>`(`<rlng_rrr>`)
       35.   └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
       36.     └─rlang::abort(...)
      
      [ FAIL 1 | WARN 2 | SKIP 11 | PASS 105 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘cubist.Rmd’ using rmarkdown
    --- finished re-building ‘cubist.Rmd’
    
    --- re-building ‘glm.Rmd’ using rmarkdown
    --- finished re-building ‘glm.Rmd’
    
    --- re-building ‘lm.Rmd’ using rmarkdown
    --- finished re-building ‘lm.Rmd’
    
    ...
    ℹ In index: 1.
    Caused by error in `purrr::map2()`:
    ! Can't recycle `.x` (size 0) to match `.y` (size 2).
    --- failed re-building ‘xgboost.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘xgboost.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidytext

<details>

* Version: 0.3.4
* GitHub: https://github.com/juliasilge/tidytext
* Source code: https://github.com/cran/tidytext
* Date/Publication: 2022-08-20 00:10:02 UTC
* Number of recursive dependencies: 127

Run `cloud_details(, "tidytext")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `expected`: 7
      ── Error ('test-dictionary-tidiers.R:17'): can tidy a quanteda dictionary ──────
      Error in `sort.int(x, na.last = na.last, decreasing = decreasing, ...)`: 'x' must be atomic
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-dictionary-tidiers.R:17:4
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─base::sort(unique(td$word))
       5. └─base::sort.default(unique(td$word))
       6.   └─base::sort.int(...)
      
      [ FAIL 3 | WARN 5 | SKIP 4 | PASS 319 ]
      Error: Test failures
      Execution halted
    ```

# tidywikidatar

<details>

* Version: 0.5.4
* GitHub: NA
* Source code: https://github.com/cran/tidywikidatar
* Date/Publication: 2022-08-06 14:00:02 UTC
* Number of recursive dependencies: 135

Run `cloud_details(, "tidywikidatar")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidywikidatar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tw_filter
    > ### Title: Filter search result and keep only items with matching property
    > ###   and Q identifier
    > ### Aliases: tw_filter
    > 
    > ### ** Examples
    > 
    ...
     18. │ └─dplyr:::filter_rows(.data, ..., caller_env = caller_env())
     19. │   └─dplyr:::filter_eval(dots, mask = mask, error_call = error_call)
     20. │     ├─base::withCallingHandlers(...)
     21. │     └─mask$eval_all_filter(dots, env_filter)
     22. ├─property
     23. ├─rlang:::`$.rlang_data_pronoun`(.data, property)
     24. │ └─rlang:::data_pronoun_get(...)
     25. └─rlang:::abort_data_pronoun(x, call = y)
     26.   └─rlang::abort(msg, "rlang_error_data_pronoun_not_found", call = call)
    Execution halted
    ```

# utile.tools

<details>

* Version: 0.2.7
* GitHub: https://github.com/efinite/utile.tools
* Source code: https://github.com/cran/utile.tools
* Date/Publication: 2022-02-20 21:40:02 UTC
* Number of recursive dependencies: 22

Run `cloud_details(, "utile.tools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘utile.tools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calc_duration
    > ### Title: Calculate durations of time
    > ### Aliases: calc_duration
    > 
    > ### ** Examples
    > 
    > library(lubridate)
    ...
     13.                 ├─base::withRestarts(...)
     14.                 │ └─base (local) withOneRestart(expr, restarts[[1L]])
     15.                 │   └─base (local) doWithOneRestart(return(expr), restart)
     16.                 └─vctrs:::stop_lossy_cast(...)
     17.                   └─vctrs::stop_incompatible_cast(...)
     18.                     └─vctrs::stop_incompatible_type(...)
     19.                       └─vctrs:::stop_incompatible(...)
     20.                         └─vctrs:::stop_vctrs(...)
     21.                           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

