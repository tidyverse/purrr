# Setup

## Platform

|setting  |value                                       |
|:--------|:-------------------------------------------|
|version  |R version 3.4.0 Patched (2017-06-13 r72789) |
|system   |x86_64, darwin15.6.0                        |
|ui       |RStudio (1.1.271)                           |
|language |(EN)                                        |
|collate  |en_US.UTF-8                                 |
|tz       |America/Chicago                             |
|date     |2017-06-26                                  |

## Packages

|package   |*  |version    |date       |source                     |
|:---------|:--|:----------|:----------|:--------------------------|
|covr      |   |2.2.2      |2017-01-05 |cran (@2.2.2)              |
|knitr     |   |1.16       |2017-05-18 |cran (@1.16)               |
|purrr     |   |0.2.2.9000 |2017-06-26 |local (tidyverse/purrr@NA) |
|rmarkdown |   |1.6        |2017-06-15 |cran (@1.6)                |
|testthat  |*  |1.0.2      |2016-04-23 |cran (@1.0.2)              |

# Check results

29 packages with problems

|package          |version | errors| warnings| notes|
|:----------------|:-------|------:|--------:|-----:|
|anomalyDetection |0.1.1   |      1|        0|     0|
|broom            |0.4.2   |      2|        0|     0|
|diceR            |0.1.0   |      1|        0|     0|
|eechidna         |1.1     |      0|        1|     1|
|EventStudy       |0.31    |      0|        1|     0|
|fuzzyjoin        |0.1.3   |      2|        0|     2|
|ggeffects        |0.1.2   |      1|        0|     0|
|gglogo           |0.1.3   |      0|        1|     0|
|grattan          |1.5.0.0 |      0|        1|     1|
|highcharter      |0.5.0   |      1|        0|     1|
|imager           |0.40.2  |      1|        0|     1|
|leaflet.esri     |0.2     |      1|        0|     0|
|modelr           |0.1.0   |      2|        0|     0|
|modeval          |0.1.3   |      0|        1|     0|
|nandb            |0.2.0   |      1|        0|     0|
|phylopath        |0.2.3   |      1|        1|     0|
|pollen           |0.52.00 |      1|        1|     0|
|RSQLServer       |0.3.0   |      1|        0|     0|
|sjmisc           |2.5.0   |      1|        0|     0|
|sjstats          |0.10.1  |      1|        0|     0|
|starmie          |0.1.2   |      1|        0|     0|
|tatoo            |1.0.6   |      2|        1|     1|
|tidygenomics     |0.1.0   |      1|        0|     0|
|tidyquant        |0.5.1   |      2|        1|     0|
|unpivotr         |0.1.1   |      1|        0|     0|
|valaddin         |0.1.0   |      1|        1|     0|
|wand             |0.2.0   |      1|        0|     0|
|WRTDStidal       |1.1.0   |      1|        0|     0|
|zeligverse       |0.1.1   |      0|        1|     0|

## anomalyDetection (0.1.1)
Maintainer: Bradley Boehmke <bradleyboehmke@gmail.com>  
Bug reports: https://github.com/bradleyboehmke/anomalyDetection/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Packages required but not available: ‘gmp’ ‘qdapTools’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## broom (0.4.2)
Maintainer: David Robinson <admiral.david@gmail.com>  
Bug reports: http://github.com/tidyverse/broom/issues

2 errors | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘broom-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: gmm_tidiers
> ### Title: Tidying methods for generalized method of moments "gmm" objects
> ### Aliases: glance.gmm gmm_tidiers tidy.gmm
> 
> ### ** Examples
... 58 lines ...
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

checking tests ... ERROR
  Running ‘test-all.R’
Running the tests in ‘tests/test-all.R’ failed.
Complete output:
  > library(testthat)
  > test_check("broom")
  Loading required package: broom
  Error in lahman_df() : could not find function "lahman_df"
  Calls: test_check ... with_reporter -> force -> source_file -> eval -> eval -> tbl
  testthat results ================================================================
  OK: 621 SKIPPED: 0 FAILED: 0
  Execution halted
```

## diceR (0.1.0)
Maintainer: Derek Chiu <dchiu@bccrc.ca>  
Bug reports: https://github.com/AlineTalhouk/diceR/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Packages required but not available:
  ‘flux’ ‘apcluster’ ‘infotheo’ ‘blockcluster’ ‘clue’ ‘clusterCrit’
  ‘clValid’ ‘klaR’ ‘quantable’ ‘RankAggreg’ ‘sigclust’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## eechidna (1.1)
Maintainer: Ben Marwick <benmarwick@gmail.com>

0 errors | 1 warning  | 1 note 

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...

    nasa

Warning: Removed 10 rows containing non-finite values (stat_smooth).
Warning: Removed 10 rows containing missing values (geom_point).

Attaching package: 'readr'
... 8 lines ...
  StateAb = col_character(),
  GivenNm = col_character(),
  Surname = col_character(),
  PartyNm = col_character(),
  PartyAb = col_character(),
  ElectedOrder = col_integer()
)
Quitting from lines 154-171 (exploring-election-data2016.Rmd) 
Error: processing vignette 'exploring-election-data2016.Rmd' failed with diagnostics:
Value of SET_STRING_ELT() must be a 'CHARSXP' not a 'integer'
Execution halted

checking installed package size ... NOTE
  installed size is  6.3Mb
  sub-directories of 1Mb or more:
    data   4.9Mb
    doc    1.2Mb
```

## EventStudy (0.31)
Maintainer: Dr. Simon Mueller <simon.mueller@muon-stat.com>  
Bug reports: https://github.com/EventStudyTools/api-wrapper.r/issues

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Error: processing vignette 'addin_eventstudy.Rmd' failed with diagnostics:
there is no package called ‘rmdformats’
Execution halted

```

## fuzzyjoin (0.1.3)
Maintainer: David Robinson <admiral.david@gmail.com>

2 errors | 0 warnings | 2 notes

```
checking examples ... ERROR
Running examples in ‘fuzzyjoin-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: genome_join
> ### Title: Join two tables based on overlapping genomic intervals: both a
> ### Aliases: genome_join genome_inner_join genome_left_join
> ###   genome_right_join genome_full_join genome_semi_join genome_anti_join
> 
... 23 lines ...
+                  chromosome = c("chr1", "chr2", "chr2", "chr1"),
+                  start = c(140, 210, 400, 300),
+                  end = c(160, 240, 415, 320))
> 
> # note that the the third and fourth items don't join (even though
> # 300-350 and 300-320 overlap) since the chromosomes are different:
> genome_inner_join(x1, x2, by = c("chromosome", "start", "end"))
Error in genome_join(x, y, by, mode = "inner", ...) : 
  genome_join requires the IRanges package: https://bioconductor.org/packages/release/bioc/html/IRanges.html
Calls: genome_inner_join -> genome_join
Execution halted

checking tests ... ERROR
  Running ‘testthat.R’ [38s/16s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  
  testthat results ================================================================
  OK: 179 SKIPPED: 0 FAILED: 8
  1. Error: Can join genomes on chromosomes and intervals (@test_genome_join.R#16) 
  2. Error: Can inner join on intervals (@test_interval_join.R#12) 
  3. Error: Can do non-inner joins on intervals (@test_interval_join.R#26) 
  4. Error: Can do inner joins on intervals with findOverlaps arguments (@test_interval_join.R#49) 
  5. Error: Can join integer and double columns (@test_interval_join.R#59) 
  6. Error: Can do inner joins on dates and datetimes (@test_interval_join.R#83) 
  7. Failure: Joining non-compatible formats throws an error (@test_interval_join.R#108) 
  8. Failure: Joining non-compatible formats throws an error (@test_interval_join.R#110) 
  
  Error: testthat unit tests failed
  Execution halted

checking package dependencies ... NOTE
Package suggested but not available for checking: ‘IRanges’

checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘IRanges’
```

## ggeffects (0.1.2)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/strengejacke/ggeffects/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘sjlabelled’

Packages required and available but unsuitable versions: ‘sjmisc’ ‘sjstats’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## gglogo (0.1.3)
Maintainer: Eric Hare <erichare@iastate.edu>  
Bug reports: https://github.com/heike/gglogo/issues

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...

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

## grattan (1.5.0.0)
Maintainer: Hugh Parsonage <hugh.parsonage@gmail.com>  
Bug reports: https://github.com/HughParsonage/grattan/issues

0 errors | 1 warning  | 1 note 

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
** building package indices
** testing if installed package can be loaded

checking package dependencies ... NOTE
Package suggested but not available for checking: ‘taxstats’
```

## highcharter (0.5.0)
Maintainer: Joshua Kunst <jbkunst@gmail.com>  
Bug reports: https://github.com/jbkunst/highcharter/issues

1 error  | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘highcharter-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: hcboxplot
> ### Title: Shortcut to make a boxplot
> ### Aliases: hcboxplot
> 
> ### ** Examples
> 
> hcboxplot(x = iris$Sepal.Length, var = iris$Species, color = "red")
Error in mutate_impl(.data, dots) : 
  Column `data` must be length 1 (the group size), not 5
Calls: hcboxplot ... transmute.default -> mutate -> mutate.tbl_df -> mutate_impl -> .Call
Execution halted

checking installed package size ... NOTE
  installed size is 16.4Mb
  sub-directories of 1Mb or more:
    doc          13.7Mb
    htmlwidgets   1.8Mb
```

## imager (0.40.2)
Maintainer: Simon Barthelme <simon.barthelme@gipsa-lab.fr>  
Bug reports: https://github.com/dahtah/imager/issues

1 error  | 0 warnings | 1 note 

```
checking whether package ‘imager’ can be installed ... ERROR
Installation failed.
See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/imager.Rcheck/00install.out’ for details.

checking package dependencies ... NOTE
Package which this enhances but not available for checking: ‘spatstat’
```

## leaflet.esri (0.2)
Maintainer: Bhaskar Karambelkar <bhaskarvk@gmail.com>  
Bug reports: https://github.com/bhaskarvk/leaflet.esri/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘leaflet.extras’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## modelr (0.1.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/modelr/issues

2 errors | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘modelr-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
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

checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
     })
  9: reduce_impl(.x, .f, ..., .init = .init, .left = TRUE) at /Users/hadley/Documents/tidyverse/purrr/R/reduce.R:44
  10: reduce_init(.x, .init, left = .left) at /Users/hadley/Documents/tidyverse/purrr/R/reduce.R:87
  11: stop("`.x` is empty, and no `.init` supplied", call. = FALSE) at /Users/hadley/Documents/tidyverse/purrr/R/reduce.R:103
  
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

## modeval (0.1.3)
Maintainer: Younggun You <younggun@stanford.edu>

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning: Deprecated
Quitting from lines 112-115 (modeval.Rmd) 
Error: processing vignette 'modeval.Rmd' failed with diagnostics:
the argument has already been evaluated
Execution halted

```

## nandb (0.2.0)
Maintainer: Rory Nolan <rorynoolan@gmail.com>  
Bug reports: https://github.com/rorynolan/nandb/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Packages required but not available:
  ‘autothresholdr’ ‘BiocParallel’ ‘EBImage’ ‘RcppRoll’ ‘tiff’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## phylopath (0.2.3)
Maintainer: Wouter van der Bijl <wouter.van.der.bijl@zoologi.su.se>  
Bug reports: https://github.com/Ax3man/phylopath/issues

1 error  | 1 warning  | 0 notes

```
checking examples ... ERROR
Running examples in ‘phylopath-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
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

checking re-building of vignette outputs ... WARNING
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

## pollen (0.52.00)
Maintainer: Jakub Nowosad <nowosad.jakub@gmail.com>  
Bug reports: https://github.com/Nowosad/pollen/issues

1 error  | 1 warning  | 0 notes

```
checking examples ... ERROR
Running examples in ‘pollen-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
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

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 76-79 (intro.Rmd) 
Error: processing vignette 'intro.Rmd' failed with diagnostics:
non-numeric argument to binary operator
Execution halted

```

## RSQLServer (0.3.0)
Maintainer: Imanuel Costigan <i.costigan@me.com>  
Bug reports: https://github.com/imanuelcostigan/RSQLServer/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Packages required but not available: ‘rJava’ ‘dbplyr’

Package suggested but not available for checking: ‘DBItest’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## sjmisc (2.5.0)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/strengejacke/sjmisc/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘sjlabelled’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## sjstats (0.10.1)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/strengejacke/sjstats/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘sjlabelled’

Package required and available but unsuitable version: ‘sjmisc’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
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

## tatoo (1.0.6)
Maintainer: Stefan Fleck <stefan.b.fleck@gmail.com>

2 errors | 1 warning  | 1 note 

```
checking examples ... ERROR
Running examples in ‘tatoo-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: mash_table
> ### Title: Mash Tables
> ### Aliases: mash_table Mashed_table mashed_table mash_table_list
> 
> ### ** Examples
... 10 lines ...
+   Species = c("setosa", "versicolor", "virginica"),
+   length = c(0.35, 0.52, 0.64),
+   width = c(0.38, 0.31, 0.32)
+ )
> 
> 
> # Mash by row
> 
> mash_table(df_mean, df_sd)
Error: 'is_scalar_integer' is not an exported object from 'namespace:purrr'
Execution halted

checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  testthat results ================================================================
  OK: 15 SKIPPED: 0 FAILED: 11
  1. Error: Composite_table works as expected (@test_Composite_table.R#9) 
  2. Error: as.data.table.Composite_table works as expected (@test_Composite_table.R#89) 
  3. Error: mash_table: stacking tables by row works (@test_Mashed_table.R#7) 
  4. Error: mash_table: stacking tables by col works (@test_Mashed_table.R#54) 
  5. Error: mash_table: as.data.table and setters work (@test_Mashed_table.R#129) 
  6. Error: rmash and cmash behave as expected (@test_Mashed_table.R#202) 
  7. Error: mash table print method produces output (@test_Mashed_table.R#248) 
  8. Error: Stacked_table works as expected (@test_Stacked_table.R#8) 
  9. Error: Tagged_table constructors work (@test_Tagged_table.R#7) 
  1. ...
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 108-116 (tatoo.Rmd) 
Error: processing vignette 'tatoo.Rmd' failed with diagnostics:
'is_scalar_integer' is not an exported object from 'namespace:purrr'
Execution halted


checking dependencies in R code ... NOTE
Missing or unexported object: ‘purrr::is_scalar_integer’
```

## tidygenomics (0.1.0)
Maintainer: Constantin Ahlmann-Eltze <artjom31415@googlemail.com>

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘IRanges’

Package required and available but unsuitable version: ‘fuzzyjoin’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## tidyquant (0.5.1)
Maintainer: Matt Dancho <mdancho@business-science.io>  
Bug reports: https://github.com/business-science/tidyquant/issues

2 errors | 1 warning  | 0 notes

```
checking examples ... ERROR
Running examples in ‘tidyquant-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: scale_manual
> ### Title: tidyquant colors and fills for ggplot2.
> ### Aliases: scale_manual scale_color_tq scale_fill_tq
> 
> ### ** Examples
... 22 lines ...
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

checking tests ... ERROR
  Running ‘testthat.R’ [7s/22s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  testthat results ================================================================
  OK: 118 SKIPPED: 2 FAILED: 10
  1.  Failure: Test 1 returns tibble with correct rows and columns. (@test_tq_get_compound_getters.R#24) 
  2.  Failure: Test 2 returns tibble with correct rows and columns. (@test_tq_get_compound_getters.R#33) 
  3.  Failure: Test 3 returns tibble with correct rows and columns. (@test_tq_get_compound_getters.R#42) 
  4.  Failure: Test prints warning message on invalid x input. (@test_tq_get_compound_getters.R#62) 
  5.  Error: Test prints warning message on invalid x input. (@test_tq_get_dividends.R#23) 
  6.  Error: Test returns NA on invalid x input. (@test_tq_get_dividends.R#27) 
  7.  Failure: Test prints warning message on invalid x input. (@test_tq_get_splits.R#23) 
  8.  Failure: Test 1 returns tibble with correct rows and columns. (@test_tq_get_stock_prices.R#19) 
  9.  Failure: Test 2 returns tibble with correct rows and columns. (@test_tq_get_stock_prices.R#28) 
  10. Failure: Test 2 returns tibble with correct rows and columns. (@test_tq_get_stock_prices.R#30) 
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
first():       dplyr, xts
intersect():   lubridate, base
lag():         dplyr, stats
last():        dplyr, xts
setdiff():     lubridate, base
union():       lubridate, base

... 8 lines ...

    as_tibble

Getting data...

Getting data...

Quitting from lines 366-369 (TQ01-core-functions-in-tidyquant.Rmd) 
Error: processing vignette 'TQ01-core-functions-in-tidyquant.Rmd' failed with diagnostics:
Evaluation error: character string is not in a standard unambiguous format.
Execution halted
```

## unpivotr (0.1.1)
Maintainer: Duncan Garmonsway <nacnudus@gmail.com>  
Bug reports: https://github.com/nacnudus/unpivotr/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  The following objects are masked from 'package:stats':
  
      filter, lag
  
  The following objects are masked from 'package:base':
  
      intersect, setdiff, setequal, union
  
  testthat results ================================================================
  OK: 119 SKIPPED: 0 FAILED: 1
  1. Failure: 'cross' works (@test-anchor.R#19) 
  
  Error: testthat unit tests failed
  Execution halted
```

## valaddin (0.1.0)
Maintainer: Eugene Ha <eha@posteo.de>  
Bug reports: https://github.com/egnha/valaddin/issues

1 error  | 1 warning  | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  1. Failure: error raised when .f is not a closure (@test-firmly.R#12) ----------
  firmly(f) did not throw an error.
  
  
  2. Failure: error raised when .f not a closure (@test-loosely.R#10) ------------
  loosely(f) did not throw an error.
  
  
  testthat results ================================================================
  OK: 3693 SKIPPED: 0 FAILED: 2
  1. Failure: error raised when .f is not a closure (@test-firmly.R#12) 
  2. Failure: error raised when .f not a closure (@test-loosely.R#10) 
  
  Error: testthat unit tests failed
  Execution halted

checking Rd cross-references ... WARNING
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

## wand (0.2.0)
Maintainer: Bob Rudis <bob@rud.is>  
Bug reports: https://github.com/hrbrmstr/wand/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘wand’ can be installed ... ERROR
Installation failed.
See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/wand.Rcheck/00install.out’ for details.
```

## WRTDStidal (1.1.0)
Maintainer: Marcus W. Beck <mbafs2012@gmail.com>  
Bug reports: https://github.com/fawda123/wtreg_for_estuaries/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘EnvStats’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## zeligverse (0.1.1)
Maintainer: Christopher Gandrud <zelig.zee@gmail.com>  
Bug reports: https://github.com/IQSS/zeligverse/issues

0 errors | 1 warning  | 0 notes

```
checking whether package ‘zeligverse’ can be installed ... WARNING
Found the following significant warnings:
  Warning: namespace ‘DBI’ is not available and has been replaced
See ‘/Users/hadley/Documents/tidyverse/purrr/revdep/checks/zeligverse.Rcheck/00install.out’ for details.
```

