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

# epitopR

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/epitopR
* Date/Publication: 2022-08-19 13:00:06 UTC
* Number of recursive dependencies: 164

Run `cloud_details(, "epitopR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       10. ├─dplyr:::mutate.data.frame(., antigen = str_remove(gsub(".*/", "", id), paste0("_", nm_method, ".txt")))
       11. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
       12. │   ├─base::withCallingHandlers(...)
       13. │   └─mask$eval_all_mutate(quo)
       14. ├─stringr::str_remove(...)
       15. │ └─stringr::str_replace(string, pattern, "")
       16. │   └─stringi::stri_replace_first_regex(...)
       17. ├─base::gsub(".*/", "", id)
       18. └─base::.handleSimpleError(...)
       19.   └─dplyr (local) h(simpleError(msg, call))
       20.     └─rlang::abort(...)
      
      [ FAIL 1 | WARN 0 | SKIP 2 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘mhcII-hu.Rmd’ using rmarkdown
    ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ✔ ggplot2 3.3.6          ✔ purrr   0.3.4.9000
    ✔ tibble  3.1.8          ✔ dplyr   1.0.9     
    ✔ tidyr   1.2.0          ✔ stringr 1.4.1     
    ✔ readr   2.1.2          ✔ forcats 0.5.2     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ...
    paste0("_", nm_method, ".txt"))`.
    Caused by error in `as.character()`:
    ! cannot coerce type 'closure' to vector of type 'character'
    --- failed re-building ‘mhcII-hu.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘mhcII-hu.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘ggseqlogo’ ‘rstudioapi’ ‘usethis’
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

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      no files found
      no files found
      no files found
      no files found
      no files found
      [ FAIL 2 | WARN 0 | SKIP 17 | PASS 33 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (17)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("vcr::use_cassette(...)",  : 
        replacement has 25 rows, data has 24
      Calls: test_check ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Introduction.Rmd’ using rmarkdown
    Quitting from lines 42-46 (Introduction.Rmd) 
    Error: processing vignette 'Introduction.Rmd' failed with diagnostics:
    Result 1 must be a single string, not a list of length 0
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

