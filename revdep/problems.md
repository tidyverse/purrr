# alphavantager

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      	  <body>
      		<iframe src="//www.herokucdn.com/error-pages/application-error.html"></iframe>
      	  </body>
      	</html>
      1: av_get(symbol, av_fun, interval = interval, time_period = time_period, series_type = series_type) at testthat/test_av_get.R:57
      2: stop(httr::content(response, as = "text"), call. = FALSE)
      
      testthat results ================================================================
      OK: 5 SKIPPED: 0 FAILED: 3
      1. Error: call TIMES_SERIES_INTRADAY (@test_av_get.R#22) 
      2. Error: call SECTOR (@test_av_get.R#38) 
      3. Error: call Technical Indicators (@test_av_get.R#57) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘devtools’
      All declared Imports should be used.
    ```

# anomalyDetection

Version: 0.2.4

## In both

*   checking whether package ‘anomalyDetection’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/anomalyDetection/new/anomalyDetection.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘anomalyDetection’ ...
** package ‘anomalyDetection’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/new/Rcpp/include" -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/anomalyDetection/new/anomalyDetection.Rcheck/anomalyDetection’

```
### CRAN

```
* installing *source* package ‘anomalyDetection’ ...
** package ‘anomalyDetection’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/old/Rcpp/include" -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/anomalyDetection/old/anomalyDetection.Rcheck/anomalyDetection’

```
# ari

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m5. Error: ari_stitch() can combine audio and images into a video (@test_ari_stitch.R#21) [39m
      Could not find ffmpeg. See the documentation for ari_stitch() for more details.
      1: ari_stitch(graphs, sound, video) at testthat/test_ari_stitch.R:21
      2: stop("Could not find ffmpeg. See the documentation for ari_stitch() for more details.")
      
      testthat results ================================================================
      OK: 1 SKIPPED: 0 FAILED: 5
      1. Error: Ari can make a video from local HTML slides. (@test_ari_narrate.R#16) 
      2. Error: Ari can make a video from HTML slides on the web. (@test_ari_narrate.R#28) 
      3. Error: Ari use an Rmd file with HTML comments for a script. (@test_ari_narrate.R#40) 
      4. Error: Ari can process text with over 1500 characters. (@test_ari_spin.R#60) 
      5. Error: ari_stitch() can combine audio and images into a video (@test_ari_stitch.R#21) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# banR

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringr’
      All declared Imports should be used.
    ```

# breathtestcore

Version: 0.4.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘breathteststan’
    ```

# breathteststan

Version: 0.3.0

## In both

*   checking whether package ‘breathteststan’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Rcpp’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/breathteststan/new/breathteststan.Rcheck/00install.out’ for details.
    ```

# broom

Version: 0.4.2

## In both

*   checking examples ... ERROR
    ```
    ...
    +   f2 <- Finance[1:300, "hml"] - rf
    +   f3 <- Finance[1:300, "smb"] - rf
    +   h <- cbind(f1, f2, f3)
    +   res2 <- gmm(z ~ f1 + f2 + f3, x = h)
    +   
    +   td2 <- tidy(res2, conf.int = TRUE)
    +   td2
    +   
    +   # coefficient plot
    +   td2 %>%
    +     mutate(variable = reorder(variable, estimate)) %>%
    +     ggplot(aes(estimate, variable)) +
    +     geom_point() +
    +     geom_errorbarh(aes(xmin = conf.low, xmax = conf.high)) +
    +     facet_wrap(~ term) +
    +     geom_vline(xintercept = 0, color = "red", lty = 2)
    + }
    Error in `colnames<-`(`*tmp*`, value = c("conf.low", "conf.high")) : 
      attempt to set 'colnames' on an object with less than two dimensions
    Calls: tidy -> tidy.gmm -> process_lm -> colnames<-
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testthat)
      > test_check("broom")
      Loading required package: broom
      Error in lahman_df() : could not find function "lahman_df"
      Calls: test_check ... with_reporter -> force -> source_file -> eval -> eval -> tbl
      In addition: Warning message:
      package 'lme4' was built under R version 3.4.2 
      testthat results ================================================================
      OK: 621 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

# bsplus

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# censys

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: expect_compare(">=", object, expected, label = label, expected.label = expected.label)
      3: stopifnot(is.numeric(actual), length(actual) == 1)
      4: get_series()
      5: httr::GET(CENSYS_API_URL %s+% "data", check_api())
      6: request_build("GET", hu$url, as.request(config), ...)
      7: as.request(config)
      8: check_api()
      9: stop("Both CENSYS_API_ID and CENSYS_API_SECRET must be present in the R environment.")
      
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 1
      1. Error: we can do something (@test-censys.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cepR

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 287 marked UTF-8 strings
    ```

# childsds

Version: 0.6.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gamlss.dist’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 20 marked UTF-8 strings
    ```

# clustermq

Version: 0.7.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘infuser’
      All declared Imports should be used.
    ```

# congressbr

Version: 0.1.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# corrr

Version: 0.2.1

## In both

*   checking whether package ‘corrr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/corrr/new/corrr.Rcheck/00install.out’ for details.
    ```

# countyweather

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# cytominer

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
            <dbl>      <dbl>      <dbl>              <int>                 <int>
    1 -0.56047565 -1.0678237 -0.6947070                  1                     1
    2 -0.23017749 -0.2179749 -0.2079173                  2                     1
    3  1.55870831 -1.0260044 -1.2653964                  3                     1
    4  0.07050839 -0.7288912  2.1689560                  4                     1
    5  0.12928774 -0.6250393  1.2079620                  5                     1
    6  1.71506499 -1.6866933 -1.1231086                  6                     1
    # ... with 1 more variables: Metadata_batch <int>
    > 
    > # `replicate_correlation`` returns the median, min, and max 
    > # replicate correlation (across batches) per variable
    > replicate_correlation(sample = sample,
    +                       variables = c("x", "y", "z"),
    +                       strata = c("Metadata_treatment"),
    +                       replicates = 2,
    +                       split_by = "Metadata_batch",
    +                       replicate_by = "Metadata_replicate_id",
    +                       cores = 1) 
    Error in { : task 1 failed - "Argument 1 must have names"
    Calls: replicate_correlation -> %>% -> eval -> eval -> %dopar% -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                 correlation_matrix <- sample_split %>% dplyr::arrange_(.dots = strata) %>% 
                     dplyr::select_(.dots = c(strata, variable, replicate_by)) %>% tidyr::spread_(replicate_by, 
                     variable) %>% dplyr::select_(~-dplyr::one_of(setdiff(strata, replicate_by))) %>% 
                     stats::cor()
                 median(correlation_matrix[upper.tri(correlation_matrix)])
             }) %>% dplyr::mutate(variable = variable)
         }
      11: e$fun(obj, substitute(ex), parent.frame(), e$data)
      
      testthat results ================================================================
      OK: 22 SKIPPED: 0 FAILED: 1
      1. Error: `replicate_correlation` measures correlationbetween replicates in each feature (@test-replicate_correlation.R#57) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# d3r

Version: 0.7.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Failed with error:  'there is no package called 'V8''
      [31m2. Error: d3_v8 has d3 (@test_v8.R#9) [39m------------------------------------------
      The V8 package must be installed for this function.  Please install.packages('V8').
      1: expect_identical(d3_v8()$get("global.d3.version"), d3_dep_v4()$version) at testthat/test_v8.R:9
      2: identical(object, expected)
      3: d3_v8()
      4: stop("The V8 package must be installed for this function.  Please install.packages('V8').")
      
      testthat results ================================================================
      OK: 11 SKIPPED: 3 FAILED: 2
      1. Error: d3-jetpack on latest release (@test_deps.R#47) 
      2. Error: d3_v8 has d3 (@test_v8.R#9) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘igraph’ ‘partykit’ ‘treemap’ ‘V8’
    ```

# dbplyr

Version: 1.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# DChIPRep

Version: 1.6.2

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

# dexter

Version: 0.4.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 109 marked UTF-8 strings
    ```

# diceR

Version: 0.2.0

## In both

*   checking whether package ‘diceR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/diceR/new/diceR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘diceR’ ...
** package ‘diceR’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/new/Rcpp/include" -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘diceR’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/diceR/new/diceR.Rcheck/diceR’

```
### CRAN

```
* installing *source* package ‘diceR’ ...
** package ‘diceR’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/old/Rcpp/include" -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘diceR’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/diceR/old/diceR.Rcheck/diceR’

```
# dodgr

Version: 0.0.1

## Newly fixed

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(dodgr)
      > 
      > test_check("dodgr")
      [31m1. Failure: sample graph (@test-dodgr.R#24) [39m------------------------------------
      nrow(v) not equal to 100.
      1/1 mismatches
      [1] 101 - 100 == 1
      
      
      testthat results ================================================================
      OK: 9 SKIPPED: 0 FAILED: 1
      1. Failure: sample graph (@test-dodgr.R#24) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Loading dodgr
    Quitting from lines 119-131 (benchmark.Rmd) 
    Error: processing vignette 'benchmark.Rmd' failed with diagnostics:
    polygon edge not found
    Execution halted
    ```

# eechidna

Version: 1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        data   4.9Mb
        doc    1.2Mb
    ```

# epitable

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘magrittr’ ‘readr’
      All declared Imports should be used.
    ```

# esc

Version: 0.3.2

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘esc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: combine_esc
    > ### Title: Combine one or more 'esc' objects into a data frame
    > ### Aliases: combine_esc
    > 
    > ### ** Examples
    > 
    > e1 <- esc_2x2(grp1yes = 30, grp1no = 50, grp2yes = 40,
    +               grp2no = 45, study = "Study 1")
    > e2 <- esc_2x2(grp1yes = 30, grp1no = 50, grp2yes = 40, grp2no = 45,
    +               es.type = "or", study = "Study 2")
    > e3 <- esc_t(p = 0.03, grp1n = 100, grp2n = 150, study = "Study 3")
    > e4 <- esc_mean_sd(grp1m = 7, grp1sd = 2, grp1n = 50, grp2m = 9, grp2sd = 3,
    +                   grp2n = 60, es.type = "logit", study = "Study 4")
    > 
    > combine_esc(e1, e2, e3, e4)
    Error in bind_rows_(x, .id) : Argument 1 must have names
    Calls: combine_esc -> <Anonymous> -> <Anonymous> -> bind_rows_ -> .Call
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘metafor’
    ```

# evaluator

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggalt’ ‘pander’ ‘psych’
      All declared Imports should be used.
    Missing or unexported object: ‘purrr::by_row’
    ```

# EventStudy

Version: 0.34

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        doc   5.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘curl’ ‘openxlsx’ ‘stringr’
      All declared Imports should be used.
    ```

# exifr

Version: 0.2.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.2Mb
      sub-directories of 1Mb or more:
        exiftool  12.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# fbar

Version: 0.1.23

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘Rglpk’ ‘ROI.plugin.glpk’
    ```

# flextable

Version: 0.3.0

## In both

*   checking whether package ‘flextable’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘officer’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/flextable/new/flextable.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# ftDK

Version: 1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 39 marked UTF-8 strings
    ```

# GA4GHclient

Version: 1.0.0

## In both

*   R CMD check timed out
    

# geoparser

Version: 0.1.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m2. Error: no problems if no results (@test_query.R#26) [39m-------------------------
      HTTP failure: 401
      1: geoparser_q(text_input = "no placename here") at testthat/test_query.R:26
      2: lapply(text_input, total, key = key)
      3: FUN(X[[i]], ...)
      4: geoparser_check(temp)
      5: stop("HTTP failure: ", status, call. = FALSE)
      
      testthat results ================================================================
      OK: 3 SKIPPED: 0 FAILED: 2
      1. Error: query returns a list of data.frames (@test_query.R#4) 
      2. Error: no problems if no results (@test_query.R#26) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 34-37 (geoparser.Rmd) 
    Error: processing vignette 'geoparser.Rmd' failed with diagnostics:
    HTTP failure: 401
    Execution halted
    ```

# ggeffects

Version: 0.2.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggeffects-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: emm
    > ### Title: Get marginal effects for model response
    > ### Aliases: emm
    > 
    > ### ** Examples
    > 
    > data(efc)
    > fit <- lm(barthtot ~ c12hour + neg_c_7 + c161sex + c172code, data = efc)
    > emm(fit)
    Error in bind_rows_(x, .id) : Argument 1 must have names
    Calls: emm -> <Anonymous> -> <Anonymous> -> bind_rows_ -> .Call
    Execution halted
    ```

# gglogo

Version: 0.1.3

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    
    Attaching package: 'gglogo'
    
    The following object is masked from 'package:ggplot2':
    
        fortify
    
    Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y,  :
      no font could be found for family "Garamond"
    Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y,  :
      no font could be found for family "Garamond"
    Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y,  :
      no font could be found for family "Garamond"
    Quitting from lines 46-52 (gglogo-alphabet.Rmd) 
    Error: processing vignette 'gglogo-alphabet.Rmd' failed with diagnostics:
    replacement has 1 row, data has 0
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘knitr’
      All declared Imports should be used.
    ```

# ggmosaic

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘NHANES’ ‘gridExtra’
      All declared Imports should be used.
    ```

# ggpubr

Version: 0.1.5

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘FactoMineR’
    ```

# ggstance

Version: 0.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lazyeval’
      All declared Imports should be used.
    ```

# googleLanguageR

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: tryCatchList(expr, classes, parentenv, handlers)
      4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      5: value[[3L]](cond)
      6: stop(ex$message, call. = FALSE)
      
      testthat results ================================================================
      OK: 5 SKIPPED: 7 FAILED: 5
      1. Error: NLP returns expected fields (@test_unit.R#79) 
      2. Error: Speech recognise expected (@test_unit.R#115) 
      3. Error: Listing translations works (@test_unit.R#144) 
      4. Error: Translation detection works (@test_unit.R#159) 
      5. Error: Translation works (@test_unit.R#175) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# googlesheets

Version: 0.2.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(googlesheets)
      > 
      > if (identical(tolower(Sys.getenv("NOT_CRAN")), "true")) {
      +   test_check("googlesheets")
      + }
      Error: Cannot read token from alleged .rds file:
      googlesheets_token.rds
      testthat results ================================================================
      OK: 2 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 37-41 (basic-usage.Rmd) 
    Error: processing vignette 'basic-usage.Rmd' failed with diagnostics:
    Cannot read token from alleged .rds file:
    ../tests/testthat/googlesheets_token.rds
    Execution halted
    ```

# grattan

Version: 1.5.1.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘taxstats’
    ```

# gutenbergr

Version: 0.1.3

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 13617 marked UTF-8 strings
    ```

# highcharter

Version: 0.5.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.4Mb
      sub-directories of 1Mb or more:
        doc          13.7Mb
        htmlwidgets   1.8Mb
    ```

# HURDAT

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(HURDAT)
      > 
      > test_check("HURDAT")
      Error in bind_rows_(x, .id) : Argument 1 must have names
      Calls: test_check ... .f -> <Anonymous> -> <Anonymous> -> bind_rows_ -> .Call
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

# hurricaneexposure

Version: 0.0.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    ```

# imager

Version: 0.40.2

## In both

*   checking whether package ‘imager’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/imager/new/imager.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘spatstat’
    ```

## Installation

### Devel

```
* installing *source* package ‘imager’ ...
** package ‘imager’ successfully unpacked and MD5 sums checked
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking how to run the C preprocessor... gcc -E
checking for X... libraries /usr/X11/lib, headers /usr/X11/include
configure: Checking if FFTW3 library is available using pkg-config
checking for pkg-config... /usr/local/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for FFTW... no
FFTW library not found, please install fftw3 for better FFT support.
checking for TIFFOpen in -ltiff... yes
configure: creating ./config.status
config.status: creating src/Makevars
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -fopenmp  -I/usr/X11/include   -Dcimg_use_tiff -I../inst/include -DCIMG_COMPILING -Dcimg_use_rng -Dcimg_use_r -Dcimg_use_fftw3_singlethread -Dcimg_verbosity=1 -Dcimg_date='""' -Dcimg_time='""' -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘imager’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/imager/new/imager.Rcheck/imager’

```
### CRAN

```
* installing *source* package ‘imager’ ...
** package ‘imager’ successfully unpacked and MD5 sums checked
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking how to run the C preprocessor... gcc -E
checking for X... libraries /usr/X11/lib, headers /usr/X11/include
configure: Checking if FFTW3 library is available using pkg-config
checking for pkg-config... /usr/local/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for FFTW... no
FFTW library not found, please install fftw3 for better FFT support.
checking for TIFFOpen in -ltiff... yes
configure: creating ./config.status
config.status: creating src/Makevars
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -fopenmp  -I/usr/X11/include   -Dcimg_use_tiff -I../inst/include -DCIMG_COMPILING -Dcimg_use_rng -Dcimg_use_r -Dcimg_use_fftw3_singlethread -Dcimg_verbosity=1 -Dcimg_date='""' -Dcimg_time='""' -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘imager’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/imager/old/imager.Rcheck/imager’

```
# incgraph

Version: 1.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

# influxdbr

Version: 0.13.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 11
      1. Error: connection (@test_query.R#12) 
      2. Error: single query no chunking (@test_query.R#24) 
      3. Error: multiple query no chunking (@test_query.R#65) 
      4. Error: single query with chunking (@test_query.R#84) 
      5. Error: multiple query with chunking (@test_query.R#101) 
      6. Error: multiple query with chunking and xts result (@test_query.R#118) 
      7. Error: connection (@test_schema_exploration.R#12) 
      8. Error: show commands (@test_schema_exploration.R#25) 
      9. Error: connection (@test_write.R#12) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# jpmesh

Version: 0.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘readr’
      All declared Imports should be used.
    ```

# jpndistrict

Version: 0.2.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 188 marked UTF-8 strings
    ```

# kokudosuuchi

Version: 0.2.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 47 marked UTF-8 strings
    ```

# leaflet

Version: 1.1.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        htmlwidgets   4.3Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 12 marked UTF-8 strings
    ```

# leaflet.esri

Version: 0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘htmlwidgets’ ‘shiny’
      All declared Imports should be used.
    ```

# leaflet.extras

Version: 0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘shiny’
      All declared Imports should be used.
    ```

# metagenomeFeatures

Version: 1.8.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.7Mb
      sub-directories of 1Mb or more:
        extdata   6.7Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    .mgDb_annotateFeatures: no visible binding for global variable
      ‘db_keys’
    .select.taxa: no visible binding for global variable ‘Keys’
    .select.taxa: no visible binding for global variable ‘.’
    aggregate_taxa: no visible binding for global variable ‘.’
    aggregate_taxa: no visible binding for global variable ‘index’
    vignette_pheno_data: no visible global function definition for
      ‘read.csv’
    Undefined global functions or variables:
      . Keys db_keys index read.csv
    Consider adding
      importFrom("utils", "read.csv")
    to your NAMESPACE file.
    ```

# modelr

Version: 0.1.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘lme4’, ‘rstanarm’
    ```

# modeval

Version: 0.1.3

## In both

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

# nandb

Version: 0.2.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘autothresholdr’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# naniar

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘naniar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_label_shadow
    > ### Title: Add a column describing whether there is a shadow
    > ### Aliases: add_label_shadow
    > 
    > ### ** Examples
    > 
    > 
    > airquality %>%
    +   add_shadow(Ozone, Solar.R) %>%
    +   add_label_shadow()
    Error in bind_rows_(x, .id) : Argument 1 must have names
    Calls: %>% ... as_shadow.data.frame -> <Anonymous> -> <Anonymous> -> bind_rows_ -> .Call
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(naniar)
      > 
      > test_check("naniar")
      Error in bind_rows_(x, .id) : Argument 1 must have names
      Calls: test_check ... as_shadow.data.frame -> <Anonymous> -> <Anonymous> -> bind_rows_ -> .Call
      testthat results ================================================================
      OK: 10 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 61-64 (getting-started-w-naniar.Rmd) 
    Error: processing vignette 'getting-started-w-naniar.Rmd' failed with diagnostics:
    Argument 1 must have names
    Execution halted
    ```

# perccalc

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘devtools’ ‘ggplot2’ ‘haven’ ‘tidyverse’
      All declared Imports should be used.
    ```

# PKPDmisc

Version: 2.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# pointblank

Version: 0.1

## In both

*   checking whether package ‘pointblank’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/pointblank/new/pointblank.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘pointblank’ ...
** package ‘pointblank’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidyverse/purrr/revdep/library/pointblank/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidyverse/purrr/revdep/library/pointblank/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidyverse/purrr/revdep/library/pointblank/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘pointblank’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/pointblank/new/pointblank.Rcheck/pointblank’

```
### CRAN

```
* installing *source* package ‘pointblank’ ...
** package ‘pointblank’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidyverse/purrr/revdep/library/pointblank/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidyverse/purrr/revdep/library/pointblank/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidyverse/purrr/revdep/library/pointblank/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘pointblank’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/pointblank/old/pointblank.Rcheck/pointblank’

```
# proustr

Version: 0.2.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘proustr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pr_detect_pro
    > ### Title: Detect French pronoums
    > ### Aliases: pr_detect_pro
    > 
    > ### ** Examples
    > 
    > library(proustr)
    > a <- proust_books()[1,] 
    > pr_detect_pro(a, text, verbose = TRUE)
    # A tibble: 2 x 6
                                                                                  text
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("proustr")
      [31m1. Error: Pronouns are detected (@test-detect-pronouns.R#6) [39m--------------------
      Argument 1 must have names
      1: pr_detect_pro(a, text) at testthat/test-detect-pronouns.R:6
      2: purrr::map_df(df[, pos:length(df)], length_list)
      3: dplyr::bind_rows(!(!(!res)), .id = .id)
      4: bind_rows_(x, .id)
      
      testthat results ================================================================
      OK: 77 SKIPPED: 0 FAILED: 1
      1. Error: Pronouns are detected (@test-detect-pronouns.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 131-134 (gettingstarted.Rmd) 
    Error: processing vignette 'gettingstarted.Rmd' failed with diagnostics:
    Argument 1 must have names
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 20105 marked UTF-8 strings
    ```

# psycho

Version: 0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rtf’ ‘tidyverse’
      All declared Imports should be used.
    ```

# purrrlyr

Version: 0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lazyeval’
      All declared Imports should be used.
    ```

# qiitr

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 18 SKIPPED: 0 FAILED: 12
      1. Error: qiita_get_comments with comment id works (@test-qiita_get_comments.R#5) 
      2. Error: qiita_get_comments with item id works (@test-qiita_get_comments.R#12) 
      3. Error: qiita_get_items by tag ID (@test-qiita_get_items.R#6) 
      4. Error: qiita_get_items by item ID (@test-qiita_get_items.R#12) 
      5. Error: qiita_get_items by item ID (@test-qiita_get_items.R#19) 
      6. Error: qiita_get_tags with tag ID (@test-qiita_get_tags.R#5) 
      7. Error: qiita_get_tags with multiple tag IDs (@test-qiita_get_tags.R#12) 
      8. Error: qiita_get_tags with user ID (@test-qiita_get_tags.R#19) 
      9. Error: qiita_is_following_tag works. (@test-qiita_get_tags.R#25) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# quanteda

Version: 0.99.12

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1415 marked UTF-8 strings
    ```

# rcongresso

Version: 0.1.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      [31m3. Failure: Campos do dataframe (@test_proposicoes.R#43) [39m-----------------------
      sapply(pec_241, class) not equal to `tipos_pec241`.
      Lengths differ: 13 vs 12
      
      
      testthat results ================================================================
      OK: 52 SKIPPED: 0 FAILED: 3
      1. Failure: Dimensoes do dataframe (@test_proposicoes.R#33) 
      2. Failure: Atributos do dataframe (@test_proposicoes.R#38) 
      3. Failure: Campos do dataframe (@test_proposicoes.R#43) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# rdrop2

Version: 0.8.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6. Error: Able to retrieve metadata for file in multiple ways (@test-04-rdrop2-metadata.R#9) 
      7. Error: drop_dir lists files normally (@test-05-rdrop2-dir.R#8) 
      8. Error: drop_dir can detect changes in directory (@test-05-rdrop2-dir.R#46) 
      9. Error: drop_download works as expected (@test-06-rdrop2-download.R#9) 
      1. ...
      
      Error: testthat unit tests failed
      In addition: Warning messages:
      1: In UseMethod("duplicated") :
        closing unused connection 4 (/Users/hadley/Documents/tidyverse/purrr/revdep/checks/rdrop2/new/rdrop2.Rcheck/tests/testthat/rdrop2_package_test_f478b349-df50-4c56-819e-459102866979_rdrop2_package_test_drop.png)
      2: closing unused connection 6 (/Users/hadley/Documents/tidyverse/purrr/revdep/checks/rdrop2/new/rdrop2.Rcheck/tests/testthat/rdrop2_package_test_5fe0d978-1110-4303-9650-b0ad38db2712_drop_media) 
      3: closing unused connection 5 (/Users/hadley/Documents/tidyverse/purrr/revdep/checks/rdrop2/new/rdrop2.Rcheck/tests/testthat/rdrop2_package_test_f0474fa3-ca74-418f-afa1-1d807c46b799_drop_history_iris.csv) 
      4: closing unused connection 4 (/Users/hadley/Documents/tidyverse/purrr/revdep/checks/rdrop2/new/rdrop2.Rcheck/tests/testthat/rdrop2_package_test_e8e4c6ed-7f62-46b0-9aee-4333811c3a7e_share.csv) 
      5: closing unused connection 3 (/Users/hadley/Documents/tidyverse/purrr/revdep/checks/rdrop2/new/rdrop2.Rcheck/tests/testthat/rdrop2_package_test_bcf23f55-cd0a-410e-aec1-f57a4a8d45f8_delete.csv) 
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘digest’
      All declared Imports should be used.
    ```

# recipes

Version: 0.1.0

## In both

*   checking whether package ‘recipes’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/recipes/new/recipes.Rcheck/00install.out’ for details.
    ```

# repurrrsive

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 8 marked UTF-8 strings
    ```

# rmapzen

Version: 0.3.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: FUN(X[[i]], ...)
      4: vector_url(x = tile_coordinates$x, y = tile_coordinates$y, z = tile_coordinates$z, 
             layers = "all", format = "json")
      5: structure(list(scheme = "https", hostname = "tile.mapzen.com", path = vector_path(layers, 
             x, y, z, format), query = list(api_key = api_key)), class = "url")
      6: mz_key()
      7: stop("Set the MAPZEN_KEY environment variable")
      
      testthat results ================================================================
      OK: 199 SKIPPED: 0 FAILED: 2
      1. Error: single tiles can be pulled (@test-mz-vector-tiles.R#14) 
      2. Error: multiple contiguous tiles can be pulled (@test-mz-vector-tiles.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
    ```

# rmsfuns

Version: 0.0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Missing or unexported object: ‘base::shell.exec’
    ```

# rnoaa

Version: 0.7.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      testthat results ================================================================
      OK: 181 SKIPPED: 1 FAILED: 9
      1. Error: check_response returns an error (@test-check_response.r#7) 
      2. Error: check_response returns the correct error messages (@test-check_response.r#26) 
      3. Error: ncdc returns the correct ... (@test-ncdc.r#8) 
      4. Error: ncdc_datacats returns the correct ... (@test-ncdc_datacats.r#7) 
      5. Error: ncdc_datasets returns the correct class (@test-ncdc_datasets.r#7) 
      6. Error: ncdc_datatypes returns the correct class (@test-ncdc_datatypes.r#7) 
      7. Error: ncdc_locs returns the correct class (@test-ncdc_locs.r#7) 
      8. Error: ncdc_locs_cats returns the correct ... (@test-ncdc_locs_cats.r#7) 
      9. Error: ncdc_stations returns the correct... (@test-ncdc_stations.r#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# roadoi

Version: 0.4

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 73-79 (intro.Rmd) 
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    Evaluation error: Result 2 is not a length 1 atomic vector.
    Execution halted
    ```

# RSQLServer

Version: 0.3.0

## In both

*   checking whether package ‘RSQLServer’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/RSQLServer/new/RSQLServer.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘RSQLServer’ ...
** package ‘RSQLServer’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidyverse/purrr/revdep/library/RSQLServer/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidyverse/purrr/revdep/library/RSQLServer/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidyverse/purrr/revdep/library/RSQLServer/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘RSQLServer’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/RSQLServer/new/RSQLServer.Rcheck/RSQLServer’

```
### CRAN

```
* installing *source* package ‘RSQLServer’ ...
** package ‘RSQLServer’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidyverse/purrr/revdep/library/RSQLServer/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidyverse/purrr/revdep/library/RSQLServer/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidyverse/purrr/revdep/library/RSQLServer/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘RSQLServer’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/RSQLServer/old/RSQLServer.Rcheck/RSQLServer’

```
# RTCGA

Version: 1.6.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘RTCGA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: boxplotTCGA
    > ### Title: Create Boxplots for TCGA Datasets
    > ### Aliases: boxplotTCGA
    > 
    > ### ** Examples
    > 
    > library(RTCGA.rnaseq)
    Error in library(RTCGA.rnaseq) : 
      there is no package called ‘RTCGA.rnaseq’
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(RTCGA)
      Welcome to the RTCGA (version: 1.6.0).
      > library(RTCGA.rnaseq)
      Error in library(RTCGA.rnaseq) : 
        there is no package called 'RTCGA.rnaseq'
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘RTCGA.rnaseq’ ‘RTCGA.clinical’ ‘RTCGA.mutations’ ‘RTCGA.RPPA’
      ‘RTCGA.mRNA’ ‘RTCGA.miRNASeq’ ‘RTCGA.methylation’ ‘RTCGA.CNV’
      ‘RTCGA.PANCAN12’
    ```

*   checking R code for possible problems ... NOTE
    ```
    availableDates: no visible binding for global variable ‘.’
    downloadTCGA: no visible binding for global variable ‘.’
    ggbiplot: no visible binding for global variable ‘xvar’
    ggbiplot: no visible binding for global variable ‘yvar’
    ggbiplot: no visible global function definition for ‘muted’
    ggbiplot: no visible binding for global variable ‘varname’
    ggbiplot: no visible binding for global variable ‘angle’
    ggbiplot: no visible binding for global variable ‘hjust’
    read.mutations: no visible binding for global variable ‘.’
    read.rnaseq: no visible binding for global variable ‘.’
    survivalTCGA: no visible binding for global variable ‘times’
    whichDateToUse: no visible binding for global variable ‘.’
    Undefined global functions or variables:
      . angle hjust muted times varname xvar yvar
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘RTCGA.rnaseq’, ‘RTCGA.clinical’, ‘RTCGA.mutations’, ‘RTCGA.CNV’, ‘RTCGA.RPPA’, ‘RTCGA.mRNA’, ‘RTCGA.miRNASeq’, ‘RTCGA.methylation’
    ```

# scanstatistics

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gamlss.dist’
      All declared Imports should be used.
    ```

# SCORPIUS

Version: 1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘testthat’
      All declared Imports should be used.
    ```

# sergeant

Version: 0.5.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: httr::POST(sprintf("%s/query.json", drill_server), encode = "json", body = list(queryType = "SQL", 
             query = query))
      3: request_perform(req, hu$handle$handle)
      4: request_fetch(req$output, req$url, handle)
      5: request_fetch.write_memory(req$output, req$url, handle)
      6: curl::curl_fetch_memory(url, handle = handle)
      
      testthat results ================================================================
      OK: 1 SKIPPED: 0 FAILED: 3
      1. Error: Core dbplyr ops work (@test-sergeant.R#12) 
      2. Failure: REST API works (@test-sergeant.R#25) 
      3. Error: REST API works (@test-sergeant.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘sergeant’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/sergeant/new/sergeant.Rcheck/00install.out’ for details.
    ```

# shiny.semantic

Version: 0.1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        semantic   5.6Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# ShinyTester

Version: 0.1.0

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
    Error in bind_rows_(x, .id) : Argument 1 must have names
    Calls: ShinyDummyCheck ... <Anonymous> -> map_df -> <Anonymous> -> bind_rows_ -> .Call
    Execution halted
    ```

# simglm

Version: 0.6.0

## In both

*   checking whether package ‘simglm’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/simglm/new/simglm.Rcheck/00install.out’ for details.
    ```

# sjlabelled

Version: 1.0.4

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sjPlot’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘nlme’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘sjPlot’
    ```

# sjmisc

Version: 2.6.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    1        0
    2        0
    3        0
    4        0
    5        1
    6        2
    > row_count(dat, c1:c3, count = 2, append = TRUE)
    # A tibble: 6 x 5
         c1    c2    c3    c4 rowcount
      <dbl> <dbl> <dbl> <dbl>    <int>
    1     1     3     1     1        0
    2     2     2     1     1        2
    3     3     1     2     3        1
    4     1     2     1     2        1
    5     3    NA     3     1        0
    6    NA     3    NA     2        0
    > 
    > col_count(dat, count = 1)
    Error in bind_rows_(x, .id) : Argument 1 must have names
    Calls: col_count -> <Anonymous> -> <Anonymous> -> bind_rows_ -> .Call
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sjPlot’
    ```

# sjPlot

Version: 2.3.3

## In both

*   checking examples ... WARNING
    ```
    Found the following significant warnings:
    
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
    Deprecated functions may be defunct as soon as of the next release of
    R.
    See ?Deprecated.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggeffects’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘plm’
    ```

# sjstats

Version: 0.12.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘sjPlot’, ‘MuMIn’, ‘piecewiseSEM’
    ```

# sperrorest

Version: 2.1.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      Tue Oct 17 12:05:47 2017 Repetition 1 - Fold 1 
      Tue Oct 17 12:05:47 2017 Repetition 1 - Fold 2 
      Tue Oct 17 12:05:47 2017 Repetition 1 - Fold 3 
      Tue Oct 17 12:05:47 2017 Repetition 1 - Fold 4 
      Tue Oct 17 12:05:48 2017 Repetition 2 - Fold 1 
      Tue Oct 17 12:05:48 2017 Repetition 2 - Fold 2 
      Tue Oct 17 12:05:48 2017 Repetition 2 - Fold 3 
      Tue Oct 17 12:05:48 2017 Repetition 2 - Fold 4 
      testthat results ================================================================
      OK: 106 SKIPPED: 8 FAILED: 1
      1. Error: sperrorest() when missing factor levels in train data (@test-sperrorest.R#681) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# splashr

Version: 0.4.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
       /usr/bin/python
       /usr/local/bin/python
      
      1: install_splash() at testthat/test-splash.R:25
      2: docker::docker$from_env
      3: `$.python.builtin.module`(docker::docker, from_env)
      4: py_resolve_module_proxy(x)
      5: stop(message, call. = FALSE)
      
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 1
      1. Error: we can do something (@test-splash.R#25) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# starmie

Version: 0.1.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        doc       1.1Mb
        extdata   4.9Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘MCMCpack’
      All declared Imports should be used.
    ```

# survminer

Version: 0.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        doc   5.3Mb
    ```

# sweep

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘lazyeval’ ‘lubridate’ ‘tidyr’
      All declared Imports should be used.
    ```

# tatoo

Version: 1.0.8

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘crayon’ ‘utils’
      All declared Imports should be used.
    ```

# tibbletime

Version: 0.0.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      20: `_fseq`(`_lhs`)
      21: freduce(value, `_function_list`)
      22: function_list[[i]](value)
      23: fun(., ...)
      24: mutate.tbl_df(., ...)
      25: mutate_impl(.data, dots)
      
      testthat results ================================================================
      OK: 166 SKIPPED: 0 FAILED: 3
      1. Error: tmap_dfr returns a tibble (@test_tmap.R#46) 
      2. Error: tmap_df returns a tibble (@test_tmap.R#51) 
      3. Error: Groups are respected (@test_tmap.R#95) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyquant

Version: 0.5.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      testthat results ================================================================
      OK: 182 SKIPPED: 0 FAILED: 9
      1. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      2. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      3. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      4. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      5. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      6. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      7. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      8. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      9. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘tidyquant’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘quantmod’ was built under R version 3.4.2
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/tidyquant/new/tidyquant.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      error: unable to load shared object '/Users/hadley/Documents/tidyverse/purrr/revdep/library/tidyquant/rJava/libs/rJava.so':
      dlopen(/Users/hadley/Documents/tidyverse/purrr/revdep/library/tidyquant/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
      Referenced from: /Users/hadley/Documents/tidyverse/purrr/revdep/library/tidyquant/rJava/libs/rJava.so
      Reason: image not found
    
    Getting data...
    
    Getting holdings for DOW
    Warning in tq_index("DOW") :
      Error at DOW during download. 
    Error: .onLoad failed in loadNamespace() for 'rJava', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/Users/hadley/Documents/tidyverse/purrr/revdep/library/tidyquant/rJava/libs/rJava.so':
      dlopen(/Users/hadley/Documents/tidyverse/purrr/revdep/library/tidyquant/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
      Referenced from: /Users/hadley/Documents/tidyverse/purrr/revdep/library/tidyquant/rJava/libs/rJava.so
      Reason: image not found
    
    Quitting from lines 105-108 (TQ03-scaling-and-modeling-with-tidyquant.Rmd) 
    Error: processing vignette 'TQ03-scaling-and-modeling-with-tidyquant.Rmd' failed with diagnostics:
    subscript out of bounds
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘curl’ ‘devtools’ ‘rvest’ ‘timeSeries’ ‘tseries’ ‘zoo’
      All declared Imports should be used.
    ```

# tidyr

Version: 0.7.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 23 marked UTF-8 strings
    ```

# tidyRSS

Version: 1.2.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

# tidyverse

Version: 1.1.1

## In both

*   checking whether package ‘tidyverse’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/tidyverse/new/tidyverse.Rcheck/00install.out’ for details.
    ```

# timekit

Version: 0.3.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘forecast’
      All declared Imports should be used.
    ```

# timetk

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘forecast’
      All declared Imports should be used.
    ```

# TPP

Version: 3.4.3

## In both

*   R CMD check timed out
    

*   checking whether package ‘TPP’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/TPP/new/TPP.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.2Mb
      sub-directories of 1Mb or more:
        data           1.9Mb
        example_data   8.0Mb
        test_data      1.9Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘doParallel:::.options’ ‘mefa:::rep.data.frame’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘TPP/R/TPP.R’:
      .onLoad calls:
        packageStartupMessage(msgText, "\n")
    
    See section ‘Good practice’ in '?.onAttach'.
    
    plot_fSta_distribution: no visible binding for global variable
      ‘..density..’
    plot_pVal_distribution: no visible binding for global variable
      ‘..density..’
    Undefined global functions or variables:
      ..density..
    ```

# twilio

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m3. Error: tw_send_message() can send messages (@test_tw_send_message.R#11) [39m-----
      Please set environmental variable TWILIO_SID.
      1: tw_send_message("2127872000", "+15005550006", "Half a pound of whitefish salad please.") at testthat/test_tw_send_message.R:11
      2: paste("2010-04-01", "Accounts", get_sid(), "Messages.json", sep = "/")
      3: get_sid()
      4: stop("Please set environmental variable TWILIO_SID.", call. = FALSE)
      
      testthat results ================================================================
      OK: 4 SKIPPED: 0 FAILED: 3
      1. Error: tw_get_message_media() can retrieve a photo (@test_tw_get_message_media.R#6) 
      2. Error: Test that tw_get_messages_list() will retrieve messages (@test_tw_get_messages_list.R#6) 
      3. Error: tw_send_message() can send messages (@test_tw_send_message.R#11) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ukbtools

Version: 0.9.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 5 marked UTF-8 strings
    ```

# uptasticsearch

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1: devtools::check at testthat/test-repo_characteristics.R:38
      2: getExportedValue(pkg, name)
      3: asNamespace(ns)
      4: getNamespace(ns)
      5: tryCatch(loadNamespace(name), error = function(e) stop(e))
      6: tryCatchList(expr, classes, parentenv, handlers)
      7: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      8: value[[3L]](cond)
      
      testthat results ================================================================
      OK: 233 SKIPPED: 0 FAILED: 1
      1. Error: R CMD check should not return any unexpected errors, warnings, or notes (@test-repo_characteristics.R#38) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# valaddin

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# veccompare

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘pander’
      All declared Imports should be used.
    ```

# visdat

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘visdat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: vis_dat
    > ### Title: Visualises a data.frame to tell you what it contains.
    > ### Aliases: vis_dat
    > 
    > ### ** Examples
    > 
    > 
    > vis_dat(airquality)
    Error in bind_rows_(x, .id) : Argument 1 must have names
    Calls: vis_dat ... <Anonymous> -> <Anonymous> -> <Anonymous> -> bind_rows_ -> .Call
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(visdat)
      > 
      > test_check("visdat")
      Error in bind_rows_(x, .id) : Argument 1 must have names
      Calls: test_check ... <Anonymous> -> <Anonymous> -> <Anonymous> -> bind_rows_ -> .Call
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 58-61 (using_visdat.Rmd) 
    Error: processing vignette 'using_visdat.Rmd' failed with diagnostics:
    Argument 1 must have names
    Execution halted
    ```

# wand

Version: 0.2.0

## In both

*   checking whether package ‘wand’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/wand/new/wand.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘wand’ ...
** package ‘wand’ successfully unpacked and MD5 sums checked
Checking to see if libmagic is available...
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/include -L/usr/local/include -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/include -L/usr/local/include -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c wand.cpp -o wand.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o wand.so RcppExports.o wand.o -L/usr/local/lib -L/usr/lib -lmagic -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: library not found for -lmagic
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [wand.so] Error 1
ERROR: compilation failed for package ‘wand’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/wand/new/wand.Rcheck/wand’

```
### CRAN

```
* installing *source* package ‘wand’ ...
** package ‘wand’ successfully unpacked and MD5 sums checked
Checking to see if libmagic is available...
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/include -L/usr/local/include -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/include -L/usr/local/include -I"/Users/hadley/Documents/tidyverse/purrr/revdep/library/purrr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c wand.cpp -o wand.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o wand.so RcppExports.o wand.o -L/usr/local/lib -L/usr/lib -lmagic -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: library not found for -lmagic
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [wand.so] Error 1
ERROR: compilation failed for package ‘wand’
* removing ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/wand/old/wand.Rcheck/wand’

```
# widyr

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# zeligverse

Version: 0.1.1

## In both

*   checking whether package ‘zeligverse’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Zelig’ was built under R version 3.4.2
      Warning: package ‘Rcpp’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/zeligverse/new/zeligverse.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Amelia’ ‘MatchIt’ ‘WhatIf’
      All declared Imports should be used.
    ```

