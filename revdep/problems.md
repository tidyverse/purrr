# broom.helpers

<details>

* Version: 1.9.0
* GitHub: https://github.com/larmarange/broom.helpers
* Source code: https://github.com/cran/broom.helpers
* Date/Publication: 2022-09-23 20:00:09 UTC
* Number of recursive dependencies: 205

Run `revdepcheck::cloud_details(, "broom.helpers")` for more info

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

Run `revdepcheck::cloud_details(, "cattonum")` for more info

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

Run `revdepcheck::cloud_details(, "cheese")` for more info

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

# connectapi

<details>

* Version: 0.1.2
* GitHub: https://github.com/rstudio/connectapi
* Source code: https://github.com/cran/connectapi
* Date/Publication: 2022-09-30 20:10:01 UTC
* Number of recursive dependencies: 135

Run `revdepcheck::cloud_details(, "connectapi")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘test-integrated.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Results ═════════════════════════════════════════════════════════════════════
      Duration: 0.7 s
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      • Ahh! this fails presently. Are double -> POSIXct conversions allowed? (1)
    ...
      • On CRAN (1)
      • failing currently (2)
      • not implemented yet (1)
      • not tested yet (1)
      
      [ FAIL 1 | WARN 0 | SKIP 6 | PASS 116 ]
      
      Don't worry, you'll get it.
      Error: Test failures
      Execution halted
    ```

# csvwr

<details>

* Version: 0.1.6
* GitHub: https://github.com/Robsteranium/csvwr
* Source code: https://github.com/cran/csvwr
* Date/Publication: 2021-11-09 10:50:02 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "csvwr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘csvw-tests-helpers.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        7. │         └─purrr:::pmap_("list", .l, .f, ..., .progress = .progress)
        8. │           └─vctrs::vec_size_common(!!!.l, .arg = ".l", .call = ..error_call)
        9. ├─purrr::map(...)
       10. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
       11. │   └─purrr:::vctrs_vec_compat(.x)
       12. └─vctrs::stop_incompatible_size(...)
       13.   └─vctrs:::stop_incompatible(...)
       14.     └─vctrs:::stop_vctrs(...)
       15.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      ── Failure ('test-util.R:45'): vec_depth doesn't attempt to measure the depth of errors ──
      `purrr::vec_depth(err)` did not throw the expected error.
      
      [ FAIL 4 | WARN 14 | SKIP 0 | PASS 86 ]
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

Run `revdepcheck::cloud_details(, "DataFakeR")` for more info

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

Run `revdepcheck::cloud_details(, "dibble")` for more info

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
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 61 ]
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

Run `revdepcheck::cloud_details(, "ffscrapr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      })`: ℹ In index: 2.
      Caused by error in `purrr::map_depth()`:
      ! List not deep enough
      ── Error (???): ff_scoringhistory returns a tibble of player scores ────────────
      Error in `.fmap(.x, function(x) {
          map_depth_rec(.fmap = .fmap, .x = x, .depth = .depth - 1, 
              .f = .f, ..., .ragged = .ragged, .is_node = .is_node, 
              .error_call = .error_call)
      })`: ℹ In index: 2.
      Caused by error in `purrr::map_depth()`:
      ! List not deep enough
      
      [ FAIL 4 | WARN 46 | SKIP 1 | PASS 111 ]
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
* Number of recursive dependencies: 134

Run `revdepcheck::cloud_details(, "flexsurv")` for more info

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

Run `revdepcheck::cloud_details(, "grizbayr")` for more info

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

# gtsummary

<details>

* Version: 1.6.2
* GitHub: https://github.com/ddsjoberg/gtsummary
* Source code: https://github.com/cran/gtsummary
* Date/Publication: 2022-09-30 14:10:02 UTC
* Number of recursive dependencies: 181

Run `revdepcheck::cloud_details(, "gtsummary")` for more info

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
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "gwasrapidd")` for more info

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
* Number of recursive dependencies: 129

Run `revdepcheck::cloud_details(, "healthcareai")` for more info

</details>

## Newly broken

*   checking R code for possible problems ... NOTE
    ```
    setup_training: no visible binding for global variable ‘is_numeric’
    Undefined global functions or variables:
      is_numeric
    ```

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘healthcareai-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: evaluate
    > ### Title: Get model performance metrics
    > ### Aliases: evaluate evaluate.predicted_df evaluate.model_list
    > 
    > ### ** Examples
    > 
    > models <- machine_learn(pima_diabetes[1:40, ],
    ...
    +                        models = c("XGB", "RF"),
    +                        tune = FALSE,
    +                        n_folds = 3)
    Training new data prep recipe...
    
    Variable(s) ignored in prep_data won't be used to tune models: patient_id
    Error in setup_training(d, rlang::enquo(outcome), model_class, models,  : 
      All predictors must be numeric, but the following variables are not numeric. Consider using prep_data to get data ready for model training: weight_class
    Calls: machine_learn -> flash_models -> setup_training
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat-1.R’
      Running ‘testthat-2.R’
      Running ‘testthat-3.R’
      Running ‘testthat-4.R’
      Running ‘testthat-5.R’
    Running the tests in ‘tests/testthat-5.R’ failed.
    Last 13 lines of output:
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
          metric, positive_class, n_folds)`: All predictors must be numeric, but the following variables are not numeric. Consider using prep_data to get data ready for model training: weight_class
      Backtrace:
          ▆
       1. └─healthcareai::machine_learn(...) at test-cran_only.R:4:2
       2.   └─healthcareai::flash_models(...)
       3.     └─healthcareai:::setup_training(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# ipmr

<details>

* Version: 0.0.5
* GitHub: https://github.com/levisc8/ipmr
* Source code: https://github.com/cran/ipmr
* Date/Publication: 2022-04-28 13:40:08 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "ipmr")` for more info

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

# naive

<details>

* Version: 1.2.1
* GitHub: NA
* Source code: https://github.com/cran/naive
* Date/Publication: 2022-11-05 09:50:02 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "naive")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─naive::naive(...) at test-main.R:27:12
       2.   └─base::data.frame(...)
      ── Error ('test-main.R:48'): Correct outcome format and size for base outcome3 ──
      Error in `data.frame(seq_len = sqln_set, cover = round(cvr_set, 4), stride = strd_set, 
          method = mthd_set, location = lctn_set, round(avg_error, 
              4))`: object 'avg_error' not found
      Backtrace:
          ▆
       1. └─naive::naive(...) at test-main.R:48:12
       2.   └─base::data.frame(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
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
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
    Quitting from lines 260-269 (A_Brief_Introduction_to_openalexR.Rmd) 
    Error: processing vignette 'A_Brief_Introduction_to_openalexR.Rmd' failed with diagnostics:
    $ operator is invalid for atomic vectors
    --- failed re-building ‘A_Brief_Introduction_to_openalexR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘A_Brief_Introduction_to_openalexR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# PHEindicatormethods

<details>

* Version: 1.4.1
* GitHub: https://github.com/PublicHealthEngland/PHEindicatormethods
* Source code: https://github.com/cran/PHEindicatormethods
* Date/Publication: 2022-08-08 11:40:17 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "PHEindicatormethods")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. └─testthat::expect_match(wideci_warning[1], "some age bands have more deaths than population; outputs have been suppressed to NAs") at testLifeExpectancy.R:313:2
       2.   └─testthat:::expect_match_(...)
      ── Failure ('testLifeExpectancy.R:315'): LE - warnings are generated when invalid arguments are used ──
      wideci_warning\[2\] does not match "some life expectancy values have a 95% confidence interval > 20 years; these values have been suppressed to NAs".
      Actual value: "some age bands have more deaths than population; outputs have been suppressed to NAs"
      Backtrace:
          ▆
       1. └─testthat::expect_match(wideci_warning[2], "some life expectancy values have a 95% confidence interval > 20 years; these values have been suppressed to NAs") at testLifeExpectancy.R:315:2
       2.   └─testthat:::expect_match_(...)
      
      [ FAIL 2 | WARN 4 | SKIP 0 | PASS 451 ]
      Error: Test failures
      Execution halted
    ```

# rATTAINS

<details>

* Version: 0.1.3
* GitHub: https://github.com/mps9506/rATTAINS
* Source code: https://github.com/cran/rATTAINS
* Date/Publication: 2021-11-03 14:10:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "rATTAINS")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `map2(.f, .x, invoke, ..., .env = .env)`: i In index: 8.
      Caused by error in `map.function()`:
      i In index: 1.
      Caused by error:
      ! Result must be length 1, not 0.
      ── Error ('test-state_summary.R:8'): state_summary returns expected types and classes ──
      Error in `map2(.f, .x, invoke, ..., .env = .env)`: i In index: 2.
      Caused by error in `map.function()`:
      i In index: 1.
      Caused by error:
      ! Result must be length 1, not 0.
      
      [ FAIL 2 | WARN 70 | SKIP 17 | PASS 33 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Introduction.Rmd’ using rmarkdown
    Quitting from lines 42-46 (Introduction.Rmd) 
    Error: processing vignette 'Introduction.Rmd' failed with diagnostics:
    ℹ In index: 2.
    Caused by error in `map.function()`:
    ℹ In index: 1.
    Caused by error:
    ! Result must be length 1, not 0.
    --- failed re-building ‘Introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ruta

<details>

* Version: 1.1.0
* GitHub: https://github.com/fdavidcl/ruta
* Source code: https://github.com/cran/ruta
* Date/Publication: 2019-03-18 13:10:02 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "ruta")` for more info

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

Run `revdepcheck::cloud_details(, "sbm")` for more info

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
* Number of recursive dependencies: 153

Run `revdepcheck::cloud_details(, "scImmuneGraph")` for more info

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
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "scrutiny")` for more info

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

Run `revdepcheck::cloud_details(, "simpr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      x[1]: id arguments\n"
      y[1]: "Error in rnorm(size): invalid arguments\n"
      
      x[2]: "Error in `map()`:\nℹ In index: 1.\nCaused by error in `rnorm()`:\n! inval
      x[2]: id arguments\n"
      y[2]: "Error in rnorm(size): invalid arguments\n"
      ── Failure ('test_errors.R:17'): errors produce new column ─────────────────────
      all(na.omit(err_out$.sim_error) == "Error in errgt(x1): x < 3 are not all TRUE\n") is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      
      [ FAIL 2 | WARN 1 | SKIP 0 | PASS 45 ]
      Error: Test failures
      Execution halted
    ```

# skimr

<details>

* Version: 2.1.4
* GitHub: https://github.com/ropensci/skimr
* Source code: https://github.com/cran/skimr
* Date/Publication: 2022-04-15 02:20:02 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "skimr")` for more info

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
      ! Can't convert `fn`, NULL, to a function.
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
      
      [ FAIL 7 | WARN 6 | SKIP 24 | PASS 622 ]
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

# tidypredict

<details>

* Version: 0.4.9
* GitHub: https://github.com/tidymodels/tidypredict
* Source code: https://github.com/cran/tidypredict
* Date/Publication: 2022-05-25 19:20:02 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "tidypredict")` for more info

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
      
      [ FAIL 1 | WARN 1 | SKIP 11 | PASS 105 ]
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

# utile.tools

<details>

* Version: 0.2.7
* GitHub: https://github.com/efinite/utile.tools
* Source code: https://github.com/cran/utile.tools
* Date/Publication: 2022-02-20 21:40:02 UTC
* Number of recursive dependencies: 23

Run `revdepcheck::cloud_details(, "utile.tools")` for more info

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

