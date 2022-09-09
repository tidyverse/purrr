# autothresholdr

<details>

* Version: 1.4.0
* GitHub: https://github.com/rorynolan/autothresholdr
* Source code: https://github.com/cran/autothresholdr
* Date/Publication: 2022-01-04 12:10:13 UTC
* Number of recursive dependencies: 101

Run `cloud_details(, "autothresholdr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘finding-thresholds.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    --- finished re-building ‘thresholding-image-stacks.Rmd’
    
    --- re-building ‘thresholding-images.Rmd’ using rmarkdown
    --- finished re-building ‘thresholding-images.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘finding-thresholds.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# campsis

<details>

* Version: 1.3.0
* GitHub: https://github.com/Calvagone/campsis
* Source code: https://github.com/cran/campsis
* Date/Publication: 2022-06-01 10:20:07 UTC
* Number of recursive dependencies: 146

Run `cloud_details(, "campsis")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       25. │ └─object@list %>% purrr::map_chr(~.x@time)
       26. └─purrr::map_chr(., ~.x@time)
      ── Error (testTreatment.R:24:3): Test a couple of methods ──────────────────────
      Error: Can't coerce element 1 from a double to a character
      Backtrace:
          ▆
       1. ├─treatment %>% assignDoseNumber() at testTreatment.R:24:2
       2. ├─campsis:::assignDoseNumber(.)
       3. ├─campsis:::assignDoseNumber(.)
       4. │ └─object@list %>% purrr::map_chr(~.x@time)
       5. └─purrr::map_chr(., ~.x@time)
      
      [ FAIL 54 | WARN 0 | SKIP 25 | PASS 266 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘campsis.Rmd’ using rmarkdown
    Loading required package: campsismod
    
    Attaching package: 'campsismod'
    
    The following object is masked from 'package:utils':
    
        find
    
    ...
    Quitting from lines 43-45 (campsis.Rmd) 
    Error: processing vignette 'campsis.Rmd' failed with diagnostics:
    Can't coerce element 1 from a double to a character
    --- failed re-building ‘campsis.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘campsis.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# casino

<details>

* Version: 0.1.0
* GitHub: https://github.com/anthonypileggi/casino
* Source code: https://github.com/cran/casino
* Date/Publication: 2019-01-17 17:40:03 UTC
* Number of recursive dependencies: 59

Run `cloud_details(, "casino")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘persistent_player_profiles.Rmd’ using rmarkdown
    Quitting from lines 24-34 (persistent_player_profiles.Rmd) 
    Error: processing vignette 'persistent_player_profiles.Rmd' failed with diagnostics:
    Can't coerce element 1 from a double to a character
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
       2.   └─testthat::quasi_label(enquo(object), label, arg = "object")
       3.     └─rlang::eval_bare(expr, quo_get_env(quo))
      ── Failure (test-parsing.R:15:3): Target features ──────────────────────────────
      `result` is not an S3 object
      ── Failure (test-parsing.R:18:5): Variables names taken from metadata ──────────
      colnames(result) (`actual`) not equal to c("name", "dob") (`expected`).
      
      `actual` is NULL
      `expected` is a character vector ('name', 'dob')
      ── Failure (test-util.R:45:3): vec_depth doesn't attempt to measure the depth of errors ──
      `purrr::vec_depth(err)` did not throw the expected error.
      
      [ FAIL 46 | WARN 14 | SKIP 0 | PASS 44 ]
      Error: Test failures
      Execution halted
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
        7. ├─dibble (local) Ops.ddf_col(x, y)
        8. │ └─dibble:::broadcast_dim_names_warn(old_dim_names_e2, new_dim_names)
        9. │   ├─dibble:::broadcast_dim_names_message(...)
       10. │   │ ├─base::withVisible(eval(mc, parent.frame()))
       11. │   │ └─base::eval(mc, parent.frame())
       12. │   │   └─base::eval(mc, parent.frame())
       13. │   └─dibble (local) `<fn>`(...)
       14. │     └─purrr::map2(...)
       15. └─vctrs:::stop_recycle_incompatible_size(...)
       16.   └─vctrs:::stop_vctrs(...)
       17.     └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 61 ]
      Error: Test failures
      Execution halted
    ```

# egor

<details>

* Version: 1.22.5
* GitHub: https://github.com/tilltnet/egor
* Source code: https://github.com/cran/egor
* Date/Publication: 2022-05-14 00:00:02 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "egor")` for more info

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
    > # convert to egor object
    >   twofiles_to_egor(
    +     egos = egos_8,
    +     alters = alters_8,
    +     max.alters = 8,
    +     aa.first.var = "X1.to.2")
    Sorting data by egoID and alterID.
    Transforming wide edge data to edgelist.
    Error: Can't coerce element 1 from a logical to a character
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─testthat::expect_error(...) at test-read.R:82:4
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::twofiles_to_egor(...)
        7.   └─egor:::harmonize_id_var_classes(...)
        8.     └─egor:::create_as_lcc(unlist(a, recursive = FALSE))
        9.       ├─base::unique(purrr::map_chr(x, function(x) is.double(x)))
       10.       └─purrr::map_chr(x, function(x) is.double(x))
      
      [ FAIL 7 | WARN 0 | SKIP 15 | PASS 199 ]
      Error: Test failures
      Execution halted
    ```

# emba

<details>

* Version: 0.1.8
* GitHub: https://github.com/bblodfon/emba
* Source code: https://github.com/cran/emba
* Date/Publication: 2021-01-07 04:00:02 UTC
* Number of recursive dependencies: 74

Run `cloud_details(, "emba")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 288 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error (test-input.R:148:3): it returns proper results ───────────────────────
      Error: Can't coerce element 1 from a integer to a character
      Backtrace:
          ▆
       1. └─emba::filter_network(net, nodes = c("A", "D"), level = 1) at test-input.R:148:2
       2.   └─emba:::get_neighbors(net, nodes)
       3.     ├─base::unique(names(flatten_chr(adj.node.list)))
       4.     └─purrr::flatten_chr(adj.node.list)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 288 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# escalation

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/escalation
* Date/Publication: 2020-10-18 21:40:06 UTC
* Number of recursive dependencies: 126

Run `cloud_details(, "escalation")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘escalation-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: simulate_trials
    > ### Title: Simulate clinical trials.
    > ### Aliases: simulate_trials
    > 
    > ### ** Examples
    > 
    > true_prob_tox <- c(0.12, 0.27, 0.44, 0.53, 0.57)
    ...
     [1] 3 1 3 1 2 2 2 5 1 3
    > sims %>% prob_administer()
        1     2     3     4     5 
    0.525 0.200 0.075 0.150 0.050 
    > sims %>% prob_recommend()
    NoDose      1      2      3      4      5 
       0.0    0.3    0.3    0.3    0.0    0.1 
    > sims %>% trial_duration()
    Error: Can't coerce element 1 from a double to a character
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘A100-DoseSelectors.Rmd’ using rmarkdown
    --- finished re-building ‘A100-DoseSelectors.Rmd’
    
    --- re-building ‘A205-CRM.Rmd’ using rmarkdown
    Loading required package: magrittr
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    ...
    Error: processing vignette 'A700-Simulation.Rmd' failed with diagnostics:
    Can't coerce element 1 from a double to a character
    --- failed re-building ‘A700-Simulation.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘A205-CRM.Rmd’ ‘A207-NBG.Rmd’ ‘A210-TPI.Rmd’ ‘A220-mTPI.Rmd’
      ‘A700-Simulation.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.6Mb
      sub-directories of 1Mb or more:
        doc  13.1Mb
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# eventr

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/eventr
* Date/Publication: 2020-05-26 14:40:02 UTC
* Number of recursive dependencies: 38

Run `cloud_details(, "eventr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘eventr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_body_attr
    > ### Title: Get Event Body Attribute
    > ### Aliases: get_body_attr
    > 
    > ### ** Examples
    > 
    > 
    ...
    > second_event <- event(
    +   id = 'second-event',
    +   type = 'SECOND_EVENT',
    +   time = Sys.time(),
    +   attr_01 = 'first-attribute-02'
    + )
    > 
    > the_event_list <- event_list(first_event, second_event)
    Error: Can't coerce element 1 from a double to a character
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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
      ~ replace(.x, is.null(.x), NA_character_)), dropped = purrr::map(.data$dropped,
      names), dropped = purrr::map(.data$dropped, ~ replace(.x, is.null(.x),
      NA_character_)), franchise_id = purrr::map_chr(.data$franchise_id, unlist),
      timestamp = .data$timestamp / 1000, timestamp = .as_datetime(.data$timestamp))
       18. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
       19. │   ├─base::withCallingHandlers(...)
       20. │   └─mask$eval_all_mutate(quo)
       21. ├─purrr::map_chr(.data$franchise_id, unlist)
       22. └─base::.handleSimpleError(...)
       23.   └─dplyr (local) h(simpleError(msg, call))
       24.     └─rlang::abort(...)
      
      [ FAIL 1 | WARN 1 | SKIP 1 | PASS 125 ]
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
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error (test-sample_from_posterior.R:45:3): sample_from_posterior returns correct dataframe shape for all types ──
      Error in `.p(.x[[i]], ...)`: Predicate functions must return a single `TRUE` or `FALSE`, not a logical vector of length 3.
      Backtrace:
          ▆
       1. ├─testthat::expect_true(purrr::every(output, ~colnames(.x) == expected_col_names)) at test-sample_from_posterior.R:45:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─purrr::every(output, ~colnames(.x) == expected_col_names)
       5.   └─purrr (local) .p(.x[[i]], ...)
       6.     └─rlang::abort(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 245 ]
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
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─gwasrapidd::trait_to_variant(c("EFO_0000000"), warnings = TRUE)
        7.   └─purrr::map_dfr(...)
        8.     └─purrr::map(.x, .f, ...)
        9.       └─gwasrapidd (local) .f(.x[[i]], ...)
       10.         └─gwasrapidd::get_variants(efo_id = .x, verbose = verbose, warnings = warnings)
       11.           └─gwasrapidd:::get_variants_by_efo_id(...)
       12.             └─gwasrapidd:::get_variants_by_efo_trait(...)
       13.               └─assertthat::assert_that(...)
      
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

# immunarch

<details>

* Version: 0.7.0
* GitHub: https://github.com/immunomind/immunarch
* Source code: https://github.com/cran/immunarch
* Date/Publication: 2022-08-09 22:00:02 UTC
* Number of recursive dependencies: 197

Run `cloud_details(, "immunarch")` for more info

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
     13. ├─dplyr:::mutate.data.frame(., length_value = map_chr(.y, ~ ifelse(all(.x == .x[1]), yes = .x[1], no = glue(
      "range_{min(.x)}:{max(.x)}"))))
     14. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
     15. │   ├─base::withCallingHandlers(...)
     16. │   └─mask$eval_all_mutate(quo)
     17. ├─purrr::map_chr(.y, ~ifelse(all(.x == .x[1]), yes = .x[1], no = glue("range_{min(.x)}:{max(.x)}")))
     18. └─base::.handleSimpleError(...)
     19.   └─dplyr (local) h(simpleError(msg, call))
     20.     └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.5Mb
      sub-directories of 1Mb or more:
        data   3.3Mb
        doc    1.6Mb
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
# linea

<details>

* Version: 0.0.3
* GitHub: NA
* Source code: https://github.com/cran/linea
* Date/Publication: 2022-08-19 08:20:02 UTC
* Number of recursive dependencies: 130

Run `cloud_details(, "linea")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      +     expect_equal(TRUE)
      + })
      gtrends function failed. Check internet connection or attempt installing the gtrends package separately
      ── Failure (???): gtrends_f - pooled - output dataframe ────────────────────────
      `.` (`actual`) not equal to TRUE (`expected`).
      
      `actual`:   FALSE
      `expected`: TRUE 
      Backtrace:
       1. ... %>% expect_equal(TRUE)
       2. testthat::expect_equal(., TRUE)
      
      Error in reporter$stop_if_needed() : Test failed
      Calls: test_that -> <Anonymous>
      Execution halted
    ```

## Newly fixed

*   checking examples ... ERROR
    ```
    Running examples in ‘linea-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gt_f
    > ### Title: apply_normalisation
    > ### Aliases: gt_f
    > 
    > ### ** Examples
    > 
    > data = read_xcsv("https://raw.githubusercontent.com/paladinic/data/main/ecomm_data.csv") %>% 
    ...
    dbl  (7): ecommerce, black.friday, christmas, covid, online_media, offline_m...
    date (1): date
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    gtrends function failed. Check internet connection or attempt installing the gtrends package separately
    Error in UseMethod("pull") : 
      no applicable method for 'pull' applied to an object of class "NULL"
    Calls: %>% -> gt_f -> %>% -> unique -> as.Date -> pull
    Execution halted
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
              fn <- new_function(pairlist2(... = ), body, env = env)
          }
          structure(fn, class = c("purrr_function_partial", "function"), 
              body = call)
      })(.Primitive("quote")(.fn), x = 6)`: `.f` must be a function, not a symbol
      Backtrace:
          ▆
       1. └─partialised::`arguments<-`(`*tmp*`, value = `<named list>`) at test-partialised.R:12:2
       2.   ├─rlang::exec(purrr::partial, partialised_fn(x), !!!value)
       3.   └─purrr (local) `<fn>`(`<fn>`(.fn), x = 6)
       4.     └─rlang::abort(sprintf("`.f` must be a function, not %s", friendly_type_of(.f)))
      
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
    +                  pops = rep(c(7060L, 35059L, 46974L, 48489L, 43219L, 38561L, 46009L, 57208L,
    +                               61435L, 55601L, 50209L, 56416L, 46411L, 39820L, 37978L,
    +                               37039L, 33288L, 23306L, 11936L, 11936L), 2),
    +                  deaths = rep(c(17L, 9L, 4L, 8L, 20L, 15L, 24L, 33L, 50L, 71L, 100L, 163L,
    +                                 263L, 304L, 536L, 872L, 1390L, 1605L, 1936L, 1937L), 2))
    > df %>%
    +        group_by(area) %>%
    +        phe_life_expectancy(deaths, pops, startage)
    Error: Can't coerce element 1 from a logical to a character
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 405 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error (testLifeExpectancy.R:189:1): (code run outside of `test_that()`) ─────
      Error: Can't coerce element 1 from a logical to a character
      Backtrace:
          ▆
       1. ├─df1 %>% mutate(area = "test") %>% group_by(area) %>% ... at testLifeExpectancy.R:189:0
       2. ├─PHEindicatormethods::phe_life_expectancy(., deaths, pops, startage)
       3. │ └─lapply(data, is.factor) %>% purrr::map_chr(c)
       4. └─purrr::map_chr(., c)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 405 ]
      Error: Test failures
      Execution halted
    ```

# PLNmodels

<details>

* Version: 0.11.7
* GitHub: https://github.com/pln-team/PLNmodels
* Source code: https://github.com/cran/PLNmodels
* Date/Publication: 2022-08-25 10:32:38 UTC
* Number of recursive dependencies: 177

Run `cloud_details(, "PLNmodels")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. │     └─base::all.equal.environment(target, current, ...)
        7. │       └─base::as.list.environment(target, all.names = all.names, sorted = TRUE)
        8. ├─PLNmodels (local) `<fn>`()
        9. │ ├─... %>% purrr::reduce(rbind)
       10. │ └─purrr::map(...)
       11. │   └─PLNmodels (local) .f(.x[[i]], ...)
       12. │     └─purrr::map_chr(model$optim_par, tail, 1)
       13. └─purrr::reduce(., rbind)
       14.   └─purrr:::reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
       15.     └─purrr:::reduce_init(.x, .init, left = left)
       16.       └─rlang::is_empty(x)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 665 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Import_data.Rmd’ using rmarkdown
    This is packages 'PLNmodels' version 0.11.7
    Use future::plan(multicore/multisession) to speed up PLNPCA/PLNmixture/stability_selection.
    1 samples were dropped from the abundance matrix for lack of associated covariates.
    --- finished re-building ‘Import_data.Rmd’
    
    --- re-building ‘PLN.Rmd’ using rmarkdown
    This is packages 'PLNmodels' version 0.11.7
    Use future::plan(multicore/multisession) to speed up PLNPCA/PLNmixture/stability_selection.
    ...
    --- re-building ‘Trichoptera.Rmd’ using rmarkdown
    This is packages 'PLNmodels' version 0.11.7
    Use future::plan(multicore/multisession) to speed up PLNPCA/PLNmixture/stability_selection.
    --- finished re-building ‘Trichoptera.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘PLNPCA.Rmd’ ‘PLNmixture.Rmd’ ‘PLNnetwork.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 24.1Mb
      sub-directories of 1Mb or more:
        doc    2.1Mb
        libs  20.9Mb
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
    > get_cohorts(cohort_symbol = c('23andMe', 'IPOBCS'))
    Error: object ‘at_depth’ is not exported by 'namespace:purrr'
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
# rb3

<details>

* Version: 0.0.6
* GitHub: https://github.com/wilsonfreitas/rb3
* Source code: https://github.com/cran/rb3
* Date/Publication: 2022-08-19 12:50:06 UTC
* Number of recursive dependencies: 109

Run `cloud_details(, "rb3")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─testthat::expect_equal(parse_text(trm, "1"), 1) at test-transmute.R:202:2
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─rb3:::parse_text(trm, "1")
        5. └─rb3:::parse_text(trm, "1")
        6.   ├─rb3:::apply_rules(x, data)
        7.   └─rb3:::apply_rules(x, data)
        8.     └─rb3:::iter_rules(x@rules)
        9.       ├─rb3:::take(rules, "priority")
       10.       └─rb3:::take.list(rules, "priority")
       11.         └─purrr::map_chr(...)
      
      [ FAIL 14 | WARN 0 | SKIP 10 | PASS 122 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Fetching-historical-future-rates.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Error: processing vignette 'Fetching-historical-yield-curve.Rmd' failed with diagnostics:
    Can't coerce element 1 from a double to a character
    --- failed re-building ‘Fetching-historical-yield-curve.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Fetching-historical-future-rates.Rmd’
      ‘Fetching-historical-yield-curve.Rmd’
    
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
     11.   └─ruta (local) .f(.x[[i]], ...)
     12.     └─ruta:::make_atomic_network(ruta_layer_dense, units = units, activation = activation)
     13.       ├─ruta::as_network(new_layer(cl, ...))
     14.       └─ruta:::as_network.ruta_layer(new_layer(cl, ...))
     15.         └─ruta::new_network(x)
     16.           ├─base::stopifnot(every(args, ~class(.) == ruta_layer))
     17.           └─purrr::every(args, ~class(.) == ruta_layer)
     18.             └─purrr (local) .p(.x[[i]], ...)
     19.               └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       12. │     └─rlang::is_empty(x)
       13. └─purrr::map(., dense)
       14.   └─ruta (local) .f(.x[[i]], ...)
       15.     └─ruta:::make_atomic_network(ruta_layer_dense, units = units, activation = activation)
       16.       ├─ruta::as_network(new_layer(cl, ...))
       17.       └─ruta:::as_network.ruta_layer(new_layer(cl, ...))
       18.         └─ruta::new_network(x)
       19.           ├─base::stopifnot(every(args, ~class(.) == ruta_layer))
       20.           └─purrr::every(args, ~class(.) == ruta_layer)
       21.             └─purrr (local) .p(.x[[i]], ...)
       22.               └─rlang::abort(...)
      
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
    Predicate functions must return a single `TRUE` or `FALSE`, not a logical vector of length 2.
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
      9. │   ├─base::withCallingHandlers(...)
     10. │   └─mask$eval_all_mutate(quo)
     11. ├─scrutiny (local) `<fn>`(sd)
     12. │ ├─purrr::modify(x, length)
     13. │ └─purrr:::modify.character(x, length)
     14. │   └─purrr::map_chr(.x, .f, ...)
     15. └─base::.handleSimpleError(...)
     16.   └─dplyr (local) h(simpleError(msg, call))
     17.     └─rlang::abort(msg, call = call("across"), parent = cnd)
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
# tidybins

<details>

* Version: 0.1.0
* GitHub: https://github.com/Harrison4192/tidybins
* Source code: https://github.com/cran/tidybins
* Date/Publication: 2021-10-14 12:20:02 UTC
* Number of recursive dependencies: 169

Run `cloud_details(, "tidybins")` for more info

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
    > iris %>%
    + bin_cols(Sepal.Width, n_bins = 5, pretty_labels = TRUE) %>%
    + bin_cols(Petal.Width, n_bins = 3, bin_type = c("width", "kmeans")) %>%
    + bin_cols(Sepal.Width, bin_type = "xgboost", target = Species, seed = 1) -> iris1
    Error: Can't coerce element 1 from a integer to a character
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘badger’ ‘ggplot2’ ‘lubridate’ ‘scales’ ‘xgboost’
      All declared Imports should be used.
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
     15. │ └─dplyr:::filter_rows(.data, ..., caller_env = caller_env())
     16. │   └─dplyr:::filter_eval(dots, mask = mask, error_call = error_call)
     17. │     ├─base::withCallingHandlers(...)
     18. │     └─mask$eval_all_filter(dots, env_filter)
     19. ├─property
     20. ├─rlang:::`$.rlang_data_pronoun`(.data, property)
     21. │ └─rlang:::data_pronoun_get(...)
     22. └─rlang:::abort_data_pronoun(x, call = y)
     23.   └─rlang::abort(msg, "rlang_error_data_pronoun_not_found", call = call)
    Execution halted
    ```

# TT

<details>

* Version: 0.98
* GitHub: NA
* Source code: https://github.com/cran/TT
* Date/Publication: 2022-04-05 20:42:29 UTC
* Number of recursive dependencies: 33

Run `cloud_details(, "TT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘TT-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: treetable
    > ### Title: Display tree structured data using 'datatable' widget
    > ### Aliases: treetable
    > 
    > ### ** Examples
    > 
    > data("org")
    > data("col_order")
    > colnames <- factor(c("org",org$attributesAll),
    +                    levels =  col_order)
    > treetable(org, color="#FFFFFF", colnames=colnames)
    Error: Can't coerce element 1 from a double to a character
    Execution halted
    ```

# varsExplore

<details>

* Version: 0.3.0
* GitHub: NA
* Source code: https://github.com/cran/varsExplore
* Date/Publication: 2020-07-13 04:30:03 UTC
* Number of recursive dependencies: 70

Run `cloud_details(, "varsExplore")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘varsExplore-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: vars_explore
    > ### Title: Searchable variable explorer with labelled variables
    > ### Aliases: vars_explore
    > 
    > ### ** Examples
    > 
    > 
    ...
      df, ~ sd(num_x(.x))), Min = purrr::map_chr(df, ~ min(num_x(.x))), Max = purrr::map_chr(
      df, ~ max(num_x(.x))))
      5. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
      6. │   ├─base::withCallingHandlers(...)
      7. │   └─mask$eval_all_mutate(quo)
      8. ├─purrr::map_chr(df, ~min(num_x(.x)))
      9. └─base::.handleSimpleError(...)
     10.   └─dplyr (local) h(simpleError(msg, call))
     11.     └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘basic_usage.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
    Problem while computing `Min = purrr::map_chr(df, ~min(num_x(.x)))`.
    Caused by error:
    ! Can't coerce element 1 from a double to a character
    --- failed re-building ‘basic_usage.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘basic_usage.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rio’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

