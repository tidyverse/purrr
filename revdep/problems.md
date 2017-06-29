# modelr (0.1.0)

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

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘broom’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘lme4’, ‘rstanarm’
    ```

# modeval (0.1.3)

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

# phylopath (0.2.3)

*   checking examples ... ERROR
    ```
    Running examples in ‘phylopath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: average
    > ### Title: Extract and average the best supported models from a
    > ###   phylogenetic path analysis.
    > ### Aliases: average
    > 
    > ### ** Examples
    > 
    >   candidates <- list(A = DAG(LS ~ BM, NL ~ BM, DD ~ NL + LS),
    +                      C = DAG(LS ~ BM, NL ~ LS + BM, DD ~ NL))
    >   p <- phylo_path(candidates, rhino, rhino_tree)
    Error: Fitting the following model:
        DD ~ NL + LS + BM 
    produced this error:
        Error in nlme::gls(..., correlation = cor_fun(par, .x)): 
    model must be a formula of the form "resp ~ pred"
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 85-87 (intro_to_phylopath.Rmd) 
    Error: processing vignette 'intro_to_phylopath.Rmd' failed with diagnostics:
    Fitting the following model:
        DD ~ NL + BM 
    produced this error:
        Error in nlme::gls(..., correlation = cor_fun(par, .x)): 
    model must be a formula of the form "resp ~ pred"
    Execution halted
    ```

# pollen (0.52.00)

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

# tidyquant (0.5.1)

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

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘devtools’
      All declared Imports should be used.
    ```

# valaddin (0.1.0)

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

