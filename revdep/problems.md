# abjutils

Version: 0.2.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘httr’ ‘progress’
      All declared Imports should be used.
    ```

# alphavantager

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: stop(content, call. = F) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/alphavantager/new/alphavantager.Rcheck/00_pkg_src/alphavantager/R/av_get.R:103
      
      ── 3. Error: call Technical Indicators (@test_av_get.R#57)  ────────────────────
      Thank you for using Alpha Vantage! Our standard API call frequency is 5 calls per minute and 500 calls per day. Please visit https://www.alphavantage.co/premium/ if you would like to target a higher API call frequency.. API parameters used: symbol=MSFT, function=SMA, interval=monthly, time_period=60, series_type=close, apikey=HIDDEN_FOR_YOUR_SAFETY
      1: av_get(symbol, av_fun, interval = interval, time_period = time_period, series_type = series_type) at testthat/test_av_get.R:57
      2: stop(content, call. = F) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/alphavantager/new/alphavantager.Rcheck/00_pkg_src/alphavantager/R/av_get.R:103
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 5 SKIPPED: 0 FAILED: 3
      1. Error: call TIMES_SERIES_INTRADAY (@test_av_get.R#13) 
      2. Error: call SECTOR (@test_av_get.R#38) 
      3. Error: call Technical Indicators (@test_av_get.R#57) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘devtools’
      All declared Imports should be used.
    ```

# amt

Version: 0.0.5.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘magrittr’
      All declared Imports should be used.
    ```

# analysisPipelines

Version: 1.0.0

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘SparkR’ ‘reticulate’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘devtools’
      All declared Imports should be used.
    ```

# anomalize

Version: 0.1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        help   4.7Mb
    ```

# anomalyDetection

Version: 0.2.5

## In both

*   checking whether package ‘anomalyDetection’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/anomalyDetection/new/anomalyDetection.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘anomalyDetection’ ...
** package ‘anomalyDetection’ successfully unpacked and MD5 sums checked
** libs
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/anomalyDetection/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -mtune=core2 -O3 -c RcppExports.cpp -o RcppExports.o
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/anomalyDetection/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -mtune=core2 -O3 -c bottlenecks.cpp -o bottlenecks.o
clang: error: unsupported option '-fopenmp'clang: error: 
unsupported option '-fopenmp'
make: *** [bottlenecks.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/anomalyDetection/new/anomalyDetection.Rcheck/anomalyDetection’

```
### CRAN

```
* installing *source* package ‘anomalyDetection’ ...
** package ‘anomalyDetection’ successfully unpacked and MD5 sums checked
** libs
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/anomalyDetection/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -mtune=core2 -O3 -c RcppExports.cpp -o RcppExports.o
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/anomalyDetection/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -mtune=core2 -O3 -c bottlenecks.cpp -o bottlenecks.o
clang: error: unsupported option '-fopenmp'clang: error
: unsupported option '-fopenmp'
make: *** [bottlenecks.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/anomalyDetection/old/anomalyDetection.Rcheck/anomalyDetection’

```
# areal

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lwgeom’ ‘tibble’
      All declared Imports should be used.
    ```

# arena2r

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘purrr’ ‘shinyBS’ ‘shinydashboard’ ‘shinyjs’
      All declared Imports should be used.
    ```

# banR

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringr’
      All declared Imports should be used.
    ```

# bayesCT

Version: 0.99.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘msm’ ‘parallel’ ‘tidyr’
      All declared Imports should be used.
    ```

# BayesMallows

Version: 0.4.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'BayesMallowsPackage.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# bigQueryR

Version: 0.4.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘bigrquery’
    ```

# binneR

Version: 2.0.10

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘metaboData’
    ```

# blorr

Version: 0.2.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘lmtest’
    ```

# BradleyTerryScalable

Version: 0.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:igraph':
    
        as_data_frame, groups, union
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'BradleyTerryScalable.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# breathtestcore

Version: 0.4.6

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘breathteststan’
    ```

# breathteststan

Version: 0.4.7

## In both

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# broom.mixed

Version: 0.2.4

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘glmmADMB’
    ```

# bsplus

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# casino

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘crayon’ ‘dplyr’ ‘tidyr’
      All declared Imports should be used.
    ```

# CDECRetrieve

Version: 0.1.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lazyeval’ ‘purrr’ ‘roxygen2’
      All declared Imports should be used.
    ```

# cepR

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 287 marked UTF-8 strings
    ```

# childesr

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dbplyr’
      All declared Imports should be used.
    ```

# childsds

Version: 0.7.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gamlss.dist’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# chorrrds

Version: 0.1.8

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4004 marked UTF-8 strings
    ```

# cimir

Version: 0.1-0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘readr’
      All declared Imports should be used.
    ```

# circumplex

Version: 0.2.1

## In both

*   checking whether package ‘circumplex’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/circumplex/new/circumplex.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘circumplex’ ...
** package ‘circumplex’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c RcppExports.cpp -o RcppExports.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c circular.cpp -o circular.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c parameters.cpp -o parameters.o
clang: error: unsupported option '-fopenmp'clang: error: unsupported option '-fopenmp'clang: 
error: unsupported option '-fopenmp'

make: *** [parameters.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [circular.o] Error 1
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘circumplex’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/circumplex/new/circumplex.Rcheck/circumplex’

```
### CRAN

```
* installing *source* package ‘circumplex’ ...
** package ‘circumplex’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c RcppExports.cpp -o RcppExports.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c circular.cpp -o circular.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c parameters.cpp -o parameters.o
clang: error: unsupported option '-fopenmp'clang: error: clang: error: unsupported option '-fopenmp'
unsupported option '-fopenmp'

make: *** [parameters.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [circular.o] Error 1
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘circumplex’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/circumplex/old/circumplex.Rcheck/circumplex’

```
# civis

Version: 1.6.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        R      3.2Mb
        help   2.3Mb
    ```

# clustermq

Version: 0.8.6

## In both

*   R CMD check timed out
    

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘infuser’ ‘purrr’
      All declared Imports should be used.
    ```

# CNPBayes

Version: 1.12.0

## In both

*   checking whether package ‘CNPBayes’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘GenomeInfoDb’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'Convergence.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        R     2.0Mb
        doc   3.5Mb
    ```

# codebook

Version: 0.8.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘graphics’ ‘jsonlite’ ‘pander’ ‘rlang’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘mice’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 65 marked UTF-8 strings
    ```

# codemetar

Version: 0.1.6

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘memoise’
      All declared Imports should be used.
    ```

# colorednoise

Version: 1.0.4

## In both

*   checking whether package ‘colorednoise’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/colorednoise/new/colorednoise.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘colorednoise’ ...
** package ‘colorednoise’ successfully unpacked and MD5 sums checked
** libs
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -mtune=core2 -O3 -c RcppExports.cpp -o RcppExports.o
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -mtune=core2 -O3 -c noise.cpp -o noise.o
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -mtune=core2 -O3 -c simulation.cpp -o simulation.o
clang: error: unsupported option '-fopenmp'
clang: error: unsupported option '-fopenmp'
clang: error: unsupported option '-fopenmp'
make: *** [simulation.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [noise.o] Error 1
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘colorednoise’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/colorednoise/new/colorednoise.Rcheck/colorednoise’

```
### CRAN

```
* installing *source* package ‘colorednoise’ ...
** package ‘colorednoise’ successfully unpacked and MD5 sums checked
** libs
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -mtune=core2 -O3 -c RcppExports.cpp -o RcppExports.o
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -mtune=core2 -O3 -c noise.cpp -o noise.o
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/colorednoise/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -mtune=core2 -O3 -c simulation.cpp -o simulation.o
clang: error: clang: error: unsupported option '-fopenmp'unsupported option '-fopenmp'
clang
: error: unsupported option '-fopenmp'
make: *** [simulation.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [noise.o] Error 1
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘colorednoise’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/colorednoise/old/colorednoise.Rcheck/colorednoise’

```
# congressbr

Version: 0.2.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# corrr

Version: 0.3.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: vars_select_eval(.vars, quos)
      23: map_if(quos, !is_helper, eval_tidy, mask)
      24: map(.x[sel], .f, ...) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpDbr67p/R.INSTALLa65a67fc1a9b/purrr/R/map.R:147
      25: .f(.x[[i]], ...) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpDbr67p/R.INSTALLa65a67fc1a9b/purrr/R/map.R:137
      26: -rowname
      27: is_character(x)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 71 SKIPPED: 0 FAILED: 3
      1. Error: Diagonal sets correctly (@test-as_cordf.R#18) 
      2. Error: Converts values accurately (@test-as_matrix.R#11) 
      3. Error: Diagonal sets correctly (@test-correlate.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# countytimezones

Version: 1.0.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    
    Attaching package: 'lubridate'
    
    The following object is masked from 'package:base':
    
        date
    
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'countytimezones.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# countyweather

Version: 0.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    
    Attaching package: 'lubridate'
    
    The following object is masked from 'package:base':
    
        date
    
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'countyweather.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# CPAT

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rdpack’ ‘grDevices’
      All declared Imports should be used.
    ```

# crawl

Version: 2.2.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘gdistance’ ‘raster’
      All declared Imports should be used.
    ```

# CrossClustering

Version: 4.0.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘glue’
      All declared Imports should be used.
    ```

# crplyr

Version: 0.2.0

## In both

*   checking whether package ‘crplyr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘crunch’ was built under R version 3.5.2
      Warning: package ‘dplyr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/crplyr/new/crplyr.Rcheck/00install.out’ for details.
    ```

# crsra

Version: 0.2.3

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 500 marked UTF-8 strings
    ```

# customsteps

Version: 0.7.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rlang’ ‘tidyselect’
      All declared Imports should be used.
    ```

# d3r

Version: 0.8.5

## Newly fixed

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(d3r)
      > 
      > test_check("d3r")
      ── 1. Failure: d3_dep-* src href is a valid url (@test_deps.R#31)  ─────────────
      is_valid_url(file.path(jetpack_offline$src$href, jetpack$script)) isn't true.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 13 SKIPPED: 6 FAILED: 1
      1. Failure: d3_dep-* src href is a valid url (@test_deps.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘igraph’ ‘partykit’ ‘treemap’ ‘V8’
    ```

# dbparser

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘ggplot2’
      All declared Imports should be used.
    ```

# DChIPRep

Version: 1.12.0

## In both

*   checking whether package ‘DChIPRep’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DChIPRep/new/DChIPRep.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘DChIPRep’ ...
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘DChIPRep’ is not available and has been replaced
by .GlobalEnv when processing object ‘testData’
Warning: namespace ‘DChIPRep’ is not available and has been replaced
by .GlobalEnv when processing object ‘testData’
** exec
** inst
** byte-compile and prepare package for lazy loading
Warning: package ‘DESeq2’ was built under R version 3.5.2
Warning: package ‘GenomeInfoDb’ was built under R version 3.5.2
Warning: package ‘BiocParallel’ was built under R version 3.5.2
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘GO.db’
ERROR: lazy loading failed for package ‘DChIPRep’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DChIPRep/new/DChIPRep.Rcheck/DChIPRep’

```
### CRAN

```
* installing *source* package ‘DChIPRep’ ...
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘DChIPRep’ is not available and has been replaced
by .GlobalEnv when processing object ‘testData’
Warning: namespace ‘DChIPRep’ is not available and has been replaced
by .GlobalEnv when processing object ‘testData’
** exec
** inst
** byte-compile and prepare package for lazy loading
Warning: package ‘DESeq2’ was built under R version 3.5.2
Warning: package ‘GenomeInfoDb’ was built under R version 3.5.2
Warning: package ‘BiocParallel’ was built under R version 3.5.2
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘GO.db’
ERROR: lazy loading failed for package ‘DChIPRep’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DChIPRep/old/DChIPRep.Rcheck/DChIPRep’

```
# DEP

Version: 1.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        R      1.2Mb
        data   1.4Mb
        doc    3.1Mb
    ```

# desctable

Version: 0.1.4

## In both

*   checking for code/documentation mismatches ... WARNING
    ```
    Codoc mismatches from documentation object 'group_by':
    group_by
      Code: function(.data, ..., add = FALSE, .drop = FALSE)
      Docs: function(.data, ..., add = FALSE)
      Argument names in code not in docs:
        .drop
    ```

# detrendr

Version: 0.6.0

## In both

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# DiagrammeR

Version: 1.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        R             3.0Mb
        htmlwidgets   3.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# DLMtool

Version: 5.2.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.5Mb
      sub-directories of 1Mb or more:
        R      6.1Mb
        data   2.1Mb
    ```

# dlookr

Version: 0.3.8

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        doc   4.1Mb
    ```

# dodgr

Version: 0.1.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    1 of 1 page converted in 0.420787 seconds
    
    Attaching package: 'magrittr'
    
    The following objects are masked from 'package:testthat':
    
        equals, is_less_than, not
    
    processing of PostScript specials is disabled (Ghostscript not found)
    pre-processing DVI file (format 2)
    processing page 1
      WARNING: 658 PostScript specials ignored. The resulting SVG might look wrong.
      page size: 29.6887pt x 17.2154pt (10.4344mm x 6.05054mm)
      page written to fig3-1.svg
    1 of 1 page converted in 0.663143 seconds
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'dodgr.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# dotwhisker

Version: 0.5.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Warning in native_encode(res, to = encoding) :
      some characters may not work under the current locale
    Warning in readLines(con, warn = FALSE) :
      invalid input found on input connection 'dotwhisker-vignette.knit.md'
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'dotwhisker-vignette.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# dplyr

Version: 0.8.0.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        R      2.1Mb
        libs   2.4Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘vctrs’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# DuoClustering2018

Version: 1.0.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'combine_data_clustering.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DuoClustering2018/new/DuoClustering2018.Rcheck/00_pkg_src/DuoClustering2018/R/plot_timing.R:98-112)
    plot_timing: no visible binding for global variable ‘norm.time’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DuoClustering2018/new/DuoClustering2018.Rcheck/00_pkg_src/DuoClustering2018/R/plot_timing.R:98-112)
    plot_timing: no visible binding for global variable ‘dataset’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DuoClustering2018/new/DuoClustering2018.Rcheck/00_pkg_src/DuoClustering2018/R/plot_timing.R:115-128)
    plot_timing: no visible binding for global variable ‘filtering’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DuoClustering2018/new/DuoClustering2018.Rcheck/00_pkg_src/DuoClustering2018/R/plot_timing.R:115-128)
    plot_timing: no visible binding for global variable ‘method’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DuoClustering2018/new/DuoClustering2018.Rcheck/00_pkg_src/DuoClustering2018/R/plot_timing.R:115-128)
    plot_timing: no visible binding for global variable ‘k’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DuoClustering2018/new/DuoClustering2018.Rcheck/00_pkg_src/DuoClustering2018/R/plot_timing.R:115-128)
    plot_timing: no visible binding for global variable ‘elapsed’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DuoClustering2018/new/DuoClustering2018.Rcheck/00_pkg_src/DuoClustering2018/R/plot_timing.R:115-128)
    plot_timing: no visible binding for global variable ‘medianelapsed’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DuoClustering2018/new/DuoClustering2018.Rcheck/00_pkg_src/DuoClustering2018/R/plot_timing.R:115-128)
    Undefined global functions or variables:
      ARI ari.stab cell cluster data.wide dataset ds ds.norm elapsed
      entropy est_k estnclust filtering k k_diff med.t medARI
      median.elapsed median.stability medianARI medianelapsed method
      norm.time run s s.norm s.true s.true.norm sce stability trueclass
      truenclust
    ```

# echor

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lubridate’
      All declared Imports should be used.
    ```

# eechidna

Version: 1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        data   5.1Mb
        doc    1.2Mb
    ```

# eesim

Version: 0.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
        intersect, setdiff, setequal, union
    
    
    Attaching package: 'gridExtra'
    
    The following object is masked from 'package:dplyr':
    
        combine
    
    This is dlnm 2.3.8. For details: help(dlnm) and vignette('dlnmOverview').
    This function may take a minute or two to run, especially if you
    are creating lots of replications (`n_reps`).
    This function may take a minute or two to run, especially if you
    are creating lots of replications (`n_reps`).
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'eesim.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# egor

Version: 0.19.1

## In both

*   checking whether package ‘egor’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
      Warning: package ‘tibble’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/egor/new/egor.Rcheck/00install.out’ for details.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘haven’
    ```

# embed

Version: 0.0.2

## In both

*   checking whether package ‘embed’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/embed/new/embed.Rcheck/00install.out’ for details.
    ```

# emuR

Version: 1.1.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'emuR'
    
    The following object is masked from 'package:base':
    
        norm
    
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'EQL.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        R         3.0Mb
        doc       1.2Mb
        extdata   1.5Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘git2r’ ‘servr’
      All declared Imports should be used.
    ```

# enrichplot

Version: 1.2.0

## In both

*   checking whether package ‘enrichplot’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/enrichplot/new/enrichplot.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘org.Hs.eg.db’
    ```

## Installation

### Devel

```
* installing *source* package ‘enrichplot’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘GO.db’
ERROR: lazy loading failed for package ‘enrichplot’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/enrichplot/new/enrichplot.Rcheck/enrichplot’

```
### CRAN

```
* installing *source* package ‘enrichplot’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘GO.db’
ERROR: lazy loading failed for package ‘enrichplot’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/enrichplot/old/enrichplot.Rcheck/enrichplot’

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

# ergm

Version: 3.9.4

## In both

*   R CMD check timed out
    

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘Rmpi’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        R     4.0Mb
        doc   1.7Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘tergm’, ‘ergm.count’, ‘networkDynamic’
    ```

# esc

Version: 0.4.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘metafor’
    ```

# EventStudy

Version: 0.34

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.2Mb
      sub-directories of 1Mb or more:
        doc   5.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘curl’ ‘openxlsx’ ‘stringr’
      All declared Imports should be used.
    ```

# eyetrackingR

Version: 0.1.8

## In both

*   checking whether package ‘eyetrackingR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/eyetrackingR/new/eyetrackingR.Rcheck/00install.out’ for details.
    ```

# ezpickr

Version: 1.0.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘BrailleR’
    ```

# fedregs

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rvest’ ‘stringi’
      All declared Imports should be used.
    ```

# filesstrings

Version: 3.0.0

## In both

*   checking whether package ‘filesstrings’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘stringr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/filesstrings/new/filesstrings.Rcheck/00install.out’ for details.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘dplyr’
    ```

# finalfit

Version: 0.9.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘readr’
      All declared Imports should be used.
    ```

# fingertipscharts

Version: 0.0.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘curl’ ‘mapproj’
      All declared Imports should be used.
    ```

# fingertipsR

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# forecastHybrid

Version: 4.2.17

## In both

*   checking whether package ‘forecastHybrid’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/forecastHybrid/new/forecastHybrid.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘forecastHybrid’ ...
** package ‘forecastHybrid’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: package ‘forecast’ was built under R version 3.5.2
Error in loadNamespace(name) : there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘forecastHybrid’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/forecastHybrid/new/forecastHybrid.Rcheck/forecastHybrid’

```
### CRAN

```
* installing *source* package ‘forecastHybrid’ ...
** package ‘forecastHybrid’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: package ‘forecast’ was built under R version 3.5.2
Error in loadNamespace(name) : there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘forecastHybrid’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/forecastHybrid/old/forecastHybrid.Rcheck/forecastHybrid’

```
# fpp2

Version: 2.3

## In both

*   checking whether package ‘fpp2’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/fpp2/new/fpp2.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘fpp2’ ...
** package ‘fpp2’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Warning: package ‘forecast’ was built under R version 3.5.2
Error in loadNamespace(name) : there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘fpp2’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/fpp2/new/fpp2.Rcheck/fpp2’

```
### CRAN

```
* installing *source* package ‘fpp2’ ...
** package ‘fpp2’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Warning: package ‘forecast’ was built under R version 3.5.2
Error in loadNamespace(name) : there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘fpp2’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/fpp2/old/fpp2.Rcheck/fpp2’

```
# fredr

Version: 1.0.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# frite

Version: 0.1.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘frite-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: is.output.same
    > ### Title: Checks if functions will produce identical output
    > ### Aliases: is.output.same
    > 
    > ### ** Examples
    > 
    > 
    > is.output.same(purrr::map(1:3, cumsum), lapply) # TRUE
    Error in parent.frame(.n) : invalid 'n' value
    Calls: is.output.same ... detect_index -> .f -> .fn -> _fn -> %in% -> ls -> parent.frame
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      7: reduce_impl(.x, .f, ..., .init = .init, .dir = .dir) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpDbr67p/R.INSTALLa65a67fc1a9b/purrr/R/reduce.R:125
      8: fn(out, elt, ...) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpDbr67p/R.INSTALLa65a67fc1a9b/purrr/R/reduce.R:160
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 12 SKIPPED: 0 FAILED: 7
      1. Error: is.output.same returns logical (@test-is-output-same.R#4) 
      2. Error: is.output.same returns false for outputs of different class (@test-is-output-same.R#8) 
      3. Error: is.output.same throws warning when piped (@test-is-output-same.R#12) 
      4. Error: find_call_piped return has type 'language' (@test_find_call_piped.R#4) 
      5. Error: find_call_piped gives warning when piped (@test_find_call_piped.R#9) 
      6. Error: tictocify functions work when duped args are given (@test_tictocify.R#15) 
      7. Error: tictocify produces equal output to original (@test_tictocify.R#20) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 50-57 (getting-started.Rmd) 
    Error: processing vignette 'getting-started.Rmd' failed with diagnostics:
    invalid 'type' (character) of argument
    Execution halted
    ```

# ftDK

Version: 1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 39 marked UTF-8 strings
    ```

# furrr

Version: 0.1.0

## In both

*   checking whether package ‘furrr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘future’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/furrr/new/furrr.Rcheck/00install.out’ for details.
    ```

# GA4GHshiny

Version: 1.4.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: stop(txt, domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 2 SKIPPED: 0 FAILED: 8
      1. Error: app works (@test-app.R#5) 
      2. Error: getGene works (@test-getGene.R#4) 
      3. Error: getGeneSymbols works (@test-getGeneSymbols.R#4) 
      4. Error: initializeReferences works (@test-initializeReferences.R#6) 
      5. Error: initializeVariantSet works (@test-initializeVariantSet.R#6) 
      6. Error: (unknown) (@test-searchVariantsByGeneSymbol.R#3) 
      7. Error: tidyVariants works with searchVariants output (@test-tidyVariants.R#6) 
      8. Error: tidyVariants works with searchVariantsByGeneSymbol output (@test-tidyVariants.R#16) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'GA4GHshiny.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘org.Hs.eg.db’ ‘TxDb.Hsapiens.UCSC.hg19.knownGene’
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

# ganalytics

Version: 0.10.6

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        R   5.0Mb
    ```

# ggdag

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggforce’ ‘plyr’
      All declared Imports should be used.
    ```

# ggedit

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# ggeffects

Version: 0.8.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘ordinal’
    ```

# ggformula

Version: 0.9.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        R     3.1Mb
        doc   2.7Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘quantreg’
    ```

# ggiraphExtra

Version: 0.2.9

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggforce’ ‘webshot’ ‘ztable’
      All declared Imports should be used.
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

# ggmap

Version: 3.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   4.4Mb
    ```

# ggpubr

Version: 0.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘FactoMineR’
    ```

# ggraptR

Version: 1.1

## In both

*   checking whether package ‘ggraptR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/ggraptR/new/ggraptR.Rcheck/00install.out’ for details.
    ```

# ggstatsplot

Version: 0.0.9

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        R      2.0Mb
        help   4.1Mb
    ```

# ggthemes

Version: 4.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 138 marked UTF-8 strings
    ```

# ggtree

Version: 1.14.6

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'ggtree.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 11.0Mb
      sub-directories of 1Mb or more:
        R          2.1Mb
        doc        4.9Mb
        examples   3.7Mb
    ```

# googlesheets

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# graphTweets

Version: 0.5.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# gravity

Version: 0.9.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'gravity'
    
    The following object is masked from 'package:stats':
    
        nls
    
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'crash-course-on-gravity-models.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# gutenbergr

Version: 0.1.4

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 13617 marked UTF-8 strings
    ```

# highcharter

Version: 0.7.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.2Mb
      sub-directories of 1Mb or more:
        doc           3.7Mb
        htmlwidgets   4.0Mb
    ```

# hpiR

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘knitr’
      All declared Imports should be used.
    ```

# hurricaneexposure

Version: 0.0.1

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘hurricaneexposure-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: default_map
    > ### Title: Create a default map with eastern US states
    > ### Aliases: default_map
    > 
    > ### ** Examples
    > 
    > default_map()
    Error in loadNamespace(name) : there is no package called ‘mapproj’
    Calls: <Anonymous> ... mapply -> <Anonymous> -> <Anonymous> -> f -> mproject
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    ```

# ICD10gm

Version: 1.0.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.9Mb
      sub-directories of 1Mb or more:
        data   7.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 252748 marked UTF-8 strings
    ```

# imager

Version: 0.41.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -Dcimg_r_mode -fpermissive -I/usr/X11R6/include -I/opt/X11/include  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/imager/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/checks.noindex/imager/new/imager.Rcheck/imager/include" -I"/private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpB1g0Ii/sourceCpp-x86_64-apple-darwin15.6.0-1.0.0" -I/usr/local/include   -fPIC  -mtune=core2 -O3 -c file9c7f5906789d.cpp -o file9c7f5906789d.o
      clang++ -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o sourceCpp_2.so file9c7f5906789d.o -lX11 -L/usr/X11R6/lib -L/opt/X11/include -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
      ── 1. Error: cpp_plugin (@test_cpp_api.R#14)  ──────────────────────────────────
      Error 1 occurred building shared library.
      1: cppFunction(foo.inline, depends = "imager") at testthat/test_cpp_api.R:14
      2: sourceCpp(code = code, env = env, rebuild = rebuild, cacheDir = cacheDir, showOutput = showOutput, 
             verbose = verbose)
      3: stop("Error ", status, " occurred building shared library.")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 17 SKIPPED: 0 FAILED: 1
      1. Error: cpp_plugin (@test_cpp_api.R#14) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 15.0Mb
      sub-directories of 1Mb or more:
        data      1.4Mb
        doc       5.3Mb
        include   2.8Mb
        libs      3.2Mb
    ```

# incgraph

Version: 1.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

# INDperform

Version: 0.2.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        R      1.1Mb
        data   4.0Mb
        help   1.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lazyeval’
      All declared Imports should be used.
    ```

# interplot

Version: 0.2.1

## In both

*   checking whether package ‘interplot’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘lme4’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/interplot/new/interplot.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Loading required package: ggplot2
    Loading required package: abind
    Loading required package: arm
    Loading required package: MASS
    Loading required package: Matrix
    Loading required package: lme4
    
    arm (Version 1.10-1, built: 2018-4-12)
    
    Working directory is /Users/lionel/Desktop/lowliner/revdep/checks.noindex/interplot/new/interplot.Rcheck/vign_test/interplot/vignettes
    
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'interplot-vignette.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gridExtra’
      All declared Imports should be used.
    ```

# iotables

Version: 0.4.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 53206 marked UTF-8 strings
    ```

# ipeadatar

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘curl’
      All declared Imports should be used.
    ```

# ipumsr

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# irteQ

Version: 1.0.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘rpf’, ‘plink’
    ```

# jpmesh

Version: 1.1.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 176 marked UTF-8 strings
    ```

# jpndistrict

Version: 0.3.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 502 marked UTF-8 strings
    ```

# kokudosuuchi

Version: 0.4.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 52458 marked UTF-8 strings
    ```

# LipidMS

Version: 1.0.0

## In both

*   checking whether package ‘LipidMS’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘CAMERA’ was built under R version 3.5.2
      Warning: package ‘xcms’ was built under R version 3.5.2
      Warning: package ‘BiocParallel’ was built under R version 3.5.2
      Warning: package ‘MSnbase’ was built under R version 3.5.2
      Warning: package ‘mzR’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/LipidMS/new/LipidMS.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.5Mb
      sub-directories of 1Mb or more:
        R      2.0Mb
        data   5.9Mb
    ```

# listarrays

Version: 0.1.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘keras’
    ```

# matsindf

Version: 0.3.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'matsindf.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# memery

Version: 0.5.0

## In both

*   checking whether package ‘memery’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘showtext’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/memery/new/memery.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘colourpicker’ ‘shinyBS’ ‘shinycssloaders’
      All declared Imports should be used.
    ```

# metagene

Version: 2.14.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘EnsDb.Hsapiens.v86’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# metagenomeFeatures

Version: 2.2.1

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘metagenomeFeatures-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: MgDb-class
    > ### Title: Metagenome Database class
    > ### Aliases: MgDb-class mgdb
    > 
    > ### ** Examples
    > 
    > # example MgDb-class object, Greengenes 13.8 85% OTUs database.
    > gg85 <- get_gg13.8_85MgDb()
    Error in validObject(.Object) : 
      invalid class “MgDb” object: 1: invalid object for slot "taxa" in class "MgDb": got class "tbl_SQLiteConnection", should be or extend class "tbl_dbi"
    invalid class “MgDb” object: 2: invalid object for slot "taxa" in class "MgDb": got class "tbl_dbi", should be or extend class "tbl_dbi"
    invalid class “MgDb” object: 3: invalid object for slot "taxa" in class "MgDb": got class "tbl_sql", should be or extend class "tbl_dbi"
    invalid class “MgDb” object: 4: invalid object for slot "taxa" in class "MgDb": got class "tbl_lazy", should be or extend class "tbl_dbi"
    invalid class “MgDb” object: 5: invalid object for slot "taxa" in class "MgDb": got class "tbl", should be or extend class "tbl_dbi"
    Calls: get_gg13.8_85MgDb ... newMgDb -> new -> initialize -> initialize -> validObject
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
          intersect, setdiff, setequal, union
      
      Error in validObject(.Object) : 
        invalid class "MgDb" object: 1: invalid object for slot "taxa" in class "MgDb": got class "tbl_SQLiteConnection", should be or extend class "tbl_dbi"
      invalid class "MgDb" object: 2: invalid object for slot "taxa" in class "MgDb": got class "tbl_dbi", should be or extend class "tbl_dbi"
      invalid class "MgDb" object: 3: invalid object for slot "taxa" in class "MgDb": got class "tbl_sql", should be or extend class "tbl_dbi"
      invalid class "MgDb" object: 4: invalid object for slot "taxa" in class "MgDb": got class "tbl_lazy", should be or extend class "tbl_dbi"
      invalid class "MgDb" object: 5: invalid object for slot "taxa" in class "MgDb": got class "tbl", should be or extend class "tbl_dbi"
      Calls: test_check ... newMgDb -> new -> initialize -> initialize -> validObject
      In addition: Warning messages:
      1: replacing previous import 'lazyeval::is_formula' by 'purrr::is_formula' when loading 'metagenomeFeatures' 
      2: replacing previous import 'lazyeval::is_atomic' by 'purrr::is_atomic' when loading 'metagenomeFeatures' 
      3: package 'dplyr' was built under R version 3.5.2 
      Execution halted
    ```

*   checking whether package ‘metagenomeFeatures’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: subclass "QualityScaledDNAStringSet" of class "DNAStringSet" is not local and cannot be updated for new inheritance information; consider setClassUnion()
      Warning: replacing previous import ‘lazyeval::is_formula’ by ‘purrr::is_formula’ when loading ‘metagenomeFeatures’
      Warning: replacing previous import ‘lazyeval::is_atomic’ by ‘purrr::is_atomic’ when loading ‘metagenomeFeatures’
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/metagenomeFeatures/new/metagenomeFeatures.Rcheck/00install.out’ for details.
    ```

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented S4 methods:
      generic '[' and siglist 'mgFeatures'
    All user-level objects in a package (including S4 classes and
    methods) should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 16-19 (Exploring_a_MgDb.Rmd) 
    Error: processing vignette 'Exploring_a_MgDb.Rmd' failed with diagnostics:
    invalid class "MgDb" object: 1: invalid object for slot "taxa" in class "MgDb": got class "tbl_SQLiteConnection", should be or extend class "tbl_dbi"
    invalid class "MgDb" object: 2: invalid object for slot "taxa" in class "MgDb": got class "tbl_dbi", should be or extend class "tbl_dbi"
    invalid class "MgDb" object: 3: invalid object for slot "taxa" in class "MgDb": got class "tbl_sql", should be or extend class "tbl_dbi"
    invalid class "MgDb" object: 4: invalid object for slot "taxa" in class "MgDb": got class "tbl_lazy", should be or extend class "tbl_dbi"
    invalid class "MgDb" object: 5: invalid object for slot "taxa" in class "MgDb": got class "tbl", should be or extend class "tbl_dbi"
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        extdata   3.5Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    .select: no visible binding for global variable ‘identifier’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/metagenomeFeatures/new/metagenomeFeatures.Rcheck/00_pkg_src/metagenomeFeatures/R/mgDb_method_select.R:96-97)
    .select.taxa: no visible binding for global variable ‘Keys’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/metagenomeFeatures/new/metagenomeFeatures.Rcheck/00_pkg_src/metagenomeFeatures/R/mgDb_method_select.R:21)
    .select.taxa: no visible binding for global variable ‘.’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/metagenomeFeatures/new/metagenomeFeatures.Rcheck/00_pkg_src/metagenomeFeatures/R/mgDb_method_select.R:21)
    get_gg13.8_85MgDb: no visible binding for global variable ‘metadata’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/metagenomeFeatures/new/metagenomeFeatures.Rcheck/00_pkg_src/metagenomeFeatures/R/gg13.8_85MgDb.R:23-25)
    Undefined global functions or variables:
      . Keys identifier metadata
    ```

# MetamapsDB

Version: 0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Matrix’ ‘shiny’
      All declared Imports should be used.
    ```

# mlbgameday

Version: 0.1.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘doParallel’ ‘iterators’ ‘parallel’
      All declared Imports should be used.
    ```

# mleap

Version: 0.1.3

## In both

*   checking whether the package can be loaded ... ERROR
    ```
    Loading this package had a fatal error status code 1
    Loading log:
    Unable to find any JVMs matching version "(null)".
    No Java runtime present, try --request to install.
    Error: package or namespace load failed for ‘mleap’:
     .onLoad failed in loadNamespace() for 'mleap', details:
      call: NULL
      error: .onLoad failed in loadNamespace() for 'rJava', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/Users/lionel/Desktop/lowliner/revdep/library.noindex/mleap/rJava/libs/rJava.so':
      dlopen(/Users/lionel/Desktop/lowliner/revdep/library.noindex/mleap/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
      Referenced from: /Users/lionel/Desktop/lowliner/revdep/library.noindex/mleap/rJava/libs/rJava.so
      Reason: image not found
    In addition: Warning message:
    In system("/usr/libexec/java_home", intern = TRUE) :
      running command '/usr/libexec/java_home' had status 1
    Execution halted
    ```

# mlflow

Version: 0.8.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘aws.s3’
      All declared Imports should be used.
    ```

# mlr

Version: 2.13

## In both

*   checking whether package ‘mlr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘ParamHelpers’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/mlr/new/mlr.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘RWeka’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.5Mb
      sub-directories of 1Mb or more:
        R      5.1Mb
        data   2.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unable to find any JVMs matching version "(null)".
    No Java runtime present, try --request to install.
    Unable to find any JVMs matching version "(null)".
    No Java runtime present, try --request to install.
    ```

# modelgrid

Version: 1.1.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggplot2’ ‘lattice’
      All declared Imports should be used.
    ```

# modelr

Version: 0.1.4

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘lme4’, ‘rstanarm’
    ```

# monkeylearn

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ratelimitr’
      All declared Imports should be used.
    ```

# moonBook

Version: 0.2.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# MPTmultiverse

Version: 0.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: getExportedValue(pkg, name)
      4: asNamespace(ns)
      5: getNamespace(ns)
      6: tryCatch(loadNamespace(name), error = function(e) stop(e))
      7: tryCatchList(expr, classes, parentenv, handlers)
      8: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      9: value[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 3 FAILED: 2
      1. Error: No-pooling approaches work (@test-mptinr.R#23) 
      2. Error: Complete-pooling approaches work (@test-mptinr.R#164) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 57-80 (introduction-bayen_kuhlmann_2011.rmd) 
    Error: processing vignette 'introduction-bayen_kuhlmann_2011.rmd' failed with diagnostics:
    .onLoad failed in loadNamespace() for 'rjags', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/Users/lionel/Desktop/lowliner/revdep/library.noindex/MPTmultiverse/rjags/libs/rjags.so':
      dlopen(/Users/lionel/Desktop/lowliner/revdep/library.noindex/MPTmultiverse/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
      Referenced from: /Users/lionel/Desktop/lowliner/revdep/library.noindex/MPTmultiverse/rjags/libs/rjags.so
      Reason: image not found
    Execution halted
    ```

# multicolor

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘cowsay’
      All declared Imports should be used.
    ```

# nandb

Version: 2.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘stats’
      All declared Imports should be used.
    ```

# ncappc

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘bookdown’
      All declared Imports should be used.
    ```

# neo4r

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘igraph’ ‘rlang’ ‘tidyselect’
      All declared Imports should be used.
    ```

# nonet

Version: 0.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘e1071’ ‘pROC’ ‘purrr’ ‘randomForest’ ‘rlang’
      All declared Imports should be used.
    ```

# nullabor

Version: 0.3.5

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘forecast’ ‘rlang’ ‘tidyverse’ ‘tsibble’
      All declared Imports should be used.
    ```

# oec

Version: 2.7.8

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘readr’
      All declared Imports should be used.
    ```

# openair

Version: 2.6-1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        R   4.0Mb
    ```

# opensensmapr

Version: 0.5.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             test_error <<- e
         }, "object 'boxes' not found", quote(eval(code, test_env))) at testthat/test_phenomena.R:30
      2: eval(code, test_env)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 10 SKIPPED: 35 FAILED: 6
      1. Error: osem_box_to_archive_name works for one box (@test_archive.R#23) 
      2. Error: osem_box_to_archive_name works for multiple boxes (@test_archive.R#29) 
      3. Error: osem_measurements_archive works for one box (@test_archive.R#41) 
      4. Error: osem_measurements_archive fails for multiple boxes (@test_archive.R#47) 
      5. Error: summary.sensebox outputs all metrics for a single box (@test_box.R#42) 
      6. Error: phenomena from a not sensebox data.frame returns error (@test_phenomena.R#30) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
        intersect, setdiff, setequal, union
    
    
    Attaching package: 'lubridate'
    
    The following object is masked from 'package:base':
    
        date
    
    
    Attaching package: 'zoo'
    
    The following objects are masked from 'package:base':
    
        as.Date, as.Date.numeric
    
    Quitting from lines 44-47 (osem-history.Rmd) 
    Error: processing vignette 'osem-history.Rmd' failed with diagnostics:
    $ operator is invalid for atomic vectors
    Execution halted
    ```

# optiSel

Version: 2.0.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error in x$.self$finalize() : attempt to apply non-function
    Error in x$.self$finalize() : attempt to apply non-function
    Error in x$.self$finalize() : attempt to apply non-function
    Error in x$.self$finalize() : attempt to apply non-function
    Error in x$.self$finalize() : attempt to apply non-function
    Error in x$.self$finalize() : attempt to apply non-function
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'ocs-vignette.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# pathlibr

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘glue’ ‘logging’ ‘purrr’
      All declared Imports should be used.
    ```

# pcr

Version: 1.1.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Joining, by = c("group", "gene")
    Joining, by = "gene"
    Joining, by = c("group", "gene")
    Joining, by = c("group", "gene")
    Joining, by = "gene"
    Joining, by = c("group", "gene")
    Joining, by = c("group", "gene")
    Parsed with column specification:
    cols(
      ref = col_double(),
      target = col_double()
    )
    Joining, by = c("group", "gene")
    Joining, by = c("group", "gene", "calibrated")
    Joining, by = c("group", "gene")
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'qpcr_analysis.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# phenofit

Version: 0.2.0

## In both

*   checking whether package ‘phenofit’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/phenofit/new/phenofit.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘phenofit’ ...
** package ‘phenofit’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c RcppExports.cpp -o RcppExports.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/RcppArmadillo/include" -I/usr/local/include   -fPIC  -mtune=core2  -O3 -c register_routines.c -o register_routines.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c season.cpp -o season.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c sgfitw.cpp -o sgfitw.o
clang: error: unsupported option '-fopenmp'clang: error: 
unsupported option '-fopenmp'
clang: error: unsupported option '-fopenmp'
make: *** [sgfitw.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [season.o] Error 1
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘phenofit’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/phenofit/new/phenofit.Rcheck/phenofit’

```
### CRAN

```
* installing *source* package ‘phenofit’ ...
** package ‘phenofit’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c RcppExports.cpp -o RcppExports.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/RcppArmadillo/include" -I/usr/local/include   -fPIC  -mtune=core2  -O3 -c register_routines.c -o register_routines.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c season.cpp -o season.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/phenofit/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -c sgfitw.cpp -o sgfitw.o
clang: error: unsupported option '-fopenmp'
clang: error: unsupported option '-fopenmp'
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [sgfitw.o] Error 1
make: *** [season.o] Error 1
ERROR: compilation failed for package ‘phenofit’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/phenofit/old/phenofit.Rcheck/phenofit’

```
# pivot

Version: 18.4.17

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘odbc’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘colorspace’ ‘lubridate’
      All declared Imports should be used.
    ```

# PKPDmisc

Version: 2.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# plotly

Version: 4.8.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
      sub-directories of 1Mb or more:
        R             2.3Mb
        htmlwidgets   3.1Mb
    ```

# pmatch

Version: 0.1.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(pmatch)
      > 
      > test_check("pmatch")
      ── 1. Failure: we can transform a function that contains a call to cases (@test-
      tailr::can_loop_transform(llength) isn't true.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 168 SKIPPED: 0 FAILED: 1
      1. Failure: we can transform a function that contains a call to cases (@test-transforms.R#62) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# PopED

Version: 0.4.0

## Newly fixed

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        R     3.0Mb
        doc   1.2Mb
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# postal

Version: 0.1.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      17: .f(.x[[i]], ...) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpDbr67p/R.INSTALLa65a67fc1a9b/purrr/R/map.R:137
      18: readr::write_csv(this, write_to, append = TRUE, col_names = FALSE) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/postal/new/postal.Rcheck/00_pkg_src/postal/R/fetch_zones_all.R:57
      19: write_delim(x, path, delim = ",", na = na, append = append, col_names = col_names, 
             quote_escape = quote_escape) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpvD5aJZ/R.INSTALL97c27da5a21/readr/R/write.R:86
      20: stream_delim(x, path, delim = delim, col_names = col_names, append = append, na = na, 
             quote_escape = quote_escape) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpvD5aJZ/R.INSTALL97c27da5a21/readr/R/write.R:76
      21: open(path, "ab") at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpvD5aJZ/R.INSTALL97c27da5a21/readr/R/write.R:213
      22: open.connection(path, "ab")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 109 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test_fetch_zones.R#144) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# primirTSS

Version: 1.0.1

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available:
      ‘BSgenome.Hsapiens.UCSC.hg38’ ‘phastCons100way.UCSC.hg38’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# psychmeta

Version: 2.3.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'overview.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.9Mb
      sub-directories of 1Mb or more:
        R   7.0Mb
    ```

# psycho

Version: 0.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        R     1.0Mb
        doc   4.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# purrrlyr

Version: 0.0.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# qPLEXanalyzer

Version: 1.0.3

## In both

*   checking whether package ‘qPLEXanalyzer’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘MSnbase’ was built under R version 3.5.2
      Warning: package ‘mzR’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/qPLEXanalyzer/new/qPLEXanalyzer.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Loading required package: ProtGenerics
    
    This is MSnbase version 2.8.3 
      Visit https://lgatto.github.io/MSnbase/ to get started.
    
    
    Attaching package: 'MSnbase'
    
    The following object is masked from 'package:stats':
    
        smooth
    
    The following object is masked from 'package:base':
    
        trimws
    
    Quitting from lines 67-71 (qPLEXanalyzer.rnw) 
    Error: processing vignette 'qPLEXanalyzer.rnw' failed with diagnostics:
    there is no package called 'gridExtra'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘qPLEXdata’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    rliPlot: no visible binding for global variable ‘logInt’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/qPLEXanalyzer/new/qPLEXanalyzer.Rcheck/00_pkg_src/qPLEXanalyzer/R/plots.R:599-621)
    rliPlot: no visible binding for global variable ‘medianLogInt’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/qPLEXanalyzer/new/qPLEXanalyzer.Rcheck/00_pkg_src/qPLEXanalyzer/R/plots.R:599-621)
    summarizeIntensities: no visible binding for global variable
      ‘Accessions’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/qPLEXanalyzer/new/qPLEXanalyzer.Rcheck/00_pkg_src/qPLEXanalyzer/R/Allfunctions.R:55-60)
    summarizeIntensities: no visible binding for global variable
      ‘Sequences’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/qPLEXanalyzer/new/qPLEXanalyzer.Rcheck/00_pkg_src/qPLEXanalyzer/R/Allfunctions.R:55-60)
    summarizeIntensities: no visible binding for global variable
      ‘Accessions’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/qPLEXanalyzer/new/qPLEXanalyzer.Rcheck/00_pkg_src/qPLEXanalyzer/R/Allfunctions.R:62-68)
    summarizeIntensities: no visible binding for global variable ‘Count’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/qPLEXanalyzer/new/qPLEXanalyzer.Rcheck/00_pkg_src/qPLEXanalyzer/R/Allfunctions.R:62-68)
    Undefined global functions or variables:
      . Accessions AveExpr B Cor CorTxt Count GeneSymbol Grouping_column
      Intensity Mean Modifications PeptideID RawIntensity RowID SampleName
      Sequence Sequences Variance X Y adj.P.Val controlLogFoldChange group
      logFC logInt logIntensity meanscaledIntensity medianLogInt
      normalizedIntensities scaledIntensity scalingFactors x xend y yend
    ```

*   checking for unstated dependencies in vignettes ... NOTE
    ```
    'library' or 'require' call not declared from: ‘gridExtra’
    ```

# qqplotr

Version: 0.0.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘knitr’ ‘purrr’ ‘rmarkdown’
      All declared Imports should be used.
    ```

# qsort

Version: 0.2.3

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'qsort-vignette.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6 marked UTF-8 strings
    ```

# quanteda

Version: 1.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.7Mb
      sub-directories of 1Mb or more:
        R      3.1Mb
        data   1.3Mb
        libs   1.3Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 71 marked UTF-8 strings
    ```

# quokar

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MCMCpack’ ‘gridExtra’ ‘knitr’
      All declared Imports should be used.
    ```

# RBesT

Version: 1.3-7

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        R      1.1Mb
        doc    1.9Mb
        libs   2.2Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# rbin

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# rclimateca

Version: 1.0.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# rcongresso

Version: 0.4.6

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘rcongresso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fetch_despesas_deputado
    > ### Title: Fetches expenditures from deputy
    > ### Aliases: fetch_despesas_deputado
    > 
    > ### ** Examples
    > 
    > gastos_abel_mesquita <- fetch_despesas_deputado(id = 178957)
    Error: Falha na requisicao a API dos Dados Abertos. Erro 400 ao tentar acessar: https://dadosabertos.camara.leg.br/api/v2/deputados/178957/despesas?id=178957
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      9: doWithOneRestart(return(expr), restart)
      
      ── 3. Error: (unknown) (@test_votacoes.R#70)  ──────────────────────────────────
      argument "message" is missing, with no default
      1: skip() at testthat/test_votacoes.R:70
      2: structure(list(message = message), class = c("skip", "condition"))
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 13 SKIPPED: 0 FAILED: 3
      1. Error: (unknown) (@test_deputados.R#81) 
      2. Error: (unknown) (@test_proposicoes.R#91) 
      3. Error: (unknown) (@test_votacoes.R#70) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning: package 'dplyr' was built under R version 3.5.2
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 36-38 (introducao-rcongresso.Rmd) 
    Error: processing vignette 'introducao-rcongresso.Rmd' failed with diagnostics:
    could not find function "FUN1"
    Execution halted
    ```

# Rdrools

Version: 1.1.1

## In both

*   checking whether package ‘Rdrools’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/Rdrools/new/Rdrools.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘Rdrools’ ...
** package ‘Rdrools’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Unable to find any JVMs matching version "(null)".
No Java runtime present, try --request to install.
Warning in system("/usr/libexec/java_home", intern = TRUE) :
  running command '/usr/libexec/java_home' had status 1
Error: package or namespace load failed for ‘rJava’:
 .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/lionel/Desktop/lowliner/revdep/library.noindex/Rdrools/rJava/libs/rJava.so':
  dlopen(/Users/lionel/Desktop/lowliner/revdep/library.noindex/Rdrools/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/lionel/Desktop/lowliner/revdep/library.noindex/Rdrools/rJava/libs/rJava.so
  Reason: image not found
Error : package ‘rJava’ could not be loaded
ERROR: lazy loading failed for package ‘Rdrools’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/Rdrools/new/Rdrools.Rcheck/Rdrools’

```
### CRAN

```
* installing *source* package ‘Rdrools’ ...
** package ‘Rdrools’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Unable to find any JVMs matching version "(null)".
No Java runtime present, try --request to install.
Warning in system("/usr/libexec/java_home", intern = TRUE) :
  running command '/usr/libexec/java_home' had status 1
Error: package or namespace load failed for ‘rJava’:
 .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/lionel/Desktop/lowliner/revdep/library.noindex/Rdrools/rJava/libs/rJava.so':
  dlopen(/Users/lionel/Desktop/lowliner/revdep/library.noindex/Rdrools/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/lionel/Desktop/lowliner/revdep/library.noindex/Rdrools/rJava/libs/rJava.so
  Reason: image not found
Error : package ‘rJava’ could not be loaded
ERROR: lazy loading failed for package ‘Rdrools’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/Rdrools/old/Rdrools.Rcheck/Rdrools’

```
# rdrop2

Version: 0.8.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘digest’
      All declared Imports should be used.
    ```

# recipes

Version: 0.1.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: dimRed::FastICA at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/recipes/new/recipes.Rcheck/00_pkg_src/recipes/R/ica.R:158
      15: getExportedValue(pkg, name)
      16: asNamespace(ns)
      17: getNamespace(ns)
      18: tryCatch(loadNamespace(name), error = function(e) stop(e))
      19: tryCatchList(expr, classes, parentenv, handlers)
      20: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      21: value[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 1123 SKIPPED: 9 FAILED: 1
      1. Error: printing (@test_ica.R#127) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘recipes’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/recipes/new/recipes.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘dimRed’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RcppRoll’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘dimRed’
    ```

# reinforcelearn

Version: 0.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Episode 482 finished after 3 steps with a return of -3
    Episode 483 finished after 1 steps with a return of -1
    Episode 484 finished after 2 steps with a return of -2
    Episode 485 finished after 2 steps with a return of -2
    Episode 486 finished after 2 steps with a return of -2
    Episode 487 finished after 1 steps with a return of -1
    Episode 488 finished after 3 steps with a return of -3
    Episode 489 finished after 3 steps with a return of -3
    Episode 490 finished after 1 steps with a return of -1
    Episode 491 finished after 1 steps with a return of -1
    Episode 492 finished after 2 steps with a return of -2
    Episode 493 finished after 5 steps with a return of -5
    Episode 494 finished after 2 steps with a return of -2
    Episode 495 finished after 2 steps with a return of -2
    Episode 496 finished after 2 steps with a return of -2
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'agents.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘nnet’ ‘purrr’
      All declared Imports should be used.
    ```

# repurrrsive

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 8 marked UTF-8 strings
    ```

# rfbCNPJ

Version: 0.1.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 27 marked UTF-8 strings
    ```

# rfishbase

Version: 3.0.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 44 marked UTF-8 strings
    ```

# rhierbaps

Version: 1.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      Failed to tidy R code in chunk 'unnamed-chunk-11'. Reason:
    Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      Failed to tidy R code in chunk 'unnamed-chunk-12'. Reason:
    Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      Failed to tidy R code in chunk 'unnamed-chunk-13'. Reason:
    Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      Failed to tidy R code in chunk 'unnamed-chunk-14'. Reason:
    Error in loadNamespace(name) : there is no package called 'formatR'
    
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# riingo

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rlang’
      All declared Imports should be used.
    ```

# rmapzen

Version: 0.4.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
    ```

# rmd

Version: 0.1.4

## In both

*   checking whether package ‘rmd’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘blogdown’ was built under R version 3.5.2
      Warning: package ‘tinytex’ was built under R version 3.5.2
      Warning: package ‘mindr’ was built under R version 3.5.2
      Warning: package ‘bookdownplus’ was built under R version 3.5.2
      Warning: package ‘pagedown’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/rmd/new/rmd.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘blogdown’ ‘bookdown’ ‘bookdownplus’ ‘citr’ ‘pagedown’ ‘rticles’
      ‘tinytex’ ‘xaringan’
      All declared Imports should be used.
    ```

# rmsfuns

Version: 0.0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Missing or unexported object: ‘base::shell.exec’
    ```

# rnoaa

Version: 0.8.4

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        vign   1.2Mb
    ```

# roadoi

Version: 0.5.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 160-167 (intro.Rmd) 
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    no applicable method for 'mutate_' applied to an object of class "NULL"
    Execution halted
    ```

# RPyGeo

Version: 1.0.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'RPyGeo.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# RSDA

Version: 2.0.8

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘randomcoloR’
      All declared Imports should be used.
    ```

# RTCGA

Version: 1.12.1

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
      Welcome to the RTCGA (version: 1.12.1).
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
    ...
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    ggbiplot: no visible binding for global variable ‘xvar’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    ggbiplot: no visible binding for global variable ‘yvar’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    ggbiplot: no visible binding for global variable ‘angle’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    ggbiplot: no visible binding for global variable ‘hjust’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    read.mutations: no visible binding for global variable ‘.’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/readTCGA.R:383)
    read.mutations: no visible binding for global variable ‘.’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/readTCGA.R:386)
    read.rnaseq: no visible binding for global variable ‘.’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/readTCGA.R:372-375)
    survivalTCGA: no visible binding for global variable ‘times’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/survivalTCGA.R:101-137)
    whichDateToUse: no visible binding for global variable ‘.’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/downloadTCGA.R:167-168)
    Undefined global functions or variables:
      . angle hjust muted times varname xvar yvar
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘RTCGA.rnaseq’, ‘RTCGA.clinical’, ‘RTCGA.mutations’, ‘RTCGA.CNV’, ‘RTCGA.RPPA’, ‘RTCGA.mRNA’, ‘RTCGA.miRNASeq’, ‘RTCGA.methylation’
    ```

# rtrek

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘memoise’ ‘tidyr’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 988 marked UTF-8 strings
    ```

# SanzCircos

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘purrr’ ‘tidyr’
      All declared Imports should be used.
    ```

# scanstatistics

Version: 1.0.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# scriptName

Version: 1.0.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘scriptName-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: current_filename
    > ### Title: Determine a script's filename from within the script itself
    > ### Aliases: current_filename current_source_filename current_cli_filename
    > 
    > ### ** Examples
    > 
    > # Put this in example.R and try running source("example.R")
    > # and `Rscript example.R`
    > filename <- current_filename()
    Error: Predicate functions must return a single `TRUE` or `FALSE`, not a logical vector of length 0
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 6. Failure: functions work under Rscript (@test.all.R#45)  ──────────────────
      run_rscript("current_source_filename.R") not identical to " NULL".
      Lengths differ: 0 is not 1
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 13 SKIPPED: 0 FAILED: 6
      1. Failure: functions work under R --file (@test.all.R#22) 
      2. Failure: functions work under R --file (@test.all.R#23) 
      3. Failure: functions work under R -f (@test.all.R#33) 
      4. Failure: functions work under R -f (@test.all.R#34) 
      5. Failure: functions work under Rscript (@test.all.R#44) 
      6. Failure: functions work under Rscript (@test.all.R#45) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# sergeant

Version: 0.5.2

## In both

*   checking whether package ‘sergeant’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
      Warning: package ‘dbplyr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/sergeant/new/sergeant.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unable to find any JVMs matching version "(null)".
    No Java runtime present, try --request to install.
    ```

# sevenC

Version: 1.2.0

## In both

*   checking whether package ‘sevenC’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘GenomeInfoDb’ was built under R version 3.5.2
      Warning: package ‘BiocParallel’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/sevenC/new/sevenC.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
        anyMissing, rowMedians
    
    Loading required package: BiocParallel
    
    Attaching package: 'DelayedArray'
    
    The following objects are masked from 'package:matrixStats':
    
        colMaxs, colMins, colRanges, rowMaxs, rowMins, rowRanges
    
    The following objects are masked from 'package:base':
    
        aperm, apply
    
    convert: profile 'icc': 'RGB ': RGB color space not permitted on grayscale PNG `sevenC_files/figure-html/unnamed-chunk-22-1.png' @ warning/png.c/MagickPNGWarningHandler/1656.
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'sevenC.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported object imported by a ':::' call: ‘GenomicRanges:::get_out_of_bound_index’
      See the note in ?`:::` about the use of this operator.
    ```

# shiny.semantic

Version: 0.2.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# SIBER

Version: 2.1.4

## In both

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > x <- stats::rnorm(50)
    > y <- stats::rnorm(50)
    > parms <- list()
    > parms$n.iter <- 2 * 10^3
    > parms$n.burnin <- 500
    > parms$n.thin <- 2     
    > parms$n.chains <- 2    
    > priors <- list()
    > priors$R <- 1 * diag(2)
    > priors$k <- 2
    > priors$tau.mu <- 1.0E-3
    > fitEllipse(x, y, parms, priors)
    Error: .onLoad failed in loadNamespace() for 'rjags', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/Users/lionel/Desktop/lowliner/revdep/library.noindex/SIBER/rjags/libs/rjags.so':
      dlopen(/Users/lionel/Desktop/lowliner/revdep/library.noindex/SIBER/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
      Referenced from: /Users/lionel/Desktop/lowliner/revdep/library.noindex/SIBER/rjags/libs/rjags.so
      Reason: image not found
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 74-96 (Centroid-Vectors.Rmd) 
    Error: processing vignette 'Centroid-Vectors.Rmd' failed with diagnostics:
    .onLoad failed in loadNamespace() for 'rjags', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/Users/lionel/Desktop/lowliner/revdep/library.noindex/SIBER/rjags/libs/rjags.so':
      dlopen(/Users/lionel/Desktop/lowliner/revdep/library.noindex/SIBER/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
      Referenced from: /Users/lionel/Desktop/lowliner/revdep/library.noindex/SIBER/rjags/libs/rjags.so
      Reason: image not found
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘coda’ ‘ellipse’ ‘viridis’
      All declared Imports should be used.
    ```

# sigmajs

Version: 0.1.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
      sub-directories of 1Mb or more:
        doc   5.3Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 28 marked UTF-8 strings
    ```

# simTool

Version: 1.1.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [1] "Estimated replications per hour:  102126"
      [1] "Estimated replications per hour:  2921333"
      [1] "Estimated replications per hour:  354177"
      [1] "Estimated replications per hour:  3235998"
      [1] "Estimated replications per hour:  323412"
      ── 1. Failure: Two groups for summary_fun. Results were created and stored in si
      eg$simulation[[col]] not identical to expected_df[[col]].
      Objects equal but not identical
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 119 SKIPPED: 0 FAILED: 1
      1. Failure: Two groups for summary_fun. Results were created and stored in simulation (@test_eval_tibbles.R#847) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# SingleCaseES

Version: 0.4.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'Effect-size-definitions.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# sjstats

Version: 0.17.3

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘arm’
    ```

# skimr

Version: 1.0.5

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘dtplyr’, ‘dbplyr’
    ```

# sparklyr

Version: 1.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.7Mb
      sub-directories of 1Mb or more:
        R      4.0Mb
        java   1.5Mb
    ```

# sperrorest

Version: 2.1.5

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'spatial-modeling-use-case.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# ssdtools

Version: 0.0.3

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'ssdtools-manual.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# starmie

Version: 0.1.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.2Mb
      sub-directories of 1Mb or more:
        doc       1.1Mb
        extdata   4.9Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘MCMCpack’
      All declared Imports should be used.
    ```

# steemr

Version: 0.1.3

## In both

*   checking whether package ‘steemr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘data.table’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/steemr/new/steemr.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rlist’ ‘tm’ ‘zoo’
      All declared Imports should be used.
    ```

# stlcsb

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# stminsights

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘huge’ ‘readr’ ‘scales’ ‘shinyjs’
      All declared Imports should be used.
    ```

# strex

Version: 0.1.3

## In both

*   checking whether package ‘strex’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘stringr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/strex/new/strex.Rcheck/00install.out’ for details.
    ```

# STRMPS

Version: 0.5.8

## In both

*   checking whether package ‘STRMPS’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Biostrings’ was built under R version 3.5.2
      Warning: package ‘BiocParallel’ was built under R version 3.5.2
      Warning: package ‘Rsamtools’ was built under R version 3.5.2
      Warning: package ‘GenomeInfoDb’ was built under R version 3.5.2
      Warning: package ‘GenomicAlignments’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/STRMPS/new/STRMPS.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘STRaitRazoR’
    ```

# suropt

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DiceOptim’ ‘GPareto’ ‘rgenoud’
      All declared Imports should be used.
    ```

# survminer

Version: 0.4.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        R     1.0Mb
        doc   5.1Mb
    ```

# sweep

Version: 0.2.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘lazyeval’ ‘lubridate’ ‘tidyr’
      All declared Imports should be used.
    ```

# tableschema.r

Version: 1.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘iterators’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘parsedate’
    ```

# testextra

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘stringi’ ‘utils’
      All declared Imports should be used.
    ```

# textfeatures

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# textrecipes

Version: 0.0.1

## In both

*   checking whether package ‘textrecipes’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/textrecipes/new/textrecipes.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringr’
      All declared Imports should be used.
    ```

# tidybayes

Version: 1.0.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             modules = modules, factories = factories, jags = jags, call.setup = TRUE, method = method, 
             mutate = mutate)
      10: setup.jags(model = outmodel, monitor = outmonitor, data = outdata, n.chains = n.chains, 
             inits = outinits, modules = modules, factories = factories, response = response, 
             fitted = fitted, residual = residual, jags = jags, method = method, mutate = mutate)
      11: loadandcheckrjags()
      12: stop("Loading the rjags package failed (diagnostics are given above this error message)", 
             call. = FALSE)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 226 SKIPPED: 43 FAILED: 1
      1. Error: tidy_draws works with runjags (@test.tidy_draws.R#87) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyinftheo

Version: 0.2.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      12: shannon_entropy(.)
      13: reduce_data(.data, !!enquo(X), numvars = 1, na.rm = na.rm) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/tidyinftheo/new/tidyinftheo.Rcheck/00_pkg_src/tidyinftheo/R/inftheo.R:70
      14: tidyselect::vars_select(names(reduced_tab), !!!quos(...)) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/tidyinftheo/new/tidyinftheo.Rcheck/00_pkg_src/tidyinftheo/R/inftheo.R:26
      15: vars_select_eval(.vars, quos)
      16: map_lgl(quos, quo_is_helper)
      17: .f(.x[[i]], ...) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpDbr67p/R.INSTALLa65a67fc1a9b/purrr/R/map.R:176
      18: extract_expr(quo)
      19: is_call(expr, paren_sym)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 37 SKIPPED: 0 FAILED: 1
      1. Error: right number of columns given (@test-errors.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘tidyinftheo’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘tibble’ was built under R version 3.5.2
      Warning: package ‘dplyr’ was built under R version 3.5.2
      Warning: package ‘stringr’ was built under R version 3.5.2
      Warning: package ‘forcats’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/tidyinftheo/new/tidyinftheo.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'math.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘tibble’ ‘tidyverse’
      All declared Imports should be used.
    ```

# tidymodels

Version: 0.0.2

## In both

*   checking whether package ‘tidymodels’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
      Warning: package ‘rsample’ was built under R version 3.5.2
      Warning: package ‘tibble’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/tidymodels/new/tidymodels.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘dials’ ‘parsnip’
      All declared Imports should be used.
    ```

# tidyquant

Version: 0.5.5

## In both

*   checking whether package ‘tidyquant’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘tibble’ was built under R version 3.5.2
      Warning: package ‘dplyr’ was built under R version 3.5.2
      Warning: package ‘stringr’ was built under R version 3.5.2
      Warning: package ‘forcats’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/tidyquant/new/tidyquant.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc   4.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unable to find any JVMs matching version "(null)".
    No Java runtime present, try --request to install.
    ```

# tidyr

Version: 0.8.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 23 marked UTF-8 strings
    ```

# tidyRSS

Version: 1.2.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

# tidytext

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Unable to find any JVMs matching version "(null)".
    No Java runtime present, try --request to install.
    ```

# tidyverse

Version: 1.2.1

## In both

*   checking whether package ‘tidyverse’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘tibble’ was built under R version 3.5.2
      Warning: package ‘dplyr’ was built under R version 3.5.2
      Warning: package ‘stringr’ was built under R version 3.5.2
      Warning: package ‘forcats’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/tidyverse/new/tidyverse.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dbplyr’ ‘reprex’ ‘rlang’
      All declared Imports should be used.
    ```

# tidyxl

Version: 1.0.4

## In both

*   checking compiled code ... WARNING
    ```
    File ‘tidyxl/libs/tidyxl.so’:
      Found ‘_abort’, possibly from ‘abort’ (C)
        Object: ‘xlex.o’
    
    Compiled code should not call entry points which might terminate R
    nor write to stdout/stderr instead of to the console, nor use
    Fortran I/O nor system RNGs.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’
    manual.
    ```

# timetk

Version: 0.1.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘forecast’
      All declared Imports should be used.
    ```

# tipr

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘tibble’
      All declared Imports should be used.
    ```

# totalcensus

Version: 0.6.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        data   5.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 64 marked Latin-1 strings
      Note: found 548 marked UTF-8 strings
    ```

# TPP

Version: 3.10.1

## In both

*   R CMD check timed out
    

*   checking whether package ‘TPP’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/TPP/new/TPP.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 15.1Mb
      sub-directories of 1Mb or more:
        R              2.1Mb
        data           1.9Mb
        example_data   8.0Mb
        test_data      1.9Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘broom’
      All declared Imports should be used.
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
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/TPP/new/TPP.Rcheck/00_pkg_src/TPP/R/plot_fSta_distribution.R:19-28)
    plot_pVal_distribution: no visible binding for global variable
      ‘..density..’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/TPP/new/TPP.Rcheck/00_pkg_src/TPP/R/plot_pVal_distribution.R:22-31)
    Undefined global functions or variables:
      ..density..
    ```

# tsibble

Version: 0.7.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following object is masked from 'package:stats':
    
        filter
    
    
    Attaching package: 'lubridate'
    
    The following objects are masked from 'package:tsibble':
    
        interval, new_interval
    
    The following object is masked from 'package:base':
    
        date
    
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'intro-tsibble.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# ukbtools

Version: 0.11.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘plyr’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 5 marked UTF-8 strings
    ```

# vdiffr

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘freetypeharfbuzz’
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

# voxel

Version: 1.3.5

## In both

*   checking whether package ‘voxel’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘lmerTest’ was built under R version 3.5.2
      Warning: package ‘lme4’ was built under R version 3.5.2
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/voxel/new/voxel.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# vqtl

Version: 2.0.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: function_list[[i]](value)
      12: dplyr::summarise_(., mean = lazyeval::interp(~mean(var, na.rm = TRUE), var = as.name(phenotype.name)), 
             sd = lazyeval::interp(~sd(var, na.rm = TRUE), var = as.name(phenotype.name)), 
             mean.se = quote(sd/sqrt(n())), sd.se = quote(sqrt(2) * sd^2/sqrt(n() - 1)))
      13: summarise_.tbl_df(., mean = lazyeval::interp(~mean(var, na.rm = TRUE), var = as.name(phenotype.name)), 
             sd = lazyeval::interp(~sd(var, na.rm = TRUE), var = as.name(phenotype.name)), 
             mean.se = quote(sd/sqrt(n())), sd.se = quote(sqrt(2) * sd^2/sqrt(n() - 1)))
      14: summarise_impl(.data, dots, environment(), caller_env())
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 118 SKIPPED: 2 FAILED: 1
      1. Error: mean_var_sample_plot (@test-4-plots.R#76) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘hglm’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘iterators’ ‘knitr’ ‘purrr’ ‘testthat’
      All declared Imports should be used.
    ```

# wand

Version: 0.2.0

## In both

*   checking whether package ‘wand’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/wand/new/wand.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘wand’ ...
** package ‘wand’ successfully unpacked and MD5 sums checked
Checking to see if libmagic is available...
** libs
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -L/usr/local/include -L/opt/local/include -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/wand/Rcpp/include" -I/usr/local/include   -fPIC  -mtune=core2 -O3 -c RcppExports.cpp -o RcppExports.o
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -L/usr/local/include -L/opt/local/include -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/wand/Rcpp/include" -I/usr/local/include   -fPIC  -mtune=core2 -O3 -c wand.cpp -o wand.o
clang: warning: argument unused during compilation: '-L/usr/local/include' [-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-L/opt/local/include' [-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-L/usr/local/include' [-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-L/opt/local/include' [-Wunused-command-line-argument]
clang++ -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o wand.so RcppExports.o wand.o -L/usr/local/lib -L/opt/local/lib -L/usr/lib -lmagic -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: library not found for -lmagic
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [wand.so] Error 1
ERROR: compilation failed for package ‘wand’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/wand/new/wand.Rcheck/wand’

```
### CRAN

```
* installing *source* package ‘wand’ ...
** package ‘wand’ successfully unpacked and MD5 sums checked
Checking to see if libmagic is available...
** libs
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -L/usr/local/include -L/opt/local/include -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/wand/Rcpp/include" -I/usr/local/include   -fPIC  -mtune=core2 -O3 -c RcppExports.cpp -o RcppExports.o
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -L/usr/local/include -L/opt/local/include -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/wand/Rcpp/include" -I/usr/local/include   -fPIC  -mtune=core2 -O3 -c wand.cpp -o wand.o
clang: warning: argument unused during compilation: '-L/usr/local/include' [-Wunused-command-line-argument]
clangclang: warning: argument unused during compilation: '-L/opt/local/include' [-Wunused-command-line-argument]
: warning: argument unused during compilation: '-L/usr/local/include' [-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-L/opt/local/include' [-Wunused-command-line-argument]
clang++ -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o wand.so RcppExports.o wand.o -L/usr/local/lib -L/opt/local/lib -L/usr/lib -lmagic -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: library not found for -lmagic
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [wand.so] Error 1
ERROR: compilation failed for package ‘wand’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/wand/old/wand.Rcheck/wand’

```
# weathercan

Version: 0.2.8

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘xml2’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 25 marked UTF-8 strings
    ```

# wiggleplotr

Version: 1.6.1

## In both

*   checking examples ... ERROR
    ```
    ...
    
    Attaching package: ‘IRanges’
    
    The following objects are masked from ‘package:dplyr’:
    
        collapse, desc, slice
    
    Loading required package: GenomeInfoDb
    Warning: package ‘GenomeInfoDb’ was built under R version 3.5.2
    > require("org.Hs.eg.db")
    Loading required package: org.Hs.eg.db
    Warning in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
      there is no package called ‘org.Hs.eg.db’
    > require("TxDb.Hsapiens.UCSC.hg38.knownGene")
    Loading required package: TxDb.Hsapiens.UCSC.hg38.knownGene
    Warning in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
      there is no package called ‘TxDb.Hsapiens.UCSC.hg38.knownGene’
    > 
    > orgdb = org.Hs.eg.db
    Error: object 'org.Hs.eg.db' not found
    Execution halted
    ```

*   checking for missing documentation entries ... WARNING
    ```
    Warning: package ‘GenomeInfoDb’ was built under R version 3.5.2
    All user-level objects in a package should have documentation
    entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    Codoc mismatches from documentation object 'getGenotypePalette':
    getGenotypePalette
      Code: function(old = FALSE)
      Docs: function()
      Argument names in code not in docs:
        old
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 18-28 (wiggleplotr.Rmd) 
    Error: processing vignette 'wiggleplotr.Rmd' failed with diagnostics:
    there is no package called 'EnsDb.Hsapiens.v86'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘EnsDb.Hsapiens.v86’ ‘org.Hs.eg.db’
      ‘TxDb.Hsapiens.UCSC.hg38.knownGene’
    ```

*   checking R code for possible problems ... NOTE
    ```
    plotCoverage: no visible global function definition for ‘is’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/wiggleplotr/new/wiggleplotr.Rcheck/00_pkg_src/wiggleplotr/R/wiggleplotr.R:184)
    plotCoverage: no visible global function definition for ‘is’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/wiggleplotr/new/wiggleplotr.Rcheck/00_pkg_src/wiggleplotr/R/wiggleplotr.R:185)
    plotTranscripts: no visible global function definition for ‘is’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/wiggleplotr/new/wiggleplotr.Rcheck/00_pkg_src/wiggleplotr/R/wiggleplotr.R:33)
    plotTranscripts: no visible global function definition for ‘is’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/wiggleplotr/new/wiggleplotr.Rcheck/00_pkg_src/wiggleplotr/R/wiggleplotr.R:34)
    Undefined global functions or variables:
      is
    Consider adding
      importFrom("methods", "is")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports
    field contains 'methods').
    ```

# wordbankr

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dbplyr’
      All declared Imports should be used.
    ```

# xpose

Version: 0.4.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: compare.tbl_df(act$val, exp$val)
      4: NextMethod("compare") at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpvD5aJZ/R.INSTALL97c27da5a21/readr/R/utils.R:51
      5: compare.default(act$val, exp$val)
      6: all.equal(x, y, ...)
      7: all.equal.tbl_df(x, y, ...)
      8: equal_data_frame(target, current, ignore_col_order = ignore_col_order, ignore_row_order = ignore_row_order, 
             convert = convert)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 522 SKIPPED: 6 FAILED: 2
      1. Failure: dot arguments are properly passed to readr (@test-read_nm_tables.R#57) 
      2. Error: vpc_data works properly with xpdb tables (@test-vpc.R#43) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# zeligverse

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Amelia’ ‘MatchIt’ ‘WhatIf’
      All declared Imports should be used.
    ```

