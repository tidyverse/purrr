# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.2 (2016-10-31) |
|system   |x86_64, darwin13.4.0         |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |Europe/Brussels              |
|date     |2017-04-21                   |

## Packages

|package  |*  |version |date       |source                          |
|:--------|:--|:-------|:----------|:-------------------------------|
|covr     |   |2.2.2   |2017-01-05 |CRAN (R 3.3.2)                  |
|dplyr    |   |0.5.0   |2016-06-24 |CRAN (R 3.3.0)                  |
|lazyeval |   |0.2.0   |2016-06-12 |CRAN (R 3.3.0)                  |
|magrittr |   |1.5     |2014-11-22 |CRAN (R 3.3.0)                  |
|purrr    |   |0.2.2.1 |2017-04-21 |local (hadley/lowliner@7029495) |
|Rcpp     |   |0.12.10 |2017-03-19 |CRAN (R 3.3.2)                  |
|testthat |   |1.0.2   |2016-04-23 |CRAN (R 3.3.0)                  |
|tibble   |   |1.3.0   |2017-04-01 |CRAN (R 3.3.2)                  |

# Check results
10 packages with problems

## broom (0.4.2)
Maintainer: David Robinson <admiral.david@gmail.com>  
Bug reports: http://github.com/tidyverse/broom/issues

0 errors | 1 warning  | 0 notes

```
checking Rd cross-references ... WARNING
Missing link or links in documentation object 'cch_tidiers.Rd':
  ‘cch’

Missing link or links in documentation object 'coxph_tidiers.Rd':
  ‘predict.coxph’ ‘residuals.coxph’

Missing link or links in documentation object 'pyears_tidiers.Rd':
  ‘pyears’

Missing link or links in documentation object 'survfit_tidiers.Rd':
  ‘print.survfit’

See section 'Cross-references' in the 'Writing R Extensions' manual.

```

## eechidna (0.1)
Maintainer: Ben Marwick <benmarwick@gmail.com>

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...

Attaching package: 'scales'

The following object is masked from 'package:purrr':

    discard

... 8 lines ...

Attaching package: 'GGally'

The following object is masked from 'package:dplyr':

    nasa

Quitting from lines 337-354 (exploring-election-data.Rmd) 
Error: processing vignette 'exploring-election-data.Rmd' failed with diagnostics:
could not find function "dmap"
Execution halted
```

## fuzzr (0.2.0)
Maintainer: Matthew Lincoln <matthew.d.lincoln@gmail.com>  
Bug reports: https://github.com/mdlincoln/fuzzr/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  Type 'demo()' for some demos, 'help()' for on-line help, or
  'help.start()' for an HTML browser interface to help.
  Type 'q()' to quit R.
  
  > library(testthat)
  > library(fuzzr)
  > 
  > test_check("fuzzr")
  Error: `map_df()` requires dplyr
  testthat results ================================================================
  OK: 28 SKIPPED: 0 FAILED: 0
  Execution halted
```

## gdns (0.2.0)
Maintainer: Bob Rudis <bob@rud.is>

2 errors | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘gdns-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: bulk_query
> ### Title: Vectorized query, returning only answers in a data frame
> ### Aliases: bulk_query
> 
> ### ** Examples
> 
> hosts <- c("rud.is", "dds.ec", "r-project.org", "rstudio.com", "apple.com")
> gdns::bulk_query(hosts)
Error: `map_df()` requires dplyr
Execution halted

checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  > test_check("gdns")
  1. Error: we can do something (@test-gdns.R#7) ---------------------------------
  `map_df()` requires dplyr
  1: gdns::bulk_query(doms) at testthat/test-gdns.R:7
  2: map_df(results, "Answer")
  3: stop("`map_df()` requires dplyr", call. = FALSE)
  
  testthat results ================================================================
  OK: 1 SKIPPED: 0 FAILED: 1
  1. Error: we can do something (@test-gdns.R#7) 
  
  Error: testthat unit tests failed
  Execution halted
```

## giphyr (0.1.0)
Maintainer: Hao Zhu <haozhu233@gmail.com>  
Bug reports: https://github.com/haozhu233/giphyr/issues

1 error  | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘giphyr-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: gif_search
> ### Title: Search GIFs by key words throught giphy API
> ### Aliases: gif_search
> 
> ### ** Examples
> 
> gif_search("cat")
Error: `map_df()` requires dplyr
Execution halted
```

## gutenbergr (0.1.2)
Maintainer: David Robinson <admiral.david@gmail.com>  
Bug reports: http://github.com/ropenscilabs/gutenbergr/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  > library(gutenbergr)
  > 
  > test_check("gutenbergr")
  1. Failure: read_zip_url can download and read a zip file (@test-utils.R#7) ----
  any(z == "Congress shall make no law respecting an establishment of religion,") isn't true.
  
  
  testthat results ================================================================
  OK: 46 SKIPPED: 0 FAILED: 1
  1. Failure: read_zip_url can download and read a zip file (@test-utils.R#7) 
  
  Error: testthat unit tests failed
  Execution halted
```

## imager (0.40.1)
Maintainer: Simon Barthelme <simon.barthelme@gipsa-lab.fr>  
Bug reports: https://github.com/dahtah/imager/issues

0 errors | 1 warning  | 1 note 

```
checking whether package ‘imager’ can be installed ... WARNING
Found the following significant warnings:
  ../inst/include/CImg.h:224:5: warning: 'long long' is a C++11 extension [-Wc++11-long-long]
  ../inst/include/CImg.h:14876:29: warning: multiple unsequenced modifications to 'ptrs' [-Wunsequenced]
  ../inst/include/CImg.h:15055:19: warning: multiple unsequenced modifications to 'ptrs' [-Wunsequenced]
  ../inst/include/CImg.h:25383:23: warning: unsequenced modification and access to 'right' [-Wunsequenced]
  ../inst/include/CImg.h:32971:35: warning: unsequenced modification and access to '_n2x' [-Wunsequenced]
  ../inst/include/CImg.h:32971:35: warning: multiple unsequenced modifications to '_n3x' [-Wunsequenced]
  ../inst/include/CImg.h:32971:35: warning: unsequenced modification and access to '_n1x' [-Wunsequenced]
  ../inst/include/CImg.h:32991:40: warning: unsequenced modification and access to '_n2x' [-Wunsequenced]
... 13 lines ...
  ../inst/include/CImg.h:35471:17: warning: unsequenced modification and access to '_n1x' [-Wunsequenced]
  ../inst/include/CImg.h:35483:17: warning: unsequenced modification and access to '_n2x' [-Wunsequenced]
  ../inst/include/CImg.h:35483:17: warning: multiple unsequenced modifications to '_n3x' [-Wunsequenced]
  ../inst/include/CImg.h:35483:17: warning: unsequenced modification and access to '_n1x' [-Wunsequenced]
  ../inst/include/CImg.h:48268:18: warning: unsequenced modification and access to 'err' [-Wunsequenced]
  ../inst/include/CImg.h:48276:18: warning: unsequenced modification and access to 'err' [-Wunsequenced]
  ../inst/include/CImg.h:48286:22: warning: unsequenced modification and access to 'err' [-Wunsequenced]
  ../inst/include/CImg.h:48470:18: warning: unsequenced modification and access to 'err' [-Wunsequenced]
  ../inst/include/CImg.h:48478:18: warning: unsequenced modification and access to 'err' [-Wunsequenced]
  ../inst/include/CImg.h:48487:20: warning: unsequenced modification and access to 'err' [-Wunsequenced]
See ‘/Users/lionel/Dropbox/Projects/R/hadley/lowliner/revdep/checks/imager.Rcheck/00install.out’ for details.

checking installed package size ... NOTE
  installed size is 12.8Mb
  sub-directories of 1Mb or more:
    data      1.4Mb
    doc       4.2Mb
    include   2.8Mb
    libs      2.9Mb
```

## tidyquant (0.5.0)
Maintainer: Matt Dancho <mdancho@business-science.io>  
Bug reports: https://github.com/business-science/tidyquant/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
   This  behavior  will be  phased out in 0.5-0  when the call  will
   default to use auto.assign=FALSE. getOption("getSymbols.env") and 
   getOptions("getSymbols.auto.assign") are now checked for alternate defaults
  
   This message is shown once per session and may be disabled by setting 
   options("getSymbols.warning4.0"=FALSE). See ?getSymbols for more details.
  Error in names(coredata(x)) <- value : 
    'names' attribute [1] must be the same length as the vector [0]
  Calls: test_check ... tq_get_base -> tq_get_util_1 -> names<- -> names<-.zoo
  testthat results ================================================================
  OK: 41 SKIPPED: 1 FAILED: 0
  Execution halted
```

## tidytext (0.1.2)
Maintainer: Julia Silge <julia.silge@gmail.com>  
Bug reports: http://github.com/juliasilge/tidytext/issues

2 errors | 1 warning  | 0 notes

```
checking examples ... ERROR
Running examples in ‘tidytext-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: corpus_tidiers
> ### Title: Tidiers for a corpus object from the quanteda package
> ### Aliases: corpus_tidiers glance.corpus tidy.corpus
> 
> ### ** Examples
> 
> 
> if (requireNamespace("quanteda", quietly = FALSE)) {
+  data("inaugCorpus", package = "quanteda")
+ 
+  inaugCorpus
+ 
+  tidy(inaugCorpus)
+ }
Loading required namespace: quanteda
Warning in data("inaugCorpus", package = "quanteda") :
  data set ‘inaugCorpus’ not found
Error: object 'inaugCorpus' not found
Execution halted

checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  7: quanteda::inaugCorpus
  8: getExportedValue(pkg, name)
  9: stop(gettextf("'%s' is not an exported object from 'namespace:%s'", name, getNamespaceName(ns)), 
         call. = FALSE, domain = NA)
  
  testthat results ================================================================
  OK: 126 SKIPPED: 0 FAILED: 3
  1. Error: Can tidy corpus from quanteda package (@test-corpus-tidiers.R#23) 
  2. Error: can tidy a quanteda dictionary (@test-dictionary-tidiers.R#9) 
  3. Error: Can tidy dfm from quanteda (@test-sparse-tidiers.R#28) 
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
The following objects are masked from 'package:stats':

    filter, lag

The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union
... 8 lines ...

The following object is masked from 'package:ggplot2':

    annotate

Warning in data("inaugCorpus", package = "quanteda") :
  data set 'inaugCorpus' not found
Quitting from lines 79-85 (tidying_casting.Rmd) 
Error: processing vignette 'tidying_casting.Rmd' failed with diagnostics:
object 'inaugCorpus' not found
Execution halted
```

## wand (0.2.0)
Maintainer: Bob Rudis <bob@rud.is>  
Bug reports: https://github.com/hrbrmstr/wand/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘wand’ can be installed ... ERROR
Installation failed.
See ‘/Users/lionel/Dropbox/Projects/R/hadley/lowliner/revdep/checks/wand.Rcheck/00install.out’ for details.
```

