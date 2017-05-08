# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.4.0 (2017-04-21) |
|system   |x86_64, darwin15.6.0         |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |Europe/Brussels              |
|date     |2017-05-08                   |

## Packages

|package  |*  |version |date       |source                          |
|:--------|:--|:-------|:----------|:-------------------------------|
|covr     |   |2.2.2   |2017-01-05 |cran (@2.2.2)                   |
|dplyr    |   |0.5.0   |2016-06-24 |cran (@0.5.0)                   |
|lazyeval |   |0.2.0   |2016-06-12 |cran (@0.2.0)                   |
|magrittr |   |1.5     |2014-11-22 |cran (@1.5)                     |
|purrr    |   |0.2.2.1 |2017-05-08 |local (hadley/lowliner@261462f) |
|Rcpp     |   |0.12.10 |2017-03-19 |cran (@0.12.10)                 |
|testthat |   |1.0.2   |2016-04-23 |cran (@1.0.2)                   |
|tibble   |   |1.3.0   |2017-04-01 |cran (@1.3.0)                   |

# Check results
9 packages with problems

## broom (0.4.2)
Maintainer: David Robinson <admiral.david@gmail.com>  
Bug reports: http://github.com/tidyverse/broom/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘test-all.R’ [24s/26s]
Running the tests in ‘tests/test-all.R’ failed.
Complete output:
  > library(testthat)
  > test_check("broom")
  Loading required package: broom
  Loading required namespace: gam
  error occurred during calling the sampler; sampling not done
  Error in check_stanfit(stanfit) : 
    Invalid stanfit object produced please report bug
  Calls: test_check ... eval -> stan_glmer -> stan_glm.fit -> check_stanfit
  testthat results ================================================================
  OK: 451 SKIPPED: 0 FAILED: 0
  Execution halted
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
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  > library(gdns)
  > 
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

## gutenbergr (0.1.2)
Maintainer: David Robinson <admiral.david@gmail.com>  
Bug reports: http://github.com/ropenscilabs/gutenbergr/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [13s/24s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  > library(testthat)
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

## imager (0.40.2)
Maintainer: Simon Barthelme <simon.barthelme@gipsa-lab.fr>  
Bug reports: https://github.com/dahtah/imager/issues

1 error  | 0 warnings | 1 note 

```
checking whether package ‘imager’ can be installed ... ERROR
Installation failed.
See ‘/Users/lionel/Dropbox/R/hadley/lowliner/revdep/checks/imager.Rcheck/00install.out’ for details.

checking package dependencies ... NOTE
Package which this enhances but not available for checking: ‘spatstat’
```

## purrrlyr (0.0.1)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/purrrlyr/issues

2 errors | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘purrrlyr-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: by_slice
> ### Title: Apply a function to slices of a data frame
> ### Aliases: by_slice
> 
> ### ** Examples
... 15 lines ...
> # by_slice() is especially useful in combination with map().
> 
> # To modify the contents of a data frame, use rows collation. Note
> # that unlike dplyr, Mutating and summarising operations can be
> # used indistinctly.
> 
> # Mutating operation:
> df <- mtcars %>% slice_rows(c("cyl", "am"))
> df %>% by_slice(dmap, ~ .x / sum(.x), .collate = "rows")
Error: 'as_mapper' is not an exported object from 'namespace:purrr'
Execution halted

checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
         call. = FALSE, domain = NA)
  
  testthat results ================================================================
  OK: 69 SKIPPED: 0 FAILED: 8
  1. Error: dmap() returns a data frame (@test-dmap.R#4) 
  2. Error: dmap() works with sliced data frames (@test-dmap.R#9) 
  3. Error: dmap() works with no columns to map (@test-dmap.R#15) 
  4. Error: dmap() recycles only vectors of length 1 (@test-dmap.R#20) 
  5. Error: conditional sliced mapping recycles within groups (@test-dmap.R#26) 
  6. Error: output column is named according to .to (@test-rows.R#21) 
  7. Error: by_slice() works with slicers of different types (@test-rows.R#203) 
  8. Error: by_row() creates indices with c++ style indexing (@test-rows.R#228) 
  
  Error: testthat unit tests failed
  Execution halted

checking dependencies in R code ... NOTE
Missing or unexported object: ‘purrr::as_mapper’
```

## starmie (0.1.2)
Maintainer: Stuart Lee <lee.s@wehi.edu.au>  
Bug reports: https://github.com/sa-lee/starmie/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Packages required but not available:
  ‘iterpc’ ‘combinat’ ‘label.switching’ ‘proxy’ ‘MCL’ ‘ggdendro’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
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
  Running ‘testthat.R’ [14s/15s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  5: eval(expr, pf)
  6: quanteda::dfm(quanteda::inaugCorpus)
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
See ‘/Users/lionel/Dropbox/R/hadley/lowliner/revdep/checks/wand.Rcheck/00install.out’ for details.
```

