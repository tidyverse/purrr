# abmR

<details>

* Version: 1.0.6
* GitHub: NA
* Source code: https://github.com/cran/abmR
* Date/Publication: 2022-08-16 13:50:09 UTC
* Number of recursive dependencies: 160

Run `cloud_details(, "abmR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘abmR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: energyVIZ
    > ### Title: Creates a plot/table of energySIM() results
    > ### Aliases: energyVIZ
    > 
    > ### ** Examples
    > 
    > 
    ...
    • `` -> `...7`
    • `` -> `...8`
    • `` -> `...9`
    • `` -> `...10`
    • `` -> `...11`
    • `` -> `...12`
    Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("abmR::energyVIZ(EX1, type = \"summary_table\")",  : 
      replacement has 28 rows, data has 22
    Calls: energyVIZ ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

# applicable

<details>

* Version: 0.1.0
* GitHub: https://github.com/tidymodels/applicable
* Source code: https://github.com/cran/applicable
* Date/Publication: 2022-08-20 21:50:11 UTC
* Number of recursive dependencies: 110

Run `cloud_details(, "applicable")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘applicable-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: autoplot.apd_pca
    > ### Title: Plot the distribution function for principal components
    > ### Aliases: autoplot.apd_pca
    > 
    > ### ** Examples
    > 
    > library(ggplot2)
    ...
     17.               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
     18.                 └─tidyselect:::as_indices_sel_impl(...)
     19.                   └─tidyselect:::as_indices_impl(x, vars, call = call, strict = strict)
     20.                     └─tidyselect:::chr_as_locations(x, vars, call = call)
     21.                       └─vctrs::vec_as_location(x, n = length(vars), names = vars)
     22.                         └─vctrs (local) `<fn>`()
     23.                           └─vctrs:::stop_subscript_oob(...)
     24.                             └─vctrs:::stop_subscript(...)
     25.                               └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       15.           └─tidyselect:::eval_c(expr, data_mask, context_mask)
       16.             └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
       17.               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
       18.                 └─tidyselect:::as_indices_sel_impl(...)
       19.                   └─tidyselect:::as_indices_impl(x, vars, call = call, strict = strict)
       20.                     └─tidyselect:::chr_as_locations(x, vars, call = call)
       21.                       └─vctrs::vec_as_location(x, n = length(vars), names = vars)
       22.                         └─vctrs (local) `<fn>`()
       23.                           └─vctrs:::stop_subscript_oob(...)
       24.                             └─vctrs:::stop_subscript(...)
       25.                               └─rlang::abort(...)
      
      [ FAIL 2 | WARN 0 | SKIP 22 | PASS 89 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘binary-data.Rmd’ using rmarkdown
    --- finished re-building ‘binary-data.Rmd’
    
    --- re-building ‘continuous-data.Rmd’ using rmarkdown
    Loading required package: dplyr
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    ...
    Quitting from lines 149-151 (continuous-data.Rmd) 
    Error: processing vignette 'continuous-data.Rmd' failed with diagnostics:
    object 'value' not found
    --- failed re-building ‘continuous-data.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘continuous-data.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# audubon

<details>

* Version: 0.3.0
* GitHub: https://github.com/paithiov909/audubon
* Source code: https://github.com/cran/audubon
* Date/Publication: 2022-07-22 17:20:02 UTC
* Number of recursive dependencies: 63

Run `cloud_details(, "audubon")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘audubon-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pack
    > ### Title: Pack prettified data.frame of tokens
    > ### Aliases: pack
    > 
    > ### ** Examples
    > 
    > pack(strj_tokenize(polano[1:5], format = "data.frame"))
    Error: Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: Can't merge the outer name `1` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─audubon::strj_tokenize(polano[1:30], format = "data.frame") at test_pack.R:1:0
       2. │ └─audubon:::tokenize_stringi(text, split)
       3. │   ├─... %>% dplyr::mutate(doc_id = as.factor(.data$doc_id))
       4. │   └─purrr::imap_dfr(...)
       5. │     └─purrr::map2_dfr(.x, vec_index(.x), .f, ..., .id = .id)
       6. │       └─vctrs::vec_rbind(!!!res, .names_to = .id)
       7. └─dplyr::mutate(., doc_id = as.factor(.data$doc_id))
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 899 marked UTF-8 strings
    ```

# autostats

<details>

* Version: 0.3.1
* GitHub: https://github.com/Harrison4192/autostats
* Source code: https://github.com/cran/autostats
* Date/Publication: 2022-08-19 13:10:06 UTC
* Number of recursive dependencies: 233

Run `cloud_details(, "autostats")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘autostats.Rmd’ using rmarkdown
    Quitting from lines 46-48 (autostats.Rmd) 
    Error: processing vignette 'autostats.Rmd' failed with diagnostics:
    All of the models failed. See the .notes column.
    --- failed re-building ‘autostats.Rmd’
    
    --- re-building ‘tidyModels.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    ...
    
        intersect, setdiff, setequal, union
    
    --- finished re-building ‘tidyModels.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘autostats.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# baguette

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/baguette
* Source code: https://github.com/cran/baguette
* Date/Publication: 2022-06-17 16:00:02 UTC
* Number of recursive dependencies: 131

Run `cloud_details(, "baguette")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       48. │     └─base::signalCondition(cnd)
       49. └─dplyr (local) `<fn>`(`<dpl:::__>`)
       50.   └─rlang::abort(...)
      ── Error (test-mars.R:133:3): check MARS parsnip interface ─────────────────────
      Error in `tibble::is_tibble(reg_class_pred)`: object 'reg_class_pred' not found
      Backtrace:
          ▆
       1. ├─testthat::expect_true(tibble::is_tibble(reg_class_pred)) at test-mars.R:133:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─tibble::is_tibble(reg_class_pred)
      
      [ FAIL 6 | WARN 2 | SKIP 1 | PASS 109 ]
      Error: Test failures
      Execution halted
    ```

# Bchron

<details>

* Version: 4.7.6
* GitHub: https://github.com/andrewcparnell/Bchron
* Source code: https://github.com/cran/Bchron
* Date/Publication: 2021-06-10 05:20:02 UTC
* Number of recursive dependencies: 88

Run `cloud_details(, "Bchron")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Bchron-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: BchronCalibrate
    > ### Title: Fast radiocarbon calibration
    > ### Aliases: BchronCalibrate
    > 
    > ### ** Examples
    > 
    > # Calibrate a single age
    ...
      5. ├─dplyr::mutate(., densities = scaleMax(.data$densities))
      6. ├─dplyr:::mutate.data.frame(., densities = scaleMax(.data$densities))
      7. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
      8. │   ├─base::withCallingHandlers(...)
      9. │   └─mask$eval_all_mutate(quo)
     10. ├─Bchron (local) scaleMax(.data$densities)
     11. └─base::.handleSimpleError(...)
     12.   └─dplyr (local) h(simpleError(msg, call))
     13.     └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. ├─dplyr::ungroup(.)
        5. ├─dplyr::filter(., .data$densities > 0.01)
        6. ├─dplyr::mutate(., densities = scaleMax(.data$densities))
        7. ├─dplyr:::mutate.data.frame(., densities = scaleMax(.data$densities))
        8. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
        9. │   ├─base::withCallingHandlers(...)
       10. │   └─mask$eval_all_mutate(quo)
       11. ├─Bchron (local) scaleMax(.data$densities)
       12. └─base::.handleSimpleError(...)
       13.   └─dplyr (local) h(simpleError(msg, call))
       14.     └─rlang::abort(...)
      
      [ FAIL 5 | WARN 0 | SKIP 11 | PASS 87 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Bchron.Rmd’ using rmarkdown
    Quitting from lines 85-91 (Bchron.Rmd) 
    Error: processing vignette 'Bchron.Rmd' failed with diagnostics:
    Problem while computing `densities = scaleMax(.data$densities)`.
    ℹ The error occurred in group 1: Date = "Date1".
    Caused by error in `max()`:
    ! invalid 'type' (list) of argument
    --- failed re-building ‘Bchron.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Bchron.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# beadplexr

<details>

* Version: 0.4.1
* GitHub: NA
* Source code: https://github.com/cran/beadplexr
* Date/Publication: 2022-03-05 13:50:02 UTC
* Number of recursive dependencies: 130

Run `cloud_details(, "beadplexr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘beadplexr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cluster_events
    > ### Title: Clustering with trimming
    > ### Aliases: cluster_events bp_kmeans bp_clara bp_dbscan bp_mclust
    > ###   bp_density_cut
    > 
    > ### ** Examples
    > 
    ...
    +   # Probably not something you'd usually do
    +   dplyr::sample_frac(0.25) %>%
    +   bp_kmeans(.parameter = c("FSC-A", "SSC-A"),
    +             .column_name = "population", .trim = 0.1, .k = 2) %>%
    +   ggplot() +
    +   aes(x = `FSC-A`, y = `SSC-A`, colour = population) +
    +   geom_point()
    Error: Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─beadplexr::identify_legendplex_analyte(...) at test_identify_assay_analyte.R:171:2
       2. │ └─beadplexr:::ident_bead_pop(...)
       3. │   ├─base::do.call(identify_analyte, .call_args)
       4. │   └─beadplexr (local) `<fn>`(...)
       5. │     └─beadplexr::bp_clara(...)
       6. │       └─split(df, factor(df[[.column_name]])) %>% ...
       7. └─purrr::map_df(...)
       8.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 8 | WARN 0 | SKIP 0 | PASS 319 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘cba_macsplex_example.Rmd’ using rmarkdown
    Quitting from lines 68-79 (cba_macsplex_example.Rmd) 
    Error: processing vignette 'cba_macsplex_example.Rmd' failed with diagnostics:
    Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘cba_macsplex_example.Rmd’
    
    --- re-building ‘legendplex_analysis.Rmd’ using rmarkdown
    
    ...
    --- failed re-building ‘legendplex_analysis.Rmd’
    
    --- re-building ‘preparing_flow_data.Rmd’ using rmarkdown
    --- finished re-building ‘preparing_flow_data.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘cba_macsplex_example.Rmd’ ‘legendplex_analysis.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# biogrowth

<details>

* Version: 1.0.0-2
* GitHub: NA
* Source code: https://github.com/cran/biogrowth
* Date/Publication: 2022-07-19 17:10:09 UTC
* Number of recursive dependencies: 114

Run `cloud_details(, "biogrowth")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘biogrowth-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compare_growth_fits
    > ### Title: Model comparison and selection for growth models
    > ### Aliases: compare_growth_fits
    > 
    > ### ** Examples
    > 
    > 
    ...
    # A tibble: 3 × 5
      model              AIC    df           ME   RMSE
      <chr>            <dbl> <int>        <dbl>  <dbl>
    1 Baranyi         -29.7     17  0.000000402 0.0919
    2 Baranyi no lag    4.49    18 -0.000000513 0.224 
    3 Gompertz no lag   7.47    18  0.000000148 0.241 
    > plot(model_comparison)
    Error: Can't merge the outer name `Baranyi` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘v01_growth_predictions.Rmd’ using rmarkdown
    --- finished re-building ‘v01_growth_predictions.Rmd’
    
    --- re-building ‘v02_growth_fitting.Rmd’ using rmarkdown
    --- finished re-building ‘v02_growth_fitting.Rmd’
    
    --- re-building ‘v03_growth_uncertainty.Rmd’ using rmarkdown
    Quitting from lines 79-80 (v03_growth_uncertainty.Rmd) 
    Error: processing vignette 'v03_growth_uncertainty.Rmd' failed with diagnostics:
    ...
    Please supply a `.name_spec` specification.
    --- failed re-building ‘v99_deprecated.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘v03_growth_uncertainty.Rmd’ ‘v04_model_comparison.Rmd’
      ‘v23_units-dilemma.Rmd’ ‘v31_secondary_for_static.Rmd’
      ‘v99_deprecated.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# brolgar

<details>

* Version: 0.1.2
* GitHub: https://github.com/njtierney/brolgar
* Source code: https://github.com/cran/brolgar
* Date/Publication: 2021-08-25 12:50:18 UTC
* Number of recursive dependencies: 114

Run `cloud_details(, "brolgar")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘brolgar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: near_between
    > ### Title: Return x percent to y percent of values
    > ### Aliases: near_between
    > 
    > ### ** Examples
    > 
    > x <- runif(20)
    ...
      5. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
      6. │   ├─base::withCallingHandlers(...)
      7. │   └─mask$eval_all_mutate(quo)
      8. ├─dplyr:::dplyr_internal_error(...)
      9. │ └─rlang::abort(class = c(class, "dplyr:::internal_error"), dplyr_error_data = data)
     10. │   └─rlang:::signal_abort(cnd, .file)
     11. │     └─base::signalCondition(cnd)
     12. └─dplyr (local) `<fn>`(`<dpl:::__>`)
     13.   └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        8. ├─dplyr:::dplyr_internal_error(...)
        9. │ └─rlang::abort(class = c(class, "dplyr:::internal_error"), dplyr_error_data = data)
       10. │   └─rlang:::signal_abort(cnd, .file)
       11. │     └─base::signalCondition(cnd)
       12. └─dplyr (local) `<fn>`(`<dpl:::__>`)
       13.   └─rlang::abort(bullets, call = error_call, parent = skip_internal_condition(e))
      
      [ FAIL 7 | WARN 0 | SKIP 5 | PASS 234 ]
      Deleting unused snapshots:
      • facet-sample/gg-facet-sample-alt.svg
      • facet-sample/gg-facet-sample.svg
      • facet-strata/gg-facet-strata-along.svg
      • facet-strata/gg-facet-strata.svg
      Error: Test failures
      Execution halted
    ```

# broom

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/broom
* Source code: https://github.com/cran/broom
* Date/Publication: 2022-07-01 09:20:02 UTC
* Number of recursive dependencies: 294

Run `cloud_details(, "broom")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘broom-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: augment.poLCA
    > ### Title: Augment data with information from a(n) poLCA object
    > ### Aliases: augment.poLCA
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
     
    AIC(2): 1026.935
    BIC(2): 1057.313
    G^2(2): 2.719922 (Likelihood ratio/deviance statistic) 
    X^2(2): 2.719764 (Chi-square goodness of fit) 
     
    > tidy(M1)
    Error: Can't merge the outer name `A` with a vector of length > 1.
    Please supply a `.name_spec` specification.
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

# cmcR

<details>

* Version: 0.1.9
* GitHub: NA
* Source code: https://github.com/cran/cmcR
* Date/Publication: 2022-02-22 14:00:02 UTC
* Number of recursive dependencies: 116

Run `cloud_details(, "cmcR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cmcR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: x3pListPlot
    > ### Title: Plot a list of x3ps
    > ### Aliases: x3pListPlot
    > 
    > ### ** Examples
    > 
    > data(fadul1.1_processed,fadul1.2_processed)
    > 
    > x3pListPlot(list("Fadul 1-1" = fadul1.1_processed,
    +                  "Fadul 1-2" = fadul1.2_processed))
    Error: Can't merge the outer name `Fadul 1-1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed ══════════════════════════════════════════════════════════════════════
      ── 1. Error (test-diagnosticTools.R:55:1): (code run outside of `test_that()`) ─
      Error: Can't merge the outer name `name1` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
       1. cmcR::cmcPlot(...)
            at test-diagnosticTools.R:55:0
       2. cmcR:::arrangeCMCPlot(...)
       3. cmcR::x3pListPlot(...)
       6. purrr::pmap_dfr(...)
       7. vctrs::vec_rbind(!!!res, .names_to = .id)
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      Error: Test failures
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

*   checking examples ... ERROR
    ```
    Running examples in ‘codebook-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: codebook_table
    > ### Title: Codebook metadata table
    > ### Aliases: codebook_table
    > 
    > ### ** Examples
    > 
    > data("bfi")
    ...
      5.         └─codebook (local) .f(.x[[i]], ...)
      6.           └─purrr::flatten_dfr(purrr::flatten(x))
      7.             └─vctrs::vec_rbind(!!!res, .names_to = .id)
      8.               └─vctrs (local) `<fn>`()
      9.                 └─vctrs::vec_default_ptype2(...)
     10.                   └─vctrs::stop_incompatible_type(...)
     11.                     └─vctrs:::stop_incompatible(...)
     12.                       └─vctrs:::stop_vctrs(...)
     13.                         └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘codebook.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Could not summarise item C1. Error in gather_variable_metadata(results): nrow(metadata) == ncol(results) is not TRUE
    
    --- failed re-building ‘codebook_tutorial.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘codebook.Rmd’ ‘codebook_qualtrics.Rmd’ ‘codebook_sav.Rmd’
      ‘codebook_tutorial.Rmd’
    
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
      Duration: 1.0 s
      
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

# correlationfunnel

<details>

* Version: 0.2.0
* GitHub: https://github.com/business-science/correlationfunnel
* Source code: https://github.com/cran/correlationfunnel
* Date/Publication: 2020-06-09 04:40:03 UTC
* Number of recursive dependencies: 110

Run `cloud_details(, "correlationfunnel")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘correlationfunnel-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: binarize
    > ### Title: Turn data with numeric, categorical features into binary data.
    > ### Aliases: binarize
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
     26.                     └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
     27.                       └─tidyselect:::as_indices_sel_impl(...)
     28.                         └─tidyselect:::as_indices_impl(x, vars, call = call, strict = strict)
     29.                           └─tidyselect:::chr_as_locations(x, vars, call = call)
     30.                             └─vctrs::vec_as_location(x, n = length(vars), names = vars)
     31.                               └─vctrs (local) `<fn>`()
     32.                                 └─vctrs:::stop_subscript_oob(...)
     33.                                   └─vctrs:::stop_subscript(...)
     34.                                     └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       25.                 └─tidyselect:::eval_c(expr, data_mask, context_mask)
       26.                   └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
       27.                     └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
       28.                       └─tidyselect:::as_indices_sel_impl(...)
       29.                         └─tidyselect:::as_indices_impl(x, vars, call = call, strict = strict)
       30.                           └─tidyselect:::chr_as_locations(x, vars, call = call)
       31.                             └─vctrs::vec_as_location(x, n = length(vars), names = vars)
       32.                               └─vctrs (local) `<fn>`()
       33.                                 └─vctrs:::stop_subscript_oob(...)
       34.                                   └─vctrs:::stop_subscript(...)
       35.                                     └─rlang::abort(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 9 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘introducing_correlation_funnel.Rmd’ using rmarkdown
    ══ Using correlationfunnel? ════════════════════════════════════════════════════
    You might also be interested in applied data science training for business.
    </> Learn more at - www.business-science.io </>
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
    ...
    Error: processing vignette 'key_considerations.Rmd' failed with diagnostics:
    Can't subset columns that don't exist.
    ✖ Column `...1` doesn't exist.
    --- failed re-building ‘key_considerations.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘key_considerations.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# corrr

<details>

* Version: 0.4.4
* GitHub: https://github.com/tidymodels/corrr
* Source code: https://github.com/cran/corrr
* Date/Publication: 2022-08-16 20:40:01 UTC
* Number of recursive dependencies: 106

Run `cloud_details(, "corrr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘corrr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: autoplot.cor_df
    > ### Title: Create a correlation matrix from a cor_df object
    > ### Aliases: autoplot.cor_df
    > 
    > ### ** Examples
    > 
    > x <- correlate(mtcars)
    Correlation computed with
    • Method: 'pearson'
    • Missing treated using: 'pairwise.complete.obs'
    > 
    > autoplot(x)
    Error: Can't merge the outer name `mpg` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─testthat::expect_s3_class(stretch(d, remove.dups = TRUE), "data.frame") at test-stretch.R:56:2
       2. │ └─testthat::quasi_label(enquo(object), arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─corrr::stretch(d, remove.dups = TRUE)
       5. └─corrr:::stretch.cor_df(d, remove.dups = TRUE)
       6.   └─purrr::imap_dfr(x, ~tibble(x = .y, y = row_name, r = .x))
       7.     └─purrr::map2_dfr(.x, vec_index(.x), .f, ..., .id = .id)
       8.       └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 6 | WARN 0 | SKIP 0 | PASS 85 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘databases.Rmd’ using rmarkdown
    Quitting from lines 45-48 (databases.Rmd) 
    Error: processing vignette 'databases.Rmd' failed with diagnostics:
    Can't merge the outer name `mpg` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘databases.Rmd’
    
    --- re-building ‘using-corrr.Rmd’ using rmarkdown
    ...
    Error: processing vignette 'using-corrr.Rmd' failed with diagnostics:
    Can't merge the outer name `mpg` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘using-corrr.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘databases.Rmd’ ‘using-corrr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# crimedata

<details>

* Version: 0.3.1
* GitHub: https://github.com/mpjashby/crimedata
* Source code: https://github.com/cran/crimedata
* Date/Publication: 2022-06-21 19:50:02 UTC
* Number of recursive dependencies: 73

Run `cloud_details(, "crimedata")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error (test_get_crime_data.R:55:3): data cache works as expected ────────────
      Error in `order(values$data_type, values$city, values$year)`: unimplemented type 'list' in 'listgreater'
      
      Backtrace:
          ▆
       1. └─crimedata::get_crime_data(cities = "Detroit") at test_get_crime_data.R:55:2
       2.   └─crimedata:::get_file_urls(quiet = quiet)
       3.     └─crimedata:::fetch_file_urls()
       4.       ├─values[order(values$data_type, values$city, values$year), ]
       5.       ├─base::`[.data.frame`(...)
       6.       └─base::order(values$data_type, values$city, values$year)
      
      [ FAIL 12 | WARN 0 | SKIP 0 | PASS 23 ]
      Error: Test failures
      Execution halted
    ```

# crossmap

<details>

* Version: 0.3.3
* GitHub: https://github.com/rossellhayes/crossmap
* Source code: https://github.com/cran/crossmap
* Date/Publication: 2022-08-12 17:30:05 UTC
* Number of recursive dependencies: 76

Run `cloud_details(, "crossmap")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Attributes: < Component "class": 1 string mismatch >
      ── Failure (test-future_xmap.R:65:5): sequential - equivalence with df xmap()s ──
      `.xmap` not equal to `.future_xmap`.
      Attributes: < Component "class": Lengths (1, 3) differ (string compare on first 1) >
      Attributes: < Component "class": 1 string mismatch >
      Component "x": Modes: list, numeric
      Component "y": Modes: list, numeric
      ── Failure (test-future_xmap.R:70:5): sequential - equivalence with df xmap()s ──
      `.xmap` not equal to `.future_xmap`.
      Attributes: < Component "class": Lengths (1, 3) differ (string compare on first 1) >
      Attributes: < Component "class": 1 string mismatch >
      
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 281 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
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
    
    > ### Name: apply_labels
    > ### Title: Batch set variable labels
    > ### Aliases: apply_labels
    > 
    > ### ** Examples
    > 
    > iris %>%
    ...
      8.   └─purrr::imap_dfr(...)
      9.     └─purrr::map2_dfr(.x, vec_index(.x), .f, ..., .id = .id)
     10.       └─vctrs::vec_rbind(!!!res, .names_to = .id)
     11.         └─vctrs (local) `<fn>`()
     12.           └─vctrs::vec_default_ptype2(...)
     13.             └─vctrs::stop_incompatible_type(...)
     14.               └─vctrs:::stop_incompatible(...)
     15.                 └─vctrs:::stop_vctrs(...)
     16.                   └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5.         └─vctrs (local) `<fn>`()
        6.           └─vctrs::vec_default_ptype2(...)
        7.             └─vctrs::stop_incompatible_type(...)
        8.               └─vctrs:::stop_incompatible(...)
        9.                 └─vctrs:::stop_vctrs(...)
       10.                   └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      ── Failure (test-labels.R:187:3): Save/import ──────────────────────────────────
      get_label(x$disp) (`actual`) not equal to "Displacement (cu.in.)" (`expected`).
      
      `actual` is NULL
      `expected` is a character vector ('Displacement (cu.in.)')
      
      [ FAIL 60 | WARN 2 | SKIP 16 | PASS 66 ]
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
    Can't merge the outer name ` ` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘crosstable-report.Rmd’
    ...
    Quitting from lines 63-89 (crosstable.Rmd) 
    Error: processing vignette 'crosstable.Rmd' failed with diagnostics:
    Can't combine `model$...1` <character> and `mpg$...1` <double>.
    --- failed re-building ‘crosstable.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘crosstable-report.Rmd’ ‘crosstable-selection.Rmd’ ‘crosstable.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# crplyr

<details>

* Version: 0.3.9
* GitHub: https://github.com/Crunch-io/crplyr
* Source code: https://github.com/cran/crplyr
* Date/Publication: 2022-05-01 15:10:02 UTC
* Number of recursive dependencies: 87

Run `cloud_details(, "crplyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [2] 1 - 2 == -1
      ── Failure (test-summarize.R:113:9): unweighted_n with other summary statistic ──
      names(tbl9) not equal to c("mean", "n").
      Lengths differ: 1 is not 2
      ── Failure (test-summarize.R:120:9): unweighted_n with groups ──────────────────
      dim(tbl10) not equal to c(9, 5).
      1/2 mismatches
      [2] 4 - 5 == -1
      ── Failure (test-summarize.R:121:9): unweighted_n with groups ──────────────────
      names(tbl10) not equal to c("cyl", "gear", "is_missing", "mean", "n").
      Lengths differ: 4 is not 5
      
      [ FAIL 9 | WARN 0 | SKIP 1 | PASS 163 ]
      Error: Test failures
      Execution halted
    ```

# cutpointr

<details>

* Version: 1.1.2
* GitHub: https://github.com/thie1e/cutpointr
* Source code: https://github.com/cran/cutpointr
* Date/Publication: 2022-04-13 18:12:29 UTC
* Number of recursive dependencies: 83

Run `cloud_details(, "cutpointr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cutpointr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cutpointr_
    > ### Title: The standard evaluation version of cutpointr (deprecated)
    > ### Aliases: cutpointr_
    > 
    > ### ** Examples
    > 
    > library(cutpointr)
    ...
      4. ├─cutpointr:::print_df_nodat(., row.names = FALSE)
      5. │ └─base::row.names(x)
      6. ├─dplyr::left_join(., y = x$confusion_matrix[[i]], by = c(optimal_cutpoint = "cutpoint"))
      7. └─dplyr:::left_join.data.frame(., y = x$confusion_matrix[[i]], by = c(optimal_cutpoint = "cutpoint"))
      8.   └─dplyr:::join_mutate(...)
      9.     └─dplyr:::join_cols(...)
     10.       └─dplyr:::standardise_join_by(...)
     11.         └─dplyr:::check_join_vars(by$x, x_names, error_call = error_call)
     12.           └─rlang::abort(bullets, call = error_call)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11. ├─cutpointr:::print.summary_cutpointr(scp)
       12. │ └─... %>% print_df_nodat(row.names = FALSE)
       13. ├─cutpointr:::print_df_nodat(., row.names = FALSE)
       14. │ └─base::row.names(x)
       15. ├─dplyr::left_join(., y = x$confusion_matrix[[i]], by = c(optimal_cutpoint = "cutpoint"))
       16. └─dplyr:::left_join.data.frame(., y = x$confusion_matrix[[i]], by = c(optimal_cutpoint = "cutpoint"))
       17.   └─dplyr:::join_mutate(...)
       18.     └─dplyr:::join_cols(...)
       19.       └─dplyr:::standardise_join_by(...)
       20.         └─dplyr:::check_join_vars(by$x, x_names, error_call = error_call)
       21.           └─rlang::abort(bullets, call = error_call)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 445 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘cutpointr.Rmd’ using rmarkdown
    Quitting from lines 47-48 (cutpointr.Rmd) 
    Error: processing vignette 'cutpointr.Rmd' failed with diagnostics:
    Join columns must be present in data.
    ✖ Problem with `optimal_cutpoint`.
    --- failed re-building ‘cutpointr.Rmd’
    
    --- re-building ‘cutpointr_benchmarks.Rmd’ using rmarkdown
    --- finished re-building ‘cutpointr_benchmarks.Rmd’
    ...
    --- failed re-building ‘cutpointr_roc.Rmd’
    
    --- re-building ‘cutpointr_user_functions.Rmd’ using rmarkdown
    --- finished re-building ‘cutpointr_user_functions.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘cutpointr.Rmd’ ‘cutpointr_bootstrapping.Rmd’ ‘cutpointr_roc.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# cvms

<details>

* Version: 1.3.5
* GitHub: https://github.com/ludvigolsen/cvms
* Source code: https://github.com/cran/cvms
* Date/Publication: 2022-08-26 13:54:39 UTC
* Number of recursive dependencies: 144

Run `cloud_details(, "cvms")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • Fails in check - IMPROVE THESE TESTS (1)
      • On CRAN (58)
      • Skipping check for CRAN release due to r_hub failure (1)
      • Skipping parallel tests (3)
      • empty test (1)
      • keras and tensorflow take too long and have too many dependencies (1)
      • mac and ubuntu give different warnings (4)
      • tidymodels have too many dependencies (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("cvms:::create_computation_grid(...)",  : 
        replacement has 19 rows, data has 18
      Calls: test_check ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Creating_a_confusion_matrix.Rmd’ using rmarkdown
    --- finished re-building ‘Creating_a_confusion_matrix.Rmd’
    
    --- re-building ‘available_metrics.Rmd’ using rmarkdown
    --- finished re-building ‘available_metrics.Rmd’
    
    --- re-building ‘cross_validating_custom_functions.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    ...
    ! Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘picking_the_number_of_folds_for_cross-validation.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘cross_validating_custom_functions.Rmd’
      ‘picking_the_number_of_folds_for_cross-validation.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# DAISIE

<details>

* Version: 4.2.0
* GitHub: https://github.com/rsetienne/DAISIE
* Source code: https://github.com/cran/DAISIE
* Date/Publication: 2022-06-02 11:30:15 UTC
* Number of recursive dependencies: 117

Run `cloud_details(, "DAISIE")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DAISIE-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: DAISIE_plot_input
    > ### Title: DAISIE tree plot
    > ### Aliases: DAISIE_plot_input
    > 
    > ### ** Examples
    > 
    > 
    ...
      2. │ ├─base::suppressWarnings(p$data %>% dplyr::full_join(tipclades))
      3. │ │ └─base::withCallingHandlers(...)
      4. │ └─p$data %>% dplyr::full_join(tipclades)
      5. ├─dplyr::full_join(., tipclades)
      6. └─dplyr:::full_join.data.frame(., tipclades)
      7.   └─dplyr:::join_mutate(...)
      8.     └─dplyr:::join_cols(...)
      9.       └─dplyr:::standardise_join_by(...)
     10.         └─rlang::abort(bullets, call = error_call)
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘doMC’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 37.3Mb
      sub-directories of 1Mb or more:
        libs  35.3Mb
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
        3. │   └─schema[[get_schema_name(schema)]]$tables %>% ...
        4. ├─purrr::modify(...)
        5. ├─purrr:::modify.default(...)
        6. │ └─DataFakeR (local) .f(.x[[i]], ...)
        7. │   ├─DataFakeR:::mod_table_attr(...)
        8. │   └─DataFakeR:::table_to_graph(.x, schema)
        9. │     └─DataFakeR:::deps_to_edges(table_deps)
       10. │       └─... %>% dplyr::filter(!is.na(.data$from))
       11. ├─dplyr::filter(., !is.na(.data$from))
       12. └─purrr::map_dfr(...)
       13.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 8 | WARN 2 | SKIP 1 | PASS 49 ]
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
    Can't merge the outer name `treatment_id` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘extra_parameters.Rmd’
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

# dbparser

<details>

* Version: 1.2.0
* GitHub: https://github.com/ropensci/dbparser
* Source code: https://github.com/cran/dbparser
* Date/Publication: 2020-08-26 12:10:03 UTC
* Number of recursive dependencies: 71

Run `cloud_details(, "dbparser")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. ├─dbparser::drug_pathway_enzyme()
        5. │ └─PathwaySubNodesParser$new(save_table, save_csv, csv_path, override_csv, ...
        6. │   └─private$parse_record()
        7. │     ├─map_df(drugs, ~private$get_pathways_sub(., pb)) %>% unique()
        8. │     └─purrr::map_df(drugs, ~private$get_pathways_sub(., pb))
        9. │       └─purrr::map(.x, .f, ...)
       10. │         └─dbparser (local) .f(.x[[i]], ...)
       11. │           └─private$get_pathways_sub(., pb)
       12. │             └─purrr::map_df(...)
       13. │               └─vctrs::vec_rbind(!!!res, .names_to = .id)
       14. └─base::unique(.)
      
      [ FAIL 57 | WARN 0 | SKIP 0 | PASS 278 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# dcurves

<details>

* Version: 0.3.0
* GitHub: https://github.com/ddsjoberg/dcurves
* Source code: https://github.com/cran/dcurves
* Date/Publication: 2022-05-25 22:40:05 UTC
* Number of recursive dependencies: 102

Run `cloud_details(, "dcurves")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘dca.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Assigned data `df_updated` must be compatible with existing data.
    ℹ Error occurred for column `estimate`.
    ✖ Can't convert <character> to <double>.
    --- failed re-building ‘dca.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘dca.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# descstat

<details>

* Version: 0.1-2
* GitHub: NA
* Source code: https://github.com/cran/descstat
* Date/Publication: 2021-02-17 16:40:02 UTC
* Number of recursive dependencies: 57

Run `cloud_details(, "descstat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘descstat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pre_plot
    > ### Title: Put a tibble in form to plot
    > ### Aliases: pre_plot pre_plot.freq_table pre_plot.cont_table
    > ### Keywords: dplot
    > 
    > ### ** Examples
    > 
    ...
      5. │ └─... %>% map_df(rev)
      6. └─purrr::map_df(., rev)
      7.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      8.     └─vctrs (local) `<fn>`()
      9.       └─vctrs::vec_default_ptype2(...)
     10.         └─vctrs::stop_incompatible_type(...)
     11.           └─vctrs:::stop_incompatible(...)
     12.             └─vctrs:::stop_vctrs(...)
     13.               └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘descstat.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Quitting from lines 312-313 (descstat.Rmd) 
    Error: processing vignette 'descstat.Rmd' failed with diagnostics:
    Can't combine `children$...1` <factor<22e9c>> and `f$...1` <double>.
    --- failed re-building ‘descstat.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘descstat.Rmd’
    
    Error: Vignette re-building failed.
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

# diceR

<details>

* Version: 1.2.1
* GitHub: https://github.com/AlineTalhouk/diceR
* Source code: https://github.com/cran/diceR
* Date/Publication: 2022-08-17 00:10:02 UTC
* Number of recursive dependencies: 169

Run `cloud_details(, "diceR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘diceR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: consensus_evaluate
    > ### Title: Evaluate, trim, and reweigh algorithms
    > ### Aliases: consensus_evaluate
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    > set.seed(911)
    > x <- matrix(rnorm(500), ncol = 10)
    > CC <- consensus_cluster(x, nk = 3:4, reps = 10, algorithms = c("ap", "km"), 
    +     progress = FALSE)
    > set.seed(1)
    > ref.cl <- sample(1:4, 50, replace = TRUE)
    > z <- consensus_evaluate(x, CC, ref.cl = ref.cl, n = 1, trim = TRUE)
    Error in is.nan(.x) : default method not implemented for type 'list'
    Calls: <Anonymous> ... %>% -> <Anonymous> -> [.data.frame -> <Anonymous> -> .f
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Computing consensus functions
      Evaluating output with consensus function results
      Diverse Cluster Ensemble Completed
      Selecting k and imputing non-clustered cases
      Computing consensus functions
      Diverse Cluster Ensemble Completed
      Selecting k and imputing non-clustered cases
      Computing consensus functions
      Diverse Cluster Ensemble Completed
      Selecting k and imputing non-clustered cases
      Computing consensus functions
      Diverse Cluster Ensemble Completed
      Selecting k and imputing non-clustered cases
      Computing consensus functions
      Killed
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘overview.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
    Quitting from lines 233-234 (overview.Rmd) 
    Error: processing vignette 'overview.Rmd' failed with diagnostics:
    default method not implemented for type 'list'
    --- failed re-building ‘overview.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘overview.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# discrim

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/discrim
* Source code: https://github.com/cran/discrim
* Date/Publication: 2022-06-23 12:40:05 UTC
* Number of recursive dependencies: 139

Run `cloud_details(, "discrim")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `actual$.pred_3` is absent
      `expected$.pred_3` is a double vector (NA, NA, 7.75827953196976e-14, 0.497535010606489, 2.95977935125078e-14)
      
      `actual$.pred_5` is absent
      `expected$.pred_5` is a double vector (NA, NA, 0.0140762254708191, 3.85403333737856e-08, 0.02801784547658)
      
      `actual$.pred_6` is absent
      `expected$.pred_6` is a double vector (NA, NA, 2.22515300109852e-05, 3.35822039758974e-07, 2.54584665155544e-05)
      
      `actual$.pred_7` is absent
      `expected$.pred_7` is a double vector (NA, NA, 1.38123147094688e-07, 2.27736016609084e-11, 3.57130481328368e-07)
      
      [ FAIL 83 | WARN 0 | SKIP 6 | PASS 633 ]
      Error: Test failures
      Execution halted
    ```

# disk.frame

<details>

* Version: 0.7.2
* GitHub: https://github.com/DiskFrame/disk.frame
* Source code: https://github.com/cran/disk.frame
* Date/Publication: 2022-03-07 11:40:02 UTC
* Number of recursive dependencies: 103

Run `cloud_details(, "disk.frame")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘disk.frame-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_chunk
    > ### Title: Add a chunk to the disk.frame
    > ### Aliases: add_chunk
    > 
    > ### ** Examples
    > 
    > # create a disk.frame
    ...
    > # add a chunk to diskf
    > add_chunk(diskf, cars)
    path: "/tmp/Rtmpd20KoX/tmp_add_chunk"
    nchunks: 1
    nrow (at source): 50
    ncol (at source): 2
    > add_chunk(diskf, cars)
    Error: Can't merge the outer name `/tmp/Rtmpd20KoX/tmp_add_chunk/1.fst` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

# dispositionEffect

<details>

* Version: 1.0.1
* GitHub: https://github.com/marcozanotti/dispositionEffect
* Source code: https://github.com/cran/dispositionEffect
* Date/Publication: 2022-05-30 07:50:02 UTC
* Number of recursive dependencies: 135

Run `cloud_details(, "dispositionEffect")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. ├─dplyr::mutate(...)
        7. ├─dplyr:::mutate.data.frame(., stat = c("Min", "Q1", "Median", "Q3", "Mean", "Max", "StDev"), .after = "investor")
        8. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
        9. │   ├─base::withCallingHandlers(...)
       10. │   └─mask$eval_all_mutate(quo)
       11. ├─dplyr:::dplyr_internal_error(...)
       12. │ └─rlang::abort(class = c(class, "dplyr:::internal_error"), dplyr_error_data = data)
       13. │   └─rlang:::signal_abort(cnd, .file)
       14. │     └─base::signalCondition(cnd)
       15. └─dplyr (local) `<fn>`(`<dpl:::__>`)
       16.   └─rlang::abort(...)
      
      [ FAIL 2 | WARN 8 | SKIP 0 | PASS 365 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘de-analysis.Rmd’ using rmarkdown
    --------------------------------------------
    The dispositionEffect is the first R package to perform behavioural analysis on financial data.
    Use citation('dispositionEffect') to cite the package.
    Learn more at: https://marcozanotti.github.io/dispositionEffect/index.html
    --------------------------------------------
    
    Attaching package: 'dplyr'
    
    ...
    • `...1` -> `...2`
    New names:
    • `...1` -> `...2`
    --- finished re-building ‘getting-started.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘de-analysis.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dm

<details>

* Version: 1.0.1
* GitHub: https://github.com/cynkra/dm
* Source code: https://github.com/cran/dm
* Date/Publication: 2022-08-06 08:00:02 UTC
* Number of recursive dependencies: 152

Run `cloud_details(, "dm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: Can't merge the outer name `airports` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. └─dm::dm(...) at test-deconstruct.R:540:2
       2.   └─dm:::dm_impl(dots[!is_dm], names(quos_auto_name(quos[!is_dm])))
       3.     └─dm::new_dm(tbls)
       4.       └─dm:::new_keyed_dm_def(tables)
       5.         └─dm:::fks_df_from_keys_info(tables[is_keyed])
       6.           └─purrr::map_dfr(info, ~tibble(.x$fks_in, parent_uuid = .x$uuid))
       7.             └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 9 | WARN 0 | SKIP 182 | PASS 1334 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘dm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dm_deconstruct
    > ### Title: Create code to deconstruct a dm object
    > ### Aliases: dm_deconstruct
    > 
    > ### ** Examples
    > 
    > dm <- dm_nycflights13()
    ...
      origin mean_arr_delay
      <chr>           <dbl>
    1 EWR             3.43 
    2 JFK            -4.36 
    3 LGA             0.523
    > dm(airlines, airports, flights, planes, weather, by_origin) %>%
    +   dm_draw()
    Error: Can't merge the outer name `flights` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

# docxtractr

<details>

* Version: 0.6.5
* GitHub: NA
* Source code: https://github.com/cran/docxtractr
* Date/Publication: 2020-07-05 04:50:41 UTC
* Number of recursive dependencies: 33

Run `cloud_details(, "docxtractr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Last 13 lines of output:
      test_docxtractr.R.............   16 tests [0;31m2 fails[0m 
      test_docxtractr.R.............   16 tests [0;31m2 fails[0m 
      test_docxtractr.R.............   16 tests [0;31m2 fails[0m 
      test_docxtractr.R.............   16 tests [0;31m2 fails[0m [0;34m0.3s[0m
      ----- FAILED[data]: test_docxtractr.R<34--34>
       call| expect_equal(colnames(tmp_6), c("Aa", "Bb", "Cc"))
       diff| 3 string mismatches
      ----- FAILED[data]: test_docxtractr.R<48--53>
       call| expect_equal(colnames(mcga(assign_colnames(tbls[[1]], 2))), c("country", 
       call| -->    "birthrate", "death_rate", "population_growth_2005", "population_growth_2050", 
       call| -->    "relative_place_in_transition", "social_factors_1", "social_factors_2", 
       call| -->    "social_factors_3"))
       diff| 9 string mismatches
      Error: 2 out of 16 tests failed
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# dots

<details>

* Version: 0.0.2
* GitHub: https://github.com/christopherkenny/dots
* Source code: https://github.com/cran/dots
* Date/Publication: 2022-07-15 08:40:07 UTC
* Number of recursive dependencies: 114

Run `cloud_details(, "dots")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘making_dot_density_maps.Rmd’ using rmarkdown
    Quitting from lines 59-60 (making_dot_density_maps.Rmd) 
    Error: processing vignette 'making_dot_density_maps.Rmd' failed with diagnostics:
    stat_sf requires the following missing aesthetics: geometry
    --- failed re-building ‘making_dot_density_maps.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘making_dot_density_maps.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# dotwhisker

<details>

* Version: 0.7.4
* GitHub: https://github.com/fsolt/dotwhisker
* Source code: https://github.com/cran/dotwhisker
* Date/Publication: 2021-09-02 14:50:35 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "dotwhisker")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘dotwhisker-vignette.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
        intersect, setdiff, setequal, union
    
    Loading required package: ggplot2
    --- finished re-building ‘kl2007_examples.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘dotwhisker-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Unknown package ‘broomExtra’ in Rd xrefs
    ```

# dupree

<details>

* Version: 0.3.0
* GitHub: https://github.com/russHyde/dupree
* Source code: https://github.com/cran/dupree
* Date/Publication: 2020-04-21 10:20:02 UTC
* Number of recursive dependencies: 62

Run `cloud_details(, "dupree")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dupree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dupree
    > ### Title: Detect code duplication between the code-blocks in a set of
    > ###   files
    > ### Aliases: dupree
    > 
    > ### ** Examples
    > 
    > # To quantify duplication between the top-level code-blocks in a file
    > example_file <- system.file("extdata", "duplicated.R", package = "dupree")
    > dup <- dupree(example_file, min_block_size = 10)
    Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("dupree::dupree(example_file, min_block_size = 10)",  : 
      replacement has 21 rows, data has 20
    Calls: dupree ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(dupree)
      > 
      > test_check("dupree")
      [ FAIL 4 | WARN 0 | SKIP 1 | PASS 26 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • empty test (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("testthat::expect_is(dupree_dir(package), \"dups\", info = \"dupree_dir should return with class `dups`\")",  : 
        replacement has 25 rows, data has 24
      Calls: test_check ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# echor

<details>

* Version: 0.1.6
* GitHub: https://github.com/mps9506/echor
* Source code: https://github.com/cran/echor
* Date/Publication: 2021-08-21 04:40:02 UTC
* Number of recursive dependencies: 123

Run `cloud_details(, "echor")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─testthat::expect_is(echoGetCAAPR(p_id = "110000350174"), "tbl_df") at test-expected_objects.R:32:4
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─echor::echoGetCAAPR(p_id = "110000350174")
        5. │ └─tibble::tibble(...)
        6. │   └─tibble:::tibble_quos(xs, .rows, .name_repair)
        7. │     └─rlang::eval_tidy(xs[[j]], mask)
        8. └─base::as.factor(pollutant$Pollutant)
        9.   └─base::factor(x)
       10.     └─base::order(y)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 11 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction.Rmd’ using rmarkdown
    Quitting from lines 184-185 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    unimplemented type 'list' in 'orderVector1'
    
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
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
    
    > ### Name: onefile_to_egor
    > ### Title: Import ego-centered network data from 'one file format'
    > ### Aliases: onefile_to_egor
    > ### Keywords: import
    > 
    > ### ** Examples
    > 
    ...
    +   aa.first.var = "X1.to.2",
    +   max.alters = 8)
    Sorting data by egoID: Done.
    Transforming alters data to long format: Done.
    Transforming wide dyad data to edgelist: Done.
    Note: Make sure to filter out alter-alter ties with invalid weight values.
    Filtering out empty alter entries using provided network size values: Done.
    Error: Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Class:   simpleError/error/condition
      Backtrace:
          ▆
       1. ├─testthat::expect_error(...) at test-read.R:13:4
       2. │ └─testthat:::quasi_capture(...)
       3. │   ├─testthat (local) .capture(...)
       4. │   │ └─base::withCallingHandlers(...)
       5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       6. └─egor::onefile_to_egor(...)
       7.   └─purrr::map2_dfr(...)
       8.     └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 3 | WARN 3 | SKIP 15 | PASS 203 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘egor_allbus.Rmd’ using rmarkdown
    Loading required package: dplyr
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
    --- finished re-building ‘qualtrics.Rmd’
    
    --- re-building ‘using_egor.Rmd’ using rmarkdown
    --- finished re-building ‘using_egor.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘egor_allbus.Rmd’
    
    Error: Vignette re-building failed.
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

*   checking examples ... ERROR
    ```
    Running examples in ‘embed-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: step_collapse_cart
    > ### Title: Supervised Collapsing of Factor Levels
    > ### Aliases: step_collapse_cart
    > 
    > ### ** Examples
    > 
    > if (rlang::is_installed(c("modeldata", "rpart"))) {
    ...
    +   rec <- 
    +     recipe(Sale_Price ~ ., data = ames) %>% 
    +     step_collapse_cart(Sale_Type, Garage_Type, Neighborhood, 
    +                        outcome = vars(Sale_Price)) %>% 
    +     prep()
    +   tidy(rec, number = 1)
    + }
    Error: Can't merge the outer name `Sale_Type` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. ├─recipes:::prep.recipe(rec, training = ames, verbose = FALSE)
        3. │ ├─recipes::bake(x$steps[[i]], new_data = training)
        4. │ └─embed:::bake.step_collapse_stringdist(x$steps[[i]], new_data = training)
        5. │   ├─base::`[<-`(`*tmp*`, , col_names[i], value = `<list>`)
        6. │   └─tibble:::`[<-.tbl_df`(`*tmp*`, , col_names[i], value = `<list>`)
        7. │     └─tibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
        8. │       └─tibble:::vectbl_recycle_rhs_cols(value, length(j))
        9. │         └─vctrs::vec_recycle(value, ncol)
       10. └─vctrs:::stop_recycle_incompatible_size(...)
       11.   └─vctrs:::stop_vctrs(...)
       12.     └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 6 | WARN 1 | SKIP 56 | PASS 146 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘textrecipes’
    ```

# eph

<details>

* Version: 0.5.0
* GitHub: https://github.com/holatam/eph
* Source code: https://github.com/cran/eph
* Date/Publication: 2022-08-11 22:50:06 UTC
* Number of recursive dependencies: 134

Run `cloud_details(, "eph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘eph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calculate_errors
    > ### Title: Calculo del desv<c3><ad>o est<c3><a1>ndar y el coeficiente de
    > ###   variaci<c3><b3>n
    > ### Aliases: calculate_errors
    > 
    > ### ** Examples
    > 
    ...
      4. └─janitor::adorn_totals(., "row")
      5.   └─purrr::map_df(dat, col_sum)
      6.     └─vctrs::vec_rbind(!!!res, .names_to = .id)
      7.       └─vctrs (local) `<fn>`()
      8.         └─vctrs::vec_default_ptype2(...)
      9.           └─vctrs::stop_incompatible_type(...)
     10.             └─vctrs:::stop_incompatible(...)
     11.               └─vctrs:::stop_vctrs(...)
     12.                 └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. ├─eph::calculate_tabulates(...)
        4. │ └─tabulado %>% janitor::adorn_totals("row")
        5. └─janitor::adorn_totals(., "row")
        6.   └─purrr::map_df(dat, col_sum)
        7.     └─vctrs::vec_rbind(!!!res, .names_to = .id)
        8.       └─vctrs (local) `<fn>`()
        9.         └─vctrs::vec_default_ptype2(...)
       10.           └─vctrs::stop_incompatible_type(...)
       11.             └─vctrs:::stop_incompatible(...)
       12.               └─vctrs:::stop_vctrs(...)
       13.                 └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 1 | WARN 2 | SKIP 5 | PASS 11 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘eph.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    --- failed re-building ‘eph.Rmd’
    
    --- re-building ‘estimacion_pobreza.Rmd’ using rmarkdown
    --- finished re-building ‘estimacion_pobreza.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘eph.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘readr’ ‘tidyverse’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked Latin-1 string
      Note: found 1508 marked UTF-8 strings
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
    
    > ### Name: calculate_probabilities
    > ### Title: Calculate dose-path probabilities
    > ### Aliases: calculate_probabilities
    > 
    > ### ** Examples
    > 
    > # Phase 1 example.
    ...
    > paths <- get_three_plus_three(num_doses = 5) %>%
    +   get_dose_paths(cohort_sizes = c(3, 3, 3))
    > 
    > # Set the true probabilities of toxicity
    > true_prob_tox <- c(0.12, 0.27, 0.44, 0.53, 0.57)
    > # And calculate exact operating performance
    > x <- paths %>% calculate_probabilities(true_prob_tox)
    Error: Can't merge the outer name `1NNN 2NNN` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error (test_crystallised_dose_paths.R:167:3): crystallised_dose_paths supports correct interface. ──
      Error: Can't merge the outer name `1NNN` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─escalation::calculate_probabilities(dose_paths = paths, true_prob_tox = true_prob_tox) at test_crystallised_dose_paths.R:167:2
       2. ├─escalation:::calculate_probabilities.phase1_dose_paths(...)
       3. │ └─escalation (local) .recurse(node_id = min_node_id)
       4. │   └─... %>% map_dfr(rbind)
       5. └─purrr::map_dfr(., rbind)
       6.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 7366 ]
      Error: Test failures
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
    
        intersect, setdiff, setequal, union
    
    --- finished re-building ‘A700-Simulation.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘A600-DosePaths.Rmd’
    
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

# eSDM

<details>

* Version: 0.3.7
* GitHub: https://github.com/smwoodman/eSDM
* Source code: https://github.com/cran/eSDM
* Date/Publication: 2021-05-04 04:50:08 UTC
* Number of recursive dependencies: 130

Run `cloud_details(, "eSDM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘eSDM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ensemble_rescale
    > ### Title: Rescale SDM predictions
    > ### Aliases: ensemble_rescale
    > 
    > ### ** Examples
    > 
    > ensemble_rescale(preds.1, c("Density", "Density2"), "abundance", 50)
    ...
    • `` -> `...320`
    • `` -> `...321`
    • `` -> `...322`
    • `` -> `...323`
    • `` -> `...324`
    • `` -> `...325`
    Error in `[<-.data.frame`(`*tmp*`, , x.idx, value = list(...1 = c(7.97447156017059e-05,  : 
      replacement element 1 has 2 rows, need 325
    Calls: ensemble_rescale -> [<- -> [<-.data.frame
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Failure (test-ensemble.R:26:3): rescale ─────────────────────────────────────
      ensemble_rescale(sf1, 1, "sumto1") not equal to `sf1.e`.
      Component "pred": Mean relative difference: 0.5
      ── Failure (test-ensemble.R:27:3): rescale ─────────────────────────────────────
      ensemble_rescale(sf2, 1, "sumto1", x.var.idx = 2) not equal to `sf2.e`.
      Component "pred": Mean relative difference: 0.5
      Component "var": Mean relative difference: 0.5
      ── Failure (test-ensemble.R:29:3): rescale ─────────────────────────────────────
      model_abundance(ensemble_rescale(sf1, 1, "abundance", 42), 1) not equal to 42.
      1/1 mismatches
      [1] 33.6 - 42 == -8.4
      
      [ FAIL 3 | WARN 4 | SKIP 0 | PASS 39 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘example-analysis.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
    Quitting from lines 303-322 (example-analysis.Rmd) 
    Error: processing vignette 'example-analysis.Rmd' failed with diagnostics:
    replacement element 1 has 3 rows, need 11419
    --- failed re-building ‘example-analysis.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘example-analysis.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ezcox

<details>

* Version: 1.0.2
* GitHub: https://github.com/ShixiangWang/ezcox
* Source code: https://github.com/cran/ezcox
* Date/Publication: 2021-10-28 15:20:08 UTC
* Number of recursive dependencies: 93

Run `cloud_details(, "ezcox")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ezcox-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ezcox
    > ### Title: Run Cox Analysis in Batch Mode
    > ### Aliases: ezcox
    > 
    > ### ** Examples
    > 
    > library(survival)
    ...
    ==> Building Surv object...
    ==> Building Cox model...
    ==> Done.
    => Processing variable ph.ecog
    ==> Building Surv object...
    ==> Building Cox model...
    ==> Done.
    Error: Can't merge the outer name `sex` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2.   └─ezcox::ezcox(...)
       3.     └─purrr::map2_df(...)
       4.       └─vctrs::vec_rbind(!!!res, .names_to = .id)
      ── Error (test-roxytest-testexamples-show_models.R:8:3): Function show_models() @ L29 ──
      Error: Can't merge the outer name `sex` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. └─ezcox::ezcox(...) at test-roxytest-testexamples-show_models.R:8:2
       2.   └─purrr::map2_df(...)
       3.     └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘ezcox.Rmd’ using rmarkdown
    Quitting from lines 54-65 (ezcox.Rmd) 
    Error: processing vignette 'ezcox.Rmd' failed with diagnostics:
    Can't merge the outer name `sex` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘ezcox.Rmd’
    
    --- re-building ‘ezforest.Rmd’ using rmarkdown
    Quitting from lines 53-63 (ezforest.Rmd) 
    ...
    Error: processing vignette 'ezgroup.Rmd' failed with diagnostics:
    Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘ezgroup.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘ezcox.Rmd’ ‘ezforest.Rmd’ ‘ezgroup.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# faux

<details>

* Version: 1.1.0
* GitHub: https://github.com/debruine/faux
* Source code: https://github.com/cran/faux
* Date/Publication: 2021-09-13 21:40:02 UTC
* Number of recursive dependencies: 133

Run `cloud_details(, "faux")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `expected`: TRUE
      ── Failure (test-distributions.R:334:3): trunc ─────────────────────────────────
      mean(s$t) > 0.99 is not TRUE
      
      `actual`:   <NA>
      `expected`: TRUE
      ── Failure (test-distributions.R:335:3): trunc ─────────────────────────────────
      mean(s$n) > 0.99 is not TRUE
      
      `actual`:   <NA>
      `expected`: TRUE
      
      [ FAIL 10 | WARN 10 | SKIP 12 | PASS 1265 ]
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
      Check on 'full_call' failed: Must be a tibble, not data.frame
      Backtrace:
          ▆
       1. └─checkmate::expect_tibble(full_call, min.rows = 1) at test-ff_userleagues.R:29:4
       2.   └─checkmate::makeExpectation(x, res, info, label)
      ── Failure (test-ff_userleagues.R:30:5): ff_userleagues works for Sleeper ──────
      Check on 'quick_call' failed: Must be a tibble, not data.frame
      Backtrace:
          ▆
       1. └─checkmate::expect_tibble(quick_call, min.rows = 1) at test-ff_userleagues.R:30:4
       2.   └─checkmate::makeExpectation(x, res, info, label)
      
      [ FAIL 10 | WARN 0 | SKIP 1 | PASS 100 ]
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
      ‘espn_basics.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘nflreadr’
      All declared Imports should be used.
    ```

# fgeo.plot

<details>

* Version: 1.1.10
* GitHub: https://github.com/forestgeo/fgeo.plot
* Source code: https://github.com/cran/fgeo.plot
* Date/Publication: 2020-12-16 06:20:08 UTC
* Number of recursive dependencies: 98

Run `cloud_details(, "fgeo.plot")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       1. ├─base::unique(purrr::map_df(maps, "data")$page) at test-plot_tag_status_by_subquadrat.R:247:2
       2. └─purrr::map_df(maps, "data")
       3.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      ── Error (test-plot_tag_status_by_subquadrat.R:256:3): argument subquad_offset works as expected ──
      Error: Can't merge the outer name `621_1` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─base::unique(purrr::map_df(x, "data")$subquadrat) at test-plot_tag_status_by_subquadrat.R:256:2
       2. └─purrr::map_df(x, "data")
       3.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 4 | WARN 1 | SKIP 0 | PASS 126 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# fgeo.tool

<details>

* Version: 1.2.7
* GitHub: https://github.com/forestgeo/fgeo.tool
* Source code: https://github.com/cran/fgeo.tool
* Date/Publication: 2021-05-25 19:40:02 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "fgeo.tool")` for more info

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
        6. ├─fgeo.tool::add_subquad(vft, x_q = 20, x_sq = 5)
        7. │ └─... %>% dplyr::filter(!is.na(.data$qx), !is.na(.data$qy))
        8. ├─dplyr::filter(., !is.na(.data$qx), !is.na(.data$qy))
        9. ├─fgeo.tool::type_ensure(., c("qx", "qy"), type = "numeric")
       10. ├─fgeo.tool:::check_subquad_dims(...)
       11. │ ├─base::stopifnot(is.data.frame(data))
       12. │ └─base::is.data.frame(data)
       13. └─fgeo.tool::check_crucial_names(., c("qx", "qy"))
      
      [ FAIL 1 | WARN 1 | SKIP 9 | PASS 287 ]
      Error: Test failures
      Execution halted
    ```

# finalfit

<details>

* Version: 1.0.5
* GitHub: https://github.com/ewenharrison/finalfit
* Source code: https://github.com/cran/finalfit
* Date/Publication: 2022-08-09 18:30:02 UTC
* Number of recursive dependencies: 150

Run `cloud_details(, "finalfit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘finalfit-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ff_glimpse
    > ### Title: Descriptive statistics for dataframe
    > ### Aliases: ff_glimpse finalfit_glimpse
    > 
    > ### ** Examples
    > 
    > library(finalfit)
    > dependent = 'mort_5yr'
    > explanatory = c("age", "nodes", "age.factor", "extent.factor", "perfor.factor")
    > colon_s %>%
    +   finalfit_glimpse(dependent, explanatory)
    Error: Can't merge the outer name `age` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_is(...) at test_modelwrappers.R:127:8
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─svyglmmulti(dstrat, "api00", "ell") %>% fit2df()
       5. ├─finalfit::fit2df(.)
       6. ├─finalfit:::fit2df.svyglmlist(.)
       7. │ └─.data %>% ...
       8. └─purrr::map_dfr(...)
       9.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 3 | WARN 16 | SKIP 0 | PASS 128 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘all_tables_examples.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Can't merge the outer name `time` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘survival.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘all_tables_examples.Rmd’ ‘data_prep.Rmd’ ‘export.Rmd’ ‘missing.Rmd’
      ‘survival.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyselect’
      All declared Imports should be used.
    ```

# finnts

<details>

* Version: 0.2.0
* GitHub: https://github.com/microsoft/finnts
* Source code: https://github.com/cran/finnts
* Date/Publication: 2022-07-14 15:40:05 UTC
* Number of recursive dependencies: 204

Run `cloud_details(, "finnts")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      New names:
      • `...1` -> `...7`
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 0 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error (test-forecast_time_series.R:23:1): (code run outside of `test_that()`) ──
      <dplyr:::mutate_error/rlang_error/error/condition>
      Error in `dplyr::mutate(.data, !!!calls)`: Problem while computing `Date_sin3_K1 = timetk::fourier_vec(x = Date,
      period = 3, K = 1L, type = "sin")`.
      Caused by error:
      ! object 'diff.median' not found
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘back-testing-and-hyperparameter-tuning.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    --- finished re-building ‘models-used-in-finnts.Rmd’
    
    --- re-building ‘parallel-processing.Rmd’ using rmarkdown
    --- finished re-building ‘parallel-processing.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘feature-engineering.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# functiondepends

<details>

* Version: 0.2.3
* GitHub: NA
* Source code: https://github.com/cran/functiondepends
* Date/Publication: 2022-02-21 19:00:05 UTC
* Number of recursive dependencies: 79

Run `cloud_details(, "functiondepends")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(functiondepends)
      > 
      > test_check("functiondepends")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 15 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-find-dependencies.R:49:3): no function ────────────────────────
      find_dependencies("x", envir = new.env()) not equal to tibble::tibble().
      Attributes: < Component "class": Lengths (1, 3) differ (string compare on first 1) >
      Attributes: < Component "class": 1 string mismatch >
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 15 ]
      Error: Test failures
      Execution halted
    ```

# ggasym

<details>

* Version: 0.1.6
* GitHub: https://github.com/jhrcook/ggasym
* Source code: https://github.com/cran/ggasym
* Date/Publication: 2021-05-15 20:10:02 UTC
* Number of recursive dependencies: 96

Run `cloud_details(, "ggasym")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘ggasym-corrr.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    
        intersect, setdiff, setequal, union
    
    --- finished re-building ‘ggasym-stats.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ggasym-corrr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggdag

<details>

* Version: 0.2.6
* GitHub: https://github.com/malcolmbarrett/ggdag
* Source code: https://github.com/cran/ggdag
* Date/Publication: 2022-08-26 21:34:37 UTC
* Number of recursive dependencies: 100

Run `cloud_details(, "ggdag")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggdag-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: activate_collider_paths
    > ### Title: Activate paths opened by stratifying on a collider
    > ### Aliases: activate_collider_paths
    > 
    > ### ** Examples
    > 
    > dag <- dagify(m ~ x + y, x ~ y)
    ...
      5. ├─dplyr::filter(., Var1 != Var2)
      6. ├─dplyr:::filter.data.frame(., Var1 != Var2)
      7. │ └─dplyr:::filter_rows(.data, ..., caller_env = caller_env())
      8. │   └─dplyr:::filter_eval(dots, mask = mask, error_call = error_call)
      9. │     ├─base::withCallingHandlers(...)
     10. │     └─mask$eval_all_filter(dots, env_filter)
     11. └─base::.handleSimpleError(...)
     12.   └─dplyr (local) h(simpleError(msg, call))
     13.     └─rlang::abort(bullets, call = error_call, parent = skip_internal_condition(e))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • geom_dag/geom-dag-label-repel-repels-labels.svg
      • ggdag/ggdag-classic-plots-basic-dag-classically.svg
      • instrumental/ggdag-instrumental-identifies-i-and-i2-as-instrumental.svg
      • paths/ggdag-paths-fan-draws-4-open-paths.svg
      • quick_plots/ggdag-butterfly-bias-is-a-butterfly.svg
      • quick_plots/ggdag-collider-triangle-is-triangle-too.svg
      • quick_plots/ggdag-confounder-triangle-is-triangle.svg
      • relations/ggdag-ancestors-identifies-v-w1-and-z1.svg
      • relations/ggdag-descendants-identifies-y-x-and-z1.svg
      • relations/ggdag-parents-identifies-z2-x-w1-and-w2.svg
      • themes/theme-dag-gray-grid.svg
      • themes/theme-dag-gray.svg
      • themes/theme-dag-grid.svg
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘bias-structures.Rmd’ using rmarkdown
    
    Attaching package: 'ggdag'
    
    The following object is masked from 'package:stats':
    
        filter
    
    New names:
    ...
    
        intersect, setdiff, setequal, union
    
    --- finished re-building ‘intro-to-ggdag.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘bias-structures.Rmd’ ‘intro-to-dags.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggiraphExtra

<details>

* Version: 0.3.0
* GitHub: https://github.com/cardiomoon/ggiraphExtra
* Source code: https://github.com/cran/ggiraphExtra
* Date/Publication: 2020-10-06 07:00:02 UTC
* Number of recursive dependencies: 101

Run `cloud_details(, "ggiraphExtra")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggiraphExtra-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggSpine
    > ### Title: Draw an interactive spinogram
    > ### Aliases: ggSpine
    > 
    > ### ** Examples
    > 
    > require(moonBook)
    ...
    
        addLabelDf, getMapping
    
    > require(ggplot2)
    Loading required package: ggplot2
    > acs$Dx=factor(acs$Dx,levels=c("Unstable Angina","NSTEMI","STEMI"))
    > ggSpine(data=acs,aes(x=age,fill=Dx,facet=sex),palette="Reds")
    Error: Can't merge the outer name `Female` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

# ggstream

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/ggstream
* Date/Publication: 2021-05-06 07:50:03 UTC
* Number of recursive dependencies: 53

Run `cloud_details(, "ggstream")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggstream-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: geom_stream
    > ### Title: geom_stream geom to create stream plots
    > ### Aliases: geom_stream
    > 
    > ### ** Examples
    > 
    > 
    ...
    > library(ggplot2)
    > set.seed(123)
    >  df <- data.frame(x = rep(1:10, 3),
    +                   y = rpois(30, 2),
    +                   group = sort(rep(c("A", "B", "C"), 10)))
    > ggplot(df, aes(x, y, fill = group, label = group)) +
    +   geom_stream()
    Error: Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# ggthemes

<details>

* Version: 4.2.4
* GitHub: https://github.com/jrnold/ggthemes
* Source code: https://github.com/cran/ggthemes
* Date/Publication: 2021-01-20 16:50:03 UTC
* Number of recursive dependencies: 96

Run `cloud_details(, "ggthemes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggthemes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: canva_pal
    > ### Title: Canva.com color palettes
    > ### Aliases: canva_pal
    > 
    > ### ** Examples
    > 
    > require("ggplot2")
    ...
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    Error: Can't merge the outer name `Fresh and bright` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 138 marked UTF-8 strings
    ```

# gMOIP

<details>

* Version: 1.4.7
* GitHub: https://github.com/relund/gMOIP
* Source code: https://github.com/cran/gMOIP
* Date/Publication: 2021-08-23 14:20:02 UTC
* Number of recursive dependencies: 142

Run `cloud_details(, "gMOIP")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gMOIP-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: convexHull
    > ### Title: Find the convex hull of a set of points.
    > ### Aliases: convexHull
    > 
    > ### ** Examples
    > 
    > ## 1D
    ...
    ✖ Cols in `x` but not `y`: `p1`, `p2`, `p3`.
    Backtrace:
        ▆
     1. └─gMOIP::plotHull3D(pts, argsPolygon3d = list(color = "red"))
     2.   ├─base::nrow(dplyr::intersect(pt[, 1:3], pN))
     3.   ├─dplyr::intersect(pt[, 1:3], pN)
     4.   └─dplyr:::intersect.data.frame(pt[, 1:3], pN)
     5.     └─dplyr:::check_compatible(x, y)
     6.       └─rlang::abort(bullets, call = error_call)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘bi-objective_2x.Rmd’ using rmarkdown
    Warning: ggrepel: 70 unlabeled data points (too many overlaps). Consider increasing max.overlaps
    Warning: ggrepel: 70 unlabeled data points (too many overlaps). Consider increasing max.overlaps
    Warning: ggrepel: 70 unlabeled data points (too many overlaps). Consider increasing max.overlaps
    Warning: ggrepel: 70 unlabeled data points (too many overlaps). Consider increasing max.overlaps
    --- finished re-building ‘bi-objective_2x.Rmd’
    
    --- re-building ‘bi-objective_3x_ex1.Rmd’ using rmarkdown
    New names:
    ...
    ✖ Cols in `y` but not `x`: `...1`, `...2`, `...3`.
    ✖ Cols in `x` but not `y`: `p1`, `p2`, `p3`.
    --- failed re-building ‘tri-objective.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘bi-objective_3x_ex1.Rmd’ ‘intro.Rmd’ ‘polytope_3d_ex1.Rmd’
      ‘tri-objective.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# grafify

<details>

* Version: 2.3.0
* GitHub: https://github.com/ashenoy-cmbi/grafify
* Source code: https://github.com/cran/grafify
* Date/Publication: 2022-05-30 09:30:06 UTC
* Number of recursive dependencies: 111

Run `cloud_details(, "grafify")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      boundary (singular) fit: see help('isSingular')
      boundary (singular) fit: see help('isSingular')
      boundary (singular) fit: see help('isSingular')
      [ FAIL 1 | WARN 13 | SKIP 0 | PASS 338 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-make_1way_data.R:12:3): make 1w data functions ────────────────
      summary(m1)$sigma (`actual`) not equal to 2 (`expected`).
      
        `actual`: 4
      `expected`: 2
      
      [ FAIL 1 | WARN 13 | SKIP 0 | PASS 338 ]
      Error: Test failures
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

*   checking examples ... ERROR
    ```
    Running examples in ‘gratia-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: draw.rootogram
    > ### Title: Draw a rootogram
    > ### Aliases: draw.rootogram
    > 
    > ### ** Examples
    > 
    > load_mgcv()
    > df <- data_sim("eg1", n = 1000, dist = "poisson", scale = 0.1, seed = 6)
    > 
    > # A poisson example
    > m <- gam(y ~ s(x0, bs = "cr") + s(x1, bs = "cr") + s(x2, bs = "cr") +
    +          s(x3, bs = "cr"), family = poisson(), data = df, method = "REML")
    > rg <- rootogram(m)
    Error in dn[[2L]] : subscript out of bounds
    Calls: rootogram ... <Anonymous> -> <Anonymous> -> <Anonymous> -> colnames
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
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
      • rootograms/draw-poisson-rootogram.svg
      Error: Test failures
      Execution halted
    ```

# gravitas

<details>

* Version: 0.1.3
* GitHub: https://github.com/Sayani07/gravitas
* Source code: https://github.com/cran/gravitas
* Date/Publication: 2020-06-25 12:10:07 UTC
* Number of recursive dependencies: 105

Run `cloud_details(, "gravitas")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gravitas-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: harmony
    > ### Title: Get possible set of harmonies for a given tsibble
    > ### Aliases: harmony
    > 
    > ### ** Examples
    > 
    > library(tsibbledata)
    ...
    New names:
    • `` -> `...1`
    • `` -> `...2`
    • `` -> `...3`
    • `` -> `...4`
    • `` -> `...5`
    • `` -> `...6`
    Error in if (gran1 == gran2) { : argument is of length zero
    Calls: %>% -> harmony -> is_harmony
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `if (gran1 == gran2) {
          warning("the two granularities should be distinct")
      }`: argument is of length zero
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-harmony.R:47:0
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─smart_meter10 %>% harmony(ugran = "day", filter_in = "wknd_wday")
       5. └─gravitas::harmony(., ugran = "day", filter_in = "wknd_wday")
       6.   └─gravitas::is_harmony(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 125 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘cricket.Rmd’ using rmarkdown
    --- finished re-building ‘cricket.Rmd’
    
    --- re-building ‘gravitas_vignette.Rmd’ using rmarkdown
    Quitting from lines 167-171 (gravitas_vignette.Rmd) 
    Error: processing vignette 'gravitas_vignette.Rmd' failed with diagnostics:
    argument is of length zero
    --- failed re-building ‘gravitas_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘gravitas_vignette.Rmd’
    
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

# groupdata2

<details>

* Version: 2.0.0
* GitHub: https://github.com/ludvigolsen/groupdata2
* Source code: https://github.com/cran/groupdata2
* Date/Publication: 2021-10-24 15:30:02 UTC
* Number of recursive dependencies: 111

Run `cloud_details(, "groupdata2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘groupdata2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: collapse_groups
    > ### Title: Collapse groups with categorical, numerical, ID, and size
    > ###   balancing
    > ### Aliases: collapse_groups
    > 
    > ### ** Examples
    > 
    ...
    > # Creates new `.coll_groups` column
    > df_coll <- collapse_groups(
    +   data = df,
    +   n = 3,
    +   group_cols = ".folds",
    +   balance_size = TRUE # enabled by default
    + )
    Error: Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      Backtrace:
          ▆
       1. ├─... %>% position_first(col = ".group_col") at test_summarize_balances.R:2924:2
       2. └─groupdata2:::position_first(., col = ".group_col")
       3.   └─groupdata2:::base_select(...)
       4.     └─base::tryCatch(...)
       5.       └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       6.         └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       7.           └─value[[3L]](cond)
      
      [ FAIL 33 | WARN 0 | SKIP 4 | PASS 2157 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘automatic_groups_with_groupdata2.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Error: processing vignette 'time_series_with_groupdata2.Rmd' failed with diagnostics:
    Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘time_series_with_groupdata2.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘time_series_with_groupdata2.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# groupr

<details>

* Version: 0.1.0
* GitHub: https://github.com/ngriffiths21/groupr
* Source code: https://github.com/cran/groupr
* Date/Publication: 2020-10-14 12:30:06 UTC
* Number of recursive dependencies: 63

Run `cloud_details(, "groupr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11.             │ └─dplyr::group_vars(x)
       12.             ├─groupr::group_by2(out, !!!newgrps)
       13.             └─groupr:::group_by2.data.frame(out, !!!newgrps)
       14.               └─rlang::abort(...)
      ── Error (test_pivots.R:11:1): (code run outside of `test_that()`) ─────────────
      Error in `infer_colgrps(., "is_ok")`: infer_colgrps: `x` must have data frame data columns
      Backtrace:
          ▆
       1. ├─... %>% infer_colgrps("is_ok") at test_pivots.R:11:0
       2. └─groupr::infer_colgrps(., "is_ok")
       3.   └─rlang::abort("infer_colgrps: `x` must have data frame data columns")
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 9 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction.Rmd’ using rmarkdown
    Quitting from lines 62-66 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    Can't subset columns that don't exist.
    ✖ Column `...1` doesn't exist.
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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

*   checking examples ... ERROR
    ```
    Running examples in ‘gtreg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tbl_listing
    > ### Title: Data Listing Table
    > ### Aliases: tbl_listing
    > 
    > ### ** Examples
    > 
    > library(dplyr, warn.conflicts = FALSE)
    ...
      5. └─purrr::imap_dfr(...)
      6.   └─purrr::map2_dfr(.x, vec_index(.x), .f, ..., .id = .id)
      7.     └─vctrs::vec_rbind(!!!res, .names_to = .id)
      8.       └─vctrs (local) `<fn>`()
      9.         └─vctrs::vec_default_ptype2(...)
     10.           └─vctrs::stop_incompatible_type(...)
     11.             └─vctrs:::stop_incompatible(...)
     12.               └─vctrs:::stop_vctrs(...)
     13.                 └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      * `` -> `...10`
      * `` -> `...11`
      * `` -> `...12`
      * `` -> `...13`
      * `` -> `...14`
      [ FAIL 7 | WARN 4 | SKIP 4 | PASS 34 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (4)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("testthat::expect_equal(...)",  : 
        replacement has 40 rows, data has 34
      Calls: test_check ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘counting-methods.Rmd’ using rmarkdown
    Quitting from lines 92-101 (counting-methods.Rmd) 
    Error: processing vignette 'counting-methods.Rmd' failed with diagnostics:
    Problem while computing `tbl_stats = pmap(...)`.
    Caused by error in `value[[3L]]()`:
    ! There was an error assembling the summary statistics for '..soc..1'
      with summary type 'dichotomous'.
    
    ...
       To change the summary type to continuous, add the argument
      `type = list(..soc..1 ~ 'continuous')`
    2. One of the functions or statistics from the `statistic=` argument is not valid.
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
    
    > ### Name: add_n.tbl_summary
    > ### Title: Add column with N
    > ### Aliases: add_n.tbl_summary add_n.tbl_svysummary
    > 
    > ### ** Examples
    > 
    > # Example 1 ----------------------------------
    ...
    • `` -> `...8`
    • `` -> `...9`
    • `` -> `...10`
    • `` -> `...11`
    • `` -> `...12`
    • `` -> `...13`
    Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("... %>% add_n()",  : 
      replacement has 29 rows, data has 23
    Calls: %>% ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          matches
      
      > 
      > test_check("gtsummary")
      Starting 2 test processes
      [ FAIL 5 | WARN 16 | SKIP 74 | PASS 5 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (74)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("trial %>% tbl_cross(grade, stage) %>% add_p(source_note = TRUE)",  : 
        replacement has 34 rows, data has 28
      Calls: test_check ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘gallery.Rmd’ using rmarkdown
    --- finished re-building ‘gallery.Rmd’
    
    --- re-building ‘gtsummary_definition.Rmd’ using rmarkdown
    New names:
    • `` -> `...1`
    • `` -> `...2`
    • `` -> `...3`
    • `` -> `...4`
    ...
       To change the summary type to continuous, add the argument
      `type = list(age ~ 'continuous')`
    2. One of the functions or statistics from the `statistic=` argument is not valid.
    --- failed re-building ‘themes.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘gtsummary_definition.Rmd’ ‘themes.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# headliner

<details>

* Version: 0.0.2
* GitHub: https://github.com/rjake/headliner
* Source code: https://github.com/cran/headliner
* Date/Publication: 2022-06-26 23:40:02 UTC
* Number of recursive dependencies: 71

Run `cloud_details(, "headliner")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘headliner-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_headline_column
    > ### Title: Add column of headlines
    > ### Aliases: add_headline_column
    > 
    > ### ** Examples
    > 
    > 
    ...
    +     x = bo_domestic,
    +     y = bo_intl,
    +     headline = "{film} was ${delta}M higher {trend} (${x}M vs ${y}M)",
    +     trend_phrases = trend_terms(more = "domestically", less = "internationally")
    +   ) |>
    +   knitr::kable("pandoc")
    Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("knitr::kable(...)",  : 
      replacement has 18 rows, data has 12
    Calls: <Anonymous> ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(headliner)
      > 
      > test_check("headliner")
      [ FAIL 9 | WARN 0 | SKIP 0 | PASS 95 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("headliner::add_headline_column(mtcars, gear, carb)",  : 
        replacement has 17 rows, data has 11
      Calls: test_check ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘intro.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    yes = if_match, no = .data$headline)`.
    Caused by error in `.data$x == .data$y`:
    ! comparison of these types is not implemented
    --- failed re-building ‘intro.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# healthyR

<details>

* Version: 0.2.0
* GitHub: https://github.com/spsanderson/healthyR
* Source code: https://github.com/cran/healthyR
* Date/Publication: 2022-07-18 19:40:02 UTC
* Number of recursive dependencies: 155

Run `cloud_details(, "healthyR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘healthyR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ts_census_los_daily_tbl
    > ### Title: Time Series - Census and LOS by Day
    > ### Aliases: ts_census_los_daily_tbl
    > 
    > ### ** Examples
    > 
    > library(healthyR)
    ...
    New names:
    • `` -> `...1`
    New names:
    • `...1` -> `...7`
    Warning: Unknown or uninitialised column: `diff.q1`.
    Warning: Unknown or uninitialised column: `diff.q3`.
    Error in if (is_month_or_qtr & is_irregular) { : 
      argument is of length zero
    Calls: ts_census_los_daily_tbl ... <Anonymous> -> <Anonymous> -> handle_day_of_month_irregular
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        data   1.5Mb
        doc    3.8Mb
    ```

# himach

<details>

* Version: 0.3.0
* GitHub: https://github.com/david6marsh/himach
* Source code: https://github.com/cran/himach
* Date/Publication: 2022-06-09 22:40:09 UTC
* Number of recursive dependencies: 108

Run `cloud_details(, "himach")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘himach-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_route_grid
    > ### Title: Make lat-long grid for route finding
    > ### Aliases: make_route_grid
    > 
    > ### ** Examples
    > 
    > NZ_buffer <- hm_get_test("buffer")
    ...
    +                            target_km = 300, classify = TRUE,
    +                            lat_min = -49, lat_max = -32,
    +                            long_min = 162, long_max = 182)
    + )
    Made the grid:0
    Making the basic lattice:
    Error: Can't merge the outer name `0` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Timing stopped at: 0.133 0 0.133
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─testthat::expect_message(...) at test_grid.R:39:2
        2. │ └─testthat:::quasi_capture(enquo(object), label, capture_messages)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─himach::make_route_grid(...)
        7. │ └─... %>% select(-.data$grp)
        8. ├─dplyr::select(., -.data$grp)
        9. └─purrr::map_dfr(., ~as.data.frame(.))
       10.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 2 | WARN 0 | SKIP 1 | PASS 69 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Supersonic_Routes.Rmd’ using rmarkdown
    Quitting from lines 201-218 (Supersonic_Routes.Rmd) 
    Error: processing vignette 'Supersonic_Routes.Rmd' failed with diagnostics:
    Can't merge the outer name `0` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘Supersonic_Routes.Rmd’
    
    --- re-building ‘Supersonic_Routes_in_depth.Rmd’ using rmarkdown
    --- finished re-building ‘Supersonic_Routes_in_depth.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Supersonic_Routes.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# HLMdiag

<details>

* Version: 0.5.0
* GitHub: https://github.com/aloy/HLMdiag
* Source code: https://github.com/cran/HLMdiag
* Date/Publication: 2021-05-02 04:30:08 UTC
* Number of recursive dependencies: 104

Run `cloud_details(, "HLMdiag")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─HLMdiag::hlm_augment(chem.lmer, level = "school:lea") at test-hlm_augment.R:32:0
        2. ├─HLMdiag:::hlm_augment.lmerMod(chem.lmer, level = "school:lea")
        3. │ ├─HLMdiag::hlm_resid(...)
        4. │ └─HLMdiag:::hlm_resid.lmerMod(...)
        5. │   ├─HLMdiag::LSresids(object, level = level, stand = standardize)
        6. │   └─HLMdiag:::LSresids.lmerMod(object, level = level, stand = standardize)
        7. │     └─tibble::tibble(group = row.order2, purrr::map_dfr(ls.ranef, ~dplyr::bind_cols(.x)))
        8. │       └─tibble:::tibble_quos(xs, .rows, .name_repair)
        9. │         └─rlang::eval_tidy(xs[[j]], mask)
       10. └─purrr::map_dfr(ls.ranef, ~dplyr::bind_cols(.x))
       11.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 1 | WARN 0 | SKIP 6 | PASS 400 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.5Mb
      sub-directories of 1Mb or more:
        libs   6.6Mb
    ```

# infer

<details>

* Version: 1.0.3
* GitHub: https://github.com/tidymodels/infer
* Source code: https://github.com/cran/infer
* Date/Publication: 2022-08-22 18:50:03 UTC
* Number of recursive dependencies: 126

Run `cloud_details(, "infer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘infer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calculate
    > ### Title: Calculate summary statistics
    > ### Aliases: calculate
    > 
    > ### ** Examples
    > 
    > 
    ...
    • `` -> `...1`
    • `` -> `...2`
    New names:
    • `` -> `...1`
    • `` -> `...2`
    New names:
    • `` -> `...1`
    • `` -> `...2`
    Error: degree is not a level of the explanatory variable.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • `` -> `...2`
      New names:
      • `` -> `...1`
      • `` -> `...2`
      New names:
      • `` -> `...1`
      • `` -> `...2`
      New names:
      • `` -> `...1`
      • `` -> `...2`
      New names:
      • `` -> `...1`
      • `` -> `...2`
      Error: female is not a level of the explanatory variable.
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘anova.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Error: processing vignette 't_test.Rmd' failed with diagnostics:
    degree is not a level of the explanatory variable.
    --- failed re-building ‘t_test.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘anova.Rmd’ ‘chi_squared.Rmd’ ‘infer.Rmd’
      ‘observed_stat_examples.Rmd’ ‘t_test.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# interpretCI

<details>

* Version: 0.1.1
* GitHub: https://github.com/cardiomoon/interpretCI
* Source code: https://github.com/cran/interpretCI
* Date/Publication: 2022-01-28 08:50:02 UTC
* Number of recursive dependencies: 91

Run `cloud_details(, "interpretCI")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘interpretCI-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: meanCI.data.frame
    > ### Title: Calculate confidence intervals of mean or difference between
    > ###   means in a data.frame
    > ### Aliases: meanCI.data.frame meanCI_sub
    > 
    > ### ** Examples
    > 
    ...
    2           STEMI.Female           STEMI.Male 168.691 9.68 [95CI 6.96; 12.40]
    3 Unstable Angina.Female Unstable Angina.Male 319.818  6.28 [95CI 4.13; 8.43]
          ...5      ...6
    1 -0.13490 0.8929633
    2 -0.23206 0.8167719
    3 -3.40243 0.0007528
    > acs %>% select(sex,TC,TG,HDLC) %>% meanCI(group=sex)
    Error: Can't merge the outer name `Female` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Confidence_interval_for_a_mean.Rmd’ using rmarkdown
    --- finished re-building ‘Confidence_interval_for_a_mean.Rmd’
    
    --- re-building ‘Confidence_interval_for_a_proportion.Rmd’ using rmarkdown
    --- finished re-building ‘Confidence_interval_for_a_proportion.Rmd’
    
    --- re-building ‘Confidence_interval_for_paired_mean_difference.Rmd’ using rmarkdown
    --- finished re-building ‘Confidence_interval_for_paired_mean_difference.Rmd’
    
    ...
    Error: processing vignette 'Package_interpretCI.Rmd' failed with diagnostics:
    Can't merge the outer name `Female` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘Package_interpretCI.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Package_interpretCI.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘moonBook’
      All declared Imports should be used.
    ```

# janitor

<details>

* Version: 2.1.0
* GitHub: https://github.com/sfirke/janitor
* Source code: https://github.com/cran/janitor
* Date/Publication: 2021-01-05 01:10:04 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "janitor")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       14.                 └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      ── Error (test-statistical-tests.R:106:3): totals are excluded from the statistical tests, #385 ──
      Error in `sum(x)`: invalid 'type' (character) of argument
      Backtrace:
          ▆
       1. ├─base::suppressWarnings(chisq.test(adorn_totals(ttab, "both"))) at test-statistical-tests.R:106:2
       2. │ └─base::withCallingHandlers(...)
       3. ├─janitor::chisq.test(adorn_totals(ttab, "both"))
       4. ├─janitor:::chisq.test.tabyl(adorn_totals(ttab, "both"))
       5. │ └─... %>% stats::chisq.test(...)
       6. └─stats::chisq.test(., ...)
      
      [ FAIL 40 | WARN 0 | SKIP 1 | PASS 576 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘janitor.Rmd’ using rmarkdown
    
    Attaching package: 'janitor'
    
    The following objects are masked from 'package:stats':
    
        chisq.test, fisher.test
    
    --- finished re-building ‘janitor.Rmd’
    ...
    Quitting from lines 69-72 (tabyls.Rmd) 
    Error: processing vignette 'tabyls.Rmd' failed with diagnostics:
    Can't combine `eye_color$...1` <character> and `n$...1` <integer>.
    --- failed re-building ‘tabyls.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tabyls.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# lcsm

<details>

* Version: 0.1.2
* GitHub: https://github.com/milanwiedemann/lcsm
* Source code: https://github.com/cran/lcsm
* Date/Publication: 2020-07-24 18:00:02 UTC
* Number of recursive dependencies: 139

Run `cloud_details(, "lcsm")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘v0-longitudinal-plots.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    --- failed re-building ‘v3-extract-tutorial.Rmd’
    
    --- re-building ‘v4-simulate-data.Rmd’ using rmarkdown
    --- finished re-building ‘v4-simulate-data.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘v3-extract-tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘data.table’ ‘utf8’
      All declared Imports should be used.
    ```

# mapbayr

<details>

* Version: 0.7.3
* GitHub: https://github.com/FelicienLL/mapbayr
* Source code: https://github.com/cran/mapbayr
* Date/Publication: 2022-05-26 13:30:02 UTC
* Number of recursive dependencies: 68

Run `cloud_details(, "mapbayr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mapbayr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: data_helpers
    > ### Title: Data helpers
    > ### Aliases: data_helpers adm_lines adm_lines.mrgmod obs_lines
    > ###   obs_lines.mrgmod add_covariates add_covariates.mrgmod see_data
    > 
    > ### ** Examples
    > 
    ...
    > mod <- exmodel(add_exdata = FALSE)
    > 
    > mod %>%
    +   adm_lines(amt = 10000, cmt = 1) %>%
    +   obs_lines(time = c(1.5, 4.4, 7.5, 24.6), DV = c(91.2904, 110.826, 79.384, 20.6671), cmt = 2) %>%
    +   # get_data() # for curiosity, you can extract the data set at this step
    +   mapbayest()
    Error: Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─testthat::expect_message(mapbayest(mod, dat), "Reset with ") at test-verbose.R:6:2
        2. │ └─testthat:::expect_condition_matching(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─mapbayr::mapbayest(mod, dat)
        8.   └─mapbayr::postprocess.output(...)
        9.     └─purrr::map_dfr(post, "mapbay_tab")
       10.       └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 19 | WARN 0 | SKIP 4 | PASS 209 ]
      Error: Test failures
      Execution halted
    ```

# metacore

<details>

* Version: 0.0.4
* GitHub: NA
* Source code: https://github.com/cran/metacore
* Date/Publication: 2022-03-31 15:00:02 UTC
* Number of recursive dependencies: 70

Run `cloud_details(, "metacore")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘metacore-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_control_term
    > ### Title: Get Control Term
    > ### Aliases: get_control_term
    > 
    > ### ** Examples
    > 
    > meta_ex <- spec_to_metacore(metacore_example("p21_mock.xlsx"))
    Error: Can't merge the outer name `Variables` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─... %>% ... at test-reader.R:383:3
       2. ├─dplyr::mutate(...)
       3. ├─dplyr::select(...)
       4. ├─dplyr::arrange(., dataset, variable)
       5. ├─metacore::spec_type_to_value_spec(spec)
       6. │ └─doc[var_sheet] %>% ...
       7. └─purrr::map_dfr(...)
       8.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 54 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Building_Specification_Readers.Rmd’ using rmarkdown
    Quitting from lines 186-195 (Building_Specification_Readers.Rmd) 
    Error: processing vignette 'Building_Specification_Readers.Rmd' failed with diagnostics:
    Can't merge the outer name `Variables` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘Building_Specification_Readers.Rmd’
    
    --- re-building ‘Example.Rmd’ using rmarkdown
    --- finished re-building ‘Example.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Building_Specification_Readers.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# metatools

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/metatools
* Date/Publication: 2022-04-20 08:52:30 UTC
* Number of recursive dependencies: 66

Run `cloud_details(, "metatools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘metatools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: create_var_from_codelist
    > ### Title: Create Variable from Codelist
    > ### Aliases: create_var_from_codelist
    > 
    > ### ** Examples
    > 
    > library(metacore)
    ...
    +   1, "M", "Male",
    +   2, "F", "Female",
    +   3, "F", "Female",
    +   4, "U", "Unknown",
    +   5, "M", "Male",
    + )
    > spec <- spec_to_metacore(metacore_example("p21_mock.xlsx"), quiet = TRUE)
    Error: Can't merge the outer name `Variables` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `vctrs::vec_rbind(!!!res, .names_to = .id)`: Can't combine `STUDYID$...1` <character> and `IDVARVAL$...1` <integer>.
      Backtrace:
          ▆
       1. └─purrr::map_df(...) at test-supp.R:69:3
       2.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
       3.     └─vctrs (local) `<fn>`()
       4.       └─vctrs::vec_default_ptype2(...)
       5.         └─vctrs::stop_incompatible_type(...)
       6.           └─vctrs:::stop_incompatible(...)
       7.             └─vctrs:::stop_vctrs(...)
       8.               └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 43 ]
      Error: Test failures
      Execution halted
    ```

# mobr

<details>

* Version: 2.0.2
* GitHub: NA
* Source code: https://github.com/cran/mobr
* Date/Publication: 2021-02-10 06:30:02 UTC
* Number of recursive dependencies: 75

Run `cloud_details(, "mobr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mobr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_delta_stats
    > ### Title: Conduct the MoB tests on drivers of biodiversity across scales.
    > ### Aliases: get_delta_stats
    > 
    > ### ** Examples
    > 
    > data(inv_comm)
    > data(inv_plot_attr)
    > inv_mob_in = make_mob_in(inv_comm, inv_plot_attr, coord_names = c('x', 'y'))
    > inv_mob_out = get_delta_stats(inv_mob_in, 'group', ref_level='uninvaded',
    +                            type='discrete', log_scale=TRUE, n_perm=3)
    Error: Can't merge the outer name `SAD` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

# modeldb

<details>

* Version: 0.2.3
* GitHub: https://github.com/tidymodels/modeldb
* Source code: https://github.com/cran/modeldb
* Date/Publication: 2022-08-16 20:30:15 UTC
* Number of recursive dependencies: 92

Run `cloud_details(, "modeldb")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [1]  1.28975 - NA == NA
      [2] -0.12503 - NA == NA
      [3]  0.20975 - NA == NA
      [4]  0.00474 - NA == NA
      ── Failure (test_lr.R:40:3): MLR matches lm() with auto_count set to TRUE ──────
      lm(wt ~ mpg + qsec + hp, data = mtcars) %>% coef() %>% as.numeric() not equal to ... %>% as.numeric().
      4/4 mismatches (average diff: NaN)
      [1]  1.28975 - NA == NA
      [2] -0.12503 - NA == NA
      [3]  0.20975 - NA == NA
      [4]  0.00474 - NA == NA
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 17 ]
      Error: Test failures
      Execution halted
    ```

# modeltime

<details>

* Version: 1.2.2
* GitHub: https://github.com/business-science/modeltime
* Source code: https://github.com/cran/modeltime
* Date/Publication: 2022-06-07 21:50:02 UTC
* Number of recursive dependencies: 243

Run `cloud_details(, "modeltime")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘modeltime-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: modeltime_accuracy
    > ### Title: Calculate Accuracy Metrics
    > ### Aliases: modeltime_accuracy
    > 
    > ### ** Examples
    > 
    > library(tidymodels)
    ...
        ▆
     1. ├─... %>% ...
     2. ├─modeltime::modeltime_accuracy(...)
     3. │ └─modeltime::is_calibrated(object)
     4. │   └─c(".type", ".calibration_data") %in% names(object)
     5. ├─modeltime::modeltime_calibrate(., new_data = testing(splits))
     6. └─modeltime:::modeltime_calibrate.mdl_time_tbl(., new_data = testing(splits))
     7.   └─modeltime:::validate_modeltime_calibration(ret)
     8.     └─rlang::abort("All models failed Modeltime Calibration.")
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3         3 <fit[+]> LM                                 NA         
      # A tibble: 1 × 4
        .model_id .model   .model_desc             .nested.col
            <int> <list>   <chr>                   <lgl>      
      1         1 <fit[+]> ARIMA(0,1,1)(1,1,1)[12] NA         
      [ FAIL 25 | WARN 59 | SKIP 22 | PASS 199 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (22)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("... %>% split_nested_timeseries(.length_test = 52)",  : 
        replacement has 42 rows, data has 39
      Calls: test_check ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘getting-started-with-modeltime.Rmd’ using rmarkdown
    ── Attaching packages ────────────────────────────────────── tidymodels 1.0.0 ──
    ✔ broom        1.0.0          ✔ recipes      1.0.1     
    ✔ dials        1.0.0          ✔ rsample      1.1.0     
    ✔ dplyr        1.0.9          ✔ tibble       3.1.8     
    ✔ ggplot2      3.3.6          ✔ tidyr        1.2.0     
    ✔ infer        1.0.3          ✔ tune         1.0.0     
    ✔ modeldata    1.0.0          ✔ workflows    1.0.0     
    ✔ parsnip      1.0.1          ✔ workflowsets 1.0.0     
    ...
    Quitting from lines 325-334 (getting-started-with-modeltime.Rmd) 
    Error: processing vignette 'getting-started-with-modeltime.Rmd' failed with diagnostics:
    `data` should be a data.frame
    --- failed re-building ‘getting-started-with-modeltime.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘getting-started-with-modeltime.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# modeltime.ensemble

<details>

* Version: 1.0.1
* GitHub: https://github.com/business-science/modeltime.ensemble
* Source code: https://github.com/cran/modeltime.ensemble
* Date/Publication: 2022-06-09 12:20:02 UTC
* Number of recursive dependencies: 214

Run `cloud_details(, "modeltime.ensemble")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      # Modeltime Table
      # A tibble: 1 × 3
        .model_id .model .model_desc                        
            <int> <list> <chr>                              
      1         1 <NULL> RECURSIVE ENSEMBLE (MEAN): 2 MODELS
      [ FAIL 3 | WARN 49 | SKIP 5 | PASS 75 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (5)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      Error in `$<-.data.frame`(`*tmp*`, "call_text", value = c("... %>% split_nested_timeseries(.length_test = 52)",  : 
        replacement has 42 rows, data has 39
      Calls: test_check ... trace_format -> trace_as_tree -> $<- -> $<-.data.frame
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘getting-started-with-modeltime-ensemble.Rmd’ using rmarkdown
    ── Attaching packages ────────────────────────────────────── tidymodels 1.0.0 ──
    ✔ broom        1.0.0          ✔ recipes      1.0.1     
    ✔ dials        1.0.0          ✔ rsample      1.1.0     
    ✔ dplyr        1.0.9          ✔ tibble       3.1.8     
    ✔ ggplot2      3.3.6          ✔ tidyr        1.2.0     
    ✔ infer        1.0.3          ✔ tune         1.0.0     
    ✔ modeldata    1.0.0          ✔ workflows    1.0.0     
    ✔ parsnip      1.0.1          ✔ workflowsets 1.0.0     
    ...
    Quitting from lines 89-97 (getting-started-with-modeltime-ensemble.Rmd) 
    Error: processing vignette 'getting-started-with-modeltime-ensemble.Rmd' failed with diagnostics:
    object 'diff.median' not found
    --- failed re-building ‘getting-started-with-modeltime-ensemble.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘getting-started-with-modeltime-ensemble.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘parsnip’
      All declared Imports should be used.
    ```

# modeltime.gluonts

<details>

* Version: 0.1.0
* GitHub: https://github.com/business-science/modeltime.gluonts
* Source code: https://github.com/cran/modeltime.gluonts
* Date/Publication: 2020-11-30 09:40:02 UTC
* Number of recursive dependencies: 205

Run `cloud_details(, "modeltime.gluonts")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘getting-started.Rmd’ using rmarkdown
    ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ✔ ggplot2 3.3.6          ✔ purrr   0.3.4.9000
    ✔ tibble  3.1.8          ✔ dplyr   1.0.9     
    ✔ tidyr   1.2.0          ✔ stringr 1.4.1     
    ✔ readr   2.1.2          ✔ forcats 0.5.2     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ...
    ℹ The error occurred in group 1: id = H10.
    Caused by error in `seq.default()`:
    ! 'from' must be of length 1
    --- failed re-building ‘getting-started.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘getting-started.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# modeltime.resample

<details>

* Version: 0.2.1
* GitHub: https://github.com/business-science/modeltime.resample
* Source code: https://github.com/cran/modeltime.resample
* Date/Publication: 2022-06-07 14:30:03 UTC
* Number of recursive dependencies: 212

Run `cloud_details(, "modeltime.resample")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       28.           └─tidyselect:::eval_c(expr, data_mask, context_mask)
       29.             └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
       30.               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
       31.                 └─tidyselect:::as_indices_sel_impl(...)
       32.                   └─tidyselect:::as_indices_impl(x, vars, call = call, strict = strict)
       33.                     └─tidyselect:::chr_as_locations(x, vars, call = call)
       34.                       └─vctrs::vec_as_location(x, n = length(vars), names = vars)
       35.                         └─vctrs (local) `<fn>`()
       36.                           └─vctrs:::stop_subscript_oob(...)
       37.                             └─vctrs:::stop_subscript(...)
       38.                               └─rlang::abort(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 6 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘getting-started.Rmd’ using rmarkdown
    ── Attaching packages ────────────────────────────────────── tidymodels 1.0.0 ──
    ✔ broom        1.0.0          ✔ recipes      1.0.1     
    ✔ dials        1.0.0          ✔ rsample      1.1.0     
    ✔ dplyr        1.0.9          ✔ tibble       3.1.8     
    ✔ ggplot2      3.3.6          ✔ tidyr        1.2.0     
    ✔ infer        1.0.3          ✔ tune         1.0.0     
    ✔ modeldata    1.0.0          ✔ workflows    1.0.0     
    ✔ parsnip      1.0.1          ✔ workflowsets 1.0.0     
    ...
    ℹ The error occurred in group 1: id = 1_1.
    Caused by error in `if (stringr::str_detect(tolower(by), pattern = "(sec)|(min)|(hour)")) ...`:
    ! argument is of length zero
    --- failed re-building ‘panel-data.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘getting-started.Rmd’ ‘panel-data.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘crayon’ ‘dials’ ‘glue’ ‘parsnip’
      All declared Imports should be used.
    ```

# moexer

<details>

* Version: 0.1.0
* GitHub: https://github.com/x1o/moexer
* Source code: https://github.com/cran/moexer
* Date/Publication: 2021-02-01 08:30:03 UTC
* Number of recursive dependencies: 85

Run `cloud_details(, "moexer")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(moexer)
      > 
      > test_check("moexer")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 3 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-candles.R:33:5): Specifying wrong symbols only returns an empty tibble ──
      `parsed_query` not equal to `ref_parsed_query`.
      Attributes: < Component "class": Lengths (1, 3) differ (string compare on first 1) >
      Attributes: < Component "class": 1 string mismatch >
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# monoClust

<details>

* Version: 1.2.1
* GitHub: https://github.com/vinhtantran/monoClust
* Source code: https://github.com/cran/monoClust
* Date/Publication: 2021-02-15 15:00:02 UTC
* Number of recursive dependencies: 88

Run `cloud_details(, "monoClust")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘monoClust-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: MonoClust
    > ### Title: Monothetic Clustering
    > ### Aliases: MonoClust
    > 
    > ### ** Examples
    > 
    > # Very simple data set
    ...
    > wind_reduced <- wind_sensit_2007[sample.int(nrow(wind_sensit_2007), 10), ]
    > circular_wind <- MonoClust(wind_reduced, cir.var = 3, nclusters = 2)
    New names:
    • `` -> `...1`
    New names:
    • `` -> `...1`
    Error in mult_inertia(i, datamems, cutsmems, dist, mems) : 
      task 1 failed - "no applicable method for 'pull' applied to an object of class "c('double', 'numeric')""
    Calls: MonoClust ... <Anonymous> -> map -> .f -> find_split -> %op% -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘monoclust.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
    Quitting from lines 135-139 (monoclust.Rmd) 
    Error: processing vignette 'monoclust.Rmd' failed with diagnostics:
    task 1 failed - "no applicable method for 'pull' applied to an object of class "c('double', 'numeric')""
    --- failed re-building ‘monoclust.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘monoclust.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# MRFcov

<details>

* Version: 1.0.38
* GitHub: https://github.com/nicholasjclark/MRFcov
* Source code: https://github.com/cran/MRFcov
* Date/Publication: 2021-03-18 06:40:03 UTC
* Number of recursive dependencies: 109

Run `cloud_details(, "MRFcov")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Bird_Parasite_CRF.Rmd’ using rmarkdown
    Loading required package: glmnet
    Loading required package: Matrix
    Loaded glmnet 4.1-4
    Welcome to MRFcov. If you use the package, please cite as: Clark, NJ, Wells, K and Lindberg, O. 2018. Unravelling changing interspecific interactions across environmental gradients using Markov random fields. Ecology doi: 10.1002/ecy.2221 
    Quitting from lines 92-102 (Bird_Parasite_CRF.Rmd) 
    Error: processing vignette 'Bird_Parasite_CRF.Rmd' failed with diagnostics:
    'x' must be atomic
    ...
    --- finished re-building ‘CRF_data_prep.Rmd’
    
    --- re-building ‘Gaussian_Poisson_CRFs.Rmd’ using rmarkdown
    --- finished re-building ‘Gaussian_Poisson_CRFs.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Bird_Parasite_CRF.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# mshap

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/mshap
* Date/Publication: 2021-06-17 08:40:02 UTC
* Number of recursive dependencies: 120

Run `cloud_details(, "mshap")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-mshap.R:43:3): Basic case works ───────────────────────────────
      class(res$shap_vals) (`actual`) not equal to c("tbl_df", "tbl", "data.frame") (`expected`).
      
      `actual`:   "data.frame"                   
      `expected`: "tbl_df"     "tbl" "data.frame"
      ── Failure (test-mshap.R:87:3): Matrices Work ──────────────────────────────────
      class(res$shap_vals) (`actual`) not equal to c("tbl_df", "tbl", "data.frame") (`expected`).
      
      `actual`:   "data.frame"                   
      `expected`: "tbl_df"     "tbl" "data.frame"
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 25 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyselect’
      All declared Imports should be used.
    ```

# multifear

<details>

* Version: 0.1.2
* GitHub: https://github.com/AngelosPsy/multifear
* Source code: https://github.com/cran/multifear
* Date/Publication: 2021-06-01 20:50:02 UTC
* Number of recursive dependencies: 124

Run `cloud_details(, "multifear")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multifear-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rm_anova_mf
    > ### Title: rm_anova_mf
    > ### Aliases: rm_anova_mf
    > 
    > ### ** Examples
    > 
    > # Load example data
    ...
    > cs1 <- paste0("CSP", 1:10)
    > cs2 <- paste0("CSM", 1:10)
    > subj <- "id"
    > group <- "group"
    > 
    > # Repeated measures ANOVA without groups
    > rm_anova_mf(cs1 = cs1, cs2 = cs2, subj = subj, data = example_data, time = TRUE)
    Error: Can't merge the outer name `subj:cs` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       14. │           ├─base::suppressWarnings(purrr::map_df(tmpANOVA$aov, .f = broom::tidy))
       15. │           │ └─base::withCallingHandlers(...)
       16. │           └─purrr::map_df(tmpANOVA$aov, .f = broom::tidy)
       17. │             └─vctrs::vec_rbind(!!!res, .names_to = .id)
       18. ├─dplyr::mutate(...)
       19. ├─dplyr::rename_all(., list(~stringr::str_replace(., "term", "method")))
       20. │ └─dplyr::tbl_vars(.tbl)
       21. │   ├─dplyr:::new_sel_vars(tbl_vars_dispatch(x), group_vars(x))
       22. │   │ └─base::structure(...)
       23. │   └─dplyr:::tbl_vars_dispatch(x)
       24. └─dplyr::filter(...)
      
      [ FAIL 7 | WARN 1 | SKIP 0 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ez’
      All declared Imports should be used.
    ```

# naniar

<details>

* Version: 0.6.1
* GitHub: https://github.com/njtierney/naniar
* Source code: https://github.com/cran/naniar
* Date/Publication: 2021-05-14 10:20:02 UTC
* Number of recursive dependencies: 180

Run `cloud_details(, "naniar")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘naniar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: oceanbuoys
    > ### Title: West Pacific Tropical Atmosphere Ocean Data, 1993 & 1997.
    > ### Aliases: oceanbuoys
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    ...
    New names:
    • `` -> `...1`
    New names:
    • `` -> `...1`
    New names:
    • `` -> `...1`
    Error in `[.data.frame`(purrr::map_df(x, ~round(mean(is.na(.)) * 100,  : 
      undefined columns selected
    Calls: vis_miss ... label_col_missing_pct -> %>% -> <Anonymous> -> [ -> [.data.frame
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      out$x not equal to c(1, NA, NA).
      target is NULL, current is numeric
      ── Failure (test-replace-with-na-scoped-var.R:17:3): suggested multiple values are replaced with NAs ──
      out$x not equal to c(1, NA, NA, NA).
      target is NULL, current is numeric
      ── Failure (test-replace-with-na-scoped-var.R:30:3): all columns are affected by _all ──
      out$x not equal to c(1, 3, NA, NA, -98).
      target is NULL, current is numeric
      ── Failure (test-replace-with-na-scoped-var.R:31:3): all columns are affected by _all ──
      out$z not equal to c(-100, NA, -98, -101, -1).
      target is NULL, current is numeric
      
      [ FAIL 16 | WARN 0 | SKIP 33 | PASS 521 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘exploring-imputed-values.Rmd’ using rmarkdown
    --- finished re-building ‘exploring-imputed-values.Rmd’
    
    --- re-building ‘getting-started-w-naniar.Rmd’ using rmarkdown
    Quitting from lines 77-80 (getting-started-w-naniar.Rmd) 
    Error: processing vignette 'getting-started-w-naniar.Rmd' failed with diagnostics:
    undefined columns selected
    --- failed re-building ‘getting-started-w-naniar.Rmd’
    
    ...
    --- finished re-building ‘replace-with-na.Rmd’
    
    --- re-building ‘special-missing-values.Rmd’ using rmarkdown
    --- finished re-building ‘special-missing-values.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘getting-started-w-naniar.Rmd’ ‘naniar-visualisation.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# nanostringr

<details>

* Version: 0.4.0
* GitHub: https://github.com/TalhoukLab/nanostringr
* Source code: https://github.com/cran/nanostringr
* Date/Publication: 2022-08-20 00:10:16 UTC
* Number of recursive dependencies: 99

Run `cloud_details(, "nanostringr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nanostringr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: HKnorm
    > ### Title: Normalization to Housekeeping Genes
    > ### Aliases: HKnorm
    > 
    > ### ** Examples
    > 
    > HKnorm(ovd.r)
    ...
      2. │ └─raw[raw$Code.Class == "Endogenous", 1:3] %>% ...
      3. ├─dplyr::bind_cols(., norm)
      4. │ ├─dplyr:::fix_call(vec_cbind(!!!dots, .name_repair = .name_repair))
      5. │ │ └─base::withCallingHandlers(...)
      6. │ └─vctrs::vec_cbind(!!!dots, .name_repair = .name_repair)
      7. └─vctrs::stop_incompatible_size(...)
      8.   └─vctrs:::stop_incompatible(...)
      9.     └─vctrs:::stop_vctrs(...)
     10.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─nanostringr::HKnorm(ovd.r)
        5. │ └─raw[raw$Code.Class == "Endogenous", 1:3] %>% ...
        6. ├─dplyr::bind_cols(., norm)
        7. │ ├─dplyr:::fix_call(vec_cbind(!!!dots, .name_repair = .name_repair))
        8. │ │ └─base::withCallingHandlers(...)
        9. │ └─vctrs::vec_cbind(!!!dots, .name_repair = .name_repair)
       10. └─vctrs::stop_incompatible_size(...)
       11.   └─vctrs:::stop_incompatible(...)
       12.     └─vctrs:::stop_vctrs(...)
       13.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 32 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Overview.Rmd’ using rmarkdown
    New names:
    • `` -> `...1`
    • `` -> `...2`
    • `` -> `...3`
    • `` -> `...4`
    • `` -> `...5`
    • `` -> `...6`
    • `` -> `...7`
    ...
    Quitting from lines 204-214 (Overview.Rmd) 
    Error: processing vignette 'Overview.Rmd' failed with diagnostics:
    Can't recycle `..1` (size 215) to match `..2` (size 72).
    --- failed re-building ‘Overview.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Overview.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# NetCoupler

<details>

* Version: 0.1.0
* GitHub: https://github.com/NetCoupler/NetCoupler
* Source code: https://github.com/cran/NetCoupler
* Date/Publication: 2022-04-08 09:02:33 UTC
* Number of recursive dependencies: 110

Run `cloud_details(, "NetCoupler")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetCoupler-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: nc_estimate_links
    > ### Title: Compute model estimates between an external (exposure or
    > ###   outcome) variable and a network.
    > ### Aliases: nc_estimate_links nc_estimate_exposure_links
    > ###   nc_estimate_outcome_links
    > 
    > ### ** Examples
    ...
    > 
    > results <- standardized_data %>%
    +   nc_estimate_exposure_links(
    +     edge_tbl = edge_table,
    +     exposure = "exposure",
    +     model_function = lm
    +    )
    Error: Can't merge the outer name `metabolite_1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. ├─NetCoupler::nc_estimate_exposure_links(...)
        3. │ ├─... %>% dplyr::rename(exposure = "external_var")
        4. │ └─NetCoupler:::compute_model_estimates(...)
        5. │   ├─generate_all_network_combinations(edge_tbl) %>% ...
        6. │   └─NetCoupler:::generate_all_network_combinations(edge_tbl)
        7. │     └─... %>% ...
        8. ├─dplyr::rename(., exposure = "external_var")
        9. ├─dplyr::filter(., !.data$index_node %in% direct_effect_adjustment)
       10. └─purrr::imap_dfr(...)
       11.   └─purrr::map2_dfr(.x, vec_index(.x), .f, ..., .id = .id)
       12.     └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘NetCoupler.Rmd’ using rmarkdown
    Quitting from lines 220-235 (NetCoupler.Rmd) 
    Error: processing vignette 'NetCoupler.Rmd' failed with diagnostics:
    Can't merge the outer name `metabolite_1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘NetCoupler.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘NetCoupler.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# pammtools

<details>

* Version: 0.5.8
* GitHub: https://github.com/adibender/pammtools
* Source code: https://github.com/cran/pammtools
* Date/Publication: 2022-01-09 03:32:43 UTC
* Number of recursive dependencies: 118

Run `cloud_details(, "pammtools")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       9.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      ── Error (test-add-functions.R:268:3): CIF works ───────────────────────────────
      Error: Can't merge the outer name `1` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─... %>% add_cif(pam) at test-add-functions.R:268:2
       2. ├─pammtools::add_cif(., pam)
       3. └─pammtools:::add_cif.default(., pam)
       4.   └─purrr::map_dfr(...)
       5.     └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 319 ]
      Error: Test failures
      Execution halted
    ```

# parsnip

<details>

* Version: 1.0.1
* GitHub: https://github.com/tidymodels/parsnip
* Source code: https://github.com/cran/parsnip
* Date/Publication: 2022-08-18 07:30:02 UTC
* Number of recursive dependencies: 134

Run `cloud_details(, "parsnip")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘parsnip-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: augment.model_fit
    > ### Title: Augment data with predictions
    > ### Aliases: augment.model_fit
    > 
    > ### ** Examples
    > 
    > car_trn <- mtcars[11:32,]
    ...
      2. ├─parsnip:::augment.model_fit(cls_form, cls_tst)
      3. │ └─dplyr::bind_cols(ret, predict(x, new_data = new_data, type = "prob"))
      4. │   ├─dplyr:::fix_call(vec_cbind(!!!dots, .name_repair = .name_repair))
      5. │   │ └─base::withCallingHandlers(...)
      6. │   └─vctrs::vec_cbind(!!!dots, .name_repair = .name_repair)
      7. └─vctrs::stop_incompatible_size(...)
      8.   └─vctrs:::stop_incompatible(...)
      9.     └─vctrs:::stop_vctrs(...)
     10.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `actual$.pred_L` is a double vector (0.004945503956233, 0.00782391333690211, 0.993865798014941)
      `expected$.pred_L` is absent
      
      `actual$...1` is absent
      `expected$...1` is a double vector (0.910011172527722, 0.0850433235160451, 0.004945503956233)
      
      `actual$...2` is absent
      `expected$...2` is a double vector (0.592693350572423, 0.399482736090675, 0.00782391333690211)
      
      `actual$...3` is absent
      `expected$...3` is a double vector (0.000512229348194131, 0.00562197263686532, 0.993865798014941)
      
      [ FAIL 33 | WARN 1 | SKIP 67 | PASS 901 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘rules’, ‘h2o’, ‘agua’, ‘baguette’, ‘ipred’, ‘dbarts’, ‘lightgbm’, ‘bonsai’, ‘mboost’, ‘mda’, ‘sda’, ‘sparsediscrim’, ‘klaR’, ‘workflows’, ‘brulee’, ‘glmnet’, ‘rstan’, ‘rstanarm’, ‘naivebayes’, ‘plsmod’, ‘pscl’, ‘randomForest’, ‘xrf’, ‘flexsurv’, ‘broom’
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

# partition

<details>

* Version: 0.1.4
* GitHub: https://github.com/USCbiostats/partition
* Source code: https://github.com/cran/partition
* Date/Publication: 2021-10-05 04:20:02 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "partition")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("partition")
      Starting 2 test processes
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 169 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-permutations-return-correctly.R:8:3): permuted dfs are correct ──
      names(pdf) (`actual`) not equal to names(df) (`expected`).
      
      `actual`:   "...1"      "...2"      "...3"      "...4"      "...5"     
      `expected`: "block1_x1" "block1_x2" "block1_x3" "block1_x4" "block1_x5"
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 169 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.0Mb
      sub-directories of 1Mb or more:
        doc    1.2Mb
        libs   8.6Mb
    ```

# photosynthesis

<details>

* Version: 2.0.3
* GitHub: https://github.com/cdmuir/photosynthesis
* Source code: https://github.com/cran/photosynthesis
* Date/Publication: 2022-08-12 07:20:02 UTC
* Number of recursive dependencies: 105

Run `cloud_details(, "photosynthesis")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─photosynthesis::photosynthesis(...) at test-photosynthesis-crossing.R:43:2
        2. │ └─tealeaves::tleaves(...)
        3. │   └─pars %<>% dplyr::bind_cols(soln)
        4. ├─dplyr::bind_cols(., soln)
        5. │ ├─dplyr:::fix_call(vec_cbind(!!!dots, .name_repair = .name_repair))
        6. │ │ └─base::withCallingHandlers(...)
        7. │ └─vctrs::vec_cbind(!!!dots, .name_repair = .name_repair)
        8. └─vctrs::stop_incompatible_size(...)
        9.   └─vctrs:::stop_incompatible(...)
       10.     └─vctrs:::stop_vctrs(...)
       11.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 154 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        doc    3.2Mb
        help   1.1Mb
    ```

# podcleaner

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/podcleaner
* Date/Publication: 2022-01-11 20:02:42 UTC
* Number of recursive dependencies: 53

Run `cloud_details(, "podcleaner")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘podcleaner-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: combine_match_general_to_trades
    > ### Title: Match general to trades directory records
    > ### Aliases: combine_match_general_to_trades
    > 
    > ### ** Examples
    > 
    > trades_directory <- tibble::tibble(
    ...
    +   address.trade.body = c("London Road", "Dixon Place"),
    +   address.house.body = c("Queen Square", "Anderston Quay")
    + )
    > combine_match_general_to_trades(
    +  trades_directory, general_directory, progress = TRUE, verbose = FALSE,
    +  distance = TRUE, method = "osa", max_dist = 5
    + )
    Error: Can't merge the outer name `0` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: Can't merge the outer name `0` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test_trades.r:141:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─podcleaner::trades_clean_directory(...)
       5.   └─podcleaner:::trades_clean_directory_progress(directory, verbose)
       6.     └─purrr::map_dfr(...)
       7.       └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 10 | WARN 0 | SKIP 0 | PASS 89 ]
      Error: Test failures
      Execution halted
    ```

# pollen

<details>

* Version: 0.82.0
* GitHub: https://github.com/Nowosad/pollen
* Source code: https://github.com/cran/pollen
* Date/Publication: 2021-12-03 12:20:02 UTC
* Number of recursive dependencies: 79

Run `cloud_details(, "pollen")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pollen-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: outliers_replacer
    > ### Title: A Outliers Replacer Function
    > ### Aliases: outliers_replacer
    > 
    > ### ** Examples
    > 
    > 
    > data(pollen_count)
    > df <- subset(pollen_count, site=='Shire')
    > new_df <- outliers_replacer(df$birch, df$date)
    Error: Can't merge the outer name `2007` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘gdd.Rmd’ using rmarkdown
    --- finished re-building ‘gdd.Rmd’
    
    --- re-building ‘intro.Rmd’ using rmarkdown
    Quitting from lines 113-116 (intro.Rmd) 
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    Can't merge the outer name `2007` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘intro.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# protti

<details>

* Version: 0.3.1
* GitHub: https://github.com/jpquast/protti
* Source code: https://github.com/cran/protti
* Date/Publication: 2022-07-01 08:00:05 UTC
* Number of recursive dependencies: 192

Run `cloud_details(, "protti")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘protti-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: assign_missingness
    > ### Title: Assignment of missingness types
    > ### Aliases: assign_missingness
    > 
    > ### ** Examples
    > 
    > set.seed(123) # Makes example reproducible
    ...
    +   ref_condition = "all",
    +   retain_columns = c(protein)
    + )
    "all" was provided as reference condition. All pairwise comparisons are
    created from the conditions and assigned their missingness. The
    created comparisons are:
    condition_1_vs_condition_2
    Error: Can't merge the outer name `condition_1_vs_condition_2` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─normalised_data %>% ... at test-workflow.R:108:0
       2. ├─protti::assign_missingness(...)
       3. │ └─... %>% ...
       4. ├─dplyr::arrange(...)
       5. ├─dplyr::ungroup(.)
       6. ├─dplyr::select(., -c(.data$control, .data$n_replicates, .data$treated))
       7. └─purrr::map_df(...)
       8.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 72 ]
      Error: Test failures
      Execution halted
    ```

# prozor

<details>

* Version: 0.3.1
* GitHub: https://github.com/protviz/prozor
* Source code: https://github.com/cran/prozor
* Date/Publication: 2021-12-07 16:20:02 UTC
* Number of recursive dependencies: 62

Run `cloud_details(, "prozor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘prozor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: annotatePeptides
    > ### Title: Annotate peptides with protein ids
    > ### Aliases: annotatePeptides
    > 
    > ### ** Examples
    > 
    > 
    ...
      # Using lambdas
      list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
    This warning is displayed once every 8 hours.
    Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.
    Joining, by = "proteinID"
    Error in sort.list(bx[m$xi]) : 
      'x' must be atomic for 'sort.list', method "shell" and "quick"
    Have you called 'sort' on a list?
    Calls: <Anonymous> ... merge -> merge.data.frame -> [ -> [.data.frame -> sort.list
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘CreatingDecoyDB.Rmd’ using rmarkdown
    --- finished re-building ‘CreatingDecoyDB.Rmd’
    
    --- re-building ‘PeptideAnnotationwithProzor.Rmd’ using rmarkdown
    Rows: 5000 Columns: 12
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr  (2): peptideSeq, peptideModSeq
    dbl (10): RefSpectraId, numPeaks, precursorCharge, precursorMZ, retentionTim...
    ...
    --- finished re-building ‘TargetDecoyFDR_Example.Rmd’
    
    --- re-building ‘cdsw.Rmd’ using rmarkdown
    --- finished re-building ‘cdsw.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘PeptideAnnotationwithProzor.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# psyntur

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/psyntur
* Date/Publication: 2021-09-15 09:20:05 UTC
* Number of recursive dependencies: 107

Run `cloud_details(, "psyntur")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘psyntur-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: scatterplot_matrix
    > ### Title: Make a scatterplot matrix
    > ### Aliases: scatterplot_matrix
    > 
    > ### ** Examples
    > 
    > data_df <- test_psychometrics %>%
    ...
     16.               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
     17.                 └─tidyselect:::as_indices_sel_impl(...)
     18.                   └─tidyselect:::as_indices_impl(x, vars, call = call, strict = strict)
     19.                     └─tidyselect:::chr_as_locations(x, vars, call = call)
     20.                       └─vctrs::vec_as_location(x, n = length(vars), names = vars)
     21.                         └─vctrs (local) `<fn>`()
     22.                           └─vctrs:::stop_subscript_oob(...)
     23.                             └─vctrs:::stop_subscript(...)
     24.                               └─rlang::abort(...)
    Execution halted
    ```

# qualtRics

<details>

* Version: 3.1.6
* GitHub: https://github.com/ropensci/qualtRics
* Source code: https://github.com/cran/qualtRics
* Date/Publication: 2022-06-06 17:40:02 UTC
* Number of recursive dependencies: 86

Run `cloud_details(, "qualtRics")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Failure (test-all-mailinglists.R:15:3): all_mailinglists returns a tbl_df with expected column names and types ──
      x$folder has type 'list', not 'character'.
      ── Failure (test-extract-colmap.R:17:3): extract_colmap() retrieves an appropriate column map generated within read_survey ──
      cm$ImportId has type 'list', not 'character'.
      ── Failure (test-extract-colmap.R:18:3): extract_colmap() retrieves an appropriate column map generated within read_survey ──
      cm$timeZone has type 'list', not 'character'.
      ── Failure (test-extract-colmap.R:19:3): extract_colmap() retrieves an appropriate column map generated within read_survey ──
      cm$choiceId has type 'list', not 'character'.
      
      [ FAIL 8 | WARN 0 | SKIP 7 | PASS 171 ]
      Error: Test failures
      In addition: Warning message:
      In readRenviron("~/.Renviron") :
        file '/root/.Renviron' cannot be opened for reading
      Execution halted
    ```

# r4lineups

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/r4lineups
* Date/Publication: 2018-07-18 13:20:02 UTC
* Number of recursive dependencies: 66

Run `cloud_details(, "r4lineups")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘r4lineups-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: eff_size_per_foils
    > ### Title: Effective Size per Foils
    > ### Aliases: eff_size_per_foils
    > 
    > ### ** Examples
    > 
    > #Data:
    > lineup_vec <- round(runif(100, 1, 6))
    > target_pos <- c(1, 2, 3, 4, 5, 6)
    > 
    > #Call:
    > eff_size_per_foils(lineup_vec, target_pos, 6)
    Error in Math.data.frame(list(ci_low = list(X1 = c(0.95, 21.3, 971.14,  : 
      non-numeric-alike variable(s) in data frame: ci_low, ci_high
    Calls: eff_size_per_foils -> lineup_boot_allprop -> Math.data.frame
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Vignette.Rmd’ using rmarkdown
    Quitting from lines 157-159 (Vignette.Rmd) 
    Error: processing vignette 'Vignette.Rmd' failed with diagnostics:
    non-numeric-alike variable(s) in data frame: ci_low, ci_high
    --- failed re-building ‘Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rainette

<details>

* Version: 0.3.0
* GitHub: https://github.com/juba/rainette
* Source code: https://github.com/cran/rainette
* Date/Publication: 2022-02-18 23:40:02 UTC
* Number of recursive dependencies: 114

Run `cloud_details(, "rainette")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • plots/base-rainette-plot-with-free-scales.svg
      • plots/base-rainette-plot-with-k-and-without-negative.svg
      • plots/base-rainette-plot-with-k-n-terms-and-font-size.svg
      • plots/base-rainette-plot.svg
      • plots/base-rainette2-plot-measure-docprop.svg
      • plots/base-rainette2-plot-measure-frequency.svg
      • plots/base-rainette2-plot-measure-lr.svg
      • plots/base-rainette2-plot-with-complete-groups.svg
      • plots/base-rainette2-plot-with-free-scales.svg
      • plots/base-rainette2-plot-with-k-5.svg
      • plots/base-rainette2-plot-with-k-and-without-negative.svg
      • plots/base-rainette2-plot-with-k-n-terms-and-font-size.svg
      • plots/base-rainette2-plot.svg
      Error: Test failures
      Execution halted
    ```

# RCT

<details>

* Version: 1.1.2
* GitHub: NA
* Source code: https://github.com/cran/RCT
* Date/Publication: 2022-05-13 06:30:05 UTC
* Number of recursive dependencies: 78

Run `cloud_details(, "RCT")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("RCT")
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 97 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test_balance_regression.R:25:3): balance_regression returns list w/right dimension ──
      ncol(b_reg$F_test) not equal to 4.
      1/1 mismatches
      [1] 7 - 4 == 3
      ── Failure (test_balance_regression.R:33:3): Correct names balance_regression ──
      names(b_reg$F_test) not equal to c("estadistico", "Msj1", "Msj2", "Msj3").
      Lengths differ: 7 is not 4
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 97 ]
      Error: Test failures
      Execution halted
    ```

# readsdr

<details>

* Version: 0.2.0
* GitHub: https://github.com/jandraor/readsdr
* Source code: https://github.com/cran/readsdr
* Date/Publication: 2021-01-08 16:00:02 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "readsdr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘readsdr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: extract_timeseries_stock
    > ### Title: Extract the values over time of a stock from a Stan fit
    > ### Aliases: extract_timeseries_stock
    > 
    > ### ** Examples
    > 
    > posterior_df <- data.frame(`yhat[1,2]` = rep(0, 2), `yhat[2,2]` = rep(1, 2),
    +                             check.names = FALSE)
    > stocks       <- c("S1", "S2")
    > extract_timeseries_stock("S2", posterior_df, stocks, "yhat")
    Error: Can't merge the outer name `yhat[1,2]` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: Can't merge the outer name `yhat[1,2]` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-stan_utils.R:36:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─readsdr::extract_timeseries_stock(...)
       5.   └─purrr::imap_dfr(...)
       6.     └─purrr::map2_dfr(.x, vec_index(.x), .f, ..., .id = .id)
       7.       └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 251 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# rearrr

<details>

* Version: 0.3.0
* GitHub: https://github.com/ludvigolsen/rearrr
* Source code: https://github.com/cran/rearrr
* Date/Publication: 2021-09-26 15:30:02 UTC
* Number of recursive dependencies: 83

Run `cloud_details(, "rearrr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rearrr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: FixedGroupsPipeline
    > ### Title: Chain multiple transformations with different argument values
    > ###   per group
    > ### Aliases: FixedGroupsPipeline
    > 
    > ### ** Examples
    > 
    ...
    > 
    > # Apply pipeline to already grouped data.frame
    > # Enable `verbose` to print progress
    > pipe$apply(df, verbose = TRUE)
    
    ------------------------------------------------------
    Applying transformations.
    Starting: RotateError: Can't merge the outer name `1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       8.         └─vctrs::vec_rbind(!!!res, .names_to = .id)
      ── Error (test_vector_length.R:200:3): fuzz testing vector_length() ────────────
      Error: Can't merge the outer name `1` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. └─rearrr::vector_length(...) at test_vector_length.R:200:2
       2.   └─rearrr:::multi_mutator_(...)
       3.     └─rearrr:::run_by_group(...)
       4.       └─purrr::map2_dfr(...)
       5.         └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 62 | WARN 0 | SKIP 0 | PASS 1266 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
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
    
    > ### Name: step_impute_mean
    > ### Title: Impute numeric data using the mean
    > ### Aliases: step_impute_mean step_meanimpute
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
      4. │   └─base::eval(ei, envir)
      5. │     └─base::eval(ei, envir)
      6. ├─recipes::prep(impute_rec, training = credit_tr)
      7. └─recipes:::prep.recipe(impute_rec, training = credit_tr)
      8.   ├─recipes::bake(x$steps[[i]], new_data = training)
      9.   └─recipes:::bake.step_impute_mean(x$steps[[i]], new_data = training)
     10.     └─recipes::check_new_data(names(object$means), object, new_data)
     11.       └─cli::cli_abort(...)
     12.         └─rlang::abort(message, ..., call = call, use_cli_format = TRUE)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      'impute_mean_NYYjV': ...1, ...2, ...3, ...4, and ...5.
      Backtrace:
          ▆
       1. ├─... %>% prep(training = sacr_tr) at test_sparsity.R:20:0
       2. ├─recipes::prep(., training = sacr_tr)
       3. └─recipes:::prep.recipe(., training = sacr_tr)
       4.   ├─recipes::bake(x$steps[[i]], new_data = training)
       5.   └─recipes:::bake.step_impute_mean(x$steps[[i]], new_data = training)
       6.     └─recipes::check_new_data(names(object$means), object, new_data)
       7.       └─cli::cli_abort(...)
       8.         └─rlang::abort(message, ..., call = call, use_cli_format = TRUE)
      
      [ FAIL 20 | WARN 2 | SKIP 371 | PASS 1706 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘fastICA’, ‘dimRed’
    ```

# reval

<details>

* Version: 3.1-0
* GitHub: https://github.com/mkoohafkan/reval
* Source code: https://github.com/cran/reval
* Date/Publication: 2022-06-29 06:50:02 UTC
* Number of recursive dependencies: 64

Run `cloud_details(, "reval")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘reval-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: args_ofat
    > ### Title: One Factor At a Time Argument Set
    > ### Aliases: args_ofat
    > 
    > ### ** Examples
    > 
    > args_ofat(x = 1:5, y = 1:3)
    Error: Can't merge the outer name `x` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

# rmweather

<details>

* Version: 0.1.51
* GitHub: https://github.com/skgrange/rmweather
* Source code: https://github.com/cran/rmweather
* Date/Publication: 2020-06-15 06:50:03 UTC
* Number of recursive dependencies: 86

Run `cloud_details(, "rmweather")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("rmweather")
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 39 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test_02_rmw_functions.R:132:3): Test normalising function ──────────
      names(df_normalise) not identical to c("date", "value_predict").
      Lengths differ: 3 is not 2
      ── Failure (test_02_rmw_functions.R:173:3): Test normalising function with standard error calculation ──
      names(df_normalise) not identical to c("date", "se", "value_predict").
      Lengths differ: 4 is not 3
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 39 ]
      Error: Test failures
      Execution halted
    ```

# RSDA

<details>

* Version: 3.0.13
* GitHub: NA
* Source code: https://github.com/cran/RSDA
* Date/Publication: 2022-07-16 07:30:37 UTC
* Number of recursive dependencies: 149

Run `cloud_details(, "RSDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RSDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Cardiological
    > ### Title: Cardiological data example
    > ### Aliases: Cardiological
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    ...
    • `` -> `...5`
    • `` -> `...6`
    • `` -> `...7`
    • `` -> `...8`
    • `` -> `...9`
    • `` -> `...10`
    • `` -> `...11`
    Error in eval(predvars, data, env) : object 'Pulse' not found
    Calls: sym.lm ... eval -> <Anonymous> -> model.frame.default -> eval -> eval
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction.Rmd’ using rmarkdown
    Quitting from lines 308-312 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    object 'lpsa' not found
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction.Rmd’
    
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

*   checking examples ... ERROR
    ```
    Running examples in ‘sbm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotMyMultipartiteMatrix
    > ### Title: Plot the matrices corresponding to a Multipartite Network
    > ### Aliases: plotMyMultipartiteMatrix
    > 
    > ### ** Examples
    > 
    > data("multipartiteEcologicalNetwork")
    ...
    New names:
    • `` -> `...1`
    • `` -> `...2`
    New names:
    • `` -> `...1`
    • `` -> `...2`
    Error in MetaMat[place_row, place_col] <- net_ij : 
      number of items to replace is not a multiple of replacement length
    Calls: plotMyMultipartiteMatrix -> <Anonymous> -> plotMultipartiteMatrix
    Execution halted
    ```

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
      Error in `super$initialize(model = map_chr(netList, "modelName"), architecture = arch, 
          directed = directed, nbNodes = nbNodes, dimLabels = dimLabels, 
    ...
          ▆
       1. └─MultiplexSBM_fit$new(list(netA, netB, netC)) at test-MultiplexSBM_fit.R:35:4
       2.   └─sbm (local) initialize(...)
       3.     └─super$initialize(netList)
       4.       └─super$initialize(...)
       5.         └─base::stopifnot(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1046 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Multipartite_EcologicalNetwork.Rmd’ using rmarkdown
    Quitting from lines 89-90 (Multipartite_EcologicalNetwork.Rmd) 
    Error: processing vignette 'Multipartite_EcologicalNetwork.Rmd' failed with diagnostics:
    ncol(architecture) == 2 is not TRUE
    --- failed re-building ‘Multipartite_EcologicalNetwork.Rmd’
    
    --- re-building ‘MultiplexNetwork_principle.Rmd’ using rmarkdown
    Quitting from lines 175-197 (MultiplexNetwork_principle.Rmd) 
    ...
    --- finished re-building ‘Multiplex_allianceNwar_case_study.Rmd’
    
    --- re-building ‘SBM_fungus_tree_network.Rmd’ using rmarkdown
    --- finished re-building ‘SBM_fungus_tree_network.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Multipartite_EcologicalNetwork.Rmd’ ‘MultiplexNetwork_principle.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# scryr

<details>

* Version: 1.0.0
* GitHub: https://github.com/curso-r/scryr
* Source code: https://github.com/cran/scryr
* Date/Publication: 2022-01-28 08:20:05 UTC
* Number of recursive dependencies: 62

Run `cloud_details(, "scryr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘colors.Rmd’ using rmarkdown
    --- finished re-building ‘colors.Rmd’
    
    --- re-building ‘frames.Rmd’ using rmarkdown
    --- finished re-building ‘frames.Rmd’
    
    --- re-building ‘imagery.Rmd’ using rmarkdown
    --- finished re-building ‘imagery.Rmd’
    
    ...
    --- failed re-building ‘scryr.Rmd’
    
    --- re-building ‘syntax.Rmd’ using rmarkdown
    --- finished re-building ‘syntax.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘scryr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sfdep

<details>

* Version: 0.2.0
* GitHub: https://github.com/josiahparry/sfdep
* Source code: https://github.com/cran/sfdep
* Date/Publication: 2022-08-15 13:30:02 UTC
* Number of recursive dependencies: 109

Run `cloud_details(, "sfdep")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘basics-of-sfdep.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    --- failed re-building ‘spacetime-s3.Rmd’
    
    --- re-building ‘spdep-and-pysal.Rmd’ using rmarkdown
    --- finished re-building ‘spdep-and-pysal.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘spacetime-s3.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ShinyItemAnalysis

<details>

* Version: 1.4.1
* GitHub: https://github.com/patriciamar/ShinyItemAnalysis
* Source code: https://github.com/cran/ShinyItemAnalysis
* Date/Publication: 2022-04-15 15:32:37 UTC
* Number of recursive dependencies: 131

Run `cloud_details(, "ShinyItemAnalysis")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ShinyItemAnalysis-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: coef,BlisClass-method
    > ### Title: Get Coefficients from a fitted BLIS model
    > ### Aliases: coef,BlisClass-method
    > 
    > ### ** Examples
    > 
    > fitted_blis <- fit_blis(HCItest[, 1:20], HCIkey)
    ...
      6. └─tibble::add_row(., group_pars)
      7.   └─tibble:::rbind_at(.data, df, pos)
      8.     └─vctrs::vec_rbind(old, new)
      9.       └─vctrs (local) `<fn>`()
     10.         └─vctrs::vec_default_ptype2(...)
     11.           └─vctrs::stop_incompatible_type(...)
     12.             └─vctrs:::stop_incompatible(...)
     13.               └─vctrs:::stop_vctrs(...)
     14.                 └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

# ShinyTester

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/ShinyTester
* Date/Publication: 2017-02-01 16:46:15
* Number of recursive dependencies: 40

Run `cloud_details(, "ShinyTester")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ShinyTester-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ShinyDummyCheck
    > ### Title: ShinyDummyCheck
    > ### Aliases: ShinyDummyCheck
    > 
    > ### ** Examples
    > 
    > ShinyDummyCheck(directory = system.file("example", package = "ShinyTester"))
    New names:
    • `` -> `...1`
    New names:
    • `` -> `...1`
    Error in names(x) <- value : 
      'names' attribute [2] must be the same length as the vector [1]
    Calls: ShinyDummyCheck -> colnames<-
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# sigminer

<details>

* Version: 2.1.6
* GitHub: https://github.com/ShixiangWang/sigminer
* Source code: https://github.com/cran/sigminer
* Date/Publication: 2022-08-09 15:20:02 UTC
* Number of recursive dependencies: 205

Run `cloud_details(, "sigminer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sigminer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: group_enrichment
    > ### Title: General Group Enrichment Analysis
    > ### Aliases: group_enrichment
    > 
    > ### ** Examples
    > 
    > set.seed(1234)
    ...
    ============================
    Handing pair g2:e2 - group: A
    Handing pair g2:e2 - group: B
    Handing pair g2:e2 - group: C
    Handing pair g2:e2 - group: D
      An error occur when testing, it will be skipped. Info:
        not enough 'x' observations
    Error: Can't merge the outer name `V1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        libs   1.4Mb
    ```

# simTool

<details>

* Version: 1.1.7
* GitHub: https://github.com/MarselScheer/simTool
* Source code: https://github.com/cran/simTool
* Date/Publication: 2020-09-22 16:00:03 UTC
* Number of recursive dependencies: 60

Run `cloud_details(, "simTool")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Last 13 lines of output:
      test_frame_simulation.R.......    1 tests [0;32mOK[0m 
      test_frame_simulation.R.......    1 tests [0;32mOK[0m 
      test_frame_simulation.R.......    2 tests [0;32mOK[0m [0;36m34ms[0m
      
      test_unnest_simulation.R......    0 tests    
      test_unnest_simulation.R......    1 tests [0;32mOK[0m 
      test_unnest_simulation.R......    1 tests [0;32mOK[0m 
      test_unnest_simulation.R......    2 tests [0;32mOK[0m 
      test_unnest_simulation.R......    2 tests [0;32mOK[0m Error: Can't merge the outer name `1` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      In addition: Warning message:
      The `.dots` argument of `group_by()` is deprecated as of dplyr 1.0.0.
      This warning is displayed once every 8 hours.
      Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated. 
      Execution halted
    ```

# sjmisc

<details>

* Version: 2.8.9
* GitHub: https://github.com/strengejacke/sjmisc
* Source code: https://github.com/cran/sjmisc
* Date/Publication: 2021-12-03 10:40:02 UTC
* Number of recursive dependencies: 107

Run `cloud_details(, "sjmisc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sjmisc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: merge_imputations
    > ### Title: Merges multiple imputed data frames into a single data frame
    > ### Aliases: merge_imputations
    > 
    > ### ** Examples
    > 
    > if (require("mice")) {
    ...
      6.     └─ggplot2:::ggplot_build.ggplot(x)
      7.       └─layout$setup(data, plot$data, plot$plot_env)
      8.         └─ggplot2 (local) f(..., self = self)
      9.           └─self$facet$compute_layout(data, self$facet_params)
     10.             └─ggplot2 (local) f(...)
     11.               ├─ggplot2:::unrowname(...)
     12.               │ └─base::is.data.frame(x)
     13.               └─ggplot2::combine_vars(data, params$plot_env, vars, drop = params$drop)
     14.                 └─rlang::abort("Faceting variables must have at least one value")
    Execution halted
    ```

# sjPlot

<details>

* Version: 2.8.11
* GitHub: https://github.com/strengejacke/sjPlot
* Source code: https://github.com/cran/sjPlot
* Date/Publication: 2022-08-07 08:00:02 UTC
* Number of recursive dependencies: 189

Run `cloud_details(, "sjPlot")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘blackwhitefigures.Rmd’ using rmarkdown
    Learn more about sjPlot with 'browseVignettes("sjPlot")'.
    
    Attaching package: 'ggplot2'
    
    The following object is masked from 'package:sjlabelled':
    
        as_label
    
    ...
    • `` -> `...3`
    • `` -> `...4`
    • `` -> `...5`
    --- finished re-building ‘table_css.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tab_model_estimates.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# skater

<details>

* Version: 0.1.1
* GitHub: https://github.com/signaturescience/skater
* Source code: https://github.com/cran/skater
* Date/Publication: 2022-02-01 16:00:02 UTC
* Number of recursive dependencies: 94

Run `cloud_details(, "skater")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘skater-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ped2kinpair
    > ### Title: Pedigree to pairwise kinship
    > ### Aliases: ped2kinpair
    > 
    > ### ** Examples
    > 
    > famfile <- system.file("extdata", "3gens.fam", package="skater", mustWork=TRUE)
    ...
     19. ├─stats::na.omit(.)
     20. ├─corrr::stretch(.)
     21. ├─corrr:::stretch.cor_df(.)
     22. │ └─purrr::imap_dfr(x, ~tibble(x = .y, y = row_name, r = .x))
     23. │   └─purrr::map2_dfr(.x, vec_index(.x), .f, ..., .id = .id)
     24. │     └─vctrs::vec_rbind(!!!res, .names_to = .id)
     25. └─base::.handleSimpleError(...)
     26.   └─dplyr (local) h(simpleError(msg, call))
     27.     └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘basic_usage.Rmd’ using rmarkdown
    Quitting from lines 83-84 (basic_usage.Rmd) 
    Error: processing vignette 'basic_usage.Rmd' failed with diagnostics:
    Can't merge the outer name `testped1_g1-b1-s1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘basic_usage.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘basic_usage.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sknifedatar

<details>

* Version: 0.1.2
* GitHub: https://github.com/rafzamb/sknifedatar
* Source code: https://github.com/cran/sknifedatar
* Date/Publication: 2021-06-01 08:00:02 UTC
* Number of recursive dependencies: 174

Run `cloud_details(, "sknifedatar")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sknifedatar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: insert_na
    > ### Title: Add NA values to a dataframe
    > ### Aliases: insert_na
    > 
    > ### ** Examples
    > 
    > insert_na(.dataset = iris, columns = c("Sepal.Length","Petal.Length"), .p = 0.25)
    ...
      3. │ └─dplyr::bind_cols(.dataset %>% dplyr::select(-columns), data_na)
      4. │   ├─dplyr:::fix_call(vec_cbind(!!!dots, .name_repair = .name_repair))
      5. │   │ └─base::withCallingHandlers(...)
      6. │   └─vctrs::vec_cbind(!!!dots, .name_repair = .name_repair)
      7. ├─tibble::as_tibble(.)
      8. └─vctrs::stop_incompatible_size(...)
      9.   └─vctrs:::stop_incompatible(...)
     10.     └─vctrs:::stop_vctrs(...)
     11.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

# spatialsample

<details>

* Version: 0.2.1
* GitHub: https://github.com/tidymodels/spatialsample
* Source code: https://github.com/cran/spatialsample
* Date/Publication: 2022-08-05 22:40:02 UTC
* Number of recursive dependencies: 106

Run `cloud_details(, "spatialsample")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spatialsample-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: autoplot.spatial_rset
    > ### Title: Create a ggplot for spatial resamples.
    > ### Aliases: autoplot.spatial_rset autoplot.spatial_block_cv
    > 
    > ### ** Examples
    > 
    > 
    ...
      6.       └─ggplot2 (local) f(l = layers[[i]], d = data[[i]])
      7.         └─l$compute_statistic(d, layout)
      8.           └─ggplot2 (local) f(..., self = self)
      9.             └─self$stat$compute_layer(data, self$computed_stat_params, layout)
     10.               └─ggplot2 (local) f(..., self = self)
     11.                 └─ggproto_parent(Stat, self)$compute_layer(data, params, layout)
     12.                   └─ggplot2 (local) f(..., self = self)
     13.                     └─ggplot2:::check_required_aesthetics(self$required_aes, c(names(data), names(params)), snake_class(self))
     14.                       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        8.         └─ggplot2:::ggplot_build.ggplot(x)
        9.           └─ggplot2 (local) by_layer(function(l, d) l$compute_statistic(d, layout))
       10.             └─ggplot2 (local) f(l = layers[[i]], d = data[[i]])
       11.               └─l$compute_statistic(d, layout)
       12.                 └─ggplot2 (local) f(..., self = self)
       13.                   └─self$stat$compute_layer(data, self$computed_stat_params, layout)
       14.                     └─ggplot2 (local) f(..., self = self)
       15.                       └─ggproto_parent(Stat, self)$compute_layer(data, params, layout)
       16.                         └─ggplot2 (local) f(..., self = self)
       17.                           └─ggplot2:::check_required_aesthetics(self$required_aes, c(names(data), names(params)), snake_class(self))
       18.                             └─rlang::abort(...)
      
      [ FAIL 1 | WARN 3 | SKIP 24 | PASS 361 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘spatialsample.Rmd’ using rmarkdown
    Quitting from lines 56-62 (spatialsample.Rmd) 
    Error: processing vignette 'spatialsample.Rmd' failed with diagnostics:
    stat_sf requires the following missing aesthetics: geometry
    --- failed re-building ‘spatialsample.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘spatialsample.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# SSLR

<details>

* Version: 0.9.3.3
* GitHub: NA
* Source code: https://github.com/cran/SSLR
* Date/Publication: 2021-07-22 08:10:07 UTC
* Number of recursive dependencies: 218

Run `cloud_details(, "SSLR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SSLR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: coBC
    > ### Title: General Interface for CoBC model
    > ### Aliases: coBC
    > 
    > ### ** Examples
    > 
    > library(tidyverse)
    ...
    • `` -> `...97`
    • `` -> `...98`
    • `` -> `...99`
    Error in checkProb(prob = prob, ninstances, classes) : 
      Predict function incorrect output.
    The row number of 'prob' is 3.
    Expected a number equal to 99 (value of 'ninstances').
    Calls: %>% ... .coBCCombine -> lapply -> lapply -> FUN -> checkProb
    Timing stopped at: 8.965 0 8.965
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─m %>% fit(Wine ~ ., data = wine$train) at test-tritraining.R:25:0
       2. ├─generics::fit(., Wine ~ ., data = wine$train)
       3. └─SSLR::fit.model_sslr(., Wine ~ ., data = wine$train)
       4.   ├─base::system.time(model <- object$fit_function(eval_env$x, eval_env$y))
       5.   └─object$fit_function(eval_env$x, eval_env$y)
       6.     └─SSLR::triTrainingG(y, gen.learner, gen.pred)
       7.       ├─SSLR:::getClassIdx(...)
       8.       │ └─base::apply(prob, MARGIN = 1, FUN = which.max)
       9.       └─SSLR:::checkProb(...)
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 128 ]
      Error: Test failures
      Execution halted
    ```

# ssrn

<details>

* Version: 0.1.0
* GitHub: https://github.com/uribo/ssrn
* Source code: https://github.com/cran/ssrn
* Date/Publication: 2020-06-23 13:40:03 UTC
* Number of recursive dependencies: 40

Run `cloud_details(, "ssrn")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ssrn-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_adjacency_matrix
    > ### Title: Convert station data to adjacency matrix
    > ### Aliases: make_adjacency_matrix
    > 
    > ### ** Examples
    > 
    > make_adjacency_matrix(jreast_jt, st_code, next_st_code)
    ...
      2. │ └─transit_table(stations, reverse = TRUE) %>% ...
      3. ├─ssrn:::df_to_adjacency_distance(...)
      4. │ └─... %>% dplyr::mutate(distance = 1)
      5. ├─dplyr::mutate(., distance = 1)
      6. ├─dplyr::filter(., !is.na(!!arrive))
      7. ├─dplyr::distinct(., !!depart, !!arrive)
      8. └─dplyr:::distinct.data.frame(., !!depart, !!arrive)
      9.   └─dplyr::distinct_prepare(...)
     10.     └─rlang::abort(bullets, call = error_call)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. ├─dplyr::group_by(...)
        6. ├─dplyr::filter(...)
        7. ├─ssrn:::make_pass_volume(...)
        8. │ └─data %>% dplyr::right_join(st_data, by = ...)
        9. ├─dplyr::right_join(., st_data, by = ...)
       10. └─dplyr:::right_join.data.frame(., st_data, by = ...)
       11.   └─dplyr:::join_mutate(...)
       12.     └─dplyr:::join_cols(...)
       13.       └─dplyr:::standardise_join_by(...)
       14.         └─dplyr:::check_join_vars(by$y, y_names, error_call = error_call)
       15.           └─rlang::abort(bullets, call = error_call)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 4 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘scanstatistics’
    ```

# stacks

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/stacks
* Source code: https://github.com/cran/stacks
* Date/Publication: 2022-07-06 20:10:03 UTC
* Number of recursive dependencies: 140

Run `cloud_details(, "stacks")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11. ├─dplyr::mutate(...)
       12. ├─dplyr:::mutate.data.frame(., dplyr::across(dplyr::starts_with(".pred_"), ~ .x / .sum), idx = which.max(dplyr::c_across(dplyr::starts_with(".pred_"))))
       13. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
       14. │   ├─base::withCallingHandlers(...)
       15. │   └─mask$eval_all_mutate(quo)
       16. ├─dplyr:::dplyr_internal_error(...)
       17. │ └─rlang::abort(class = c(class, "dplyr:::internal_error"), dplyr_error_data = data)
       18. │   └─rlang:::signal_abort(cnd, .file)
       19. │     └─base::signalCondition(cnd)
       20. └─dplyr (local) `<fn>`(`<dpl:::__>`)
       21.   └─rlang::abort(...)
      
      [ FAIL 3 | WARN 3 | SKIP 42 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘basics.Rmd’ using rmarkdown
    Quitting from lines 294-301 (basics.Rmd) 
    Error: processing vignette 'basics.Rmd' failed with diagnostics:
    Can't subset columns that don't exist.
    ✖ Column `.row` doesn't exist.
    --- failed re-building ‘basics.Rmd’
    
    --- re-building ‘classification.Rmd’ using rmarkdown
    i Creating pre-processing data to finalize unknown parameter: mtry
    ...
    Error: processing vignette 'classification.Rmd' failed with diagnostics:
    Can't subset columns that don't exist.
    ✖ Column `.predictions` doesn't exist.
    --- failed re-building ‘classification.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘basics.Rmd’ ‘classification.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tabxplor

<details>

* Version: 1.1.0
* GitHub: https://github.com/BriceNocenti/tabxplor
* Source code: https://github.com/cran/tabxplor
* Date/Publication: 2022-06-15 22:50:02 UTC
* Number of recursive dependencies: 101

Run `cloud_details(, "tabxplor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tabxplor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fmt
    > ### Title: Create a vector of class formatted numbers
    > ### Aliases: fmt is_fmt get_num set_num get_type set_type is_totrow
    > ###   as_totrow is_tottab as_tottab is_totcol as_totcol is_refrow as_refrow
    > ###   get_comp_all set_comp_all get_diff_type set_diff_type get_ci_type
    > ###   set_ci_type get_col_var set_col_var is_refcol as_refcol get_color
    > ###   set_color get_digits set_digits
    ...
    ! New columns must be compatible with `.data`.
    ✖ New column has 5 rows.
    ℹ `.data` has 7 rows.
    Backtrace:
        ▆
     1. ├─tabs %>% tibble::add_column(tottabs) %>% ...
     2. ├─dplyr::mutate(...)
     3. └─tibble::add_column(., tottabs)
     4.   └─rlang::cnd_signal(error_incompatible_new_cols(nrow(.data), df))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─tabxplor::tab(forcats::gss_cat, race, marital, pct = "row", color = "after_ci") at test-tab_xl.R:26:2
        2. │ └─tabxplor::tab_many(...)
        3. │   └─purrr::pmap(...)
        4. │     └─tabxplor (local) .f(...)
        5. │       └─tabxplor::tab_ci(...)
        6. │         └─tabs %>% tab_match_groups_and_totrows()
        7. ├─tabxplor:::tab_match_groups_and_totrows(.)
        8. │ └─tabxplor::tab_tot(tabs, "row")
        9. │   └─tabs %>% tibble::add_column(tottab_rows, tottab_line)
       10. └─tibble::add_column(., tottab_rows, tottab_line)
       11.   └─rlang::cnd_signal(error_incompatible_new_cols(nrow(.data), df))
      
      [ FAIL 27 | WARN 49 | SKIP 0 | PASS 131 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tabxplor.Rmd’ using rmarkdown
    Quitting from lines 99-102 (tabxplor.Rmd) 
    Error: processing vignette 'tabxplor.Rmd' failed with diagnostics:
    New columns must be compatible with `.data`.
    [31m✖[39m New columns have 5 rows.
    [34mℹ[39m `.data` has 16 rows.
    --- failed re-building ‘tabxplor.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tabxplor.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tealeaves

<details>

* Version: 1.0.6
* GitHub: NA
* Source code: https://github.com/cran/tealeaves
* Date/Publication: 2022-07-20 14:30:02 UTC
* Number of recursive dependencies: 88

Run `cloud_details(, "tealeaves")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tealeaves-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tleaves
    > ### Title: 'tleaves': find leaf temperatures for multiple parameter sets
    > ### Aliases: tleaves tleaf
    > 
    > ### ** Examples
    > 
    > # tleaf for single parameter set:
    ...
      2. │ └─pars %<>% dplyr::bind_cols(soln)
      3. ├─dplyr::bind_cols(., soln)
      4. │ ├─dplyr:::fix_call(vec_cbind(!!!dots, .name_repair = .name_repair))
      5. │ │ └─base::withCallingHandlers(...)
      6. │ └─vctrs::vec_cbind(!!!dots, .name_repair = .name_repair)
      7. └─vctrs::stop_incompatible_size(...)
      8.   └─vctrs:::stop_incompatible(...)
      9.     └─vctrs:::stop_vctrs(...)
     10.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─tealeaves::tleaves(...) at test-tleaves-crossing.R:12:0
        2. │ └─pars %<>% dplyr::bind_cols(soln)
        3. ├─dplyr::bind_cols(., soln)
        4. │ ├─dplyr:::fix_call(vec_cbind(!!!dots, .name_repair = .name_repair))
        5. │ │ └─base::withCallingHandlers(...)
        6. │ └─vctrs::vec_cbind(!!!dots, .name_repair = .name_repair)
        7. └─vctrs::stop_incompatible_size(...)
        8.   └─vctrs:::stop_incompatible(...)
        9.     └─vctrs:::stop_vctrs(...)
       10.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 85 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘parameter-functions.Rmd’ using rmarkdown
    --- finished re-building ‘parameter-functions.Rmd’
    
    --- re-building ‘tealeaves-intermediate.Rmd’ using rmarkdown
    --- finished re-building ‘tealeaves-intermediate.Rmd’
    
    --- re-building ‘tealeaves-introduction.Rmd’ using rmarkdown
    Loading required package: units
    udunits database from /usr/share/xml/udunits/udunits2.xml
    ...
    Quitting from lines 95-123 (tealeaves-introduction.Rmd) 
    Error: processing vignette 'tealeaves-introduction.Rmd' failed with diagnostics:
    Can't recycle `..1` (size 52) to match `..2` (size 4).
    --- failed re-building ‘tealeaves-introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tealeaves-introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# text

<details>

* Version: 0.9.90
* GitHub: https://github.com/OscarKjell/text
* Source code: https://github.com/cran/text
* Date/Publication: 2022-05-30 11:20:02 UTC
* Number of recursive dependencies: 147

Run `cloud_details(, "text")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       37. │                 └─text (local) .f(...)
       38. │                   └─text:::fit_model_accuracy_rf(...)
       39. │                     └─... %>% ...
       40. ├─dplyr::bind_cols(...)
       41. │ ├─dplyr:::fix_call(vec_cbind(!!!dots, .name_repair = .name_repair))
       42. │ │ └─base::withCallingHandlers(...)
       43. │ └─vctrs::vec_cbind(!!!dots, .name_repair = .name_repair)
       44. └─vctrs::stop_incompatible_size(...)
       45.   └─vctrs:::stop_incompatible(...)
       46.     └─vctrs:::stop_vctrs(...)
       47.       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 1 | WARN 1 | SKIP 33 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 3 marked UTF-8 strings
    ```

# textrecipes

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/textrecipes
* Source code: https://github.com/cran/textrecipes
* Date/Publication: 2022-07-02 07:10:02 UTC
* Number of recursive dependencies: 121

Run `cloud_details(, "textrecipes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘textrecipes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: step_textfeature
    > ### Title: Calculate Set of Text Features
    > ### Aliases: step_textfeature
    > 
    > ### ** Examples
    > 
    > if (requireNamespace("textfeatures", quietly = TRUE)) {
    ...
      4. │ └─tidyselect::vars_pull(names(.data), !!enquo(var))
      5. │   ├─tidyselect:::with_entraced_errors(...)
      6. │   │ └─rlang::try_fetch(...)
      7. │   │   └─base::withCallingHandlers(...)
      8. │   └─rlang::eval_tidy(enquo(var), set_names(seq_along(vars), vars))
      9. └─base::.handleSimpleError(...)
     10.   └─rlang (local) h(simpleError(msg, call))
     11.     └─handlers[[1L]](cnd)
     12.       └─rlang::abort(conditionMessage(cnd), call = conditionCall(cnd))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(dim(tidy(obj, 2)), c(17, 4)) at test-tfidf.R:51:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─generics::tidy(obj, 2)
       5. └─recipes:::tidy.recipe(obj, 2)
       6.   ├─generics::tidy(x$steps[[number]], ...)
       7.   └─textrecipes:::tidy.step_tfidf(x$steps[[number]], ...)
       8.     └─purrr::map2_dfr(...)
       9.       └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 2 | WARN 0 | SKIP 88 | PASS 344 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# tglkmeans

<details>

* Version: 0.3.4
* GitHub: https://github.com/tanaylab/tglkmeans
* Source code: https://github.com/cran/tglkmeans
* Date/Publication: 2022-04-20 08:40:02 UTC
* Number of recursive dependencies: 87

Run `cloud_details(, "tglkmeans")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error (test-clustering.R:129:5): hclust intra cluster works ─────────────────
      Error: Can't merge the outer name `1` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. ├─tglkmeans::TGL_kmeans_tidy(...) at test-clustering.R:129:4
       2. │ └─tglkmeans:::hclust_every_cluster(km, df, parallel = parallel)
       3. │   └─... %>% purrr::map_df(~.x)
       4. └─purrr::map_df(., ~.x)
       5.   └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 1 | WARN 0 | SKIP 2 | PASS 190 ]
      Error: Test failures
      Execution halted
    ```

# themis

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/themis
* Source code: https://github.com/cran/themis
* Date/Publication: 2022-07-02 06:40:02 UTC
* Number of recursive dependencies: 88

Run `cloud_details(, "themis")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘themis-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: step_downsample
    > ### Title: Down-Sample a Data Set Based on a Factor Variable
    > ### Aliases: step_downsample
    > 
    > ### ** Examples
    > 
    > library(recipes)
    ...
    4 L       259
    > 
    > up_rec <- recipe(class ~ ., data = hpc_data0) %>%
    +   # Bring the majority levels down to about 1000 each
    +   # 1000/259 is approx 3.862
    +   step_downsample(class, under_ratio = 3.862) %>%
    +   prep()
    Error: Can't merge the outer name `VF` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─... %>% prep() at test-step_upsample.R:250:2
       2. ├─recipes::prep(.)
       3. └─recipes:::prep.recipe(.)
       4.   ├─recipes::bake(x$steps[[i]], new_data = training)
       5.   └─themis:::bake.step_upsample(x$steps[[i]], new_data = training)
       6.     ├─withr::with_seed(...)
       7.     │ └─withr::with_preserve_seed(...)
       8.     └─purrr::map2_dfr(split_data, split_wts, supsamp, num = object$target)
       9.       └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 25 | WARN 0 | SKIP 46 | PASS 255 ]
      Error: Test failures
      Execution halted
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
    
    > ### Name: five_number_summary
    > ### Title: five number summary
    > ### Aliases: five_number_summary
    > 
    > ### ** Examples
    > 
    > 
    ...
    Error in `rlang::set_names()`:
    ! The size of `nm` (6) must be compatible with the size of `x` (1).
    Backtrace:
        ▆
     1. ├─iris$Petal.Width %>% five_number_summary()
     2. ├─tidybins::five_number_summary(.)
     3. │ └─... %>% ...
     4. ├─rlang::set_names(., c("min", "q1", "median", "mean", "q3", "max"))
     5. └─rlang::abort(message = message)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘badger’ ‘ggplot2’ ‘lubridate’ ‘scales’ ‘xgboost’
      All declared Imports should be used.
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
     24. │               └─vctrs::stop_incompatible_cast(...)
     25. │                 └─vctrs::stop_incompatible_type(...)
     26. │                   └─vctrs:::stop_incompatible(...)
     27. │                     └─vctrs:::stop_vctrs(...)
     28. │                       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
     29. │                         └─rlang:::signal_abort(cnd, .file)
     30. │                           └─base::signalCondition(cnd)
     31. └─tibble (local) `<fn>`(`<vctrs___>`)
     32.   └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       25. │           └─vctrs (local) `<fn>`()
       26. │             └─vctrs::vec_default_cast(...)
       27. │               └─vctrs::stop_incompatible_cast(...)
       28. │                 └─vctrs::stop_incompatible_type(...)
       29. │                   └─vctrs:::stop_incompatible(...)
       30. │                     └─vctrs:::stop_vctrs(...)
       31. │                       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
       32. │                         └─rlang:::signal_abort(cnd, .file)
       33. │                           └─base::signalCondition(cnd)
       34. └─tibble (local) `<fn>`(`<vctrs___>`)
       35.   └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 87 | SKIP 0 | PASS 92 ]
      Error: Test failures
      Execution halted
    ```

# TidyMultiqc

<details>

* Version: 1.0.2
* GitHub: https://github.com/multimeric/TidyMultiqc
* Source code: https://github.com/cran/TidyMultiqc
* Date/Publication: 2022-02-10 15:20:03 UTC
* Number of recursive dependencies: 71

Run `cloud_details(, "TidyMultiqc")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. ├─dplyr::filter(., x == 30)
        7. ├─dplyr:::filter.data.frame(., x == 30)
        8. │ └─dplyr:::filter_rows(.data, ..., caller_env = caller_env())
        9. │   └─dplyr:::filter_eval(dots, mask = mask, error_call = error_call)
       10. │     ├─base::withCallingHandlers(...)
       11. │     └─mask$eval_all_filter(dots, env_filter)
       12. └─base::.handleSimpleError(...)
       13.   └─dplyr (local) h(simpleError(msg, call))
       14.     └─rlang::abort(bullets, call = error_call, parent = skip_internal_condition(e))
      ── Failure (test-plot-list.R:3:3): We can list plot IDs ────────────────────────
      `plots` inherits from 'data.frame' not 'tbl'.
      
      [ FAIL 6 | WARN 0 | SKIP 0 | PASS 66 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘TidyMultiqc.Rmd’ using rmarkdown
    Quitting from lines 244-248 (TidyMultiqc.Rmd) 
    Error: processing vignette 'TidyMultiqc.Rmd' failed with diagnostics:
    Problem while computing `total_reads = sum(y)`.
    ℹ The error occurred in group 1: metadata.sample_id = "P4107_1001".
    Caused by error in `sum()`:
    ! invalid 'type' (list) of argument
    --- failed re-building ‘TidyMultiqc.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘TidyMultiqc.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidyndr

<details>

* Version: 0.2.1
* GitHub: https://github.com/stephenbalogun/tidyndr
* Source code: https://github.com/cran/tidyndr
* Date/Publication: 2022-04-08 06:40:02 UTC
* Number of recursive dependencies: 70

Run `cloud_details(, "tidyndr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidyndr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cot_cascade
    > ### Title: Analyse the Treatment Continuity Cascade
    > ### Aliases: cot_cascade
    > 
    > ### ** Examples
    > 
    > cot_cascade(ndr_example, quarter = 2, ref = "2022-02-28", .level = "state")
    ...
      8. │           └─purrr::map_df(dat, col_sum)
      9. │             └─vctrs::vec_rbind(!!!res, .names_to = .id)
     10. │               └─vctrs (local) `<fn>`()
     11. │                 └─vctrs::vec_default_ptype2(...)
     12. │                   └─vctrs::stop_incompatible_type(...)
     13. │                     └─vctrs:::stop_incompatible(...)
     14. │                       └─vctrs:::stop_vctrs(...)
     15. │                         └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
     16. └─dplyr::mutate(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        9. │       └─tidyndr::my_summary(data[[i]], l = level, n = names[[i]])
       10. │         └─janitor::adorn_totals(...)
       11. │           └─purrr::map_df(dat, col_sum)
       12. │             └─vctrs::vec_rbind(!!!res, .names_to = .id)
       13. │               └─vctrs (local) `<fn>`()
       14. │                 └─vctrs::vec_default_ptype2(...)
       15. │                   └─vctrs::stop_incompatible_type(...)
       16. │                     └─vctrs:::stop_incompatible(...)
       17. │                       └─vctrs:::stop_vctrs(...)
       18. │                         └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
       19. └─dplyr::mutate(...)
      
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 20 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Augmenting-tidyndr.Rmd’ using rmarkdown
    Attaching package: 'tidyndr' 
    A package for analysis of the front-end patient-level data from the Nigeria National Data Repository.
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    ...
    Quitting from lines 364-369 (tidyndr.Rmd) 
    Error: processing vignette 'tidyndr.Rmd' failed with diagnostics:
    Can't combine `ip$...1` <character> and `curr$...1` <integer>.
    --- failed re-building ‘tidyndr.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Augmenting-tidyndr.Rmd’ ‘tidyndr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidystats

<details>

* Version: 0.5.1
* GitHub: https://github.com/WillemSleegers/tidystats
* Source code: https://github.com/cran/tidystats
* Date/Publication: 2022-01-04 22:20:02 UTC
* Number of recursive dependencies: 95

Run `cloud_details(, "tidystats")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidystats-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tidy_stats_to_data_frame
    > ### Title: Convert a tidystats list to a data frame
    > ### Aliases: tidy_stats_to_data_frame
    > 
    > ### ** Examples
    > 
    > # Load dplyr for access to the piping operator
    ...
    > results <- results %>%
    +   add_stats(sleep_test) %>%
    +   add_stats(lm_D9, type = "primary", preregistered = TRUE) %>%
    +   add_stats(npk_aov, notes = "An ANOVA example")
    >   
    > # Convert the list to a data frame
    > results_df <- tidy_stats_to_data_frame(results)
    Error: Can't merge the outer name `CI` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: Can't merge the outer name `CI` with a vector of length > 1.
      Please supply a `.name_spec` specification.
      Backtrace:
          ▆
       1. └─tidystats::tidy_stats_to_data_frame(results) at test_tidy_stats_to_data_frame.R:43:2
       2.   └─purrr::map2_dfr(x, names(x), analysis_to_data_frame)
       3.     └─purrr::map2(.x, .y, .f, ...)
       4.       └─tidystats (local) .f(.x[[i]], .y[[i]], ...)
       5.         └─tidystats:::statistics_to_data_frame(x$statistics)
       6.           └─purrr::map2_dfr(x, names(x), statistic_to_data_frame)
       7.             └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 70 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘introduction-to-tidystats.Rmd’ using rmarkdown
    Welcome to tidystats 0.5.1.
    This is a small bug fix update.
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    ...
    --- failed re-building ‘read-and-use-a-tidystats-file.Rmd’
    
    --- re-building ‘tidystats-taxonomy.Rmd’ using rmarkdown
    --- finished re-building ‘tidystats-taxonomy.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘read-and-use-a-tidystats-file.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 113 marked UTF-8 strings
    ```

# tidytidbits

<details>

* Version: 0.3.2
* GitHub: NA
* Source code: https://github.com/cran/tidytidbits
* Date/Publication: 2022-03-16 22:30:06 UTC
* Number of recursive dependencies: 29

Run `cloud_details(, "tidytidbits")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidytidbits-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: count_at
    > ### Title: Count by multiple variables
    > ### Aliases: count_at
    > 
    > ### ** Examples
    > 
    > library(magrittr)
    ...
     1. ├─mtcars %>% count_at(vars(gear, cyl))
     2. ├─tidytidbits::count_at(., vars(gear, cyl))
     3. │ ├─... %>% select(!!!labels, !!!.grouping, !!!column_names)
     4. │ └─purrr::map_dfr(...)
     5. │   └─vctrs::vec_rbind(!!!res, .names_to = .id)
     6. ├─dplyr::select(., !!!labels, !!!.grouping, !!!column_names)
     7. ├─dplyr::mutate(...)
     8. └─rlang:::stop_internal_c_lib(...)
     9.   └─rlang::abort(message, call = call, .internal = TRUE, .frame = frame)
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
    
    > ### Name: tw_extract_single
    > ### Title: Extract item data from an object of class Wikidata created with
    > ###   'WikidataR'
    > ### Aliases: tw_extract_single
    > 
    > ### ** Examples
    > 
    ...
    > item <- tryCatch(WikidataR::get_item(id = "Q180099"),
    +   error = function(e) {
    +     as.character(e[[1]])
    +   }
    + )
    > 
    > tidywikidatar:::tw_extract_single(w = item)
    Error: Can't merge the outer name `lv` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5.   └─tidywikidatar::tw_get(...)
        6.     └─purrr::map_dfr(...)
        7.       └─purrr::map(.x, .f, ...)
        8.         └─tidywikidatar (local) .f(.x[[i]], ...)
        9.           └─tidywikidatar:::tw_get_single(...)
       10.             └─tidywikidatar:::tw_extract_single(w = item, language = language)
       11.               └─purrr::map_dfr(...)
       12.                 └─vctrs::vec_rbind(!!!res, .names_to = .id)
      
      [ FAIL 3 | WARN 0 | SKIP 12 | PASS 0 ]
      Error: Test failures
      Execution halted
      Warning messages:
      1: In (function (e)  : You have a leaked pooled object.
      2: In (function (e)  : You have a leaked pooled object.
    ```

# timetk

<details>

* Version: 2.8.1
* GitHub: https://github.com/business-science/timetk
* Source code: https://github.com/cran/timetk
* Date/Publication: 2022-05-31 21:10:02 UTC
* Number of recursive dependencies: 217

Run `cloud_details(, "timetk")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘timetk-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: between_time
    > ### Title: Between (For Time Series): Range detection for date or date-time
    > ###   sequences
    > ### Aliases: between_time
    > 
    > ### ** Examples
    > 
    ...
    New names:
    • `` -> `...1`
    New names:
    • `...1` -> `...7`
    Warning: Unknown or uninitialised column: `diff.q1`.
    Warning: Unknown or uninitialised column: `diff.q3`.
    Error in if (is_month_or_qtr & is_irregular) { : 
      argument is of length zero
    Calls: tk_make_timeseries -> handle_day_of_month_irregular
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─timetk::tk_make_future_timeseries(...)
        7. └─timetk:::tk_make_future_timeseries.Date(...)
        8.   └─base::tryCatch(...)
        9.     └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       10.       └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       11.         └─value[[3L]](cond)
       12.           └─timetk:::make_sequential_timeseries_irregular_freq(...)
       13.             ├─base::seq(...)
       14.             └─base::seq.default(...)
      
      [ FAIL 23 | WARN 15 | SKIP 0 | PASS 266 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2750 marked UTF-8 strings
    ```

# tune

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/tune
* Source code: https://github.com/cran/tune
* Date/Publication: 2022-07-07 21:00:02 UTC
* Number of recursive dependencies: 110

Run `cloud_details(, "tune")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tune-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: conf_mat_resampled
    > ### Title: Compute average confusion matrix across resamples
    > ### Aliases: conf_mat_resampled
    > 
    > ### ** Examples
    > 
    > library(parsnip)
    ...
    Warning: All models failed. Run `show_notes(.Last.tune.result)` for more information.
    > 
    > conf_mat_resampled(res)
    Error in `conf_mat_resampled()`:
    ! Cannot find the predicted classes. Was this a classification model?
    Backtrace:
        ▆
     1. └─tune::conf_mat_resampled(res)
     2.   └─rlang::abort("Cannot find the predicted classes. Was this a classification model?")
    Execution halted
    ```

# uniswappeR

<details>

* Version: 0.6.0
* GitHub: https://github.com/Omni-Analytics-Group/uniswappeR
* Source code: https://github.com/cran/uniswappeR
* Date/Publication: 2022-05-27 08:00:05 UTC
* Number of recursive dependencies: 58

Run `cloud_details(, "uniswappeR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘uniswappeR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: swap_statistics
    > ### Title: Get statistics on the swaps data for a given address or
    > ###   addresses
    > ### Aliases: swap_statistics
    > 
    > ### ** Examples
    > 
    ...
    + "0x41D2a18E1DdACdAbFDdADB62e9AEE67c63070b76",
    + "0x0De20c4bDBE0d0EEFFd2956Be4c148CA86C6cC45")
    > 
    > swap_data <- swaps(addresses)
    Fetched 2 Swap Records of address 0xb1b117a45aD71d408eb55475FC3A65454edCc94A
    Fetched 19 Swap Records of address 0x41D2a18E1DdACdAbFDdADB62e9AEE67c63070b76
    > swap_statistics(swap_data)
    Error: Can't merge the outer name `All Addresses` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

# utile.tables

<details>

* Version: 0.2.1
* GitHub: https://github.com/efinite/utile.tables
* Source code: https://github.com/cran/utile.tables
* Date/Publication: 2020-06-14 15:40:02 UTC
* Number of recursive dependencies: 23

Run `cloud_details(, "utile.tables")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘utile.tables-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: build_model.coxph
    > ### Title: Build Cox PH models
    > ### Aliases: build_model.coxph
    > 
    > ### ** Examples
    > 
    > library(survival)
    ...
    +   mutate_at(vars(inst, status, sex), as.factor) %>%
    +   mutate(status = case_when(status == 1 ~ 0, status == 2 ~ 1))
    > 
    > fit <- coxph(Surv(time, status) ~ 1, data = data_lung)
    > 
    > # Create a univariate model for each variable
    > fit %>% build_model(sex, age)
    Error: Can't merge the outer name `sex` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# valet

<details>

* Version: 0.9.0
* GitHub: NA
* Source code: https://github.com/cran/valet
* Date/Publication: 2022-04-12 08:10:02 UTC
* Number of recursive dependencies: 68

Run `cloud_details(, "valet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘valet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_group
    > ### Title: Get series-group observations
    > ### Aliases: get_group
    > 
    > ### ** Examples
    > 
    > get_group("BAPF_TRANSACTION_DATA")
    ...
     26.               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
     27.                 └─tidyselect:::as_indices_sel_impl(...)
     28.                   └─tidyselect:::as_indices_impl(x, vars, call = call, strict = strict)
     29.                     └─tidyselect:::chr_as_locations(x, vars, call = call)
     30.                       └─vctrs::vec_as_location(x, n = length(vars), names = vars)
     31.                         └─vctrs (local) `<fn>`()
     32.                           └─vctrs:::stop_subscript_oob(...)
     33.                             └─vctrs:::stop_subscript(...)
     34.                               └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       22.           └─tidyselect:::eval_c(expr, data_mask, context_mask)
       23.             └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
       24.               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
       25.                 └─tidyselect:::as_indices_sel_impl(...)
       26.                   └─tidyselect:::as_indices_impl(x, vars, call = call, strict = strict)
       27.                     └─tidyselect:::chr_as_locations(x, vars, call = call)
       28.                       └─vctrs::vec_as_location(x, n = length(vars), names = vars)
       29.                         └─vctrs (local) `<fn>`()
       30.                           └─vctrs:::stop_subscript_oob(...)
       31.                             └─vctrs:::stop_subscript(...)
       32.                               └─rlang::abort(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

# validata

<details>

* Version: 0.1.0
* GitHub: https://github.com/Harrison4192/validata
* Source code: https://github.com/cran/validata
* Date/Publication: 2021-10-05 08:20:02 UTC
* Number of recursive dependencies: 124

Run `cloud_details(, "validata")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘validata-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: diagnose_missing
    > ### Title: diagnose_missing
    > ### Aliases: diagnose_missing
    > 
    > ### ** Examples
    > 
    > 
    ...
        ▆
     1. ├─... %>% diagnose_missing()
     2. ├─validata::diagnose_missing(.)
     3. │ └─... %>% dplyr::mutate(missing_ratio = missings / total_rows)
     4. ├─dplyr::mutate(., missing_ratio = missings/total_rows)
     5. ├─dplyr::filter(., missings > 0)
     6. ├─dplyr::arrange(., dplyr::desc(missings))
     7. ├─rlang::set_names(., c("column", "missings"))
     8. └─rlang::abort(message = message)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘BBmisc’ ‘badger’
      All declared Imports should be used.
    ```

# weibulltools

<details>

* Version: 2.0.0
* GitHub: https://github.com/Tim-TU/weibulltools
* Source code: https://github.com/cran/weibulltools
* Date/Publication: 2021-01-12 09:30:02 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "weibulltools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘weibulltools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: confint_betabinom
    > ### Title: Beta Binomial Confidence Bounds for Quantiles and Probabilities
    > ### Aliases: confint_betabinom confint_betabinom.wt_model
    > 
    > ### ** Examples
    > 
    > # Reliability data preparation:
    ...
    > 
    > conf_betabin_4 <- confint_betabinom(
    +   x = rr_lists,
    +   bounds = "two_sided",
    +   conf_level = 0.99,
    +   direction = "y"
    + )
    Error: Can't merge the outer name `johnson` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Life_Data_Analysis_Part_I.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Error: processing vignette 'Life_Data_Analysis_Part_III.Rmd' failed with diagnostics:
    Can't merge the outer name `mod_1` with a vector of length > 1.
    Please supply a `.name_spec` specification.
    --- failed re-building ‘Life_Data_Analysis_Part_III.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Life_Data_Analysis_Part_III.Rmd’
    
    Error: Vignette re-building failed.
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

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘evaluating-different-predictor-sets.Rmd’ using rmarkdown
    Quitting from lines 89-127 (evaluating-different-predictor-sets.Rmd) 
    Error: processing vignette 'evaluating-different-predictor-sets.Rmd' failed with diagnostics:
    Can't subset columns that don't exist.
    ✖ Column `.config` doesn't exist.
    --- failed re-building ‘evaluating-different-predictor-sets.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘evaluating-different-predictor-sets.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# wrappedtools

<details>

* Version: 0.7.9
* GitHub: NA
* Source code: https://github.com/cran/wrappedtools
* Date/Publication: 2021-09-06 14:30:02 UTC
* Number of recursive dependencies: 126

Run `cloud_details(, "wrappedtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wrappedtools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compare_n_numvars
    > ### Title: Comparison for columns of Gaussian measures for n groups
    > ### Aliases: compare_n_numvars
    > 
    > ### ** Examples
    > 
    > # Usually,only the result table is relevant:
    ...
    • `` -> `...8`
    • `` -> `...9`
    • `` -> `...10`
    • `` -> `...11`
    • `` -> `...12`
    • `` -> `...13`
    Error in data.frame(..., check.names = FALSE) : 
      arguments imply differing number of rows: 13, 3
    Calls: compare_n_numvars -> %>% -> as_tibble -> cbind -> cbind -> data.frame
    Execution halted
    ```

# xpose

<details>

* Version: 0.4.13
* GitHub: https://github.com/UUPharmacometrics/xpose
* Source code: https://github.com/cran/xpose
* Date/Publication: 2021-06-30 08:00:02 UTC
* Number of recursive dependencies: 107

Run `cloud_details(, "xpose")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘xpose-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_prm
    > ### Title: Access model parameters
    > ### Aliases: get_prm
    > 
    > ### ** Examples
    > 
    > # Store the parameter table
    ...
      5. │   └─... %>% dplyr::mutate(se = sqrt(.$variance))
      6. ├─dplyr::mutate(., se = sqrt(.$variance))
      7. ├─dplyr:::mutate.data.frame(., se = sqrt(.$variance))
      8. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
      9. │   ├─base::withCallingHandlers(...)
     10. │   └─mask$eval_all_mutate(quo)
     11. └─base::.handleSimpleError(...)
     12.   └─dplyr (local) h(simpleError(msg, call))
     13.     └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. ├─purrr::map(...)
        4. │ └─xpose (local) .f(.x[[i]], ...)
        5. │   └─... %>% dplyr::mutate(se = sqrt(.$variance))
        6. ├─dplyr::mutate(., se = sqrt(.$variance))
        7. ├─dplyr:::mutate.data.frame(., se = sqrt(.$variance))
        8. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), caller_env = caller_env())
        9. │   ├─base::withCallingHandlers(...)
       10. │   └─mask$eval_all_mutate(quo)
       11. └─base::.handleSimpleError(...)
       12.   └─dplyr (local) h(simpleError(msg, call))
       13.     └─rlang::abort(...)
      
      [ FAIL 3 | WARN 0 | SKIP 7 | PASS 512 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘access_xpdb_data.Rmd’ using rmarkdown
    Returning data from run001.ext, $prob no.1, subprob no.0, method foce
    Returning parameter estimates from $prob no.1, subprob no.0, method foce
    Quitting from lines 68-74 (access_xpdb_data.Rmd) 
    Error: processing vignette 'access_xpdb_data.Rmd' failed with diagnostics:
    Problem while computing `se = sqrt(.$variance)`.
    Caused by error in `sqrt()`:
    ! non-numeric argument to mathematical function
    --- failed re-building ‘access_xpdb_data.Rmd’
    ...
    Calculating statistics for observed data...
    
    VPC done
    --- finished re-building ‘vpc.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘access_xpdb_data.Rmd’ ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

