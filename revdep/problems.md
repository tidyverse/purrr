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

# phylopath

Version: 0.3.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘phylopath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: average
    > ### Title: Extract and average the best supported models from a
    > ###   phylogenetic path analysis.
    > ### Aliases: average
    > 
    > ### ** Examples
    > 
    >   candidates <- list(
    +     A = DAG(LS ~ BM, NL ~ BM, DD ~ NL, RS ~ BM + NL),
    +     B = DAG(LS ~ BM, NL ~ BM + RS, DD ~ NL)
    +   )
    >   p <- phylo_path(candidates, rhino, rhino_tree)
    Error: Fitting the following model:
        DD ~ NL + BM 
    produced this error:
        Error in nlme::gls(..., correlation = cor_fun(par, .x)): 
    model must be a formula of the form "resp ~ pred"
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 90-92 (intro_to_phylopath.Rmd) 
    Error: processing vignette 'intro_to_phylopath.Rmd' failed with diagnostics:
    Fitting the following model:
        DD ~ NL + BM 
    produced this error:
        Error in nlme::gls(..., correlation = cor_fun(par, .x)): 
    model must be a formula of the form "resp ~ pred"
    Execution halted
    ```

# tidyquant

Version: 0.5.2

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

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 127 SKIPPED: 0 FAILED: 15
      1. Failure: Test 1 returns tibble with correct rows and columns. (@test_tq_get_compound_getters.R#24) 
      2. Failure: Test 2 returns tibble with correct rows and columns. (@test_tq_get_compound_getters.R#33) 
      3. Failure: Test 3 returns tibble with correct rows and columns. (@test_tq_get_compound_getters.R#42) 
      4. Failure: Test prints warning message on invalid x input. (@test_tq_get_compound_getters.R#62) 
      5. Failure: Test 2 returns tibble with correct rows and columns. (@test_tq_get_stock_prices.R#28) 
      6. Failure: Test 2 returns tibble with correct rows and columns. (@test_tq_get_stock_prices.R#30) 
      7. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      8. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      9. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
        as_tibble
    
    Getting holdings for SP500
    Unable to find any JVMs matching version "(null)".
    No Java runtime present, try --request to install.
    Warning: running command '/usr/libexec/java_home' had status 1
    Warning in tq_index("SP500") :
      Error at SP500 during download. 
    Error: .onLoad failed in loadNamespace() for 'rJava', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/Users/lionel/Dropbox/Projects/R/hadley/lowliner/revdep/library/tidyquant/rJava/libs/rJava.so':
      dlopen(/Users/lionel/Dropbox/Projects/R/hadley/lowliner/revdep/library/tidyquant/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
      Referenced from: /Users/lionel/Dropbox/Projects/R/hadley/lowliner/revdep/library/tidyquant/rJava/libs/rJava.so
      Reason: image not found
    
    Getting data...
    
    Quitting from lines 365-368 (TQ01-core-functions-in-tidyquant.Rmd) 
    Error: processing vignette 'TQ01-core-functions-in-tidyquant.Rmd' failed with diagnostics:
    Evaluation error: character string is not in a standard unambiguous format.
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unable to find any JVMs matching version "(null)".
    No Java runtime present, try --request to install.
    Namespaces in Imports field not imported from:
      ‘broom’ ‘curl’ ‘devtools’ ‘rvest’ ‘timeSeries’ ‘tseries’ ‘zoo’
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

