# admiral (1.5.0)

* GitHub: <https://github.com/pharmaverse/admiral>
* Email: <mailto:edoardo.mancini@roche.com>
* GitHub mirror: <https://github.com/cran/admiral>

Run `revdepcheck::cloud_details(, "admiral")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +   )
     + )
     Warning: Use of pairlists in purrr functions was deprecated in purrr 1.0.0.
     ℹ Please coerce explicitly with `as.list()`
     ℹ The deprecated feature was likely used in the purrr package.
       Please report the issue at <https://github.com/tidyverse/purrr/issues>.
     Error in `keep()`:
     ℹ In index: 1.
     ℹ With name: dataset.
     Caused by error in `map_()`:
     ! argument ".x_i" is missing, with no default
     Backtrace:
          ▆
       1. ├─admiral::slice_derivation(...)
       2. │ └─formals(derivation) %>% keep(is_missing) %>% names()
       3. ├─purrr::keep(., is_missing)
       4. │ └─purrr:::where_if(.x, .p, ...)
       5. │   └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
       6. │     ├─purrr:::with_indexed_errors(...)
       7. │     │ └─base::withCallingHandlers(...)
       8. │     └─purrr:::call_with_cleanup(...)
       9. └─purrr (local) `<fn>`(`<evalErrr>`)
      10.   └─cli::cli_abort(...)
      11.     └─rlang::abort(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        11.     └─rlang::abort(...)
       ── Error ('test-slice_derivation.R:274:3'): slice_derivation Test 8: args = NULL works ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `keep(., is_missing)`: i In index: 1.
       i With name: .data.
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       Backtrace:
            ▆
         1. ├─admiral::slice_derivation(...) at test-slice_derivation.R:274:3
         2. │ └─formals(derivation) %>% keep(is_missing) %>% names()
         3. ├─purrr::keep(., is_missing)
         4. │ └─purrr:::where_if(.x, .p, ...)
         5. │   └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
         6. │     ├─purrr:::with_indexed_errors(...)
         7. │     │ └─base::withCallingHandlers(...)
         8. │     └─purrr:::call_with_cleanup(...)
         9. └─purrr (local) `<fn>`(`<evalErrr>`)
        10.   └─cli::cli_abort(...)
        11.     └─rlang::abort(...)
       
       [ FAIL 7 | WARN 1 | SKIP 140 | PASS 1110 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     --- finished re-building ‘lab_grading.Rmd’
     
     --- re-building ‘occds.Rmd’ using rmarkdown
     --- finished re-building ‘occds.Rmd’
     
     --- re-building ‘pk_adnca.Rmd’ using rmarkdown
     --- finished re-building ‘pk_adnca.Rmd’
     
     --- re-building ‘queries_dataset.Rmd’ using rmarkdown
     --- finished re-building ‘queries_dataset.Rmd’
     
     --- re-building ‘questionnaires.Rmd’ using rmarkdown
     --- finished re-building ‘questionnaires.Rmd’
     
     --- re-building ‘tte_analyses.Rmd’ using rmarkdown
     --- finished re-building ‘tte_analyses.Rmd’
     
     --- re-building ‘visits_periods.Rmd’ using rmarkdown
     --- finished re-building ‘visits_periods.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘bds_finding.Rmd’ ‘higher_order.Rmd’ ‘hys_law.Rmd’ ‘imputation.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# admiralmetabolic (0.3.0)

* GitHub: <https://github.com/pharmaverse/admiralmetabolic>
* Email: <mailto:iakd@novonordisk.com>
* GitHub mirror: <https://github.com/cran/admiralmetabolic>

Run `revdepcheck::cloud_details(, "admiralmetabolic")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      5.   └─purrr:::where_if(.x, .p, ...)
      6.     └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
      7.       ├─purrr:::with_indexed_errors(...)
      8.       │ └─base::withCallingHandlers(...)
      9.       └─purrr:::call_with_cleanup(...)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'adlb.Rmd' failed with diagnostics:
     ℹ In index: 1.
     ℹ With name: .data.
     Caused by error in `map_()`:
     ! argument ".x_i" is missing, with no default
     --- failed re-building ‘adlb.Rmd’
     
     --- re-building ‘admiralmetabolic.Rmd’ using rmarkdown
     --- finished re-building ‘admiralmetabolic.Rmd’
     
     --- re-building ‘advs.Rmd’ using rmarkdown
     --- finished re-building ‘advs.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘adlb.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# admiralpeds (0.4.0)

* GitHub: <https://github.com/pharmaverse/admiralpeds>
* Email: <mailto:fanny.gautier@cytel.com>
* GitHub mirror: <https://github.com/cran/admiralpeds>

Run `revdepcheck::cloud_details(, "admiralpeds")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     Backtrace:
         ▆
      1. ├─advs %>% ...
      2. ├─admiral::slice_derivation(...)
      3. │ └─formals(derivation) %>% keep(is_missing) %>% names()
      4. └─purrr::keep(., is_missing)
      5.   └─purrr:::where_if(.x, .p, ...)
      6.     └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
      7.       ├─purrr:::with_indexed_errors(...)
      8.       │ └─base::withCallingHandlers(...)
      9.       └─purrr:::call_with_cleanup(...)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'advs.Rmd' failed with diagnostics:
     ℹ In index: 1.
     ℹ With name: dataset.
     Caused by error in `map_()`:
     ! argument ".x_i" is missing, with no default
     --- failed re-building ‘advs.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘advs.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# bambooHR (0.1.1)

* GitHub: <https://github.com/MangoTheCat/bambooHR>
* Email: <mailto:tom.bowling@ascent.io>
* GitHub mirror: <https://github.com/cran/bambooHR>

Run `revdepcheck::cloud_details(, "bambooHR")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         8.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
         9.     └─lifecycle:::deprecate_stop0(msg)
        10.       └─rlang::cnd_signal(...)
       ── Error ('test-get_time_off_types.R:4:5'): get time off types works ───────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `when()` was deprecated in purrr 1.0.0 and is now defunct.
       i Please use `if` instead.
       Backtrace:
            ▆
         1. ├─bambooHR::get_timeoff_types() at test-get_time_off_types.R:4:5
         2. │ └─bambooHR::get_meta("time_off/types")
         3. │   └─... %>% janitor::clean_names()
         4. ├─janitor::clean_names(.)
         5. ├─tibble::tibble(.)
         6. │ └─tibble:::tibble_quos(xs, .rows, .name_repair)
         7. │   └─rlang::eval_tidy(xs[[j]], mask)
         8. └─purrr::when(...)
         9.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
        10.     └─lifecycle:::deprecate_stop0(msg)
        11.       └─rlang::cnd_signal(...)
       
       [ FAIL 3 | WARN 8 | SKIP 0 | PASS 19 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# broom (1.0.13)

* GitHub: <https://github.com/tidymodels/broom>
* Email: <mailto:emil.hvitfeldt@posit.co>
* GitHub mirror: <https://github.com/cran/broom>

Run `revdepcheck::cloud_details(, "broom")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
        7. └─purrr (local) `<fn>`(`<evalErrr>`)
        8.   └─cli::cli_abort(...)
        9.     └─rlang::abort(...)
       ── Error ('test-tseries.R:11:3'): tseries tidier arguments ─────────────────────
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map_lgl(arglist, is.name)`: i In index: 1.
       i With name: x.
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       Backtrace:
           ▆
        1. ├─modeltests::check_arguments(tidy.garch) at test-tseries.R:11:3
        2. │ └─purrr::map_lgl(arglist, is.name)
        3. │   └─purrr:::map_("logical", .x, .f, ..., .progress = .progress)
        4. │     ├─purrr:::with_indexed_errors(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─purrr:::call_with_cleanup(...)
        7. └─purrr (local) `<fn>`(`<evalErrr>`)
        8.   └─cli::cli_abort(...)
        9.     └─rlang::abort(...)
       
       [ FAIL 22 | WARN 0 | SKIP 98 | PASS 831 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# bspcov (1.0.3)

* GitHub: <https://github.com/statjs/bspcov>
* Email: <mailto:kwlee1718@gmail.com>
* GitHub mirror: <https://github.com/cran/bspcov>

Run `revdepcheck::cloud_details(, "bspcov")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     Error:
     ! `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `map()` instead.
       # Previously
     rerun(100, CholWishart::rInvWishart(1, param_initpost$nu, param_initpost$A)[, ,
     1] %>% Matrix::Matrix(sparse = T) %>% Matrix::band(k1 = -k, k2 = k) %>%
     pd_adjustment_Matrix(eps = eps))
     
       # Now
     map(1:100, ~ CholWishart::rInvWishart(1, param_initpost$nu, param_initpost$A)[,
     ,
     1] %>% Matrix::Matrix(sparse = T) %>% Matrix::band(k1 = -k, k2 = k) %>%
     pd_adjustment_Matrix(eps = eps))
     Backtrace:
         ▆
      1. ├─bspcov::bandPPP(X, 2, 0.01, nsample = 100)
      2. │ ├─... %>% purrr::map(~ matrixcalc::vech(as.matrix(.x)))
      3. │ └─purrr::rerun(...)
      4. │   └─lifecycle::deprecate_stop(...)
      5. │     └─lifecycle:::deprecate_stop0(msg)
      6. │       └─rlang::cnd_signal(...)
      7. └─purrr::map(., ~matrixcalc::vech(as.matrix(.x)))
      8.   └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
      9.     └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
     Execution halted
     ```

# cheese (0.1.3)

* GitHub: <https://github.com/zajichek/cheese>
* Email: <mailto:alexzajichek@gmail.com>
* GitHub mirror: <https://github.com/cran/cheese>

Run `revdepcheck::cloud_details(, "cheese")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +       rbinom(nrow(.), size = 1, prob = .5) %>%
     +       factor
     +   )
     > 
     > data %>%
     +   stretch(
     +     key = c(BloodSugar, HeartDisease),
     +     value = c(Mean, SD, Random)
     +   )
     Error:
     ! `cross_df()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     Backtrace:
         ▆
      1. ├─data %>% ...
      2. ├─cheese::stretch(...)
      3. │ └─data %>% dplyr::select(tidyselect::all_of(key)) %>% ...
      4. ├─cheese:::order_levels(., sep = sep)
      5. │ └─sets %>% purrr::map(as.character) %>% purrr::cross_df()
      6. └─purrr::cross_df(.)
      7.   └─lifecycle::deprecate_stop(...)
      8.     └─lifecycle:::deprecate_stop0(msg)
      9.       └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     Backtrace:
          ▆
       1. ├─heart_disease %>% univariate_table(strata = ~Sex)
       2. ├─cheese::univariate_table(., strata = ~Sex)
       3. │ └─... %>% ...
       4. ├─cheese::stretch(...)
       5. │ └─data %>% dplyr::select(tidyselect::all_of(key)) %>% ...
       6. ├─cheese:::order_levels(., sep = sep)
       7. │ └─sets %>% purrr::map(as.character) %>% purrr::cross_df()
       8. └─purrr::cross_df(.)
       9.   └─lifecycle::deprecate_stop(...)
      10.     └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'describe.Rmd' failed with diagnostics:
     `cross_df()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     --- failed re-building ‘describe.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘cheese.Rmd’ ‘describe.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# cohortBuilder (1.0.0)

* GitHub: <https://github.com/r-world-devs/cohortBuilder>
* Email: <mailto:krystian8207@gmail.com>
* GitHub mirror: <https://github.com/cran/cohortBuilder>

Run `revdepcheck::cloud_details(, "cohortBuilder")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
            ▆
         1. ├─testthat::expect_identical(...) at test-reproducible_code_utils.R:43:3
         2. │ └─testthat::quasi_label(enquo(object), label)
         3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
         4. ├─cohortBuilder:::combine_expressions(...)
         5. │ └─base::lapply(...) at cohortBuilder/R/repro_code_utils.R:114:3
         6. ├─cohortBuilder:::parse_func_expr(test_fun_one) at cohortBuilder/R/repro_code_utils.R:114:3
         7. │ ├─cohortBuilder:::substitute_q(...) at cohortBuilder/R/repro_code_utils.R:35:3
         8. │ │ └─base::eval(call) at cohortBuilder/R/repro_code_utils.R:12:3
         9. │ │   └─base::eval(call)
        10. │ ├─base::append(...) at cohortBuilder/R/repro_code_utils.R:35:3
        11. │ └─purrr::keep(formals(func), Negate(is.symbol)) at cohortBuilder/R/repro_code_utils.R:35:3
        12. │   └─purrr:::where_if(.x, .p, ...)
        13. │     └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
        14. │       ├─purrr:::with_indexed_errors(...)
        15. │       │ └─base::withCallingHandlers(...)
        16. │       └─purrr:::call_with_cleanup(...)
        17. └─purrr (local) `<fn>`(`<evalErrr>`)
        18.   └─cli::cli_abort(...)
        19.     └─rlang::abort(...)
       
       [ FAIL 3 | WARN 1 | SKIP 5 | PASS 1012 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      12.         │   └─base::eval(call)
      13.         ├─base::append(...) at cohortBuilder/R/repro_code_utils.R:35:3
      14.         └─purrr::keep(formals(func), Negate(is.symbol)) at cohortBuilder/R/repro_code_utils.R:35:3
      15.           └─purrr:::where_if(.x, .p, ...)
      16.             └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
      17.               ├─purrr:::with_indexed_errors(...)
      18.               │ └─base::withCallingHandlers(...)
      19.               └─purrr:::call_with_cleanup(...)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'managing-cohort.Rmd' failed with diagnostics:
     ℹ In index: 1.
     ℹ With name: source.
     Caused by error in `map_()`:
     ! argument ".x_i" is missing, with no default
     --- failed re-building ‘managing-cohort.Rmd’
     
     --- re-building ‘source-intelligence.Rmd’ using rmarkdown
     --- finished re-building ‘source-intelligence.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘cohortBuilder.Rmd’ ‘custom-filters.Rmd’ ‘managing-cohort.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# colorednoise (1.1.2)

* GitHub: <https://github.com/japilo/colorednoise>
* Email: <mailto:pilowskyj@caryinstitute.org>
* GitHub mirror: <https://github.com/cran/colorednoise>

Run `revdepcheck::cloud_details(, "colorednoise")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ###   Combination of Parameters
     > ### Aliases: autocorr_sim
     > 
     > ### ** Examples
     > 
     > survival_range <- autocorr_sim(timesteps = 30, start = 200, survPhi = 0.3, fecundPhi = 0.1,
     +                                survMean = c(0.2, 0.3, 0.4, 0.5, 0.6), survSd = 0.5,
     +                                fecundMean = 1.1, fecundSd = 0.5, replicates = 50)
     Error:
     ! `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `map()` instead.
       # Previously
       rerun(50, ., pmap(., unstructured_pop))
     
       # Now
       map(1:50, ~ list(., pmap(., unstructured_pop)))
     Backtrace:
         ▆
      1. ├─colorednoise::autocorr_sim(...)
      2. │ └─... %>% rerun(.n = replicates, pmap(., unstructured_pop))
      3. └─purrr::rerun(., .n = replicates, pmap(., unstructured_pop))
      4.   └─lifecycle::deprecate_stop(...)
      5.     └─lifecycle:::deprecate_stop0(msg)
      6.       └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         # Now
       map(1:1000, ~ unstructured_pop(start = 5000, timesteps = 50, survPhi = 0.5,
       survMean = 0.4, survSd = 0.05, fecundPhi = 0, fecundMean = 1.5, fecundSd =
       0.2))
       Backtrace:
            ▆
         1. ├─... %>% map_dbl(~ autocorrelation(.$est_surv)) at test_simulations.R:15:5
         2. ├─purrr::map_dbl(., ~autocorrelation(.$est_surv))
         3. │ └─purrr:::map_("double", .x, .f, ..., .progress = .progress)
         4. │   └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
         5. ├─purrr::map(., ~.[, `:=`(est_surv = survivors/population, est_fecund = newborns/survivors)])
         6. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
         7. │   └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
         8. ├─purrr::map(., setDT)
         9. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        10. │   └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
        11. └─purrr::rerun(...)
        12.   └─lifecycle::deprecate_stop(...)
        13.     └─lifecycle:::deprecate_stop0(msg)
        14.       └─rlang::cnd_signal(...)
       
       [ FAIL 4 | WARN 0 | SKIP 0 | PASS 5 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     
     Quitting from noise.Rmd:60-63 [estimate noise]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/lifecycle_error_deprecated>
     Error:
     ! `invoke_map()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use map() + exec() instead.
     ---
     Backtrace:
         ▆
      1. └─purrr::invoke_map(...)
      2.   └─lifecycle::deprecate_stop("1.0.0", "invoke_map()", I("map() + exec()"))
      3.     └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'noise.Rmd' failed with diagnostics:
     `invoke_map()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use map() + exec() instead.
     --- failed re-building ‘noise.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘noise.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘simulate_populations.R’
     ```

# crossmap (0.5.0)

* GitHub: <https://github.com/rossellhayes/crossmap>
* Email: <mailto:alexander@rossellhayes.com>
* GitHub mirror: <https://github.com/cran/crossmap>

Run `revdepcheck::cloud_details(, "crossmap")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘crossmap-Ex.R’ failed
     The error most likely occurred in:
     
     > ### Name: cross_fit
     > ### Title: Cross map a model across multiple formulas, subsets, and weights
     > ### Aliases: cross_fit
     > 
     > ### ** Examples
     > 
     > cross_fit(mtcars, mpg ~ wt, cyl)
     Warning: Using `by = character()` to perform a cross join was deprecated in dplyr 1.1.0.
     ℹ Please use `cross_join()` instead.
     ℹ The deprecated feature was likely used in the crossmap package.
       Please report the issue at <https://github.com/rossellhayes/crossmap/issues>.
     Error:
     ! `lift()` was deprecated in purrr 1.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─crossmap::cross_fit(mtcars, mpg ~ wt, cyl)
      2.   └─crossmap:::cross_fit_internal(...)
      3.     └─purrr::lift(tidy)
      4.       └─lifecycle::deprecate_stop("1.0.0", "lift()")
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         6. └─crossmap::cross_fit(df, x ~ m, n, errors = "warn")
         7.   └─crossmap:::cross_fit_internal(...)
         8.     └─purrr::lift(tidy)
         9.       └─lifecycle::deprecate_stop("1.0.0", "lift()")
        10.         └─lifecycle:::deprecate_stop0(msg)
        11.           └─rlang::cnd_signal(...)
       ── Error ('test-cross_fit_glm.R:11:3'): cross_fit_glm ──────────────────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `lift()` was deprecated in purrr 1.0.0 and is now defunct.
       Backtrace:
           ▆
        1. ├─base::suppressWarnings(...) at test-cross_fit_glm.R:11:3
        2. │ └─base::withCallingHandlers(...)
        3. └─crossmap::cross_fit_glm(...)
        4.   └─crossmap:::cross_fit_internal(...)
        5.     └─purrr::lift(tidy)
        6.       └─lifecycle::deprecate_stop("1.0.0", "lift()")
        7.         └─lifecycle:::deprecate_stop0(msg)
        8.           └─rlang::cnd_signal(...)
       
       [ FAIL 14 | WARN 0 | SKIP 2 | PASS 161 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# csvwr (0.1.7)

* GitHub: <https://github.com/Robsteranium/csvwr>
* Email: <mailto:csvwr@infonomics.ltd.uk>
* GitHub mirror: <https://github.com/cran/csvwr>

Run `revdepcheck::cloud_details(, "csvwr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 95 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-util.R:11:3'): rmap ────────────────────────────────────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `vec_depth()` was deprecated in purrr 1.0.0 and is now defunct.
       i Please use `pluck_depth()` instead.
       Backtrace:
            ▆
         1. ├─testthat::expect_equal(...) at test-util.R:11:3
         2. │ └─testthat::quasi_label(enquo(object), label)
         3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
         4. └─csvwr:::rmap(lowercase, stringr::str_to_upper)
         5.   └─purrr::lmap(.x, m)
         6.     └─purrr:::lmap_helper(.x, rep(TRUE, length(.x)), .f, ...)
         7.       └─csvwr (local) .f(.x[i], ...)
         8.         └─purrr::vec_depth(v)
         9.           └─lifecycle::deprecate_stop("1.0.0", "vec_depth()", "pluck_depth()")
        10.             └─lifecycle:::deprecate_stop0(msg)
        11.               └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 95 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# datadogr (0.1.2)

* GitHub: <https://github.com/yutannihilation/K9>
* Email: <mailto:yutani.ini@gmail.com>
* GitHub mirror: <https://github.com/cran/datadogr>

Run `revdepcheck::cloud_details(, "datadogr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─datadogr:::to_epochtime(x)
        5.   └─purrr::when(...)
        6.     └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
        7.       └─lifecycle:::deprecate_stop0(msg)
        8.         └─rlang::cnd_signal(...)
       ── Error ('test-to_epochtime.R:17:3'): to_epochtime with Date works ────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `when()` was deprecated in purrr 1.0.0 and is now defunct.
       ℹ Please use `if` instead.
       Backtrace:
           ▆
        1. ├─testthat::expect_equal(to_epochtime(x), 1496534400L) at test-to_epochtime.R:17:3
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─datadogr:::to_epochtime(x)
        5.   └─purrr::when(...)
        6.     └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
        7.       └─lifecycle:::deprecate_stop0(msg)
        8.         └─rlang::cnd_signal(...)
       
       [ FAIL 8 | WARN 0 | SKIP 1 | PASS 16 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# describedata (0.1.1)

* GitHub: <https://github.com/craigjmcgowan/describedata>
* Email: <mailto:mcgowan.cj@gmail.com>
* GitHub mirror: <https://github.com/cran/describedata>

Run `revdepcheck::cloud_details(, "describedata")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘describedata-Ex.R’ failed
     The error most likely occurred in:
     
     > ### Name: bivariate_compare
     > ### Title: Create publication-style table across one categorical variable
     > ### Aliases: bivariate_compare
     > 
     > ### ** Examples
     > 
     > bivariate_compare(iris, compare = "Species", normal_vars = c("Sepal.Length", "Sepal.Width"))
     Error:
     ! `when()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `if` instead.
     Backtrace:
         ▆
      1. ├─describedata::bivariate_compare(...)
      2. │ └─... %>% ...
      3. ├─dplyr::select(...)
      4. └─purrr::when(...)
      5.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
      6.     └─lifecycle:::deprecate_stop0(msg)
      7.       └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         9. └─purrr::when(...)
        10.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
        11.     └─lifecycle:::deprecate_stop0(msg)
        12.       └─rlang::cnd_signal(...)
       ── Error ('test-bivariate_compare.R:182:3'): column counts work if include_na = F ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `when()` was deprecated in purrr 1.0.0 and is now defunct.
       ℹ Please use `if` instead.
       Backtrace:
            ▆
         1. ├─testthat::expect_equal(...) at test-bivariate_compare.R:182:3
         2. │ └─testthat::quasi_label(enquo(object), label)
         3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
         4. ├─describedata::bivariate_compare(test_df, compare = "cyl", normal_vars = "disp")
         5. │ └─... %>% ...
         6. ├─dplyr::select(...)
         7. └─purrr::when(...)
         8.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
         9.     └─lifecycle:::deprecate_stop0(msg)
        10.       └─rlang::cnd_signal(...)
       
       [ FAIL 8 | WARN 0 | SKIP 0 | PASS 0 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# dibble (0.3.2)

* GitHub: <https://github.com/UchidaMizuki/dibble>
* Email: <mailto:uchidamizuki@vivaldi.net>
* GitHub mirror: <https://github.com/cran/dibble>

Run `revdepcheck::cloud_details(, "dibble")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Error in `purrr::map2(dim_names, locs, function(x, i) {     if (is_missing(i)) {         x     }     else {         vec_slice(x, i)     } })`: i In index: 2.
       i With name: axis2.
       Caused by error in `map2_()`:
       ! argument ".y_i" is missing, with no default
       Backtrace:
            ▆
         1. ├─dplyr::filter(tbl_ddf, axis1 == 2) at test-tbl_ddf.R:161:3
         2. ├─dibble:::filter.tbl_ddf(tbl_ddf, axis1 == 2)
         3. │ └─dibble:::filter_dibble(.data, ...)
         4. │   ├─dplyr::slice(.data, !!!locs)
         5. │   └─dibble:::slice.tbl_ddf(.data, !!!locs)
         6. │     └─dibble:::slice_dibble(.data, ...)
         7. │       └─purrr::map2(...)
         8. │         └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
         9. │           ├─purrr:::with_indexed_errors(...)
        10. │           │ └─base::withCallingHandlers(...)
        11. │           └─purrr:::call_with_cleanup(...)
        12. └─purrr (local) `<fn>`(`<evalErrr>`)
        13.   └─cli::cli_abort(...)
        14.     └─rlang::abort(...)
       
       [ FAIL 2 | WARN 0 | SKIP 0 | PASS 194 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# dynparam (1.0.2)

* GitHub: <https://github.com/dynverse/dynparam>
* Email: <mailto:rcannood@gmail.com>
* GitHub mirror: <https://github.com/cran/dynparam>

Run `revdepcheck::cloud_details(, "dynparam")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > di <- uniform_distribution(lower = 1, upper = 10)
     > print(di)
     U(1, 10)> 
     > li <- as.list(di)
     > di2 <- as_distribution(li)
     Error in `map_chr()`:
     ℹ In index: 1.
     ℹ With name: lower.
     Caused by error in `map_()`:
     ! argument ".x_i" is missing, with no default
     Backtrace:
          ▆
       1. ├─dynparam::as_distribution(li)
       2. │ └─formals(constructor_fun) %>% as.list() %>% map_chr(class)
       3. ├─purrr::map_chr(., class)
       4. │ └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
       5. │   ├─purrr:::with_indexed_errors(...)
       6. │   │ └─base::withCallingHandlers(...)
       7. │   └─purrr:::call_with_cleanup(...)
       8. └─purrr (local) `<fn>`(`<evalErrr>`)
       9.   └─cli::cli_abort(...)
      10.     └─rlang::abort(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        11.     └─rlang::abort(...)
       ── Error ('test-set.R:114:3'): works with many parameters ──────────────────────
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `map_chr(., class)`: ℹ In index: 1.
       ℹ With name: id.
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       Backtrace:
            ▆
         1. ├─dynparam::as_parameter_set(li) at test-set.R:114:3
         2. │ └─dynparam::as_parameter(lin)
         3. │   └─formals(constructor_fun) %>% as.list() %>% map_chr(class)
         4. ├─purrr::map_chr(., class)
         5. │ └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
         6. │   ├─purrr:::with_indexed_errors(...)
         7. │   │ └─base::withCallingHandlers(...)
         8. │   └─purrr:::call_with_cleanup(...)
         9. └─purrr (local) `<fn>`(`<evalErrr>`)
        10.   └─cli::cli_abort(...)
        11.     └─rlang::abort(...)
       
       [ FAIL 22 | WARN 0 | SKIP 0 | PASS 275 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# fakir (1.0.0)

* GitHub: <https://github.com/Thinkr-open/fakir>
* Email: <mailto:contact@colinfay.me>
* GitHub mirror: <https://github.com/cran/fakir>

Run `revdepcheck::cloud_details(, "fakir")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
       1. ├─fakir::fake_survey_people(10)
       2. │ ├─withr::with_seed(...)
       3. │ │ └─withr::with_preserve_seed(...)
       4. │ ├─base::suppressWarnings(...)
       5. │ │ └─base::withCallingHandlers(...)
       6. │ ├─... %>% ...
       7. │ └─tibble::tibble(...)
       8. │   └─tibble:::tibble_quos(xs, .rows, .name_repair)
       9. │     └─rlang::eval_tidy(xs[[j]], mask)
      10. ├─dplyr::select(...)
      11. ├─dplyr::arrange(., question_date)
      12. ├─base::paste0(...)
      13. ├─purrr::as_vector(...)
      14. │ └─purrr:::as_vector_(.x, .type)
      15. │   └─purrr:::can_simplify(.x, .type)
      16. │     └─base::vapply(x, is.atomic, logical(1))
      17. ├─rerun(n, sample(LETTERS, 4)) %>% map(paste0, collapse = "")
      18. ├─purrr::map(., paste0, collapse = "")
      19. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
      20. │   └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
      21. └─purrr::rerun(n, sample(LETTERS, 4))
      22.   └─lifecycle::deprecate_stop(...)
      23.     └─lifecycle:::deprecate_stop0(msg)
      24.       └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        12. │     │ └─base::withCallingHandlers(...)
        13. │     ├─... %>% ...
        14. │     └─tibble::tibble(...)
        15. │       └─tibble:::tibble_quos(xs, .rows, .name_repair)
        16. │         └─rlang::eval_tidy(xs[[j]], mask)
        17. ├─dplyr::select(...)
        18. ├─dplyr::arrange(., question_date)
        19. ├─base::paste0(...)
        20. ├─purrr::as_vector(...)
        21. │ └─purrr:::as_vector_(.x, .type)
        22. │   └─purrr:::can_simplify(.x, .type)
        23. │     └─base::vapply(x, is.atomic, logical(1))
        24. ├─rerun(n, sample(LETTERS, 4)) %>% map(paste0, collapse = "")
        25. ├─purrr::map(., paste0, collapse = "")
        26. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        27. │   └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
        28. └─purrr::rerun(n, sample(LETTERS, 4))
        29.   └─lifecycle::deprecate_stop(...)
        30.     └─lifecycle:::deprecate_stop0(msg)
        31.       └─rlang::cnd_signal(...)
       
       [ FAIL 3 | WARN 0 | SKIP 0 | PASS 125 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      22. ├─purrr::map(., paste0, collapse = "")
      23. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
      24. │   └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
      25. └─purrr::rerun(vol, sample(LETTERS, 4))
      26.   └─lifecycle::deprecate_stop(...)
      27.     └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'fakir-example.Rmd' failed with diagnostics:
     ℹ In argument: `ref = paste0(...)`.
     Caused by error:
     ! `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `map()` instead.
       # Previously
       rerun(10, sample(LETTERS, 4))
     
       # Now
       map(1:10, ~ sample(LETTERS, 4))
     --- failed re-building ‘fakir-example.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘fakir-example.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking Rd files ... NOTE
     ```
     checkRd: (-1) fra_sf.Rd:22: Lost braces; missing escapes or markup?
         22 | A map of France as {sf} object. Can be used as dataset or for maps
            |                    ^
     ```

# finnts (0.7.0)

* GitHub: <https://github.com/microsoft/finnts>
* Email: <mailto:mftokic@gmail.com>
* GitHub mirror: <https://github.com/cran/finnts>

Run `revdepcheck::cloud_details(, "finnts")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Backtrace:
           ▆
        1. ├─finnts::prep_data(...) at test-multistep.R:20:3
        2. │ ├─... %>% base::suppressPackageStartupMessages()
        3. │ └─... %op% ...
        4. │   └─e$fun(obj, substitute(ex), parent.frame(), e$data)
        5. └─base::suppressPackageStartupMessages(.)
        6.   └─base::withCallingHandlers(expr, packageStartupMessage = function(c) tryInvokeRestart("muffleMessage"))
       ── Error ('test-prep_data.R:48:3'): prep_data grouped_hierarchy with mixed xreg future coverage has no NAs ──
       Error in `{     combo <- x %>% dplyr::pull(Combo)     return_tbl <- tibble::tibble(Combo = combo, Combo_Hash = hash_data(combo))     initial_prep_combo_tbl <- filtered_initial_prep_tbl %>% dplyr::filter(Combo == combo) %>% dplyr::collect()     xregs_future_tbl <- initial_prep_combo_tbl %>% dplyr::select(Combo, Date, tidyselect::any_of(global_xregs_future_list))     initial_tbl <- initial_prep_combo_tbl %>% dplyr::filter(Combo == combo) %>% dplyr::select(Combo, Date, Target, tidyselect::all_of(setdiff(external_regressors, global_xregs_future_list))) %>% dplyr::group_by(Combo) %>% timetk::pad_by_time(Date, .by = date_type, .pad_value = ifelse(clean_missing_values, NA, 0), .end_date = hist_end_date) %>% timetk::pad_by_time(Date, .by = date_type, .pad_value = 0, .start_date = hist_start_date, .end_date = hist_end_date) %>% timetk::future_frame(Date, .length_out = forecast_horizon,          .bind_data = TRUE) %>% dplyr::ungroup() %>% dplyr::left_join(xregs_future_tbl, by = c("Combo", "Date")) %>% clean_outliers_missing_values(clean_outliers, clean_missing_values, get_frequency_number(date_type), external_regressors) %>% dplyr::mutate_if(is.numeric, list(~replace(., is.infinite(.), NA))) %>% dplyr::mutate_if(is.numeric, list(~replace(., is.nan(.), NA))) %>% dplyr::mutate_if(is.numeric, list(~replace(., is.na(.), 0))) %>% dplyr::mutate(Target = ifelse(Date > hist_end_date, NA,          Target))     if ("Target_Original" %in% colnames(initial_tbl)) {         initial_tbl <- initial_tbl %>% dplyr::mutate(Target_Original = ifelse(Date > hist_end_date, NA, Target_Original))     }     xreg_raw_df <- NULL     if (!is.null(external_regressors) && length(external_regressors) > 0) {         xreg_raw_df <- initial_tbl %>% dplyr::select(Date, tidyselect::all_of(external_regressors))     }     if (box_cox) {         box_cox_tbl <- initial_tbl %>% apply_box_cox()         initial_tbl <- box_cox_tbl$data         return_tbl <- return_tbl %>% dplyr::left_join(box_cox_tbl$diff_info, by = "Combo")     }     if (stationary) {         stationary_tbl <- initial_tbl %>% make_stationary()         initial_tbl <- stationary_tbl$data         return_tbl <- return_tbl %>% dplyr::left_join(stationary_tbl$diff_info, by = "Combo")     }     date_features <- initial_tbl %>% dplyr::select(Date) %>% dplyr::mutate(Date_Adj = Date %m+% months(fiscal_year_start - 1), Date_day_month_end = ifelse(lubridate::day(Date_Adj) == lubridate::days_in_month(Date_Adj), 1, 0)) %>% timetk::tk_augment_timeseries_signature(Date_Adj) %>% dplyr::select(!tidyselect::matches(get_date_regex(date_type)), -Date_Adj, -Date)     names(date_features) <- stringr::str_c("Date_", names(date_features))     initial_tbl <- initial_tbl %>% cbind(date_features)     if (is.null(recipes_to_run)) {         run_all_recipes_override <- FALSE     }     else if ("all" %in% recipes_to_run) {         run_all_recipes_override <- TRUE     }     else {         run_all_recipes_override <- FALSE     }     if (is.null(recipes_to_run) | "R1" %in% recipes_to_run | run_all_recipes_override) {         R1 <- initial_tbl %>% multivariate_prep_recipe_1(external_regressors, xregs_future_values_list = global_xregs_future_list, get_fourier_periods(fourier_periods, date_type), get_lag_periods(lag_periods, date_type, forecast_horizon, multistep_horizon, TRUE), get_rolling_window_periods(rolling_window_periods, date_type), hist_end_date, date_type, xreg_raw_df = xreg_raw_df) %>% dplyr::mutate(Target = base::ifelse(Date > hist_end_date, NA, Target))         write_data(x = R1, combo = combo, run_info = run_info, output_type = "data", folder = "prep_data", suffix = "-R1")     }     if ((is.null(recipes_to_run) & date_type %in% c("month", "quarter", "year")) | "R2" %in% recipes_to_run | run_all_recipes_override) {         R2 <- initial_tbl %>% multivariate_prep_recipe_2(external_regressors, xregs_future_values_list = global_xregs_future_list, get_fourier_periods(fourier_periods, date_type), get_lag_periods(lag_periods, date_type, forecast_horizon), get_rolling_window_periods(rolling_window_periods, date_type), date_type, forecast_horizon, hist_end_date) %>% dplyr::mutate(Target = base::ifelse(Date > hist_end_date, NA, Target))         write_data(x = R2, combo = combo, run_info = run_info, output_type = "data", folder = "prep_data", suffix = "-R2")     }     return(return_tbl) }`: task 1 failed - "`cross_df()` was deprecated in purrr 1.0.0 and is now defunct.
       i Please use `tidyr::expand_grid()` instead.
       i See <https://github.com/tidyverse/purrr/issues/768>."
       Backtrace:
           ▆
        1. ├─finnts::prep_data(...) at test-prep_data.R:48:3
        2. │ ├─... %>% base::suppressPackageStartupMessages()
        3. │ └─... %op% ...
        4. │   └─e$fun(obj, substitute(ex), parent.frame(), e$data)
        5. └─base::suppressPackageStartupMessages(.)
        6.   └─base::withCallingHandlers(expr, packageStartupMessage = function(c) tryInvokeRestart("muffleMessage"))
       
       [ FAIL 5 | WARN 0 | SKIP 16 | PASS 362 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>."
     --- failed re-building ‘forecast-components.Rmd’
     
     --- re-building ‘forecasting-genai.Rmd’ using rmarkdown
     --- finished re-building ‘forecasting-genai.Rmd’
     
     --- re-building ‘hierarchical-forecasting.Rmd’ using rmarkdown
     --- finished re-building ‘hierarchical-forecasting.Rmd’
     
     --- re-building ‘models-used-in-finnts.Rmd’ using rmarkdown
     --- finished re-building ‘models-used-in-finnts.Rmd’
     
     --- re-building ‘parallel-processing.Rmd’ using rmarkdown
     --- finished re-building ‘parallel-processing.Rmd’
     
     --- re-building ‘tips-for-production.Rmd’ using rmarkdown
     --- finished re-building ‘tips-for-production.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘back-testing-and-hyperparameter-tuning.Rmd’
       ‘feature-engineering.Rmd’ ‘forecast-components.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# flipr (0.3.3)

* GitHub: <https://github.com/LMJL-Alea/flipr>
* Email: <mailto:aymeric.stamm@cnrs.fr>
* GitHub mirror: <https://github.com/cran/flipr>

Run `revdepcheck::cloud_details(, "flipr")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     + )
     ℹ Setting new maximum confidence level in field `$max_conf_level`.
     ℹ Computing a confidence interval with confidence level 0.8 for parameter mean...
     > pf$set_grid(
     +   parameters = pf$parameters,
     +   npoints = 2L
     + )
     ℹ Setting new grid size in field `$npoints`.
     Error:
     ! `cross_df()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     Backtrace:
          ▆
       1. ├─pf$set_grid(parameters = pf$parameters, npoints = 2L)
       2. │ └─flipr::grid_biregular(...)
       3. │   ├─flipr:::.grid_biregular(...)
       4. │   └─flipr:::.grid_biregular.list(...)
       5. │     └─flipr:::make_biregular_grid(...)
       6. │       └─... %>% purrr::cross_df()
       7. └─purrr::cross_df(.)
       8.   └─lifecycle::deprecate_stop(...)
       9.     └─lifecycle:::deprecate_stop0(msg)
      10.       └─rlang::cnd_signal(...)
     Execution halted
     ```

# fuzzr (0.2.2)

* GitHub: <https://github.com/mdlincoln/fuzzr>
* Email: <mailto:matthew.d.lincoln@gmail.com>
* GitHub mirror: <https://github.com/cran/fuzzr>

Run `revdepcheck::cloud_details(, "fuzzr")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘fuzzr-Ex.R’ failed
     The error most likely occurred in:
     
     > ### Name: fuzz_function
     > ### Title: Fuzz-test a function
     > ### Aliases: fuzz_function p_fuzz_function
     > 
     > ### ** Examples
     > 
     > # Evaluate the 'formula' argument of lm, passing additional required variables
     > fr <- fuzz_function(lm, "formula", data = iris)
     Error:
     ! `cross()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     Backtrace:
         ▆
      1. └─fuzzr::fuzz_function(lm, "formula", data = iris)
      2.   └─fuzzr::p_fuzz_function(...)
      3.     └─fuzzr:::named_cross_n(.l)
      4.       └─purrr::cross(ll)
      5.         └─lifecycle::deprecate_stop(...)
      6.           └─lifecycle:::deprecate_stop0(msg)
      7.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        4. └─fuzzr::p_fuzz_function(lm, .l = list(data = list(y = iris)))
        5.   └─fuzzr:::named_cross_n(.l)
        6.     └─purrr::cross(ll)
        7.       └─lifecycle::deprecate_stop(...)
        8.         └─lifecycle:::deprecate_stop0(msg)
        9.           └─rlang::cnd_signal(...)
       ── Error ('test_fuzz.R:62:1'): (code run outside of `test_that()`) ─────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `cross()` was deprecated in purrr 1.0.0 and is now defunct.
       ℹ Please use `tidyr::expand_grid()` instead.
       ℹ See <https://github.com/tidyverse/purrr/issues/768>.
       Backtrace:
           ▆
        1. └─fuzzr::fuzz_function(...) at test_fuzz.R:62:1
        2.   └─fuzzr::p_fuzz_function(...)
        3.     └─fuzzr:::named_cross_n(.l)
        4.       └─purrr::cross(ll)
        5.         └─lifecycle::deprecate_stop(...)
        6.           └─lifecycle:::deprecate_stop0(msg)
        7.             └─rlang::cnd_signal(...)
       
       [ FAIL 2 | WARN 0 | SKIP 0 | PASS 27 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ! `cross()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     ---
     Backtrace:
         ▆
      1. └─fuzzr::fuzz_function(my_function, "n", x = 1:3, tests = test_all())
      2.   └─fuzzr::p_fuzz_function(...)
      3.     └─fuzzr:::named_cross_n(.l)
      4.       └─purrr::cross(ll)
      5.         └─lifecycle::deprecate_stop(...)
      6.           └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'fuzzr.Rmd' failed with diagnostics:
     `cross()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     --- failed re-building ‘fuzzr.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘fuzzr.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# GitStats (2.5.2)

* GitHub: <https://github.com/r-world-devs/GitStats>
* Email: <mailto:banasmaciek@gmail.com>
* GitHub mirror: <https://github.com/cran/GitStats>

Run `revdepcheck::cloud_details(, "GitStats")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Expected `gl_repos_urls_with_code_in_files` to have type "character".
       Actual type: "NULL"
       ── Failure ('test-get_urls_repos-GitLab.R:190:3'): get_repos_urls_with_code_from_repos returns repositories URLS ──
       Expected `length(gl_repos_urls_with_code_in_files)` > 0.
       Actual comparison: 0.0 <= 0.0
       Difference: 0.0 <= 0
       ── Failure ('test-get_urls_repos-GitStats.R:36:3'): get_repos_urls_from_hosts gets data with_code in_files from the hosts ──
       Expected `any(grepl("gitlab.com", repos_urls_from_hosts_with_code_in_files))` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       ── Failure ('test-get_urls_repos-GitStats.R:108:3'): get_repos_urls gets vector of repository URLS ──
       Expected `length(repos_urls)` > 1.
       Actual comparison: 1.0 <= 1.0
       Difference: 0.0 <= 0
       ── Failure ('test-get_urls_repos-GitStats.R:132:3'): get_repos_urls gets vector of repository URLS ──
       Expected `length(repos_urls)` > 1.
       Actual comparison: 1.0 <= 1.0
       Difference: 0.0 <= 0
       
       [ FAIL 10 | WARN 0 | SKIP 160 | PASS 1383 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# gtexr (0.2.1)

* GitHub: <https://github.com/ropensci/gtexr>
* Email: <mailto:alasdair.warwick.19@ucl.ac.uk>
* GitHub mirror: <https://github.com/cran/gtexr>

Run `revdepcheck::cloud_details(, "gtexr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         2. │ └─testthat:::expect_condition_matching_(...)
         3. │   └─testthat:::quasi_capture(...)
         4. │     ├─testthat (local) .capture(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         7. ├─gtexr::get_neighbor_gene()
         8. │ └─gtexr:::gtex_query(endpoint = "reference/neighborGene")
         9. │   ├─purrr::compact(purrr::map(query_params, process_na_and_zero_char_query_params))
        10. │   │ └─purrr::discard(.x, function(x) is_empty(.f(x)))
        11. │   │   └─purrr:::where_if(.x, .p, ...)
        12. │   │     └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
        13. │   │       └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
        14. │   └─purrr::map(query_params, process_na_and_zero_char_query_params)
        15. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        16. │       ├─purrr:::with_indexed_errors(...)
        17. │       │ └─base::withCallingHandlers(...)
        18. │       └─purrr:::call_with_cleanup(...)
        19. └─purrr (local) `<fn>`(`<evalErrr>`)
        20.   └─cli::cli_abort(...)
        21.     └─rlang::abort(...)
       
       [ FAIL 1 | WARN 0 | SKIP 54 | PASS 50 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# hablar (0.3.2)

* GitHub: <https://github.com/davidsjoberg/hablar>
* Email: <mailto:dav.sjob@gmail.com>
* GitHub mirror: <https://github.com/cran/hablar>

Run `revdepcheck::cloud_details(, "hablar")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test.check_df.R:175:3'): check_complete_set ─────────────────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `cross_df()` was deprecated in purrr 1.0.0 and is now defunct.
       ℹ Please use `tidyr::expand_grid()` instead.
       ℹ See <https://github.com/tidyverse/purrr/issues/768>.
       Backtrace:
            ▆
         1. ├─testthat::expect_equal(...) at test.check_df.R:175:3
         2. │ └─testthat::quasi_label(enquo(object), label)
         3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
         4. ├─tibble(a = c(1, 2), b = c(3, 4)) %>% ...
         5. ├─hablar::check_complete_set(., a, b)
         6. │ ├─purrr::cross_df(purrr::map(.data, ~unique(.))) %>% nrow()
         7. │ └─purrr::cross_df(purrr::map(.data, ~unique(.)))
         8. │   └─lifecycle::deprecate_stop(...)
         9. │     └─lifecycle:::deprecate_stop0(msg)
        10. │       └─rlang::cnd_signal(...)
        11. └─base::nrow(.)
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 415 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# healthiar (0.2.7)

* GitHub: <https://github.com/SwissTPH/healthiar>
* Email: <mailto:alberto.castrofernandez@swisstph.ch>
* GitHub mirror: <https://github.com/cran/healthiar>

Run `revdepcheck::cloud_details(, "healthiar")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       Backtrace:
            ▆
         1. ├─testthat::expect_error(...) at test-socialize.R:419:3
         2. │ └─testthat:::expect_condition_matching_(...)
         3. │   └─testthat:::quasi_capture(...)
         4. │     ├─testthat (local) .capture(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         7. ├─healthiar::socialize(...)
         8. │ └─healthiar:::get_input_args(environment = environment(), call = match.call())
         9. │   └─purrr::map_lgl(...)
        10. │     └─purrr:::map_("logical", .x, .f, ..., .progress = .progress)
        11. │       ├─purrr:::with_indexed_errors(...)
        12. │       │ └─base::withCallingHandlers(...)
        13. │       └─purrr:::call_with_cleanup(...)
        14. └─purrr (local) `<fn>`(`<evalErrr>`)
        15.   └─cli::cli_abort(...)
        16.     └─rlang::abort(...)
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 463 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# hypothesis (1.1.0)

* Email: <mailto:krystian8207@gmail.com>
* GitHub mirror: <https://github.com/cran/hypothesis>

Run `revdepcheck::cloud_details(, "hypothesis")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         4. ├─hypothesis::useHypothesis()
         5. │ ├─jsonlite::toJSON(...)
         6. │ │ └─base::force(x)
         7. │ ├─... %>% drop_nulls()
         8. │ └─hypothesis::hypothesisBranding()
         9. │   └─environment() %>% as.list() %>% purrr::keep(~!is.symbol(.x))
        10. ├─hypothesis:::drop_nulls(.)
        11. │ └─purrr::keep(x, ~!is.null(.x))
        12. │   └─purrr:::where_if(.x, .p, ...)
        13. │     └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
        14. │       └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
        15. ├─purrr::keep(., ~!is.symbol(.x))
        16. │ └─purrr:::where_if(.x, .p, ...)
        17. │   └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
        18. │     ├─purrr:::with_indexed_errors(...)
        19. │     │ └─base::withCallingHandlers(...)
        20. │     └─purrr:::call_with_cleanup(...)
        21. └─purrr (local) `<fn>`(`<evalErrr>`)
        22.   └─cli::cli_abort(...)
        23.     └─rlang::abort(...)
       
       [ FAIL 3 | WARN 0 | SKIP 0 | PASS 35 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘hypothesis-api.R’
     ```

# important (0.2.1)

* GitHub: <https://github.com/tidymodels/important>
* Email: <mailto:max@posit.co>
* GitHub mirror: <https://github.com/cran/important>

Run `revdepcheck::cloud_details(, "important")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       i In index: 4.
       i With name: score.
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       ── Error ('test-step_predictor_retain.R:167:3'): empty selection prep/bake is a no-op ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(x$steps, get_needs_tuning)`: i In index: 1.
       Caused by error in `map_lgl()`:
       i In index: 4.
       i With name: score.
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       ── Error ('test-step_predictor_retain.R:183:3'): empty selection tidy method works ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(x$steps, get_needs_tuning)`: i In index: 1.
       Caused by error in `map_lgl()`:
       i In index: 4.
       i With name: score.
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       
       [ FAIL 3 | WARN 0 | SKIP 23 | PASS 243 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# IOBR (2.2.3)

* GitHub: <https://github.com/IOBR/IOBR>
* Email: <mailto:w_shixiang@163.com>
* GitHub mirror: <https://github.com/cran/IOBR>

Run `revdepcheck::cloud_details(, "IOBR")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +   target = "phenotype_score",
     +   is_target_continuous = TRUE,
     +   category = "signature",
     +   signature_group = sig_group_example,
     +   show_plot = FALSE,
     +   path = tempdir()
     + )
     ℹ Processing signature: "signature"
     tidyHeatmap says: (once per session) from release 1.7.0 the scaling is set to "none" by default. Please use scale = "row", "column" or "both" to apply scaling
     tidyHeatmap says: If you use tidyHeatmap for scientific research, please cite: Mangiola, S. and Papenfuss, A.T., 2020. 'tidyHeatmap: an R package for modular heatmap production based on tidy principles.' Journal of Open Source Software. doi:10.21105/joss.02472.
     This message is displayed once per session.
     Error:
     ! `when()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `if` instead.
     Backtrace:
         ▆
      1. ├─IOBR::iobr_cor_plot(...)
      2. │ └─... %>% ...
      3. ├─tidyHeatmap::heatmap(...)
      4. └─tidyHeatmap::heatmap(...)
      5.   └─purrr::when(...)
      6.     └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
      7.       └─lifecycle:::deprecate_stop0(msg)
      8.         └─rlang::cnd_signal(...)
     Execution halted
     ```

# kntnr (0.4.4)

* GitHub: <https://github.com/yutannihilation/kntnr>
* Email: <mailto:yutani.ini@gmail.com>
* GitHub mirror: <https://github.com/cran/kntnr>

Run `revdepcheck::cloud_details(, "kntnr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
        11. ├─kntnr (local) `<fn>`(subtable)
        12. │ └─purrr::map(...)
        13. │   └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        14. │     ├─purrr:::with_indexed_errors(...)
        15. │     │ └─base::withCallingHandlers(...)
        16. │     ├─purrr:::call_with_cleanup(...)
        17. │     └─kntnr (local) .f(.x_i)
        18. │       └─purrr::when(...)
        19. │         └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
        20. │           └─lifecycle:::deprecate_stop0(msg)
        21. │             └─rlang::cnd_signal(...)
        22. │               └─rlang:::signal_abort(cnd)
        23. │                 └─base::signalCondition(cnd)
        24. ├─purrr (local) `<fn>`(`<lfcycl__>`)
        25. │ └─cli::cli_abort(...)
        26. │   └─rlang::abort(...)
        27. │     └─rlang:::signal_abort(cnd, .file)
        28. │       └─base::signalCondition(cnd)
        29. └─dplyr (local) `<fn>`(`<prrr_rr_>`)
        30.   └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
       
       [ FAIL 2 | WARN 0 | SKIP 0 | PASS 67 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# longke (0.1.0)

* Email: <mailto:wangs43@miamioh.edu>
* GitHub mirror: <https://github.com/cran/longke>

Run `revdepcheck::cloud_details(, "longke")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘longke-Ex.R’ failed
     The error most likely occurred in:
     
     > ### Name: FPCA_trajectory
     > ### Title: FPCA_trajectory
     > ### Aliases: FPCA_trajectory
     > 
     > ### ** Examples
     > 
     > t_all = 1:50
     > data = datagen(ntotal=350,ntest=50,t_all=t_all,t_split=25,seed=1)
     Error:
     ! `rdunif()` was deprecated in purrr 1.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─longke::datagen(...)
      2.   └─purrr::rdunif(kk.t, 1, 5)
      3.     └─lifecycle::deprecate_stop("1.0.0", "rdunif()")
      4.       └─lifecycle:::deprecate_stop0(msg)
      5.         └─rlang::cnd_signal(...)
     Execution halted
     ```

# LTFGRS (1.0.1)

* GitHub: <https://github.com/EmilMiP/LTFGRS>
* Email: <mailto:emp@ph.au.dk>
* GitHub mirror: <https://github.com/cran/LTFGRS>

Run `revdepcheck::cloud_details(, "LTFGRS")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     + genetic_corrmat = genetic_corrmat, full_corrmat = full_corrmat, h2 = rep(.5,3),
     + n_sim = 1, pop_prev = rep(.1,3))
     Error in `mutate()`:
     ℹ In argument: `max_age = purrr::invoke(pmax, select(.,
       ends_with("_age")))`.
     Caused by error:
     ! `invoke()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `exec()` instead.
     Backtrace:
          ▆
       1. ├─LTFGRS::simulate_under_LTM(...)
       2. │ └─LTFGRS::simulate_under_LTM_multi(...)
       3. │   └─liabs %>% ...
       4. ├─dplyr::mutate(., max_age = purrr::invoke(pmax, select(., ends_with("_age"))))
       5. ├─dplyr:::mutate.data.frame(., max_age = purrr::invoke(pmax, select(., ends_with("_age"))))
       6. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       7. │   ├─base::withCallingHandlers(...)
       8. │   └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
       9. │     └─mask$eval_all_mutate(quo)
      10. │       └─dplyr (local) eval()
      11. └─purrr::invoke(pmax, select(., ends_with("_age")))
      12.   └─lifecycle::deprecate_stop("1.0.0", "invoke()", "exec()")
      13.     └─lifecycle:::deprecate_stop0(msg)
      14.       └─rlang::cnd_signal(...)
     Execution halted
     ```

# LTFHPlus (2.2.0)

* GitHub: <https://github.com/EmilMiP/LTFHPlus>
* Email: <mailto:emp@ph.au.dk>
* GitHub mirror: <https://github.com/cran/LTFHPlus>

Run `revdepcheck::cloud_details(, "LTFHPlus")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     + genetic_corrmat = genetic_corrmat, full_corrmat = full_corrmat, h2 = rep(.5,3), 
     + n_sim = 1, pop_prev = rep(.1,3))
     Error in `mutate()`:
     ℹ In argument: `max_age = purrr::invoke(pmax, select(.,
       ends_with("_age")))`.
     Caused by error:
     ! `invoke()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `exec()` instead.
     Backtrace:
          ▆
       1. ├─LTFHPlus::simulate_under_LTM(...)
       2. │ └─LTFHPlus::simulate_under_LTM_multi(...)
       3. │   └─liabs %>% ...
       4. ├─dplyr::mutate(., max_age = purrr::invoke(pmax, select(., ends_with("_age"))))
       5. ├─dplyr:::mutate.data.frame(., max_age = purrr::invoke(pmax, select(., ends_with("_age"))))
       6. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       7. │   ├─base::withCallingHandlers(...)
       8. │   └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
       9. │     └─mask$eval_all_mutate(quo)
      10. │       └─dplyr (local) eval()
      11. └─purrr::invoke(pmax, select(., ends_with("_age")))
      12.   └─lifecycle::deprecate_stop("1.0.0", "invoke()", "exec()")
      13.     └─lifecycle:::deprecate_stop0(msg)
      14.       └─rlang::cnd_signal(...)
     Execution halted
     ```

# metathis (1.1.4)

* GitHub: <https://github.com/gadenbuie/metathis>
* Email: <mailto:garrick@adenbuie.com>
* GitHub mirror: <https://github.com/cran/metathis>

Run `revdepcheck::cloud_details(, "metathis")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     The error most likely occurred in:
     
     > ### Name: meta
     > ### Title: Initialize a List of HTML Metadata Tags
     > ### Aliases: meta is_meta as_meta
     > 
     > ### ** Examples
     > 
     > meta() %>%
     +   meta_viewport() %>%
     +   is_meta()
     Error:
     ! `prepend()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use append(after = 0) instead.
     Backtrace:
         ▆
      1. ├─meta() %>% meta_viewport() %>% is_meta()
      2. ├─metathis::is_meta(.)
      3. └─metathis::meta_viewport(.)
      4.   └─metathis:::prepend_to_meta(.meta, list(meta_new))
      5.     └─purrr::prepend(.meta[[1]]$children, .list)
      6.       └─lifecycle::deprecate_stop("1.0.0", "prepend()", I("append(after = 0)"))
      7.         └─lifecycle:::deprecate_stop0(msg)
      8.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         6. └─metathis::meta_viewport(width = "100px", min_width = "100px")
         7.   └─metathis:::prepend_to_meta(.meta, list(meta_new))
         8.     └─purrr::prepend(.meta[[1]]$children, .list)
         9.       └─lifecycle::deprecate_stop("1.0.0", "prepend()", I("append(after = 0)"))
        10.         └─lifecycle:::deprecate_stop0(msg)
        11.           └─rlang::cnd_signal(...)
       ── Error ('test-write.R:4:5'): write_meta() / writes to a file ─────────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `prepend()` was deprecated in purrr 1.0.0 and is now defunct.
       ℹ Please use append(after = 0) instead.
       Backtrace:
           ▆
        1. ├─meta_tag(method = "test") %>% meta_viewport() at test-write.R:4:5
        2. └─metathis::meta_viewport(.)
        3.   └─metathis:::prepend_to_meta(.meta, list(meta_new))
        4.     └─purrr::prepend(.meta[[1]]$children, .list)
        5.       └─lifecycle::deprecate_stop("1.0.0", "prepend()", I("append(after = 0)"))
        6.         └─lifecycle:::deprecate_stop0(msg)
        7.           └─rlang::cnd_signal(...)
       
       [ FAIL 10 | WARN 0 | SKIP 0 | PASS 57 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# metR (0.19.0)

* GitHub: <https://github.com/eliocamp/metR>
* Email: <mailto:eliocampitelli@gmail.com>
* GitHub mirror: <https://github.com/cran/metR>

Run `revdepcheck::cloud_details(, "metR")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
        54.                 │ └─base::withCallingHandlers(...)
        55.                 └─purrr::cross(new_subset)
        56.                   └─lifecycle::deprecate_stop(...)
        57.                     └─lifecycle:::deprecate_stop0(msg)
        58.                       └─rlang::cnd_signal(...)
       ── Error ('test-ReadNetCDF.R:142:3'): reads one point ──────────────────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `cross()` was deprecated in purrr 1.0.0 and is now defunct.
       ℹ Please use `tidyr::expand_grid()` instead.
       ℹ See <https://github.com/tidyverse/purrr/issues/768>.
       Backtrace:
           ▆
        1. └─metR::ReadNetCDF(file, subset = list(lat = 45.51, lon = 180.5)) at test-ReadNetCDF.R:142:3
        2.   └─metR:::.expand_chunks(subset)
        3.     ├─base::suppressWarnings(purrr::cross(new_subset))
        4.     │ └─base::withCallingHandlers(...)
        5.     └─purrr::cross(new_subset)
        6.       └─lifecycle::deprecate_stop(...)
        7.         └─lifecycle:::deprecate_stop0(msg)
        8.           └─rlang::cnd_signal(...)
       
       [ FAIL 4 | WARN 0 | SKIP 20 | PASS 190 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     ---
     Backtrace:
         ▆
      1. └─metR::ReadNetCDF(file, subset = list(lat = 90:0, level = 925))
      2.   └─metR:::.expand_chunks(subset)
      3.     ├─base::suppressWarnings(purrr::cross(new_subset))
      4.     │ └─base::withCallingHandlers(...)
      5.     └─purrr::cross(new_subset)
      6.       └─lifecycle::deprecate_stop(...)
      7.         └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'Working-with-data.Rmd' failed with diagnostics:
     `cross()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     --- failed re-building ‘Working-with-data.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘Working-with-data.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# modeltests (0.1.8)

* GitHub: <https://github.com/alexpghayes/modeltests>
* Email: <mailto:alexpghayes@gmail.com>
* GitHub mirror: <https://github.com/cran/modeltests>

Run `revdepcheck::cloud_details(, "modeltests")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       ! argument ".x_i" is missing, with no default
       Backtrace:
            ▆
         1. ├─testthat::expect_silent(...) at test-check_arguments.R:76:3
         2. │ └─testthat:::quasi_capture(enquo(object), NULL, evaluate_promise)
         3. │   ├─testthat (local) .capture(...)
         4. │   │ ├─withr::with_output_sink(...)
         5. │   │ │ └─base::force(code)
         6. │   │ ├─base::withCallingHandlers(...)
         7. │   │ └─base::withVisible(code)
         8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         9. ├─modeltests::check_arguments(tidy_correct, strict = TRUE) at test-check_arguments.R:77:5
        10. │ └─purrr::map_lgl(arglist, is.name)
        11. │   └─purrr:::map_("logical", .x, .f, ..., .progress = .progress)
        12. │     ├─purrr:::with_indexed_errors(...)
        13. │     │ └─base::withCallingHandlers(...)
        14. │     └─purrr:::call_with_cleanup(...)
        15. └─purrr (local) `<fn>`(`<evalErrr>`)
        16.   └─cli::cli_abort(...)
        17.     └─rlang::abort(...)
       
       [ FAIL 3 | WARN 0 | SKIP 0 | PASS 388 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# multibiasmeta (0.2.2)

* GitHub: <https://github.com/mathurlabstanford/multibiasmeta>
* Email: <mailto:peter@analythium.io>
* GitHub mirror: <https://github.com/cran/multibiasmeta>

Run `revdepcheck::cloud_details(, "multibiasmeta")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > # publication bias without internal bias
     > meta_0 <- multibias_meta(yi = meta_meat$yi,
     +                          vi = meta_meat$vi,
     +                          selection_ratio = 4,
     +                          bias_affirmative = 0,
     +                          bias_nonaffirmative = 0)
     Error in `discard()`:
     ℹ In index: 3.
     ℹ With name: sei.
     Caused by error in `map_()`:
     ! argument ".x_i" is missing, with no default
     Backtrace:
          ▆
       1. ├─multibiasmeta::multibias_meta(...)
       2. │ └─purrr::discard(args, function(a) class(a) == "name")
       3. │   └─purrr:::where_if(.x, .p, ...)
       4. │     └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
       5. │       ├─purrr:::with_indexed_errors(...)
       6. │       │ └─base::withCallingHandlers(...)
       7. │       └─purrr:::call_with_cleanup(...)
       8. └─purrr (local) `<fn>`(`<evalErrr>`)
       9.   └─cli::cli_abort(...)
      10.     └─rlang::abort(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       Backtrace:
            ▆
         1. ├─rlang::exec(...) at test-outputs.R:51:3
         2. ├─multibiasmeta (local) `<fn>`(...)
         3. │ └─multibiasmeta (local) compute_eb("estimate")
         4. │   └─stats::optimize(f = bias_factor, interval = c(0, bias_max))
         5. │     └─stats (local) `<fn>`(3.81966011250105)
         6. │       └─multibiasmeta (local) f(arg, ...)
         7. │         ├─base::suppressWarnings(...)
         8. │         │ └─base::withCallingHandlers(...)
         9. │         └─multibiasmeta::multibias_meta(...)
        10. │           └─purrr::discard(args, function(a) class(a) == "name")
        11. │             └─purrr:::where_if(.x, .p, ...)
        12. │               └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
        13. │                 ├─purrr:::with_indexed_errors(...)
        14. │                 │ └─base::withCallingHandlers(...)
        15. │                 └─purrr:::call_with_cleanup(...)
        16. └─purrr (local) `<fn>`(`<evalErrr>`)
        17.   └─cli::cli_abort(...)
        18.     └─rlang::abort(...)
       
       [ FAIL 6 | WARN 0 | SKIP 0 | PASS 9 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ! argument ".x_i" is missing, with no default
     ---
     Backtrace:
         ▆
      1. └─multibiasmeta::multibias_meta(...)
      2.   └─purrr::discard(args, function(a) class(a) == "name")
      3.     └─purrr:::where_if(.x, .p, ...)
      4.       └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
      5.         ├─purrr:::with_indexed_errors(...)
      6.         │ └─base::withCallingHandlers(...)
      7.         └─purrr:::call_with_cleanup(...)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'tutorial.Rmd' failed with diagnostics:
     ℹ In index: 3.
     ℹ With name: sei.
     Caused by error in `map_()`:
     ! argument ".x_i" is missing, with no default
     --- failed re-building ‘tutorial.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘tutorial.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# NetCoupler (0.1.1)

* GitHub: <https://github.com/NetCoupler/NetCoupler>
* Email: <mailto:lwjohnst@gmail.com>
* GitHub mirror: <https://github.com/cran/NetCoupler>

Run `revdepcheck::cloud_details(, "NetCoupler")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +    )
     Error in `pmap()`:
     ℹ In index: 1.
     Caused by error:
     ! `lift()` was deprecated in purrr 1.0.0 and is now defunct.
     Backtrace:
          ▆
       1. ├─standardized_data %>% ...
       2. ├─NetCoupler::nc_estimate_exposure_links(...)
       3. │ ├─... %>% dplyr::rename(exposure = "external_var")
       4. │ └─NetCoupler:::compute_model_estimates(...)
       5. │   └─formula_df %>% ...
       6. ├─dplyr::rename(., exposure = "external_var")
       7. └─purrr::pmap_dfr(...)
       8.   └─purrr::pmap(.l, .f, ...)
       9.     └─purrr:::pmap_("list", .l, .f, ..., .progress = .progress)
      10.       ├─purrr:::with_indexed_errors(...)
      11.       │ └─base::withCallingHandlers(...)
      12.       ├─purrr:::call_with_cleanup(...)
      13.       └─NetCoupler (local) .f(...)
      14.         └─purrr::lift_dl(model_function)
      15.           └─lifecycle::deprecate_stop("1.0.0", "lift()")
      16.             └─lifecycle:::deprecate_stop0(msg)
      17.               └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
       Running ‘spelling.R’
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Complete output:
       > library(testthat)
       > library(NetCoupler)
       > 
       > test_check("NetCoupler")
       Saving _problems/test-model-estimates-15.R
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 10 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-model-estimates.R:10:1'): (code run outside of `test_that()`) ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `pmap(.l, .f, ...)`: ℹ In index: 1.
       Caused by error:
       ! `lift()` was deprecated in purrr 1.0.0 and is now defunct.
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 10 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       5. │   └─formula_df %>% ...
       6. ├─dplyr::rename(., outcome = "external_var")
       7. └─purrr::pmap_dfr(...)
       8.   └─purrr::pmap(.l, .f, ...)
       9.     └─purrr:::pmap_("list", .l, .f, ..., .progress = .progress)
      10.       ├─purrr:::with_indexed_errors(...)
      11.       │ └─base::withCallingHandlers(...)
      12.       ├─purrr:::call_with_cleanup(...)
      13.       └─NetCoupler (local) .f(...)
      14.         └─purrr::lift_dl(model_function)
      15.           └─lifecycle::deprecate_stop("1.0.0", "lift()")
      16.             └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'NetCoupler.Rmd' failed with diagnostics:
     ℹ In index: 1.
     Caused by error:
     ! `lift()` was deprecated in purrr 1.0.0 and is now defunct.
     --- failed re-building ‘NetCoupler.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘NetCoupler.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# nevada (0.2.0)

* GitHub: <https://github.com/astamm/nevada>
* Email: <mailto:aymeric.stamm@cnrs.fr>
* GitHub mirror: <https://github.com/cran/nevada>

Run `revdepcheck::cloud_details(, "nevada")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     + )
     > sim <- sample2_sbm(n, 68, p1, c(17, 17, 17, 17), p2, seed = 1234)
     Error:
     ! `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `map()` instead.
       # Previously
       rerun(10, x = igraph::sample_sbm(nv, p1, b1), y = igraph::sample_sbm(nv, p2,
       b2))
     
       # Now
     map(1:10, ~ list(x = igraph::sample_sbm(nv, p1, b1), y = igraph::sample_sbm(nv,
     p2, b2)))
     Backtrace:
          ▆
       1. ├─nevada::sample2_sbm(n, 68, p1, c(17, 17, 17, 17), p2, seed = 1234)
       2. │ └─... %>% purrr::map(as_nvd)
       3. ├─purrr::map(., as_nvd)
       4. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
       5. │   └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
       6. ├─purrr::transpose(.)
       7. └─purrr::rerun(...)
       8.   └─lifecycle::deprecate_stop(...)
       9.     └─lifecycle:::deprecate_stop0(msg)
      10.       └─rlang::cnd_signal(...)
     Execution halted
     ```

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘visualizations.R’
     ```

# optic (1.0.1)

* GitHub: <https://github.com/randcorporation/optic>
* Email: <mailto:plima@rand.org>
* GitHub mirror: <https://github.com/cran/optic>

Run `revdepcheck::cloud_details(, "optic")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +                         models = list(mod), 
     +                         method = 'no_confounding', 
     +                         unit_var = 'state', 
     +                         treat_var = 'state',
     +                         time_var = 'year', 
     +                         effect_magnitude = list(eff), 
     +                         n_units = 2, 
     +                         effect_direction = 'pos', 
     +                         iters = 2,
     +                         policy_speed = 'instant', 
     +                         n_implementation_periods = 1)
     Error:
     ! `cross()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     Backtrace:
         ▆
      1. └─optic::optic_simulation(...)
      2.   └─OpticSim$new(...)
      3.     └─optic (local) initialize(...)
      4.       └─purrr::cross(params)
      5.         └─lifecycle::deprecate_stop(...)
      6.           └─lifecycle:::deprecate_stop0(msg)
      7.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        2.   └─OpticSim$new(...)
        3.     └─optic (local) initialize(...)
        4.       └─purrr::cross(params)
        5.         └─lifecycle::deprecate_stop(...)
        6.           └─lifecycle:::deprecate_stop0(msg)
        7.             └─rlang::cnd_signal(...)
       ── Error ('test-no_confounding.R:47:1'): (code run outside of `test_that()`) ───
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `cross()` was deprecated in purrr 1.0.0 and is now defunct.
       i Please use `tidyr::expand_grid()` instead.
       i See <https://github.com/tidyverse/purrr/issues/768>.
       Backtrace:
           ▆
        1. └─optic::optic_simulation(...) at test-no_confounding.R:47:1
        2.   └─OpticSim$new(...)
        3.     └─optic (local) initialize(...)
        4.       └─purrr::cross(params)
        5.         └─lifecycle::deprecate_stop(...)
        6.           └─lifecycle:::deprecate_stop0(msg)
        7.             └─rlang::cnd_signal(...)
       
       [ FAIL 3 | WARN 0 | SKIP 0 | PASS 1 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ! `cross()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     ---
     Backtrace:
         ▆
      1. └─optic::optic_simulation(...)
      2.   └─OpticSim$new(...)
      3.     └─optic (local) initialize(...)
      4.       └─purrr::cross(params)
      5.         └─lifecycle::deprecate_stop(...)
      6.           └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'intro_optic.Rmd' failed with diagnostics:
     `cross()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     --- failed re-building ‘intro_optic.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘intro_optic.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# pammtools (0.8.1)

* GitHub: <https://github.com/adibender/pammtools>
* Email: <mailto:andreas.bender@stat.uni-muenchen.de>
* GitHub mirror: <https://github.com/cran/pammtools>

Run `revdepcheck::cloud_details(, "pammtools")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     The error most likely occurred in:
     
     > ### Name: gg_tensor
     > ### Title: Plot tensor product effects
     > ### Aliases: gg_tensor
     > 
     > ### ** Examples
     > 
     > g <- mgcv::gam(Sepal.Length ~ te(Sepal.Width, Petal.Length), data=iris)
     > gg_tensor(g)
     Error:
     ! `cross_df()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     Backtrace:
         ▆
      1. └─pammtools::gg_tensor(g)
      2.   └─pammtools::tidy_smooth2d(x, ci = ci, se = ci, ...)
      3.     └─base::lapply(...)
      4.       └─pammtools (local) FUN(X[[i]], ...)
      5.         └─purrr::cross_df(sm[c("x", "y")])
      6.           └─lifecycle::deprecate_stop(...)
      7.             └─lifecycle:::deprecate_stop0(msg)
      8.               └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ── Error ('test-mgcv-convenience.R:21:3'): mgcv convenience works ──────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `cross_df()` was deprecated in purrr 1.0.0 and is now defunct.
       ℹ Please use `tidyr::expand_grid()` instead.
       ℹ See <https://github.com/tidyverse/purrr/issues/768>.
       Backtrace:
            ▆
         1. ├─checkmate::expect_data_frame(...) at test-mgcv-convenience.R:21:3
         2. │ └─checkmate::checkDataFrame(...)
         3. │   └─... %and% checkListTypes(x, types)
         4. │     └─base::isTRUE(lhs)
         5. ├─base::suppressWarnings(tidy_smooth2d(g2, ci = TRUE))
         6. │ └─base::withCallingHandlers(...)
         7. └─pammtools::tidy_smooth2d(g2, ci = TRUE)
         8.   └─base::lapply(...)
         9.     └─pammtools (local) FUN(X[[i]], ...)
        10.       └─purrr::cross_df(sm[c("x", "y")])
        11.         └─lifecycle::deprecate_stop(...)
        12.           └─lifecycle:::deprecate_stop0(msg)
        13.             └─rlang::cnd_signal(...)
       
       [ FAIL 3 | WARN 0 | SKIP 0 | PASS 843 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# PEIMAN2 (1.1.0)

* Email: <mailto:payman.nickchi@gmail.com>
* GitHub mirror: <https://github.com/cran/PEIMAN2>

Run `revdepcheck::cloud_details(, "PEIMAN2")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### Title: Plot the results of protein set enrichment analysis (PSEA)
     > ### Aliases: plotPSEA
     > 
     > ### ** Examples
     > 
     > # We recommend at least nperm = 1000.
     > # The number of permutations was reduced to 10
     > # to accommodate CRAN policy on examples (run time <= 5 seconds).
     > psea_res <- runPSEA(protein = exmplData2, os.name = 'Rattus norvegicus (Rat)', nperm = 10)
     Error:
     ! `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `map()` instead.
       # Previously
       rerun(10, psea(x = protein, y = pro.pathway, p = pexponent, perm = TRUE))
     
       # Now
       map(1:10, ~ psea(x = protein, y = pro.pathway, p = pexponent, perm = TRUE))
     Backtrace:
         ▆
      1. └─PEIMAN2::runPSEA(...)
      2.   └─purrr::rerun(...)
      3.     └─lifecycle::deprecate_stop(...)
      4.       └─lifecycle:::deprecate_stop0(msg)
      5.         └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       map(1:1000, ~ psea(x = protein, y = pro.pathway, p = pexponent, perm = TRUE))
     ---
     Backtrace:
         ▆
      1. └─PEIMAN2::runPSEA(...)
      2.   └─purrr::rerun(...)
      3.     └─lifecycle::deprecate_stop(...)
      4.       └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'PEIMAN2-vignette.Rmd' failed with diagnostics:
     `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `map()` instead.
       # Previously
       rerun(1000, psea(x = protein, y = pro.pathway, p = pexponent, perm = TRUE))
     
       # Now
       map(1:1000, ~ psea(x = protein, y = pro.pathway, p = pexponent, perm = TRUE))
     --- failed re-building ‘PEIMAN2-vignette.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘PEIMAN2-vignette.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# PhenotypeR (0.5.0)

* GitHub: <https://github.com/OHDSI/PhenotypeR>
* Email: <mailto:edward.burn@ndorms.ox.ac.uk>
* GitHub mirror: <https://github.com/cran/PhenotypeR>

Run `revdepcheck::cloud_details(, "PhenotypeR")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         ! argument ".x_i" is missing, with no default
       ── Failure ('test-phenotypeDiagnostics.R:27:3'): test check functions ──────────
       Expected `...[]` to equal `x`.
       Differences:
       `actual` is a list
       `expected` is NULL
       
       ── Failure ('test-phenotypeDiagnostics.R:35:3'): test check functions ──────────
       Expected `x <- checkPopulationDiagnosticsInput(populationDiagnostics = list())` not to throw any errors.
       Actually got a <purrr_error_indexed> with message:
         i In index: 1.
         i With name: cohort.
         Caused by error in `map_()`:
         ! argument ".x_i" is missing, with no default
       ── Failure ('test-phenotypeDiagnostics.R:38:3'): test check functions ──────────
       Expected `names(x1)` to equal `names(x)`.
       Differences:
       `actual` is a character vector ('cohortId', 'incidence', 'periodPrevalence', 'populationSample', 'populationDateRange')
       `expected` is NULL
       
       
       [ FAIL 8 | WARN 1 | SKIP 23 | PASS 21 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# PheVis (1.0.4)

* Email: <mailto:thomas.ferte@u-bordeaux.fr>
* GitHub mirror: <https://github.com/cran/PheVis>

Run `revdepcheck::cloud_details(, "PheVis")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       > 
       > test_check("PheVis")
       Saving _problems/test-traintest_phevis-31.R
       [ FAIL 1 | WARN 21 | SKIP 0 | PASS 2 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-traintest_phevis.R:24:9'): test all pipeline is working ────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `rbernoulli()` was deprecated in purrr 1.0.0 and is now defunct.
       Backtrace:
           ▆
        1. └─PheVis::train_phevis(...) at test-traintest_phevis.R:24:9
        2.   └─PheVis:::phenorm_longit_simpl(...)
        3.     └─PheVis:::phenorm_longit_fit(...)
        4.       └─PheVis:::noising(X_boot = x_extreme, p = p.noise)
        5.         ├─base::matrix(...)
        6.         └─purrr::rbernoulli(n = prod(dim(X_boot)), p = p)
        7.           └─lifecycle::deprecate_stop("1.0.0", "rbernoulli()")
        8.             └─lifecycle:::deprecate_stop0(msg)
        9.               └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 21 | SKIP 0 | PASS 2 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     <error/lifecycle_error_deprecated>
     Error:
     ! `rbernoulli()` was deprecated in purrr 1.0.0 and is now defunct.
     ---
     Backtrace:
         ▆
      1. └─PheVis::train_phevis(...)
      2.   └─PheVis:::phenorm_longit_simpl(...)
      3.     └─PheVis:::phenorm_longit_fit(...)
      4.       └─PheVis:::noising(X_boot = x_extreme, p = p.noise)
      5.         ├─base::matrix(...)
      6.         └─purrr::rbernoulli(n = prod(dim(X_boot)), p = p)
      7.           └─lifecycle::deprecate_stop("1.0.0", "rbernoulli()")
      8.             └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'TutoPheVis.Rmd' failed with diagnostics:
     `rbernoulli()` was deprecated in purrr 1.0.0 and is now defunct.
     --- failed re-building ‘TutoPheVis.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘TutoPheVis.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# plume (0.3.0)

* GitHub: <https://github.com/arnaudgallou/plume>
* Email: <mailto:arangacas@gmail.com>
* GitHub mirror: <https://github.com/cran/plume>

Run `revdepcheck::cloud_details(, "plume")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 8.
       i With name: format.
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       Backtrace:
            ▆
         1. ├─testthat::expect_null(aut$get_contact_details(email = FALSE)) at test-get-contact-details.R:39:3
         2. │ └─testthat::quasi_label(enquo(object), label)
         3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
         4. ├─aut$get_contact_details(email = FALSE)
         5. │ └─plume:::get_detail_vars()
         6. │   └─purrr::map_vec(args, rlang::is_true)
         7. │     └─purrr::map(.x, .f, ..., .progress = .progress)
         8. │       └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
         9. │         ├─purrr:::with_indexed_errors(...)
        10. │         │ └─base::withCallingHandlers(...)
        11. │         └─purrr:::call_with_cleanup(...)
        12. └─purrr (local) `<fn>`(`<evalErrr>`)
        13.   └─cli::cli_abort(...)
        14.     └─rlang::abort(...)
       
       [ FAIL 2 | WARN 0 | SKIP 33 | PASS 189 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      1. └─aut$get_contact_details()
      2.   └─plume:::get_detail_vars()
      3.     └─purrr::map_vec(args, rlang::is_true)
      4.       └─purrr::map(.x, .f, ..., .progress = .progress)
      5.         └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
      6.           ├─purrr:::with_indexed_errors(...)
      7.           │ └─base::withCallingHandlers(...)
      8.           └─purrr:::call_with_cleanup(...)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'plume.Rmd' failed with diagnostics:
     ℹ In index: 8.
     ℹ With name: format.
     Caused by error in `map_()`:
     ! argument ".x_i" is missing, with no default
     --- failed re-building ‘plume.Rmd’
     
     --- re-building ‘working-in-other-languages.Rmd’ using rmarkdown
     --- finished re-building ‘working-in-other-languages.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘plume.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# purrrlyr (0.0.10)

* GitHub: <https://github.com/hadley/purrrlyr>
* Email: <mailto:lionel@posit.co>
* GitHub mirror: <https://github.com/cran/purrrlyr>

Run `revdepcheck::cloud_details(, "purrrlyr")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
      3  22.8     4  108     93  3.85  2.32  18.6     1     1     4     1 <dbl [1]>
      4  21.4     6  258    110  3.08  3.22  19.4     1     0     3     1 <dbl [1]>
      5  18.7     8  360    175  3.15  3.44  17.0     0     0     3     2 <dbl [1]>
      6  18.1     6  225    105  2.76  3.46  20.2     1     0     3     1 <dbl [1]>
      7  14.3     8  360    245  3.21  3.57  15.8     0     0     3     4 <dbl [1]>
      8  24.4     4  147.    62  3.69  3.19  20       1     0     4     2 <dbl [1]>
      9  22.8     4  141.    95  3.92  3.15  22.9     1     0     4     2 <dbl [1]>
     10  19.2     6  168.   123  3.92  3.44  18.3     1     0     4     4 <dbl [1]>
     # ℹ 22 more rows
     > 
     > # Other functions such as mean() may need to be adjusted with one
     > # of the lift_xy() helpers:
     > mtcars %>% by_row(purrr::lift_vl(mean))
     Error:
     ! `lift_vl()` was deprecated in purrr 1.0.0 and is now defunct.
     Backtrace:
         ▆
      1. ├─mtcars %>% by_row(purrr::lift_vl(mean))
      2. ├─purrrlyr::by_row(., purrr::lift_vl(mean))
      3. │ └─purrrlyr:::as_rows_function(..f)
      4. └─purrr::lift_vl(mean)
      5.   └─lifecycle::deprecate_stop("1.0.0", "lift_vl()")
      6.     └─lifecycle:::deprecate_stop0(msg)
      7.       └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
       i Please use `map()` instead.
         # Previously
         rerun(16, df)
       
         # Now
         map(1:16, ~df)
       Backtrace:
            ▆
         1. ├─testthat::expect_equal(...) at test-rows.R:137:3
         2. │ └─testthat::quasi_label(enquo(expected), expected.label)
         3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
         4. ├─dplyr::as_tibble(dplyr::bind_rows(purrr::rerun(16, df)))
         5. ├─dplyr::bind_rows(purrr::rerun(16, df))
         6. │ └─rlang::list2(...)
         7. └─purrr::rerun(16, df)
         8.   └─lifecycle::deprecate_stop(...)
         9.     └─lifecycle:::deprecate_stop0(msg)
        10.       └─rlang::cnd_signal(...)
       
       [ FAIL 4 | WARN 0 | SKIP 0 | PASS 64 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# r4lineups (0.1.1)

* Email: <mailto:colin.tredoux@uct.ac.za>
* GitHub mirror: <https://github.com/cran/r4lineups>

Run `revdepcheck::cloud_details(, "r4lineups")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > #Data:
     > lineup_vec <- round(runif(100, 1, 6))
     > target_pos <- 3
     > k <- 6
     > 
     > #Bootstrap data:
     > lineup_boot_df <- gen_boot_samples(lineup_vec, 1000)
     Error:
     ! `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `map()` instead.
       # Previously
       rerun(1000, sample(lineup_vec, length(lineup_vec), replace = TRUE))
     
       # Now
       map(1:1000, ~ sample(lineup_vec, length(lineup_vec), replace = TRUE))
     Backtrace:
         ▆
      1. ├─r4lineups::gen_boot_samples(lineup_vec, 1000)
      2. │ └─bootno %>% ...
      3. └─purrr::rerun(., sample(lineup_vec, length(lineup_vec), replace = TRUE))
      4.   └─lifecycle::deprecate_stop(...)
      5.     └─lifecycle:::deprecate_stop0(msg)
      6.       └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ---
     Backtrace:
         ▆
      1. ├─r4lineups::gen_boot_samples(lineup_vec, 1000)
      2. │ └─bootno %>% ...
      3. └─purrr::rerun(., sample(lineup_vec, length(lineup_vec), replace = TRUE))
      4.   └─lifecycle::deprecate_stop(...)
      5.     └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'Vignette.Rmd' failed with diagnostics:
     `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `map()` instead.
       # Previously
       rerun(1000, sample(lineup_vec, length(lineup_vec), replace = TRUE))
     
       # Now
       map(1:1000, ~ sample(lineup_vec, length(lineup_vec), replace = TRUE))
     --- failed re-building ‘Vignette.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘Vignette.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# registr (2.2.1)

* Email: <mailto:julia.wrobel@emory.edu>
* GitHub mirror: <https://github.com/cran/registr>

Run `revdepcheck::cloud_details(, "registr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
        14. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        15. │   ├─purrr:::with_indexed_errors(...)
        16. │   │ └─base::withCallingHandlers(...)
        17. │   ├─purrr:::call_with_cleanup(...)
        18. │   └─registr (local) .f(.x_i)
        19. │     ├─cross_df(list(i1 = .x$index, i2 = .x$index)) %>% ...
        20. │     └─purrr::cross_df(list(i1 = .x$index, i2 = .x$index))
        21. │       └─lifecycle::deprecate_stop(...)
        22. │         └─lifecycle:::deprecate_stop0(msg)
        23. │           └─rlang::cnd_signal(...)
        24. │             └─rlang:::signal_abort(cnd)
        25. │               └─base::signalCondition(cnd)
        26. ├─dplyr::mutate(...)
        27. ├─purrr (local) `<fn>`(`<lfcycl__>`)
        28. │ └─cli::cli_abort(...)
        29. │   └─rlang::abort(...)
        30. │     └─rlang:::signal_abort(cnd, .file)
        31. │       └─base::signalCondition(cnd)
        32. └─dplyr (local) `<fn>`(`<prrr_rr_>`)
        33.   └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
       
       [ FAIL 1 | WARN 8 | SKIP 6 | PASS 240 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# sapfluxnetr (0.1.5)

* GitHub: <https://github.com/sapfluxnet/sapfluxnetr>
* Email: <mailto:victorgrandagarcia@gmail.com>
* GitHub mirror: <https://github.com/cran/sapfluxnetr>

Run `revdepcheck::cloud_details(, "sapfluxnetr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Saving _problems/test-sfn_data_classes-327.R
       [ FAIL 1 | WARN 0 | SKIP 19 | PASS 324 ]
       
       ══ Skipped tests (19) ══════════════════════════════════════════════════════════
       • On CRAN (19): 'test-metrics.R:345:3', 'test-metrics.R:412:3',
         'test-metrics.R:459:3', 'test-metrics.R:506:3', 'test-metrics.R:605:3',
         'test-metrics.R:672:3', 'test-metrics.R:694:3', 'test-metrics.R:716:3',
         'test-metrics.R:738:3', 'test-metrics.R:760:3', 'test-metrics.R:782:3',
         'test-metrics.R:804:3', 'test-metrics.R:872:3', 'test-metrics.R:897:3',
         'test-metrics.R:986:3', 'test-metrics.R:1019:3', 'test-metrics.R:1053:3',
         'test-metrics.R:1087:3', 'test-sfn_data_classes.R:60:3'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-sfn_data_classes.R:327:3'): get methods returns the correct object ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(., dplyr::rename, TIMESTAMP = ".x[[i]]")`: i In index: 1.
       i With name: ARG_TRE.
       Caused by error in `.f()`:
       ! Can't rename columns that don't exist.
       x Column `.x[[i]]` doesn't exist.
       
       [ FAIL 1 | WARN 0 | SKIP 19 | PASS 324 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       5. ├─purrr::map(., ~tibble::as_tibble(.x))
       6. │ └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
       7. │   └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
       8. └─purrr::map(., dplyr::rename, TIMESTAMP = ".x[[i]]")
       9.   └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
      10.     ├─purrr:::with_indexed_errors(...)
      11.     │ └─base::withCallingHandlers(...)
      12.     ├─purrr:::call_with_cleanup(...)
      13.     ├─dplyr (local) .f(.x_i, ...)
      14.     └─dplyr:::rename.data.frame(.x_i, ...)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'sfn-data-classes.Rmd' failed with diagnostics:
     ℹ In index: 1.
     ℹ With name: ARG_TRE.
     Caused by error in `.f()`:
     ! Can't rename columns that don't exist.
     ✖ Column `.x[[i]]` doesn't exist.
     --- failed re-building ‘sfn-data-classes.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘sfn-data-classes.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# shinyQueryBuilder (0.1.0)

* Email: <mailto:krystian8207@gmail.com>
* GitHub mirror: <https://github.com/cran/shinyQueryBuilder>

Run `revdepcheck::cloud_details(, "shinyQueryBuilder")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     Backtrace:
          ▆
       1. ├─shinyQueryBuilder::genQueryFilters(...)
       2. │ ├─... %>% unname()
       3. │ └─purrr::imap(...)
       4. │   └─purrr::map2(.x, vec_index(.x), .f, ...)
       5. │     └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
       6. │       ├─purrr:::with_indexed_errors(...)
       7. │       │ └─base::withCallingHandlers(...)
       8. │       ├─purrr:::call_with_cleanup(...)
       9. │       └─shinyQueryBuilder (local) .f(.x_i, .y_i, ...)
      10. │         ├─base::do.call(...)
      11. │         └─shinyQueryBuilder (local) `<fn>`(...)
      12. │           └─environment() %>% as.list() %>% purrr::keep(~!is.symbol(.x))
      13. ├─base::unname(.)
      14. ├─purrr::keep(., ~!is.symbol(.x))
      15. │ └─purrr:::where_if(.x, .p, ...)
      16. │   └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
      17. │     ├─purrr:::with_indexed_errors(...)
      18. │     │ └─base::withCallingHandlers(...)
      19. │     └─purrr:::call_with_cleanup(...)
      20. └─purrr (local) `<fn>`(`<evalErrr>`)
      21.   └─cli::cli_abort(...)
      22.     └─rlang::abort(...)
     Execution halted
     ```

# sketch (1.1.20.3)

* GitHub: <https://github.com/kcf-jackson/sketch>
* Email: <mailto:jkwok@svi.edu.au>
* GitHub mirror: <https://github.com/cran/sketch>

Run `revdepcheck::cloud_details(, "sketch")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### Name: deparse_js
     > ### Title: Expression deparsing for JavaScript
     > ### Aliases: deparse_js
     > 
     > ### ** Examples
     > 
     > expr_1 <- parse_expr("R.extract(x, 3, )")
     > deparse_js(expr_1, basic_deparsers())
     Error in `purrr::map_chr()`:
     ℹ In index: 4.
     Caused by error in `map_()`:
     ! argument ".x_i" is missing, with no default
     Backtrace:
          ▆
       1. ├─sketch::deparse_js(expr_1, basic_deparsers())
       2. │ └─deparser$deparse(ast, deparsers)
       3. │   └─purrr::map_chr(as.list(ast), deparse_js, ...)
       4. │     └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
       5. │       ├─purrr:::with_indexed_errors(...)
       6. │       │ └─base::withCallingHandlers(...)
       7. │       └─purrr:::call_with_cleanup(...)
       8. └─purrr (local) `<fn>`(`<S3: evalError>`)
       9.   └─cli::cli_abort(...)
      10.     └─rlang::abort(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ℹ In index: 3.
       Caused by error in `purrr::map()`:
       ℹ In index: 2.
       Caused by error in `purrr::map()`:
       ℹ In index: 1.
       ℹ With name: n.
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       ── Error ('test_source.R:52:5'): basic_tags() ──────────────────────────────────
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(., rewrite, rules = rules)`: ℹ In index: 1.
       Caused by error in `purrr::map()`:
       ℹ In index: 3.
       Caused by error in `purrr::map()`:
       ℹ In index: 2.
       Caused by error in `purrr::map()`:
       ℹ In index: 1.
       ℹ With name: n.
       Caused by error in `map_()`:
       ! argument ".x_i" is missing, with no default
       
       [ FAIL 10 | WARN 1 | SKIP 1 | PASS 277 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘ext-annotate_expr.R’
     ```

# slippymath (0.3.1)

* Email: <mailto:miles.mcbain@gmail.com>
* GitHub mirror: <https://github.com/cran/slippymath>

Run `revdepcheck::cloud_details(, "slippymath")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘slippymath-Ex.R’ failed
     The error most likely occurred in:
     
     > ### Name: bbox_tile_query
     > ### Title: bbox_tile_query
     > ### Aliases: bbox_tile_query
     > 
     > ### ** Examples
     > 
     > tibrogargan<- c(xmin = 152.938485, ymin = -26.93345, xmax = 152.956467, 
     +                ymax = -26.921463)
     > 
     > bbox_tile_query(tibrogargan)
     Error:
     ! `lift()` was deprecated in purrr 1.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─slippymath::bbox_tile_query(tibrogargan)
      2.   └─slippymath:::lol_to_df(extents_at_zooms)
      3.     └─purrr::lift_dl(data.frame)
      4.       └─lifecycle::deprecate_stop("1.0.0", "lift()")
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       Error: `lift()` was deprecated in purrr 1.0.0 and is now defunct.
       Backtrace:
           ▆
        1. └─slippymath::bbox_tile_query(bbox, zoom_levels = 0:19) at test-tile_logic.R:7:3
        2.   └─slippymath:::lol_to_df(extents_at_zooms)
        3.     └─purrr::lift_dl(data.frame)
        4.       └─lifecycle::deprecate_stop("1.0.0", "lift()")
        5.         └─lifecycle:::deprecate_stop0(msg)
        6.           └─rlang::cnd_signal(...)
       ── Error ('test-tile_logic.R:23:3'): tile cascade smaller extent works ─────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `lift()` was deprecated in purrr 1.0.0 and is now defunct.
       Backtrace:
           ▆
        1. └─slippymath::bbox_tile_query(bbox, zoom_levels = 0:19) at test-tile_logic.R:23:3
        2.   └─slippymath:::lol_to_df(extents_at_zooms)
        3.     └─purrr::lift_dl(data.frame)
        4.       └─lifecycle::deprecate_stop("1.0.0", "lift()")
        5.         └─lifecycle:::deprecate_stop0(msg)
        6.           └─rlang::cnd_signal(...)
       
       [ FAIL 2 | WARN 0 | SKIP 0 | PASS 15 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     
     Quitting from how-to-slippymath.Rmd:41-51 [unnamed-chunk-1]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/lifecycle_error_deprecated>
     Error:
     ! `lift()` was deprecated in purrr 1.0.0 and is now defunct.
     ---
     Backtrace:
         ▆
      1. └─slippymath::bbox_tile_query(uluru_bbox)
      2.   └─slippymath:::lol_to_df(extents_at_zooms)
      3.     └─purrr::lift_dl(data.frame)
      4.       └─lifecycle::deprecate_stop("1.0.0", "lift()")
      5.         └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'how-to-slippymath.Rmd' failed with diagnostics:
     `lift()` was deprecated in purrr 1.0.0 and is now defunct.
     --- failed re-building ‘how-to-slippymath.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘fetching-elevation-rasters-from-mapbox.Rmd’ ‘how-to-slippymath.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# spinebil (1.0.5)

* GitHub: <https://github.com/uschiLaa/spinebil>
* Email: <mailto:tina.rashidjafari@gmail.com>
* GitHub mirror: <https://github.com/cran/spinebil>

Run `revdepcheck::cloud_details(, "spinebil")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘spinebil-Ex.R’ failed
     The error most likely occurred in:
     
     > ### Name: distance_dist
     > ### Title: Collecting all pairwise distances between input planes.
     > ### Aliases: distance_dist
     > 
     > ### ** Examples
     > 
     > planes1 <- purrr::rerun(10, tourr::basis_random(5))
     Error:
     ! `rerun()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `map()` instead.
       # Previously
       rerun(10, tourr::basis_random(5))
     
       # Now
       map(1:10, ~ tourr::basis_random(5))
     Backtrace:
         ▆
      1. └─purrr::rerun(10, tourr::basis_random(5))
      2.   └─lifecycle::deprecate_stop(...)
      3.     └─lifecycle:::deprecate_stop0(msg)
      4.       └─rlang::cnd_signal(...)
     Execution halted
     ```

# sweep (0.2.7)

* GitHub: <https://github.com/business-science/sweep>
* Email: <mailto:mdancho@business-science.io>
* GitHub mirror: <https://github.com/cran/sweep>

Run `revdepcheck::cloud_details(, "sweep")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       1. ├─df %>% mutate(out = invoke_map(f, params))
       2. ├─dplyr::mutate(., out = invoke_map(f, params))
       3. ├─dplyr:::mutate.data.frame(., out = invoke_map(f, params))
       4. │ └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       5. │   ├─base::withCallingHandlers(...)
       6. │   └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
       7. │     └─mask$eval_all_mutate(quo)
       8. │       └─dplyr (local) eval()
       9. └─purrr::invoke_map(f, params)
      10.   └─lifecycle::deprecate_stop("1.0.0", "invoke_map()", I("map() + exec()"))
      11.     └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'SW02_Forecasting_Multiple_Models.Rmd' failed with diagnostics:
     ℹ In argument: `out = invoke_map(f, params)`.
     Caused by error:
     ! `invoke_map()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use map() + exec() instead.
     --- failed re-building ‘SW02_Forecasting_Multiple_Models.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘SW02_Forecasting_Multiple_Models.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# tabxplor (2.0.1)

* GitHub: <https://github.com/BriceNocenti/tabxplor>
* Email: <mailto:brice.nocenti@protonmail.com>
* GitHub mirror: <https://github.com/cran/tabxplor>

Run `revdepcheck::cloud_details(, "tabxplor")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Backtrace:
            ▆
         1. ├─tabxplor::tab_chi2(...) at test-tab-steps-legacy.R:66:3
         2. │ └─tabxplor::tab_get_vars(tabs)
         3. │   ├─base::stopifnot(is.data.frame(tabs))
         4. │   └─base::is.data.frame(tabs)
         5. ├─tabxplor::tab_ci(...)
         6. │ ├─purrr::discard(...)
         7. │ │ └─purrr:::where_if(.x, .p, ...)
         8. │ │   └─purrr:::map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
         9. │ │     └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
        10. │ ├─base::unique(purrr::map_chr(tot_cols, as.character))
        11. │ └─purrr::map_chr(tot_cols, as.character)
        12. │   └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
        13. │     ├─purrr:::with_indexed_errors(...)
        14. │     │ └─base::withCallingHandlers(...)
        15. │     └─purrr:::call_with_cleanup(...)
        16. └─purrr (local) `<fn>`(`<evalErrr>`)
        17.   └─cli::cli_abort(...)
        18.     └─rlang::abort(...)
       
       [ FAIL 5 | WARN 1 | SKIP 37 | PASS 4417 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# tidygate (1.0.19)

* GitHub: <https://github.com/stemangiola/tidygate>
* Email: <mailto:hutchison.w@wehi.edu.au>
* GitHub mirror: <https://github.com/cran/tidygate>

Run `revdepcheck::cloud_details(, "tidygate")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
      12. │   └─purrr::map(...)
      13. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
      14. │       ├─purrr:::with_indexed_errors(...)
      15. │       │ └─base::withCallingHandlers(...)
      16. │       ├─purrr:::call_with_cleanup(...)
      17. │       └─tidygate (local) .f(.x_i)
      18. │         └─... %>% ...
      19. ├─dplyr::pull(., gate)
      20. ├─dplyr::mutate(., `:=`(gate, if_else(gate == "", "0", gate)))
      21. ├─tidyr::unite(., contains("gate"), col = "gate", sep = ",", na.rm = TRUE)
      22. ├─dplyr::arrange(., as.numeric(point))
      23. ├─dplyr::full_join(...)
      24. ├─purrr::reduce(., .f = full_join, by = "point")
      25. │ └─purrr:::reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
      26. │   └─purrr:::reduce_init(.x, .init, left = left, error_call = .purrr_error_call)
      27. │     └─rlang::is_empty(x)
      28. ├─purrr::imap(., ~tibble(gate = .y, point = .x))
      29. │ └─purrr::map2(.x, vec_index(.x), .f, ...)
      30. │   └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
      31. │     └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
      32. └─purrr::when(., !is.null(.) ~ (.) %>% add_attr(.x, "gate"))
      33.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
      34.     └─lifecycle:::deprecate_stop0(msg)
      35.       └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        30. │ └─purrr:::reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
        31. │   └─purrr:::reduce_init(.x, .init, left = left, error_call = .purrr_error_call)
        32. │     └─rlang::is_empty(x)
        33. ├─purrr::imap(., ~tibble(gate = .y, point = .x))
        34. │ └─purrr::map2(.x, vec_index(.x), .f, ...)
        35. │   └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
        36. │     └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
        37. ├─purrr::when(., !is.null(.) ~ (.) %>% add_attr(.x, "gate"))
        38. │ └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
        39. │   └─lifecycle:::deprecate_stop0(msg)
        40. │     └─rlang::cnd_signal(...)
        41. │       └─rlang:::signal_abort(cnd)
        42. │         └─base::signalCondition(cnd)
        43. ├─purrr (local) `<fn>`(`<lfcycl__>`)
        44. │ └─cli::cli_abort(...)
        45. │   └─rlang::abort(...)
        46. │     └─rlang:::signal_abort(cnd, .file)
        47. │       └─base::signalCondition(cnd)
        48. └─dplyr (local) `<fn>`(`<prrr_rr_>`)
        49.   └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
       
       [ FAIL 3 | WARN 0 | SKIP 0 | PASS 0 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      28. ├─purrr::imap(., ~tibble(gate = .y, point = .x))
      29. │ └─purrr::map2(.x, vec_index(.x), .f, ...)
      30. │   └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
      31. │     └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
      32. └─purrr::when(., !is.null(.) ~ (.) %>% add_attr(.x, "gate"))
      33.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
      34.     └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'introdution.Rmd' failed with diagnostics:
     ℹ In argument: `gated = gate(x = mpg, y = wt, programmatic_gates =
       tidygate_env$gates)`.
     Caused by error in `purrr::map()`:
     ℹ In index: 1.
     ℹ With name: 1.
     Caused by error:
     ! `when()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `if` instead.
     --- failed re-building ‘introdution.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘introdution.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# tidyHeatmap (1.13.1)

* GitHub: <https://github.com/stemangiola/tidyHeatmap>
* Email: <mailto:mangiolastefano@gmail.com>
* GitHub mirror: <https://github.com/cran/tidyHeatmap>

Run `revdepcheck::cloud_details(, "tidyHeatmap")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > 
     > 
     > hm = 
     +   tidyHeatmap::N52 |>
     +   tidyHeatmap::heatmap(
     +     .row = symbol_ct,
     +     .column = UBR,
     +     .value = `read count normalised log`
     + )
     tidyHeatmap says: (once per session) from release 1.7.0 the scaling is set to "none" by default. Please use scale = "row", "column" or "both" to apply scaling
     tidyHeatmap says: If you use tidyHeatmap for scientific research, please cite: Mangiola, S. and Papenfuss, A.T., 2020. 'tidyHeatmap: an R package for modular heatmap production based on tidy principles.' Journal of Open Source Software. doi:10.21105/joss.02472.
     This message is displayed once per session.
     Error:
     ! `when()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `if` instead.
     Backtrace:
         ▆
      1. ├─tidyHeatmap::heatmap(...)
      2. └─tidyHeatmap::heatmap(...)
      3.   └─purrr::when(...)
      4.     └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
      5.       └─lifecycle:::deprecate_stop0(msg)
      6.         └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        16. └─base (local) `<fn>`(`<lfcycl__>`)
       
       [ FAIL 69 | WARN 0 | SKIP 0 | PASS 2 ]
       Deleting unused snapshots: 'color-functionality/color-size-columns-text.svg',
       'color-functionality/color-size-columns.svg',
       'color-functionality/layer-arrow-down-color.svg',
       'color-functionality/layer-arrow-up-color.svg',
       'color-functionality/layer-asterisk-color.svg',
       'color-functionality/layer-diamond-color.svg',
       'color-functionality/layer-point-color-column.svg',
       'color-functionality/layer-point-color.svg',
       'color-functionality/layer-square-color.svg',
       'color-functionality/layer-star-color.svg',
       'color-functionality/layer-symbol-color-column.svg',
       'color-functionality/layer-symbol-default-color.svg',
       'color-functionality/layer-symbol-direct-color.svg',
       'color-functionality/layer-text-color-column.svg',
       'color-functionality/layer-text-default-color.svg',
       'color-functionality/layer-text-direct-color.svg',
       'color-functionality/multiple-layers-colors.svg',
       'tests/annotated-heatmap-1.svg', …, 'tests/tile-factor-custom-palette.svg', and
       'tests/wrap-heatmap.svg'
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ---
     Backtrace:
          ▆
       1. ├─tidyHeatmap::annotation_tile(...)
       2. ├─tidyHeatmap::heatmap(...)
       3. ├─tidyHeatmap::heatmap(...)
       4. │ └─purrr::when(...)
       5. │   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
       6. │     └─lifecycle:::deprecate_stop0(msg)
       7. │       └─rlang::cnd_signal(...)
       8. │         └─rlang:::signal_abort(cnd)
       9. │           └─base::signalCondition(cnd)
      10. └─base (local) `<fn>`(`<lfcycl__>`)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'introduction.Rmd' failed with diagnostics:
     error in evaluating the argument '.data' in selecting a method for function 'annotation_tile': `when()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `if` instead.
     --- failed re-building ‘introduction.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘introduction.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# tidyllm (0.7.1)

* GitHub: <https://github.com/edubruell/tidyllm>
* Email: <mailto:eduard.bruell@zew.de>
* GitHub mirror: <https://github.com/cran/tidyllm>

Run `revdepcheck::cloud_details(, "tidyllm")` for more info

## Newly broken

*   checking whether package ‘tidyllm’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘/tmp/workdir/tidyllm/new/tidyllm.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘tidyllm’ ...
** this is package ‘tidyllm’ version ‘0.7.1’
** package ‘tidyllm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: Use of pairlists in purrr functions was deprecated in purrr 1.0.0.
ℹ Please coerce explicitly with `as.list()`
ℹ The deprecated feature was likely used in the tidyllm package.
...
ℹ With name: chat.
Caused by error in `purrr::map_chr()`:
ℹ In index: 1.
ℹ With name: .llm.
Caused by error in `map_()`:
! argument ".x_i" is missing, with no default
Error: unable to load R code in package ‘tidyllm’
Execution halted
ERROR: lazy loading failed for package ‘tidyllm’
* removing ‘/tmp/workdir/tidyllm/new/tidyllm.Rcheck/tidyllm’


```
### CRAN

```
* installing *source* package ‘tidyllm’ ...
** this is package ‘tidyllm’ version ‘0.7.1’
** package ‘tidyllm’ successfully unpacked and MD5 sums checked
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
* DONE (tidyllm)


```
# tidyseurat (0.8.10)

* GitHub: <https://github.com/stemangiola/tidyseurat>
* Email: <mailto:mangiolastefano@gmail.com>
* GitHub mirror: <https://github.com/cran/tidyseurat>

Run `revdepcheck::cloud_details(, "tidyseurat")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
      28. │   └─tidyseurat (local) .f(.x_i)
      29. │     └─my_data__ %>% filter(.cell %in% pull(.x, .cell)) %>% ...
      30. ├─dplyr::select(., colnames(.x))
      31. ├─dplyr::filter(., .cell %in% pull(.x, .cell))
      32. ├─tidyseurat:::filter.Seurat(., .cell %in% pull(.x, .cell))
      33. │ └─... %>% as_meta_data(.data)
      34. ├─tidyseurat:::as_meta_data(., .data)
      35. │ └─... %>% column_to_rownames(c_(seurat_object)$name)
      36. ├─tibble::column_to_rownames(., c_(seurat_object)$name)
      37. │ ├─base::stopifnot(is.data.frame(.data))
      38. │ └─base::is.data.frame(.data)
      39. ├─dplyr::select_if(., !colnames(.) %in% col_to_exclude)
      40. │ └─rlang::is_logical(.predicate)
      41. ├─colnames(.) %in% col_to_exclude
      42. ├─base::colnames(.)
      43. │ └─base::is.data.frame(x)
      44. ├─dplyr::filter(., ..., .preserve = .preserve)
      45. ├─tibble::as_tibble(.)
      46. ├─tidyseurat:::as_tibble.Seurat(.)
      47. │ └─x[[]] %>% tibble::as_tibble(rownames = c_(x)$name) %>% ...
      48. └─purrr::when(...)
      49.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
      50.     └─lifecycle:::deprecate_stop0(msg)
      51.       └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ── Error ('test-utilities.R:11:3'): ping_old_special_column_into_metadata ──────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `when()` was deprecated in purrr 1.0.0 and is now defunct.
       ℹ Please use `if` instead.
       Backtrace:
            ▆
         1. ├─testthat::expect_equal(...) at test-utilities.R:11:3
         2. │ └─testthat::quasi_label(enquo(object), label)
         3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
         4. ├─purrr::pluck(...)
         5. │ └─purrr:::pluck_raw(.x, list2(...), .default = .default)
         6. ├─base::colnames(as_tibble(ping_old_special_column_into_metadata(pbmc_small)))
         7. │ └─base::is.data.frame(x)
         8. ├─tibble::as_tibble(ping_old_special_column_into_metadata(pbmc_small))
         9. ├─tidyseurat:::as_tibble.Seurat(ping_old_special_column_into_metadata(pbmc_small))
        10. │ └─x[[]] %>% tibble::as_tibble(rownames = c_(x)$name) %>% ...
        11. └─purrr::when(...)
        12.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
        13.     └─lifecycle:::deprecate_stop0(msg)
        14.       └─rlang::cnd_signal(...)
       
       [ FAIL 32 | WARN 3 | SKIP 0 | PASS 20 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       8. │     └─tidyseurat:::print.Seurat(object)
       9. │       ├─... %>% print()
      10. │       ├─vctrs::new_data_frame(...)
      11. │       ├─tibble::as_tibble(x, n_dimensions_to_return = 5) at vctrs/R/type-data-frame.R:29:3
      12. │       └─tidyseurat:::as_tibble.Seurat(x, n_dimensions_to_return = 5)
      13. │         └─x[[]] %>% tibble::as_tibble(rownames = c_(x)$name) %>% ...
      14. ├─base::print(.)
      15. ├─tidyseurat:::add_attr(., x@active.assay, "active_assay")
      16. ├─tidyseurat:::add_attr(., Assays(x), "assay_names")
      17. ├─tidyseurat:::add_attr(., GetAssayData(x) %>% nrow, "number_of_features")
      18. └─purrr::when(...)
      19.   └─lifecycle::deprecate_stop("1.0.0", "when()", I("`if`"))
      20.     └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'introduction.Rmd' failed with diagnostics:
     `when()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `if` instead.
     --- failed re-building ‘introduction.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘introduction.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# timetk (2.9.1)

* GitHub: <https://github.com/business-science/timetk>
* Email: <mailto:mdancho@business-science.io>
* GitHub mirror: <https://github.com/cran/timetk>

Run `revdepcheck::cloud_details(, "timetk")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     # ℹ 998 more rows
     > 
     > # For summary operations like rolling means, we can accomplish large-scale
     > # multi-rolls with tk_augment_slidify()
     > 
     > FB %>%
     +     select(symbol, date, adjusted) %>%
     +     tk_augment_slidify(
     +         adjusted, .period = 5:10, .f = mean, .align = "right",
     +         .names = stringr::str_c("MA_", 5:10)
     +     )
     Error:
     ! `cross_df()` was deprecated in purrr 1.0.0 and is now defunct.
     ℹ Please use `tidyr::expand_grid()` instead.
     ℹ See <https://github.com/tidyverse/purrr/issues/768>.
     Backtrace:
         ▆
      1. ├─FB %>% select(symbol, date, adjusted) %>% ...
      2. ├─timetk::tk_augment_slidify(...)
      3. └─timetk:::tk_augment_slidify.data.frame(...)
      4.   └─purrr::cross_df(.l = list(col = col_nms, per = .period))
      5.     └─lifecycle::deprecate_stop(...)
      6.       └─lifecycle:::deprecate_stop0(msg)
      7.         └─rlang::cnd_signal(...)
     Execution halted
     ```

