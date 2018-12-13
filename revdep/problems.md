# abjutils

Version: 0.2.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# adaptalint

Version: 0.2.3

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# alphavantager

Version: 0.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# amt

Version: 0.0.5.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Attaching package: 'sp'
    
    The following object is masked from 'package:amt':
    
        bbox
    
    
    Attaching package: 'raster'
    
    The following object is masked from 'package:amt':
    
        select
    
    Warning in random_steps.steps_xy(., n = 15) :
      Step-lengths or turning angles contained NA, which were removed.
    Warning in random_steps.steps_xy(., n = 15) :
      Step-lengths or turning angles contained NA, which were removed.
    Quitting from lines 144-145 (p4_SSF.Rmd) 
    Error: processing vignette 'p4_SSF.Rmd' failed with diagnostics:
    there is no package called 'devtools'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘magrittr’
      All declared Imports should be used.
    ```

# anomalize

Version: 0.1.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 15-24 (anomalize_methods.Rmd) 
    Error: processing vignette 'anomalize_methods.Rmd' failed with diagnostics:
    there is no package called 'devtools'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

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
clang: clang: error: unsupported option '-fopenmp'error: 
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
clang: error: unsupported option '-fopenmp'clang: error: unsupported option '-fopenmp'

make: *** [RcppExports.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [bottlenecks.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/anomalyDetection/old/anomalyDetection.Rcheck/anomalyDetection’

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

# automagic

Version: 0.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# banR

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringr’
      All declared Imports should be used.
    ```

# BayesMallows

Version: 0.2.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Using exact partition function.
    Computing Mallows model with 4 clusters.
    Using exact partition function.
    Computing Mallows model with 5 clusters.
    Using exact partition function.
    Computing Mallows model with 6 clusters.
    Using exact partition function.
    Computing Mallows model with 7 clusters.
    Using exact partition function.
    Computing Mallows model with 8 clusters.
    Using exact partition function.
    Computing Mallows model with 9 clusters.
    Using exact partition function.
    Computing Mallows model with 10 clusters.
    Using exact partition function.
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

Version: 2.0.5

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘metaboData’
    ```

# biomartr

Version: 0.8.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# blorr

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘descriptr’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘lmtest’
    ```

# blscrapeR

Version: 3.1.2

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘blscrapeR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: qcew_api
    > ### Title: Request data from the Quarterly Census of Employment and Wages.
    > ### Aliases: qcew_api
    > ### Keywords: api bls cpi economics inflation unemployment
    > 
    > ### ** Examples
    > 
    > 
    > # A request for the employment levels and wages for NIACS 5112: Software Publishers.
    > dat <- qcew_api(year=2015, qtr="A", slice="area", sliceCode="US000")
    Please set a numeric year.
    Trying BLS servers...
    URL caused a warning. Please check your parameters and try again: https://data.bls.gov/cew/data/api/2015/A/area/US000.csv
    Error in qcew_api(year = 2015, qtr = "A", slice = "area", sliceCode = "US000") : 
      object 'qcewDat' not found
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(blscrapeR)
      > 
      > test_check("blscrapeR")
      ── 1. Error: (unknown) (@test_qcew_api.R#8)  ───────────────────────────────────
      cannot open URL 'https://data.bls.gov/cew/data/api/2013/1/industry/5112.csv'
      1: download.file(url, temp, quiet = TRUE) at testthat/test_qcew_api.R:8
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 2 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test_qcew_api.R#8) 
      
      Error: testthat unit tests failed
      Execution halted
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

Version: 0.4.5

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

Version: 0.2.3

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

# cdcfluview

Version: 0.7.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘units’
      All declared Imports should be used.
    ```

# CDECRetrieve

Version: 0.1.2

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

# chorrrds

Version: 0.1.7

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        data   5.1Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 8008 marked UTF-8 strings
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
clang: error: unsupported option '-fopenmp'clang: error: unsupported option '-fopenmp'

clang: error: unsupported option '-fopenmp'
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
clang: errorclang: unsupported option '-fopenmp'
: error: unsupported option '-fopenmp'clang: error
: unsupported option '-fopenmp'
make: *** [parameters.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [circular.o] Error 1
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘circumplex’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/circumplex/old/circumplex.Rcheck/circumplex’

```
# civis

Version: 1.5.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# clustermq

Version: 0.8.5

## In both

*   R CMD check timed out
    

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘infuser’ ‘purrr’
      All declared Imports should be used.
    ```

# CNPBayes

Version: 1.10.0

## In both

*   checking Rd \usage sections ... WARNING
    ```
    Undocumented arguments in documentation object 'marginal_lik'
      ‘value’
    
    Functions with \usage entries need to have the appropriate \alias
    entries, and all their arguments documented.
    The \usage entries must correspond to syntactically valid R code.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
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
      installed size is  8.7Mb
      sub-directories of 1Mb or more:
        R      3.0Mb
        doc    3.4Mb
        libs   1.3Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    copyNumber,SingleBatchCopyNumber: no visible binding for global
      variable ‘theta.star’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/copynumber-models.R:148-149)
    copyNumber,SingleBatchCopyNumber: no visible binding for global
      variable ‘theta.star’
      (/Users/lionel/Desktop/lowliner/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/copynumber-models.R:150-151)
    Undefined global functions or variables:
      theta.star
    ```

# codebook

Version: 0.7.5

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘graphics’ ‘pander’
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

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# colorednoise

Version: 1.0.3

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
clang: error: unsupported option '-fopenmp'clang: error: clang: error: 
unsupported option '-fopenmp'unsupported option '-fopenmp'

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
clang: error: unsupported option '-fopenmp'
clang: error: clang: error: unsupported option '-fopenmp'unsupported option '-fopenmp'

make: *** [simulation.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [noise.o] Error 1
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘colorednoise’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/colorednoise/old/colorednoise.Rcheck/colorednoise’

```
# congressbr

Version: 0.1.3

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Loading required package: dplyr
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 61-62 (senate.Rmd) 
    Error: processing vignette 'senate.Rmd' failed with diagnostics:
    at_depth() is defunct, please use `map_depth()` instead
    Execution halted
    ```

## Newly fixed

*   R CMD check timed out
    

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘congressbr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sen_bills
    > ### Title: Downloads and tidies information on the legislation in the
    > ###   Federal Senate
    > ### Aliases: sen_bills
    > 
    > ### ** Examples
    > 
    > pls_5_2010 <- sen_bills(type = "PLS", number = 5, year = 2010)
    Error: Column `bill_indexing` must be a 1d atomic vector or a list
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 187 marked UTF-8 strings
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

Version: 0.8.4

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘igraph’ ‘partykit’ ‘treemap’ ‘V8’
    ```

# DataPackageR

Version: 0.15.4

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# DChIPRep

Version: 1.10.0

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
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘GO.db’
ERROR: lazy loading failed for package ‘DChIPRep’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/DChIPRep/old/DChIPRep.Rcheck/DChIPRep’

```
# DEP

Version: 1.2.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        R      1.2Mb
        data   1.4Mb
        doc    3.1Mb
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

# diffdf

Version: 1.0.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# DLMtool

Version: 5.2.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# dlookr

Version: 0.3.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        doc   4.2Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dbplyr’ ‘randomForest’
      All declared Imports should be used.
    ```

# dodgr

Version: 0.1.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 18-19 (benchmark.Rmd) 
    Error: processing vignette 'benchmark.Rmd' failed with diagnostics:
    there is no package called 'devtools'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
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
    Error in re-building vignettes:
      ...
    Loading required package: ggplot2
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'dotwhisker-vignette.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# dynutils

Version: 1.0.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# edgarWebR

Version: 1.0.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
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
    
    This is dlnm 2.3.6. For details: help(dlnm) and vignette('dlnmOverview').
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

# emuR

Version: 1.1.1

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
        R         3.1Mb
        doc       1.2Mb
        extdata   1.5Mb
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
      installed size is  7.1Mb
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

Version: 0.2.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.0Mb
      sub-directories of 1Mb or more:
        exiftool  12.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# filesstrings

Version: 3.0.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘dplyr’
    ```

# fingertipscharts

Version: 0.0.2

## In both

*   checking examples ... ERROR
    ```
    ...
    > region <- "North East region"
    > top_names <- c("England", region)
    > dfdom <- fingertips_data(DomainID = 1938132762) %>%
    + group_by(IndicatorID) %>%
    +         filter(((IndicatorID == 41001 &
    +                          Timeperiod == "2014 - 16" &
    +                          Sex == "Persons") |
    +                         (IndicatorID == 91393 &
    +                                  Timeperiod == "2011 - 15" &
    +                                  Sex == "Female") |
    +                         (IndicatorID == 92607 &
    +                                  Timeperiod == "2016" &
    +                                  Sex == "Not applicable")) &
    +                        (AreaName %in% top_names |
    +                                 ParentName == region)) %>%
    +         ungroup() %>%
    +         mutate(Value = round(Value, 1))
    Error in mutate_impl(.data, dots) : 
      Evaluation error: object 'Indicator Name' not found.
    Calls: %>% ... as.data.frame -> mutate -> mutate.tbl_df -> mutate_impl
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      23: function_list[[k]](value)
      24: mutate_at(., .vars = character_fields, as.character)
      25: mutate(.tbl, !!!funs)
      26: mutate.data.frame(.tbl, !!!funs)
      27: as.data.frame(mutate(tbl_df(.data), ...))
      28: mutate(tbl_df(.data), ...)
      29: mutate.tbl_df(tbl_df(.data), ...)
      30: mutate_impl(.data, dots)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 40 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test-examples.R#126) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Warning: Removed 2 rows containing missing values (geom_point).
    Quitting from lines 224-235 (quick_charts.Rmd) 
    Error: processing vignette 'quick_charts.Rmd' failed with diagnostics:
    Evaluation error: object 'Indicator Name' not found.
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘mapproj’
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

# forestmangr

Version: 0.9.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘covr’ ‘curl’ ‘graphics’ ‘htmltools’ ‘psych’ ‘rmarkdown’ ‘scales’
      All declared Imports should be used.
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

## Newly broken

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
    Error in exists("chain_parts", env) : invalid 'envir' argument
    Calls: is.output.same -> find_call_piped -> exists
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
         })(.x, .f, ..., .init, .dir)
      7: reduce_impl(.x, .f, ..., .init = .init, .dir = .dir) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmphmLsVj/R.INSTALLe86e71f0f301/purrr/R/reduce.R:125
      8: fn(out, elt, ...) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmphmLsVj/R.INSTALLe86e71f0f301/purrr/R/reduce.R:158
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 14 SKIPPED: 0 FAILED: 5
      1. Error: is.output.same returns logical (@test-is-output-same.R#4) 
      2. Error: is.output.same returns false for outputs of different class (@test-is-output-same.R#8) 
      3. Error: find_call_piped return has type 'language' (@test_find_call_piped.R#4) 
      4. Error: tictocify functions work when duped args are given (@test_tictocify.R#15) 
      5. Error: tictocify produces equal output to original (@test_tictocify.R#20) 
      
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

# GA4GHshiny

Version: 1.2.0

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

# getTBinR

Version: 0.5.6

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
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

Version: 0.7.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      10: `[[<-.data.frame`(`*tmp*`, i, value = c(2, 3, 4, 0, 3, 1, 1, 8, 2, 0, 2, 2, 0, 2, 
         0, 5, 0, 0, 1, 3, 0, 0, 1, 8, 1, 3, 0, 12, 2, 0, 0, 0, 1, 1, 0, 2, 0, 5, 3, 1, 2, 
         1, 0, 0, 1, 2, 0, 0, 11, 0, 0, 0, 1, 1, 1, 0, 12, 9, 5, 5, 19, 17, 20, 14, 14, 16, 
         18, 8, 10, 7, 6, 13, 25, 24, 3, 14, 17, 18, 19, 8, 9, 6, 5, 22, 7, 6, 8, 6, 21, 21, 
         18, 20, 25, 22, 19, 21, 8, 7, 6, 5, 20, 22, 19, 23, 8, 2, 3, 2, 18, 14, 14, 15)) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmphmLsVj/R.INSTALLe86e71f0f301/purrr/R/modify.R:156
      11: stop(sprintf(ngettext(N, "replacement has %d row, data has %d", "replacement has %d rows, data has %d"), 
             N, nrows), domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 36 SKIPPED: 50 FAILED: 2
      1. Error: ggeffects, glm (@test-glm.R#41) 
      2. Error: ggeffects, glm, robust (@test-glm.R#52) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Model has log-transformed predictors. Consider using `terms="hp [exp]"` to back-transform scale.
    Model has log-transformed predictors. Consider using `terms="hp [exp]"` to back-transform scale.
    Model has log-transformed predictors. Consider using `terms="hp [exp]"` to back-transform scale.
    Loading required package: Matrix
    singular fit
    Model contains polynomial or cubic / quadratic terms. Consider using `terms="c12hour [all]"` to if you want smooth plots. See also package-vignette 'Marginal Effects at Specific Values'.
    Model contains polynomial or cubic / quadratic terms. Consider using `terms="c12hour [all]"` to if you want smooth plots. See also package-vignette 'Marginal Effects at Specific Values'.
    Model contains polynomial or cubic / quadratic terms. Consider using `terms="c12hour [all]"` to if you want smooth plots. See also package-vignette 'Marginal Effects at Specific Values'.
    Model contains polynomial or cubic / quadratic terms. Consider using `terms="c12hour [all]"` to if you want smooth plots. See also package-vignette 'Marginal Effects at Specific Values'.
    Model contains polynomial or cubic / quadratic terms. Consider using `terms="c12hour [all]"` to if you want smooth plots. See also package-vignette 'Marginal Effects at Specific Values'.
    Model contains polynomial or cubic / quadratic terms. Consider using `terms="c12hour [all]"` to if you want smooth plots. See also package-vignette 'Marginal Effects at Specific Values'.
    Standard errors are on link-scale (untransformed).
    Quitting from lines 64-76 (plotmethod.Rmd) 
    Error: processing vignette 'plotmethod.Rmd' failed with diagnostics:
    replacement has 112 rows, data has 56
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘ordinal’
    ```

# ggformula

Version: 0.9.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
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

# ggpubr

Version: 0.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘FactoMineR’
    ```

# ggstatsplot

Version: 0.0.7

## In both

*   R CMD check timed out
    

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘glmmTMB’
      All declared Imports should be used.
    ```

# ggthemes

Version: 4.0.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 138 marked UTF-8 strings
    ```

# ggtree

Version: 1.12.7

## In both

*   checking whether package ‘ggtree’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/ggtree/new/ggtree.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ggtree’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
Error : object ‘as_data_frame’ is not exported by 'namespace:tidytree'
ERROR: lazy loading failed for package ‘ggtree’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/ggtree/new/ggtree.Rcheck/ggtree’

```
### CRAN

```
* installing *source* package ‘ggtree’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
Error : object ‘as_data_frame’ is not exported by 'namespace:tidytree'
ERROR: lazy loading failed for package ‘ggtree’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/ggtree/old/ggtree.Rcheck/ggtree’

```
# gitlabr

Version: 0.9

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# googledrive

Version: 0.1.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: abort(msg) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmphmLsVj/R.INSTALLe86e71f0f301/purrr/R/as_mapper.R:137
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 239 SKIPPED: 61 FAILED: 8
      1. Failure: drive_mkdir() catches invalid parameters (@test-drive_mkdir.R#119) 
      2. Error: generate_request() basically works (@test-generate_request.R#5) 
      3. Failure: generate_request() errors for unrecognized parameters (@test-generate_request.R#15) 
      4. Error: generate_request() and build_request() can deliver same result (@test-generate_request.R#26) 
      5. Error: generate_request() sends no API key if token is non-NULL (@test-generate_request.R#41) 
      6. Error: generate_request() adds built-in API key when token = NULL (@test-generate_request.R#50) 
      7. Error: generate_request() prefers explicit API key to built-in (@test-generate_request.R#59) 
      8. Error: key argument overrides key in params of generate_request() (@test-generate_request.R#76) 
      
      Error: testthat unit tests failed
      Execution halted
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

Version: 0.5.0

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

# healthcareai

Version: 2.2.0

## In both

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘healthcareai-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: evaluate
    > ### Title: Get model performance metrics
    > ### Aliases: evaluate evaluate.predicted_df evaluate.model_list
    > 
    > ### ** Examples
    > 
    > models <- machine_learn(pima_diabetes[1:40, ],
    +                        patient_id,
    +                        outcome = diabetes,
    +                        models = c("XGB", "RF"),
    +                        tune = FALSE,
    +                        n_folds = 3)
    Training new data prep recipe...
    
    Error in lapply(newdata[vars], function(x) { : 
      argument "newdata" is missing, with no default
    Calls: machine_learn ... <Anonymous> -> prep.recipe -> bake -> bake.step_missing -> lapply
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat-5.R’ failed.
    Last 13 lines of output:
      3: recipes::prep(recipe, training = d) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/healthcareai/new/healthcareai.Rcheck/00_pkg_src/healthcareai/R/prep_data.R:432
      4: prep.recipe(recipe, training = d)
      5: bake(x$steps[[i]], new_data = training)
      6: bake.step_missing(x$steps[[i]], new_data = training)
      7: lapply(newdata[vars], function(x) {
             levels(x) <- c(levels(x), "missing")
             x
         }) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/healthcareai/new/healthcareai.Rcheck/00_pkg_src/healthcareai/R/step_hcai_missing.R:128
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 1
      1. Error: the fundamentals work (@test-cran_only.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# highcharter

Version: 0.5.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.9Mb
      sub-directories of 1Mb or more:
        doc          13.7Mb
        htmlwidgets   1.8Mb
    ```

# hpiR

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘knitr’
      All declared Imports should be used.
    ```

# HURDAT

Version: 0.2.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# hurricaneexposure

Version: 0.0.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    ```

# imager

Version: 0.41.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -Dcimg_r_mode -fpermissive -I/usr/X11R6/include -I/opt/X11/include  -I"/Users/lionel/Desktop/lowliner/revdep/library.noindex/imager/Rcpp/include" -I"/Users/lionel/Desktop/lowliner/revdep/checks.noindex/imager/new/imager.Rcheck/imager/include" -I"/private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpstCOW6/sourceCpp-x86_64-apple-darwin15.6.0-1.0.0" -I/usr/local/include   -fPIC  -mtune=core2 -O3 -c file31ff41341ac7.cpp -o file31ff41341ac7.o
      clang++ -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o sourceCpp_2.so file31ff41341ac7.o -lX11 -L/usr/X11R6/lib -L/opt/X11/include -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
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
      installed size is 10.7Mb
      sub-directories of 1Mb or more:
        data      1.4Mb
        doc       1.1Mb
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

Version: 0.1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        R      1.0Mb
        data   3.0Mb
        help   1.1Mb
    ```

# interplot

Version: 0.2.1

## In both

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

# konfound

Version: 0.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 42-43 (Introduction_to_konfound.Rmd) 
    Error: processing vignette 'Introduction_to_konfound.Rmd' failed with diagnostics:
    there is no package called 'devtools'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# LAGOSNE

Version: 1.1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# LipidMS

Version: 1.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.6Mb
      sub-directories of 1Mb or more:
        R      2.1Mb
        data   5.9Mb
    ```

# listarrays

Version: 0.1.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘keras’
    ```

# memery

Version: 0.5.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘colourpicker’ ‘shinyBS’ ‘shinycssloaders’
      All declared Imports should be used.
    ```

# metagene

Version: 2.12.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘EnsDb.Hsapiens.v86’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# metagenomeFeatures

Version: 2.0.0

## In both

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
    ── Attaching packages ────────────────────────────────── tidyverse 1.2.1 ──
    ✔ ggplot2 3.1.0          ✔ purrr   0.2.5.9000
    ✔ tibble  1.4.2          ✔ dplyr   0.7.8     
    ✔ tidyr   0.8.2          ✔ stringr 1.3.1     
    ✔ readr   1.3.0          ✔ forcats 0.3.0     
    ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
    ✖ ggplot2::Position() masks BiocGenerics::Position(), base::Position()
    ✖ dplyr::combine()    masks Biobase::combine(), BiocGenerics::combine()
    ✖ dplyr::filter()     masks stats::filter()
    ✖ dplyr::lag()        masks stats::lag()
    Quitting from lines 106-120 (database-explore.Rmd) 
    Error: processing vignette 'database-explore.Rmd' failed with diagnostics:
    package or namespace load failed for 'ggtree':
     object 'as_data_frame' is not exported by 'namespace:tidytree'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
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

Version: 0.1.2

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

Version: 0.1.2

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
         }, "object 'boxes' not found", quote(eval(code, test_env))) at testthat/test_phenomena.R:30
      2: eval(code, test_env)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 9 SKIPPED: 35 FAILED: 7
      1. Error: osem_box_to_archive_name works for one box (@test_archive.R#23) 
      2. Error: osem_box_to_archive_name works for multiple boxes (@test_archive.R#29) 
      3. Error: osem_measurements_archive works for one box (@test_archive.R#41) 
      4. Error: osem_measurements_archive fails for multiple boxes (@test_archive.R#47) 
      5. Error: summary.sensebox outputs all metrics for a single box (@test_box.R#42) 
      6. Failure: data.frame can be converted to measurements data.frame (@test_measurements.R#128) 
      7. Error: phenomena from a not sensebox data.frame returns error (@test_phenomena.R#30) 
      
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

# openVA

Version: 1.0.7

## In both

*   checking whether package ‘openVA’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/openVA/new/openVA.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘openVA’ ...
** package ‘openVA’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Unable to find any JVMs matching version "(null)".
No Java runtime present, try --request to install.
Warning in system("/usr/libexec/java_home", intern = TRUE) :
  running command '/usr/libexec/java_home' had status 1
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/lionel/Desktop/lowliner/revdep/library.noindex/openVA/rJava/libs/rJava.so':
  dlopen(/Users/lionel/Desktop/lowliner/revdep/library.noindex/openVA/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/lionel/Desktop/lowliner/revdep/library.noindex/openVA/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘openVA’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/openVA/new/openVA.Rcheck/openVA’

```
### CRAN

```
* installing *source* package ‘openVA’ ...
** package ‘openVA’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Unable to find any JVMs matching version "(null)".
No Java runtime present, try --request to install.
Warning in system("/usr/libexec/java_home", intern = TRUE) :
  running command '/usr/libexec/java_home' had status 1
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/lionel/Desktop/lowliner/revdep/library.noindex/openVA/rJava/libs/rJava.so':
  dlopen(/Users/lionel/Desktop/lowliner/revdep/library.noindex/openVA/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/lionel/Desktop/lowliner/revdep/library.noindex/openVA/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘openVA’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/openVA/old/openVA.Rcheck/openVA’

```
# optiSel

Version: 2.0.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    pandoc-citeproc: when expecting a product (:*:), encountered Object instead
    Error running filter /usr/local/bin/pandoc-citeproc:
    Filter returned error status 1
    Error: processing vignette 'ocs-vignette.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    Execution halted
    ```

# parsnip

Version: 0.0.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      7: tibble(name = names(res), varying = unname(res), id = id, type = caller_method(cl)) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/parsnip/new/parsnip.Rcheck/00_pkg_src/parsnip/R/varying.R:120
      8: as_tibble(lst_quos(xs, expand = TRUE))
      9: as_tibble.list(lst_quos(xs, expand = TRUE))
      10: list_to_tibble(x, validate)
      11: check_tibble(x)
      12: invalid_df("must be [a] 1d atomic vector(s) or [a] list(s)", x, !is_1d)
      13: stopc(pluralise_msg("Column(s) ", vars), " ", pluralise(problem, vars))
      14: abort(paste0(...))
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 453 SKIPPED: 77 FAILED: 1
      1. Error: recipe parameters (@test_varying.R#99) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# pcr

Version: 1.1.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
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

# pkgdown

Version: 1.3.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(pkgdown)
      > 
      > test_check("pkgdown")
      ── 1. Failure: intermediate files cleaned up automatically (@test-build_home.R#2
      dir(pkg) not set-equal to c("docs", "man", "NAMESPACE", "DESCRIPTION", "README.md", "README.Rmd").
      Lengths differ: 5 is not 6
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 281 SKIPPED: 9 FAILED: 1
      1. Failure: intermediate files cleaned up automatically (@test-build_home.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘devtools’
    ```

# PKPDmisc

Version: 2.1.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 84-85 (multiplot.Rmd) 
    Error: processing vignette 'multiplot.Rmd' failed with diagnostics:
    there is no package called 'devtools'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# plotly

Version: 4.8.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        R             2.3Mb
        htmlwidgets   3.1Mb
    ```

# pmatch

Version: 0.1.4

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      36: callbacks$call(expr, params = params, topdown = topdown, wflags = wflags, ...)
      37: next_cb(expr, env = env, params = params, wflags = wflags, ...)
      38: next_cb(expr, env = env, params = params, wflags = wflags, ...)
      39: next_cb(expr, env = env, params = params, wflags = wflags, ...)
      40: fn(expr, next_cb = next_cb, ...)
      41: rlang::call_name(expr)
      42: abort_call_input_type("call") at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/Rtmp89aLxK/R.INSTALLe8197c354434/rlang/R/call.R:707
      43: abort(sprintf("`%s` must be a quoted call", arg)) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/Rtmp89aLxK/R.INSTALLe8197c354434/rlang/R/call.R:584
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 165 SKIPPED: 0 FAILED: 1
      1. Error: we can translate a function that call cases into one that doesn't (@test-transforms.R#34) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# PopED

Version: 0.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# postal

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      17: .f(.x[[i]], ...) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmphmLsVj/R.INSTALLe86e71f0f301/purrr/R/map.R:134
      18: readr::write_csv(this, write_to, append = TRUE, col_names = FALSE) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/postal/new/postal.Rcheck/00_pkg_src/postal/R/fetch_zones_all.R:57
      19: write_delim(x, path, delim = ",", na = na, append = append, col_names = col_names, 
             quote_escape = quote_escape) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpEGCpJR/R.INSTALLec16439bbe3e/readr/R/write.R:86
      20: stream_delim(x, path, delim = delim, col_names = col_names, append = append, na = na, 
             quote_escape = quote_escape) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpEGCpJR/R.INSTALLec16439bbe3e/readr/R/write.R:76
      21: open(path, "ab") at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmpEGCpJR/R.INSTALLec16439bbe3e/readr/R/write.R:213
      22: open.connection(path, "ab")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 109 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test_fetch_zones.R#144) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# processmapR

Version: 0.3.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘viridis’
      All declared Imports should be used.
    ```

# proustr

Version: 0.2.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 20105 marked UTF-8 strings
    ```

# psychmeta

Version: 2.2.1

## In both

*   checking whether the package can be loaded ... ERROR
    ```
    Loading this package had a fatal error status code 1
    Loading log:
    -----------------------------------------------------  psychmeta version 2.2.1  --
    
    Please report any bugs to github.com/psychmeta/psychmeta/issues
    or issues@psychmeta.com
    
    We work hard to produce these open-source tools for the R community, 
    please cite psychmeta when you use it in your research: 
      Dahlke, J. A., & Wiernik, B. M. (2018). psychmeta: An R package for 
         psychometric meta-analysis. Applied Psychological Measurement. 
         Advance online publication. https://doi.org/10.1177/0146621618795933
    
    Find info about psychmeta on the web at psychmeta.com and twitter.com/psychmetaR
    Error: package or namespace load failed for ‘psychmeta’:
     .onAttach failed in attachNamespace() for 'psychmeta', details:
      call: open.connection(x, "rb")
      error: HTTP error 502.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.8Mb
      sub-directories of 1Mb or more:
        R   7.0Mb
    ```

# psycho

Version: 0.3.7

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        doc   4.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# qqplotr

Version: 0.0.3

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

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

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6 marked UTF-8 strings
    ```

# quanteda

Version: 1.3.14

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        R      3.0Mb
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
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        R      2.1Mb
        doc    1.9Mb
        libs   2.2Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# rclimateca

Version: 1.0.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
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
      OK: 1118 SKIPPED: 9 FAILED: 1
      1. Error: printing (@test_ica.R#127) 
      
      Error: testthat unit tests failed
      Execution halted
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

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 44 marked UTF-8 strings
    ```

# rhierbaps

Version: 1.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in block_exec(params) :
      Failed to tidy R code in chunk 'unnamed-chunk-1'. Reason:
    Error in loadNamespace(name) : there is no package called 'formatR'
    
    Quitting from lines 40-46 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    package or namespace load failed for 'ggtree':
     object 'as_data_frame' is not exported by 'namespace:tidytree'
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

# rmsfuns

Version: 0.0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Missing or unexported object: ‘base::shell.exec’
    ```

# rnoaa

Version: 0.8.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: tibble::as_data_frame(stats::setNames(cbind(expand.grid(longs, lats), res), c("lon", 
             "lat", "precip"))) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/rnoaa/new/rnoaa.Rcheck/00_pkg_src/rnoaa/R/arc2.R:78
      4: stats::setNames(cbind(expand.grid(longs, lats), res), c("lon", "lat", "precip")) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/rnoaa/new/rnoaa.Rcheck/00_pkg_src/rnoaa/R/arc2.R:78
      5: cbind(expand.grid(longs, lats), res) at /Users/lionel/Desktop/lowliner/revdep/checks.noindex/rnoaa/new/rnoaa.Rcheck/00_pkg_src/rnoaa/R/arc2.R:78
      6: cbind(deparse.level, ...)
      7: data.frame(..., check.names = FALSE)
      8: stop(gettextf("arguments imply differing number of rows: %s", paste(unique(nrows), 
             collapse = ", ")), domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 93 SKIPPED: 50 FAILED: 1
      1. Error: arc2 returns the expected output (@test-arc2.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        vign   1.2Mb
    ```

# roxygen2

Version: 6.1.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘devtools’
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

Version: 1.10.0

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
      Welcome to the RTCGA (version: 1.10.0).
      > library(RTCGA.rnaseq)
      Error in library(RTCGA.rnaseq) : 
        there is no package called 'RTCGA.rnaseq'
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘devtools’ ‘RTCGA.rnaseq’ ‘RTCGA.clinical’ ‘RTCGA.mutations’
      ‘RTCGA.RPPA’ ‘RTCGA.mRNA’ ‘RTCGA.miRNASeq’ ‘RTCGA.methylation’
      ‘RTCGA.CNV’ ‘RTCGA.PANCAN12’
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
    Packages unavailable to check Rd xrefs: ‘RTCGA.rnaseq’, ‘RTCGA.clinical’, ‘RTCGA.mutations’, ‘RTCGA.CNV’, ‘RTCGA.RPPA’, ‘RTCGA.mRNA’, ‘RTCGA.miRNASeq’, ‘RTCGA.methylation’, ‘devtools’
    ```

# rtrek

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 992 marked UTF-8 strings
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

# SCORPIUS

Version: 1.0.2

## In both

*   checking whether package ‘SCORPIUS’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/SCORPIUS/new/SCORPIUS.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘SCORPIUS’ ...
** package ‘SCORPIUS’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘SCORPIUS’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/SCORPIUS/new/SCORPIUS.Rcheck/SCORPIUS’

```
### CRAN

```
* installing *source* package ‘SCORPIUS’ ...
** package ‘SCORPIUS’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘SCORPIUS’
* removing ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/SCORPIUS/old/SCORPIUS.Rcheck/SCORPIUS’

```
# scriptName

Version: 1.0.0

## Newly broken

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
    Error: Predicate functions must return a single logical `TRUE` or `FALSE`, not a logical vector of length 0
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
      OK: 12 SKIPPED: 0 FAILED: 6
      1. Failure: functions work under R --file (@test.all.R#22) 
      2. Failure: functions work under R --file (@test.all.R#23) 
      3. Failure: functions work under R -f (@test.all.R#33) 
      4. Failure: functions work under R -f (@test.all.R#34) 
      5. Failure: functions work under Rscript (@test.all.R#44) 
      6. Failure: functions work under Rscript (@test.all.R#45) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# sergeant

Version: 0.5.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Unable to find any JVMs matching version "(null)".
    No Java runtime present, try --request to install.
    ```

# sevenC

Version: 1.0.0

## In both

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
    
    convert: profile 'icc': 'RGB ': RGB color space not permitted on grayscale PNG `sevenC_files/figure-html/unnamed-chunk-21-1.png' @ warning/png.c/MagickPNGWarningHandler/1656.
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

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > presever_rownames = function(mat)
    + {
    +   rn = rownames(mat)
    +   ret = tibble::as_tibble(mat)
    +   ret$term = rn
    +   ret
    + }
    > 
    > eg <- eval_tibbles(
    +   expand_tibble(fun="regData", n=5L, SD=1:2),
    +   expand_tibble(proc="lm", formula=c("y~x", "y~I(x^2)")),
    +   post_analyze = purrr::compose(presever_rownames, coef, summary),
    +   #post_analyze = broom::tidy, # is a nice out of the box alternative
    +   summary_fun = list(mean = mean, sd = sd),
    +   group_for_summary = "term",
    +   replications=3
    + )
    Error in bind_rows_(x, .id) : 
      Argument 1 must be a data frame or a named atomic vector, not a summary.lm
    Calls: eval_tibbles ... bind_or_combine -> do.call -> bind_rows -> bind_rows_
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [1] "Estimated replications per hour:  3016339"
      [1] "Estimated replications per hour:  368852"
      [1] "Estimated replications per hour:  3440382"
      [1] "Estimated replications per hour:  373471"
      ── 1. Failure: Post analyze function works (@test_eval_tibbles.R#239)  ─────────
      eg$simulation not identical to `expected_df`.
      Cols in y but not x: `max`, `min`. 
      Cols in x but not y: `results`. 
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 56 SKIPPED: 0 FAILED: 1
      1. Failure: Post analyze function works (@test_eval_tibbles.R#239) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 244-252 (simTool.Rmd) 
    Error: processing vignette 'simTool.Rmd' failed with diagnostics:
    Argument 1 must be a data frame or a named atomic vector, not a summary.lm
    Execution halted
    ```

# SingleCaseES

Version: 0.4.0

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

Version: 0.17.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘arm’
    ```

# skimr

Version: 1.0.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: (function (..., na.rm = FALSE) 
         .Primitive("min")(..., na.rm))(na.rm = ~TRUE, ...) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/Rtmp89aLxK/R.INSTALLe8197c354434/rlang/R/eval-tidy.R:153
      7: Summary.difftime(structure(c(-30, NA, -10, 0, 10, 20, 30, 40, 50, 60), class = "difftime", units = "secs"), 
             TRUE, na.rm = FALSE)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 421 SKIPPED: 2 FAILED: 5
      1. Failure: skim_v returns expected response for Date vectors (@test-skim_v.R#162) 
      2. Failure: skim_v handles objects with multiple classes (@test-skim_v.R#180) 
      3. Failure: skim_v returns expected response for ts vectors (@test-skim_v.R#233) 
      4. Failure: skim_v returns expected response for POSIXct vectors (@test-skim_v.R#252) 
      5. Error: skim_v returns expected response for difftime vectors (@test-skim_v.R#318) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# sparklyr

Version: 0.9.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        R      4.1Mb
        java   1.9Mb
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

# stminsights

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘huge’ ‘readr’ ‘scales’ ‘shinyjs’
      All declared Imports should be used.
    ```

# STRMPS

Version: 0.5.8

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘STRaitRazoR’
    ```

# suropt

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DiceOptim’ ‘GPareto’ ‘rgenoud’ ‘tidyr’
      All declared Imports should be used.
    ```

# survivalAnalysis

Version: 0.1.0

## Newly broken

*   checking whether package ‘survivalAnalysis’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘purrr::flatten_raw’ by ‘rlang::flatten_raw’ when loading ‘survivalAnalysis’
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/survivalAnalysis/new/survivalAnalysis.Rcheck/00install.out’ for details.
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

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
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

# textfeatures

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# tidybayes

Version: 1.0.3

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
      OK: 260 SKIPPED: 2 FAILED: 1
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
      17: .f(.x[[i]], ...) at /private/var/folders/b9/1vbq6rn93_1fk71sn95dqb8r0000gn/T/RtmphmLsVj/R.INSTALLe86e71f0f301/purrr/R/map.R:170
      18: extract_expr(quo)
      19: is_call(expr, paren_sym)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 37 SKIPPED: 0 FAILED: 1
      1. Error: right number of columns given (@test-errors.R#10) 
      
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

# tidyLPA

Version: 0.2.3

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# tidymodels

Version: 0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘dials’ ‘parsnip’
      All declared Imports should be used.
    ```

# tidyquant

Version: 0.5.5

## In both

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

# tidytidbits

Version: 0.1.0

## Newly broken

*   checking whether package ‘tidytidbits’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘purrr::flatten_raw’ by ‘rlang::flatten_raw’ when loading ‘tidytidbits’
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/tidytidbits/new/tidytidbits.Rcheck/00install.out’ for details.
    ```

# tidyverse

Version: 1.2.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dbplyr’ ‘reprex’ ‘rlang’
      All declared Imports should be used.
    ```

# tidyxl

Version: 1.0.3

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

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
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

Version: 0.5.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   4.5Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 64 marked Latin-1 strings
      Note: found 548 marked UTF-8 strings
    ```

# TPP

Version: 3.8.5

## In both

*   R CMD check timed out
    

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

Version: 0.6.2

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

# understandBPMN

Version: 1.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# valaddin

Version: 0.1.2

## Newly broken

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented code objects:
      ‘vld_done_box’
    All user-level objects in a package should have documentation
    entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# valr

Version: 0.4.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# vdiffr

Version: 0.2.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# veccompare

Version: 0.1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘pander’
      All declared Imports should be used.
    ```

# visdat

Version: 0.5.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘plotly’ ‘rlang’
      All declared Imports should be used.
    ```

# voxel

Version: 1.3.5

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# vqtl

Version: 2.0.4

## In both

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
clang: warning: argument unused during compilation: '-L/usr/local/include' [-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-L/opt/local/include' [-Wunused-command-line-argument]
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

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘xml2’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 25 marked UTF-8 strings
    ```

# webTRISr

Version: 0.1.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# wiggleplotr

Version: 1.4.0

## In both

*   checking examples ... ERROR
    ```
    ...
    Loading required package: IRanges
    
    Attaching package: ‘IRanges’
    
    The following objects are masked from ‘package:dplyr’:
    
        collapse, desc, slice
    
    Loading required package: GenomeInfoDb
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
          filter
      
      > 
      > test_check("xpose")
      ── 1. Failure: dot arguments are properly passed to readr (@test-read_nm_tables.
      nrow(...) not equal to 3.
      1/1 mismatches
      [1] 2 - 3 == -1
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 523 SKIPPED: 6 FAILED: 1
      1. Failure: dot arguments are properly passed to readr (@test-read_nm_tables.R#57) 
      
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

