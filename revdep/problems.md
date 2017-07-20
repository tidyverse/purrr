# modelr

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘modelr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_predictors
    > ### Title: Add predictors to a formula
    > ### Aliases: add_predictors
    > 
    > ### ** Examples
    > 
    > f <- lhs ~ rhs
    > add_predictors(f, ~var1, ~var2)
    Error: `.x` is empty, and no `.init` supplied
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         })
      9: reduce_impl(.x, .f, ..., .init = .init, .left = TRUE)
      10: reduce_init(.x, .init, left = .left)
      11: stop("`.x` is empty, and no `.init` supplied", call. = FALSE)
      
      testthat results ================================================================
      OK: 6 SKIPPED: 0 FAILED: 5
      1. Error: add_predictors() combines predictors (@test-formulas.R#5) 
      2. Error: add_predictors() combines with fun (@test-formulas.R#9) 
      3. Error: add_predictors() handles lhss (@test-formulas.R#13) 
      4. Error: merge_formula() handles lhss (@test-formulas.R#18) 
      5. Error: formulas() combines the lhs (@test-formulas.R#47) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘broom’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘lme4’, ‘rstanarm’
    ```

# modeval

Version: 0.1.3

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning: Deprecated
    Quitting from lines 112-115 (modeval.Rmd) 
    Error: processing vignette 'modeval.Rmd' failed with diagnostics:
    the argument has already been evaluated
    Execution halted
    ```

# pollen

Version: 0.52.00

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pollen-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: outliers_replacer
    > ### Title: A Outliers Replacer Function
    > ### Aliases: outliers_replacer
    > ### Keywords: outliers pollen pollen,
    > 
    > ### ** Examples
    > 
    > 
    > data(pollen_count)
    > df <- subset(pollen_count, site=='Shire')
    > new_df <- outliers_replacer(df, value="birch", date="date")
    Error in FUN(left, right) : non-numeric argument to binary operator
    Calls: outliers_replacer ... outliers_detector -> which -> Ops.data.frame -> eval -> eval
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 76-79 (intro.Rmd) 
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    non-numeric argument to binary operator
    Execution halted
    ```

# tatoo

Version: 1.0.6

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      tres2 <- stack_table_list(list(t_mash_1, t_comp_3, t_df1), meta = t_meta_verbose) produced warnings.
      
      
      3. Failure: Tagged_table constructors work (@test_Tagged_table.R#37) -----------
      tres <- stack_table(t_df1, t_df2, meta = t_meta_simple) produced warnings.
      
      
      testthat results ================================================================
      OK: 116 SKIPPED: 0 FAILED: 3
      1. Failure: Stacked_table works as expected (@test_Stacked_table.R#11) 
      2. Failure: Stacked_table works as expected (@test_Stacked_table.R#19) 
      3. Failure: Tagged_table constructors work (@test_Tagged_table.R#37) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyquant

Version: 0.5.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
     Removing FB.
    Warning: x = 'NFLX', get = 'stock.prices': Error in charToDate(x): character string is not in a standard unambiguous format
     Removing NFLX.
    Warning in value[[3L]](cond) : Returning as nested data frame.
    > 
    > # Plot for stocks
    > a <- stocks %>%
    +     ggplot(aes(date, adjusted, color = symbol)) +
    +     geom_line() +
    +     labs(title = "Multi stock example",
    +          xlab = "Date",
    +          ylab = "Adjusted Close")
    > 
    > # Plot with tidyquant theme and colors
    > a +
    +     theme_tq() +
    +     scale_color_tq()
    Don't know how to automatically pick scale for object of type function. Defaulting to continuous.
    Error in FUN(X[[i]], ...) : object 'adjusted' not found
    Calls: <Anonymous> ... by_layer -> f -> <Anonymous> -> f -> lapply -> FUN -> FUN
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    setdiff():     lubridate, base
    union():       lubridate, base
    
    Attaching package: 'tidyquant'
    
    The following object is masked from 'package:dplyr':
    
        as_tibble
    
    The following object is masked from 'package:tibble':
    
        as_tibble
    
    Getting data...
    
    Getting data...
    
    Quitting from lines 366-369 (TQ01-core-functions-in-tidyquant.Rmd) 
    Error: processing vignette 'TQ01-core-functions-in-tidyquant.Rmd' failed with diagnostics:
    Evaluation error: character string is not in a standard unambiguous format.
    Execution halted
    ```

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 139 SKIPPED: 0 FAILED: 14
      1. Failure: Test 1 returns tibble with correct rows and columns. (@test_tq_get_compound_getters.R#24) 
      2. Failure: Test 2 returns tibble with correct rows and columns. (@test_tq_get_compound_getters.R#33) 
      3. Failure: Test 3 returns tibble with correct rows and columns. (@test_tq_get_compound_getters.R#42) 
      4. Failure: Test prints warning message on invalid x input. (@test_tq_get_compound_getters.R#62) 
      5. Error: Test prints warning message on invalid x input. (@test_tq_get_dividends.R#23) 
      6. Error: Test returns NA on invalid x input. (@test_tq_get_dividends.R#27) 
      7. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_exchange_rates.R#25) 
      8. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_metal_prices.R#26) 
      9. Failure: Test prints warning message on invalid x input. (@test_tq_get_splits.R#23) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘devtools’
      All declared Imports should be used.
    ```

# valaddin

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1. Failure: error raised when .f is not a closure (@test-firmly.R#12) ----------
      firmly(f) did not throw an error.
      
      
      2. Failure: error raised when .f not a closure (@test-loosely.R#10) ------------
      loosely(f) did not throw an error.
      
      
      testthat results ================================================================
      OK: 3695 SKIPPED: 0 FAILED: 2
      1. Failure: error raised when .f is not a closure (@test-firmly.R#12) 
      2. Failure: error raised when .f not a closure (@test-loosely.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'bare-type-checkers.Rd':
      ‘[purrr:bare-type-predicates]{bare type predicate}’
      ‘[purrr:bare-type-predicates]{Bare type predicates}’
    
    Missing link or links in documentation object 'scalar-type-checkers.Rd':
      ‘[purrr:scalar-type-predicates]{scalar type }’
      ‘[purrr:scalar-type-predicates]{Scalar type predicates}’
    
    Missing link or links in documentation object 'type-checkers.Rd':
      ‘[purrr:type-predicates]{type predicate}’
      ‘[purrr:type-predicates]{Type predicates}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

