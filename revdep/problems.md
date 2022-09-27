# allhomes

<details>

* Version: 0.3.0
* GitHub: NA
* Source code: https://github.com/cran/allhomes
* Date/Publication: 2022-09-09 07:23:00 UTC
* Number of recursive dependencies: 71

Run `cloud_details(, "allhomes")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       18. ├─dplyr::filter(...)
       19. └─base::.handleSimpleError(...)
       20.   └─purrr (local) h(simpleError(msg, call))
       21.     └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
       22.       └─rlang::abort(...)
      ── Error (test-get_past_sales_data.R:8:5): Empty search returns zero-row `tibble` ──
      Error in `map(.x, .f, ...)`: i In index: 1.
      Caused by error in `map2()`:
      i In index: 1.
      Caused by error in `UseMethod()`:
      ! no applicable method for 'filter' applied to an object of class "list"
      
      [ FAIL 2 | WARN 4 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

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
      ── Error (test-tidy_parameters.R:26:3): tidy_parameters() works for basic models ──
      Error in `identical(res1$conf.low, res2$conf.low)`: object 'res1' not found
      Backtrace:
          ▆
       1. ├─testthat::expect_false(identical(res1$conf.low, res2$conf.low)) at test-tidy_parameters.R:26:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─base::identical(res1$conf.low, res2$conf.low)
      
      [ FAIL 12 | WARN 1 | SKIP 51 | PASS 438 ]
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

# bumbl

<details>

* Version: 1.0.2
* GitHub: https://github.com/Aariq/bumbl
* Source code: https://github.com/cran/bumbl
* Date/Publication: 2022-05-13 20:20:20 UTC
* Number of recursive dependencies: 101

Run `cloud_details(, "bumbl")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Creating plots for 6 colonies...
      [ FAIL 2 | WARN 43 | SKIP 1 | PASS 39 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-bumbl.R:56:3): no unexpected warnings ─────────────────────────
      `bumbl(...)` produced warnings.
      ── Failure (test-bumbl.R:57:3): no unexpected warnings ─────────────────────────
      `bumbl(...)` produced warnings.
      
      [ FAIL 2 | WARN 43 | SKIP 1 | PASS 39 ]
      Error: Test failures
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
     18.   └─purrr:::map_depth_rec(map, .x, .depth, .f, ..., .ragged = .ragged)
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

* Version: 0.1.1.1
* GitHub: https://github.com/rstudio/connectapi
* Source code: https://github.com/cran/connectapi
* Date/Publication: 2022-07-21 12:20:02 UTC
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
      Duration: 1.1 s
      
    ...
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      • Ahh! this fails presently. Are double -> POSIXct conversions allowed? (1)
      • On CRAN (1)
      • failing currently (2)
      • not implemented yet (1)
      • not tested yet (1)
      
      [ FAIL 1 | WARN 0 | SKIP 6 | PASS 116 ]
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

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `.` produced warnings.
      Backtrace:
          ▆
       1. ├─... %>% expect_silent() at test-selection.R:52:2
       2. └─testthat::expect_silent(.)
      ── Failure (test-selection.R:57:3): crosstable with external character vector ──
      `.` produced warnings.
      Backtrace:
          ▆
       1. ├─... %>% expect_silent() at test-selection.R:57:2
       2. └─testthat::expect_silent(.)
      
      [ FAIL 7 | WARN 705 | SKIP 40 | PASS 338 ]
      Error: Test failures
      Execution halted
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
      ── Failure (test-util.R:45:3): vec_depth doesn't attempt to measure the depth of errors ──
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
      ── Failure (test-cube.R:87:3): filter ──────────────────────────────────────────
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
       16. │         └─vctrs::vec_recycle_common(.x = .x, .y = .y, .call = ..error_call)
       17. └─vctrs::stop_incompatible_size(...)
       18.   └─vctrs:::stop_incompatible(...)
       19.     └─vctrs:::stop_vctrs(...)
       20.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 1 | WARN 11 | SKIP 0 | PASS 61 ]
      Error: Test failures
      Execution halted
    ```

# dm

<details>

* Version: 1.0.2
* GitHub: https://github.com/cynkra/dm
* Source code: https://github.com/cran/dm
* Date/Publication: 2022-09-20 07:46:26 UTC
* Number of recursive dependencies: 152

Run `cloud_details(, "dm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • only works on `sqlite` (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-dplyr.R:210:3): basic test: 'slice()'-methods work ────────────
      `expect_equivalent_tbl(...)` produced warnings.
      ── Failure (test-filter-dm.R:200:3): dm_filter() works without primary keys ────
      ``%>%`(...)` produced warnings.
      ── Failure (test-dm.R:49:3): dm() works for adding tables ──────────────────────
      `expect_equivalent_tbl(...)` produced warnings.
      ── Failure (test-validate.R:13:3): validator is silent ─────────────────────────
      `dm(a = tibble(x = 1)) %>% dm_add_pk(a, x) %>% dm_validate()` produced warnings.
      
      [ FAIL 4 | WARN 672 | SKIP 191 | PASS 1333 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘dm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dm_flatten_to_tbl
    > ### Title: Flatten a part of a 'dm' into a wide table
    > ### Aliases: dm_flatten_to_tbl
    > 
    > ### ** Examples
    > 
    > 
    ...
      8. │   └─dm:::check_dm(dm)
      9. │     └─dm::is_dm(dm)
     10. ├─dm::dm_financial()
     11. │ ├─base::withVisible(eval(mc, parent.frame()))
     12. │ └─base::eval(mc, parent.frame())
     13. │   └─base::eval(mc, parent.frame())
     14. └─dm (local) `<fn>`()
     15.   └─dm:::financial_db_con()
     16.     └─rlang::abort(...)
    Execution halted
    ```

# embed

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/embed
* Source code: https://github.com/cran/embed
* Date/Publication: 2022-07-02 16:50:02 UTC
* Number of recursive dependencies: 180

Run `cloud_details(, "embed")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `embed:::woe_table(...)` produced warnings.
      ── Failure (test_woe.R:76:3): woe_table ruturns no messages nor warnings ───────
      `embed:::woe_table(df$x1, df$y)` produced warnings.
      ── Failure (test_woe.R:109:3): dictionary returns no messages nor warnings nor errors ──
      `dictionary(df, "y", x1)` produced warnings.
      ── Failure (test_woe.R:110:3): dictionary returns no messages nor warnings nor errors ──
      `dictionary(...)` produced warnings.
      ── Failure (test_woe.R:128:3): add_woe ruturns no messages nor warnings nor errors ──
      `add_woe(df, "y", x1)` produced warnings.
      ── Failure (test_woe.R:129:3): add_woe ruturns no messages nor warnings nor errors ──
      `add_woe(df %>% mutate(x3 = rep(c(TRUE, FALSE), 10)), "y", x3)` produced warnings.
      
      [ FAIL 8 | WARN 87 | SKIP 56 | PASS 155 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘textrecipes’
    ```

# ergm

<details>

* Version: 4.2.2
* GitHub: https://github.com/statnet/ergm
* Source code: https://github.com/cran/ergm
* Date/Publication: 2022-06-01 12:00:04 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "ergm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘requireNamespaceTest.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11. │   └─ergm:::ergm_proposal.ergm_conlist(...)
       12. │     └─ergm:::select_ergm_proposal(...)
       13. │       └─ergm (local) score_proposals(candidates, conlist)
       14. │         └─... %>% as_tibble
       15. ├─tibble::as_tibble(.)
       16. ├─purrr::map(., simplify_simple, toNA = "keep")
       17. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
       18. │   └─purrr:::vctrs_vec_compat(.x)
       19. └─purrr::transpose(.)
      ── Failure (test-predict.ergm.R:31:3): predict.formula(conditional=FALSE) ──────
      `... <- NULL` produced warnings.
      
      [ FAIL 6 | WARN 1614 | SKIP 1 | PASS 3412 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.5Mb
      sub-directories of 1Mb or more:
        R      1.1Mb
        doc    1.7Mb
        libs   4.1Mb
    ```

# ergm.ego

<details>

* Version: 1.0.1
* GitHub: https://github.com/statnet/ergm.ego
* Source code: https://github.com/cran/ergm.ego
* Date/Publication: 2022-05-26 14:30:02 UTC
* Number of recursive dependencies: 79

Run `cloud_details(, "ergm.ego")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • Not yet fixed (3)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-gof.ergm.ego.R:15:3): GOF='model' works ───────────────────────
      `z <- gof(fmhfit, GOF = "model")` produced warnings.
      ── Failure (test-gof.ergm.ego.R:30:3): GOF='degree' works ──────────────────────
      `z <- gof(fmhfit, GOF = "degree")` produced warnings.
      ── Failure (test-gof.ergm.ego.R:46:3): GOF='espartners' works ──────────────────
      `z <- gof(fmhfit, GOF = "espartners")` produced warnings.
      ── Failure (test-gof.ergm.ego.R:70:3): GOF='espartners' works if `esp` term is in the model ──
      `gofobj <- gof(fit, GOF = "espartners")` produced warnings.
      
      [ FAIL 4 | WARN 1855 | SKIP 3 | PASS 80 ]
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
    
    SUMMARY: processing the following file failed:
      ‘fleaflicker_getendpoint.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘nflreadr’
      All declared Imports should be used.
    ```

# finetune

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/finetune
* Source code: https://github.com/cran/finetune
* Date/Publication: 2022-09-05 23:20:03 UTC
* Number of recursive dependencies: 162

Run `cloud_details(, "finetune")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
          prune
      
      [ FAIL 1 | WARN 80 | SKIP 18 | PASS 137 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (18)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-anova-filter.R:65:3): anova filtering and logging ─────────────
      `{ ... }` produced warnings.
      
      [ FAIL 1 | WARN 80 | SKIP 18 | PASS 137 ]
      Error: Test failures
      Execution halted
    ```

# flexsurv

<details>

* Version: 2.2
* GitHub: https://github.com/chjackson/flexsurv-dev
* Source code: https://github.com/cran/flexsurv
* Date/Publication: 2022-06-17 23:10:08 UTC
* Number of recursive dependencies: 135

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
     5. │     └─vctrs::vec_recycle_common(.x = .x, .y = .y, .call = ..error_call)
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

# GDPuc

<details>

* Version: 0.9.2
* GitHub: https://github.com/pik-piam/GDPuc
* Source code: https://github.com/cran/GDPuc
* Date/Publication: 2022-09-19 16:16:09 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "GDPuc")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(GDPuc)
      > 
      > test_check("GDPuc")
      [ FAIL 1 | WARN 57 | SKIP 0 | PASS 313 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-warn.R:13:3): convertGDP with option GDPuc.warn ───────────────
      `withr::with_options(...)` produced warnings.
      
      [ FAIL 1 | WARN 57 | SKIP 0 | PASS 313 ]
      Error: Test failures
      Execution halted
    ```

# gghighlight

<details>

* Version: 0.3.3
* GitHub: https://github.com/yutannihilation/gghighlight
* Source code: https://github.com/cran/gghighlight
* Date/Publication: 2022-06-06 20:10:11 UTC
* Number of recursive dependencies: 82

Run `cloud_details(, "gghighlight")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘gghighlight.Rmd’ using rmarkdown
    Quitting from lines 245-251 (gghighlight.Rmd) 
    Error: processing vignette 'gghighlight.Rmd' failed with diagnostics:
    geom_label_repel requires the following missing aesthetics: label
    --- failed re-building ‘gghighlight.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘gghighlight.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# gratia

<details>

* Version: 0.7.3
* GitHub: https://github.com/gavinsimpson/gratia
* Source code: https://github.com/cran/gratia
* Date/Publication: 2022-05-09 11:20:03 UTC
* Number of recursive dependencies: 83

Run `cloud_details(, "gratia")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      • hgam-paper/hgam-paper-bird-move-model-1.svg
      • hgam-paper/hgam-paper-bird-move-model-2.svg
      • hgam-paper/hgam-paper-bird-move-model-3.svg
      • hgam-paper/hgam-paper-bird-move-model-5.svg
      • hgam-paper/hgam-paper-co2-model-1.svg
      • hgam-paper/hgam-paper-co2-model-2.svg
      • hgam-paper/hgam-paper-co2-model-3.svg
      • hgam-paper/hgam-paper-co2-model-4.svg
      • hgam-paper/hgam-paper-co2-model-5.svg
      • hgam-paper/hgam-paper-zoop-model-4.svg
      • hgam-paper/hgam-paper-zoop-model-5.svg
      • rootograms/draw-gaussian-rootogram.svg
      • rootograms/draw-neg-bin-rootogram.svg
      Error: Test failures
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
      ── Error (test-sample_from_posterior.R:45:3): sample_from_posterior returns correct dataframe shape for all types ──
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
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 245 ]
      Error: Test failures
      Execution halted
    ```

# gtreg

<details>

* Version: 0.1.1
* GitHub: https://github.com/shannonpileggi/gtreg
* Source code: https://github.com/cran/gtreg
* Date/Publication: 2022-08-17 14:30:05 UTC
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
        6. │     └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
        7. │       ├─purrr:::with_indexed_errors(...)
        8. │       │ └─base::withCallingHandlers(...)
        9. │       └─gtreg (local) .f(.x[[i]], .y[[i]], ...)
       10. │         └─gtsummary::tbl_stack(list(.x, .y), quiet = TRUE)
       11. │           └─base::stop(...)
       12. ├─gtsummary::tbl_stack(., quiet = TRUE)
       13. └─base::.handleSimpleError(...)
       14.   └─purrr (local) h(simpleError(msg, call))
       15.     └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
       16.       └─rlang::abort(...)
      
      [ FAIL 2 | WARN 323 | SKIP 4 | PASS 49 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘counting-methods.Rmd’ using rmarkdown
    Quitting from lines 92-101 (counting-methods.Rmd) 
    Error: processing vignette 'counting-methods.Rmd' failed with diagnostics:
    ℹ In index: 1.
    Caused by error:
    ! All objects in 'tbls' must be class 'gtsummary'
    --- failed re-building ‘counting-methods.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘counting-methods.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# gtsummary

<details>

* Version: 1.6.1
* GitHub: https://github.com/ddsjoberg/gtsummary
* Source code: https://github.com/cran/gtsummary
* Date/Publication: 2022-06-22 07:40:11 UTC
* Number of recursive dependencies: 183

Run `cloud_details(, "gtsummary")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gtsummary-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_p.tbl_svysummary
    > ### Title: Adds p-values to svysummary tables
    > ### Aliases: add_p.tbl_svysummary
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    ! `version` must be `NULL` or a vector of versions the same length as
      `pkg`.
    Backtrace:
        ▆
     1. └─broom.helpers::.assert_package(...)
     2.   └─rlang::is_installed(pkg = pkg, version = version, compare = compare)
     3.     └─rlang:::pkg_version_info(pkg, version = version, compare = compare)
     4.       └─rlang:::check_pkg_version(pkg, version, compare, call = call)
     5.         └─rlang::abort(...)
    Execution halted
    ```

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
      
      [ FAIL 3 | WARN 125 | SKIP 74 | PASS 11 ]
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

# ICD10gm

<details>

* Version: 1.2.4
* GitHub: https://github.com/edonnachie/ICD10gm
* Source code: https://github.com/cran/ICD10gm
* Date/Publication: 2021-12-05 14:10:14 UTC
* Number of recursive dependencies: 63

Run `cloud_details(, "ICD10gm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ICD10gm)
      > 
      > test_check("ICD10gm")
      [ FAIL 1 | WARN 20 | SKIP 0 | PASS 49 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-icd_expand.R:48:3): Expands down the hierarchy ────────────────
      `ICD10gm::icd_expand(...)` produced warnings.
      
      [ FAIL 1 | WARN 20 | SKIP 0 | PASS 49 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 329984 marked UTF-8 strings
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
      ── Failure (test-generics.R:1644:3): warnings are produced correctly ───────────
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

# ir

<details>

* Version: 0.2.1
* GitHub: NA
* Source code: https://github.com/cran/ir
* Date/Publication: 2022-05-02 11:50:08 UTC
* Number of recursive dependencies: 138

Run `cloud_details(, "ir")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ir-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ir_clip
    > ### Title: Clips infrared spectra to new wavenumber ranges
    > ### Aliases: ir_clip
    > 
    > ### ** Examples
    > 
    > ## clipping with one range
    ...
      7. │     └─ir (local) .f(.x[[i]], ...)
      8. │       └─ir::ir_get_wavenumberindex(...)
      9. │         └─purrr::map2_lgl(...)
     10. │           └─purrr:::map2_("logical", .x, .y, .f, ..., .progress = .progress)
     11. │             └─vctrs::vec_recycle_common(.x = .x, .y = .y, .call = ..error_call)
     12. └─vctrs::stop_incompatible_size(...)
     13.   └─vctrs:::stop_incompatible(...)
     14.     └─vctrs:::stop_vctrs(...)
     15.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
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

# jstor

<details>

* Version: 0.3.10
* GitHub: https://github.com/ropensci/jstor
* Source code: https://github.com/cran/jstor
* Date/Publication: 2021-12-08 08:50:07 UTC
* Number of recursive dependencies: 82

Run `cloud_details(, "jstor")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • On CRAN (2)
      • This test is stupid, should be improved. It depends on the console width (1)
      • empty test (2)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-import-spec.R:9:3): jst_define_import validates input ─────────
      `jst_define_import(...)` produced warnings.
      ── Failure (test-import-spec.R:13:3): jst_define_import validates input ────────
      `jst_define_import(article = c(jst_get_article, jst_get_authors))` produced warnings.
      ── Failure (test-import-spec.R:30:3): jst_define_import validates input ────────
      `jst_define_import(book = chapters_w_authors)` produced warnings.
      
      [ FAIL 3 | WARN 64 | SKIP 6 | PASS 246 ]
      Error: Test failures
      Execution halted
    ```

# kerastuneR

<details>

* Version: 0.1.0.5
* GitHub: https://github.com/EagerAI/kerastuneR
* Source code: https://github.com/cran/kerastuneR
* Date/Publication: 2022-03-25 08:50:02 UTC
* Number of recursive dependencies: 112

Run `cloud_details(, "kerastuneR")` for more info

</details>

## Newly broken

*   checking whether package ‘kerastuneR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/kerastuneR/new/kerastuneR.Rcheck/00install.out’ for details.
    ```

## Newly fixed

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘keras’
      All declared Imports should be used.
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
# mskcc.oncotree

<details>

* Version: 0.1.0
* GitHub: https://github.com/maialab/mskcc.oncotree
* Source code: https://github.com/cran/mskcc.oncotree
* Date/Publication: 2022-04-21 13:10:02 UTC
* Number of recursive dependencies: 42

Run `cloud_details(, "mskcc.oncotree")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mskcc.oncotree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_tumor_types
    > ### Title: Get tumor types
    > ### Aliases: get_tumor_types
    > 
    > ### ** Examples
    > 
    > get_tumor_types()
    Error: object ‘at_depth’ is not exported by 'namespace:purrr'
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘memoise’
      All declared Imports should be used.
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

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. └─testthat::expect_match(wideci_warning[1], "some age bands have more deaths than population; outputs have been suppressed to NAs") at testLifeExpectancy.R:313:2
       2.   └─testthat:::expect_match_(...)
      ── Failure (testLifeExpectancy.R:315:3): LE - warnings are generated when invalid arguments are used ──
      wideci_warning\[2\] does not match "some life expectancy values have a 95% confidence interval > 20 years; these values have been suppressed to NAs".
      Actual value: "some age bands have more deaths than population; outputs have been suppressed to NAs"
      Backtrace:
          ▆
       1. └─testthat::expect_match(wideci_warning[2], "some life expectancy values have a 95% confidence interval > 20 years; these values have been suppressed to NAs") at testLifeExpectancy.R:315:2
       2.   └─testthat:::expect_match_(...)
      
      [ FAIL 2 | WARN 1 | SKIP 0 | PASS 451 ]
      Error: Test failures
      Execution halted
    ```

# pkgdown

<details>

* Version: 2.0.6
* GitHub: https://github.com/r-lib/pkgdown
* Source code: https://github.com/cran/pkgdown
* Date/Publication: 2022-07-16 14:50:02 UTC
* Number of recursive dependencies: 71

Run `cloud_details(, "pkgdown")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       14. │       └─purrr:::vctrs_vec_compat(.x)
       15. └─purrr::imap(., data_reference_index_rows, pkg = pkg)
       16.   └─purrr::map2(.x, vec_index(.x), .f, ...)
       17.     └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
       18.       ├─purrr:::with_indexed_errors(...)
       19.       │ └─base::withCallingHandlers(...)
       20.       └─pkgdown (local) .f(.x[[i]], .y[[i]], ...)
       21.         └─purrr::transpose(topics)
      
      [ FAIL 1 | WARN 23 | SKIP 87 | PASS 543 ]
      Deleting unused snapshots:
      • build-search-docs/search-no-url.json
      • build-search-docs/search.json
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘usethis’
    ```

# psfmi

<details>

* Version: 1.0.0
* GitHub: https://github.com/mwheymans/psfmi
* Source code: https://github.com/cran/psfmi
* Date/Publication: 2021-09-23 10:10:05 UTC
* Number of recursive dependencies: 156

Run `cloud_details(, "psfmi")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘psfmi-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: psfmi_validate
    > ### Title: Internal validation and performance of logistic prediction
    > ###   models across Multiply Imputed datasets
    > ### Aliases: psfmi_validate
    > 
    > ### ** Examples
    > 
    ...
        ▆
     1. └─psfmi::psfmi_validate(...)
     2.   └─psfmi::cv_MI(...)
     3.     ├─purrr::map(...)
     4.     │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
     5.     │   └─purrr:::vctrs_vec_compat(.x)
     6.     └─rsample::vfold_cv(data_orig, v = folds, strata = unlist(data_orig[pobj$Outcome]))
     7.       └─rsample:::strata_check(strata, data)
     8.         └─rlang::abort("`strata` should be a single name or character value.")
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘MI_boot.Rmd’ using rmarkdown
    --- finished re-building ‘MI_boot.Rmd’
    
    --- re-building ‘MI_cv_naive.Rmd’ using rmarkdown
    --- finished re-building ‘MI_cv_naive.Rmd’
    
    --- re-building ‘Pool_Model_Performance.Rmd’ using rmarkdown
    --- finished re-building ‘Pool_Model_Performance.Rmd’
    
    ...
    --- finished re-building ‘psfmi_StabilityAnalysis.Rmd’
    
    --- re-building ‘psfmi_mice.Rmd’ using rmarkdown
    --- finished re-building ‘psfmi_mice.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘cv_MI.Rmd’ ‘cv_MI_RR.Rmd’ ‘development_workflow.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘miceadds’
      All declared Imports should be used.
    ```

# quincunx

<details>

* Version: 0.1.5
* GitHub: https://github.com/maialab/quincunx
* Source code: https://github.com/cran/quincunx
* Date/Publication: 2022-08-14 16:50:09 UTC
* Number of recursive dependencies: 90

Run `cloud_details(, "quincunx")` for more info

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
     18. │     └─purrr:::vctrs_vec_compat(x)
     19. ├─base::loadNamespace(x)
     20. │ └─base::namespaceImportFrom(...)
     21. │   └─base::importIntoEnv(impenv, impnames, ns, impvars)
     22. │     └─base::stop(...)
     23. └─base::.handleSimpleError(...)
     24.   └─purrr (local) h(simpleError(msg, call))
     25.     └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
     26.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: object 'at_depth' is not exported by 'namespace:purrr'
      Backtrace:
          ▆
       1. ├─testthat::expect_true(is_paginated(txt)) at test-is_paginated.R:13:2
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

# rATTAINS

<details>

* Version: 0.1.3
* GitHub: https://github.com/mps9506/rATTAINS
* Source code: https://github.com/cran/rATTAINS
* Date/Publication: 2021-11-03 14:10:02 UTC
* Number of recursive dependencies: 80

Run `cloud_details(, "rATTAINS")` for more info

</details>

## Newly broken

*   checking whether package ‘rATTAINS’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/rATTAINS/new/rATTAINS.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘rATTAINS’ ...
** package ‘rATTAINS’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘rATTAINS’
* removing ‘/tmp/workdir/rATTAINS/new/rATTAINS.Rcheck/rATTAINS’


```
### CRAN

```
* installing *source* package ‘rATTAINS’ ...
** package ‘rATTAINS’ successfully unpacked and MD5 sums checked
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
* DONE (rATTAINS)


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
      ── Failure (test-utilities.R:223:3): replace_by_pattern() works for nouns and prepositions ──
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
      ── Failure (test_swirl_3d.R:1988:3): fuzz testing swirl_3d() ───────────────────
      xpectr::strip(side_effects_10389[["error_class"]]) not equal to xpectr::strip(c("simpleError", "error", "condition")).
      1/3 mismatches
      x[1]: "rlangerror"
      y[1]: "simpleError"
      
      [ FAIL 156 | WARN 0 | SKIP 0 | PASS 7187 ]
      Error: Test failures
      Execution halted
    ```

# recipes

<details>

* Version: 1.0.1
* GitHub: https://github.com/tidymodels/recipes
* Source code: https://github.com/cran/recipes
* Date/Publication: 2022-07-07 22:30:06 UTC
* Number of recursive dependencies: 128

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
     13. │       └─vctrs::vec_recycle_common(.x = .x, .y = .y, .call = ..error_call)
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
        3. │ ├─recipes::prep(x$steps[[i]], training = training, info = x$term_info)
        4. │ └─recipes:::prep.step_dummy_extract(...)
        5. │   └─purrr::map2(lvls, as.double(wts), ~rep(.y, length(.x)))
        6. │     └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
        7. │       └─vctrs::vec_recycle_common(.x = .x, .y = .y, .call = ..error_call)
        8. └─vctrs::stop_incompatible_size(...)
        9.   └─vctrs:::stop_incompatible(...)
       10.     └─vctrs:::stop_vctrs(...)
       11.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      ── Failure (test_relu.R:63:3): works with all_predictors() selector ────────────
      `prepped_rec <- prep(rec, iris)` produced warnings.
      
      [ FAIL 6 | WARN 245 | SKIP 374 | PASS 1737 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘fastICA’, ‘dimRed’
    ```

# roxygen2

<details>

* Version: 7.2.1
* GitHub: https://github.com/r-lib/roxygen2
* Source code: https://github.com/cran/roxygen2
* Date/Publication: 2022-07-18 16:40:02 UTC
* Number of recursive dependencies: 64

Run `cloud_details(, "roxygen2")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • On CRAN (84)
      • file.exists(test_path("../../DESCRIPTION")) is not TRUE (1)
      • rmarkdown::pandoc_available("2.17") is not TRUE (10)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-block.R:123:3): whitespace is not detected as details ─────────
      `out <- roc_proc_text(rd_roclet(), "\n        #' Title\n        #'\n        #'\n        #' Description\n        #'\n        #'\n        #'\n        foo <- function(x) {}")[[1]]` produced warnings.
      ── Failure (test-rd-r6.R:207:3): R6 edge cases, class without (documented) fields ──
      `topic_add_r6_methods(rd, block, environment())` produced warnings.
      ── Failure (test-rd-r6.R:250:3): R6 edge cases, class without active bindings ──
      `topic_add_r6_methods(rd, block, environment())` produced warnings.
      
      [ FAIL 3 | WARN 181 | SKIP 95 | PASS 759 ]
      Error: Test failures
      Execution halted
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
      ── Error (test-layers.R:21:3): networks can be built from integers ─────────────
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
      ── Failure (test-MultipartiteSBM.R:35:5): initializing Multipartite SBM works ──
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
      5. │     └─vctrs::vec_recycle_common(!!!.l, .arg = ".l", .call = ..error_call)
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
     18. │       │     └─base (local) doTryCatch(return(expr), name, parentenv, handler)
     19. │       └─vctrs::list_unchop(x, ptype = ptype)
     20. └─vctrs (local) `<fn>`()
     21.   └─vctrs::vec_default_cast(...)
     22.     └─vctrs::stop_incompatible_cast(...)
     23.       └─vctrs::stop_incompatible_type(...)
     24.         └─vctrs:::stop_incompatible(...)
     25.           └─vctrs:::stop_vctrs(...)
     26.             └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
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

# simMetric

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/simMetric
* Date/Publication: 2022-01-04 15:30:02 UTC
* Number of recursive dependencies: 36

Run `cloud_details(, "simMetric")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(simMetric)
      > 
      > test_check("simMetric")
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 20 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-join_metrics.R:11:3): joining metrics works ───────────────────
      `{ ... }` produced warnings.
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 20 ]
      Error: Test failures
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
      ── Failure (test_errors.R:17:1): errors produce new column ─────────────────────
      all(na.omit(err_out$.sim_error) == "Error in errgt(x1): x < 3 are not all TRUE\n") is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      ── Failure (test_generate.R:17:3): .quiet, .warn_on_error, .stop_on_error options work as expected ──
      `generate(buggy_spec, 1, .warn_on_error = FALSE, .quiet = FALSE)` produced unexpected messages.
      Expected match: invalid arguments
      Actual values:
      * Error: In index: 1.
      
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 44 ]
      Error: Test failures
      Execution halted
    ```

# sketch

<details>

* Version: 1.1.17
* GitHub: https://github.com/kcf-jackson/sketch
* Source code: https://github.com/cran/sketch
* Date/Publication: 2021-10-06 15:10:02 UTC
* Number of recursive dependencies: 68

Run `cloud_details(, "sketch")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. │   └─purrr::map_chr(res, deparse_js, deparsers = deparsers)
        7. │     └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
        8. │       ├─purrr:::with_indexed_errors(...)
        9. │       │ └─base::withCallingHandlers(...)
       10. │       └─sketch (local) .f(.x[[i]], ...)
       11. │         └─deparser$deparse(ast, deparsers)
       12. │           └─base::get(deparse1(ast[[2]]), envir = find_compile_exprs_env())
       13. └─base::.handleSimpleError(...)
       14.   └─purrr (local) h(simpleError(msg, call))
       15.     └─cli::cli_abort(c(i = "In index: {i}."), parent = cnd, call = error_call)
       16.       └─rlang::abort(...)
      
      [ FAIL 2 | WARN 0 | SKIP 1 | PASS 439 ]
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
      ── Error (test-skim_with.R:175:3): Defining an integer sfl changes behavior ────
      Error in `dplyr::summarize(grouped, skimmed = purrr::map2(.data$skimmers, 
          .data$skim_variable, skim_by_type, data))`: Problem while computing `skimmed = purrr::map2(...)`.
      Caused by error in `purrr::map2()`:
      ℹ In index: 1.
      Caused by error in `dplyr::summarize()`:
      ! Problem while computing `..1 = dplyr::across(variable_names,
        mangled_skimmers$funs)`.
      Caused by error in `as_across_fn_call()`:
      ! Can't convert `fn`, NULL, to a function.
      
      [ FAIL 7 | WARN 0 | SKIP 24 | PASS 623 ]
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

# stoRy

<details>

* Version: 0.2.0
* GitHub: https://github.com/theme-ontology/stoRy
* Source code: https://github.com/cran/stoRy
* Date/Publication: 2021-11-08 05:10:02 UTC
* Number of recursive dependencies: 76

Run `cloud_details(, "stoRy")` for more info

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
# tergm

<details>

* Version: 4.1.0
* GitHub: https://github.com/statnet/tergm
* Source code: https://github.com/cran/tergm
* Date/Publication: 2022-06-22 15:30:02 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "tergm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘degree.mean.age.R’
      Running ‘dynamic_EGMME.R’
      Running ‘dynamic_MLE_blockdiag.R’
      Running ‘dynamic_MLE_blockdiag.bipartite.R’
      Running ‘sim_gf_sum.R’
      Running ‘simulate_networkDynamic.R’
      Running ‘tergm_offset_tests.R’
      Running ‘tergm_parallel.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    ...
       11. │           └─... %>% as_tibble
       12. ├─tibble::as_tibble(.)
       13. ├─purrr::map(., simplify_simple, toNA = "keep")
       14. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
       15. │   └─purrr:::vctrs_vec_compat(.x)
       16. └─purrr::transpose(.)
      
      [ FAIL 3 | WARN 1258 | SKIP 0 | PASS 3617 ]
      Error: Test failures
      Execution halted
    ```

# tidycmprsk

<details>

* Version: 0.1.2
* GitHub: https://github.com/MSKCC-Epi-Bio/tidycmprsk
* Source code: https://github.com/cran/tidycmprsk
* Date/Publication: 2022-03-04 16:50:02 UTC
* Number of recursive dependencies: 98

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
      ── Error (test-tbl_cuminc.R:10:3): tbl_cuminc() works ──────────────────────────
      Error in `inline_text(tbl0, time = 12)`: object 'tbl0' not found
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(inline_text(tbl0, time = 12), "6.0% (3.3%, 9.9%)") at test-tbl_cuminc.R:10:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─gtsummary::inline_text(tbl0, time = 12)
      
      [ FAIL 8 | WARN 585 | SKIP 0 | PASS 43 ]
      Error: Test failures
      Execution halted
    ```

# tidyjson

<details>

* Version: 0.3.1
* GitHub: https://github.com/colearendt/tidyjson
* Source code: https://github.com/cran/tidyjson
* Date/Publication: 2020-05-31 21:30:03 UTC
* Number of recursive dependencies: 96

Run `cloud_details(, "tidyjson")` for more info

</details>

## Newly broken

*   checking whether package ‘tidyjson’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/tidyjson/new/tidyjson.Rcheck/00install.out’ for details.
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
      
      [ FAIL 1 | WARN 54 | SKIP 11 | PASS 105 ]
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

# tidyr

<details>

* Version: 1.2.1
* GitHub: https://github.com/tidyverse/tidyr
* Source code: https://github.com/cran/tidyr
* Date/Publication: 2022-09-08 07:30:02 UTC
* Number of recursive dependencies: 73

Run `cloud_details(, "tidyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─testthat::expect_warning(...) at test-rectangle.R:349:2
        2. │ └─testthat:::expect_condition_matching(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─tidyr::unnest_wider(df, y, names_sep = "_")
        8.   └─tidyr::unchop(data, all_of(cols))
        9.     └─tidyr:::df_unchop(cols, ptype = ptype, keep_empty = keep_empty)
       10.       └─tidyr:::list_init_empty(x = col, null = TRUE, typed = keep_empty)
       11.         └─vctrs::vec_equal_na(x)
      
      [ FAIL 3 | WARN 600 | SKIP 95 | PASS 962 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
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
      ── Error (test-dictionary-tidiers.R:17:5): can tidy a quanteda dictionary ──────
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

# Tplyr

<details>

* Version: 0.4.4
* GitHub: https://github.com/atorus-research/Tplyr
* Source code: https://github.com/cran/Tplyr
* Date/Publication: 2022-01-27 16:00:02 UTC
* Number of recursive dependencies: 117

Run `cloud_details(, "Tplyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `build(t5)` produced warnings.
      ── Failure (test-shift.R:34:3): group_shift layers can be built without warnings/errors ──
      `build(t1)` produced warnings.
      ── Failure (test-shift.R:35:3): group_shift layers can be built without warnings/errors ──
      `build(t2)` produced warnings.
      ── Failure (test-shift.R:36:3): group_shift layers can be built without warnings/errors ──
      `build(t3)` produced warnings.
      ── Failure (test-shift.R:37:3): group_shift layers can be built without warnings/errors ──
      `build(t4)` produced warnings.
      ── Failure (test-shift.R:38:3): group_shift layers can be built without warnings/errors ──
      `build(t5)` produced warnings.
      
      [ FAIL 37 | WARN 1116 | SKIP 52 | PASS 518 ]
      Error: Test failures
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

# workflowsets

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/workflowsets
* Source code: https://github.com/cran/workflowsets
* Date/Publication: 2022-07-12 23:20:01 UTC
* Number of recursive dependencies: 123

Run `cloud_details(, "workflowsets")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        `vec_equal_na()` was deprecated in vctrs 0.5.0.
        Please use `vec_detect_missing()` instead.
      [ FAIL 1 | WARN 483 | SKIP 10 | PASS 376 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (9)
      • rlang::is_installed("rlang") is TRUE (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-workflow_set.R:142:4): workflow_set can handle correctly passed case weights ──
      `{ ... }` produced messages.
      
      [ FAIL 1 | WARN 483 | SKIP 10 | PASS 376 ]
      Error: Test failures
      Execution halted
    ```

