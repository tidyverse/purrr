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
94 packages

## anomalyDetection (0.1.1)
Maintainer: Bradley Boehmke <bradleyboehmke@gmail.com>  
Bug reports: https://github.com/bradleyboehmke/anomalyDetection/issues

0 errors | 0 warnings | 0 notes

## apa (0.2.0)
Maintainer: Daniel Gromer <dgromer@mailbox.org>  
Bug reports: https://github.com/dgromer/apa/issues

0 errors | 0 warnings | 0 notes

## automagic (0.3)
Maintainer: Cole Brokamp <cole.brokamp@gmail.com>  
Bug reports: https://github.com/cole-brokamp/automagic/issues

0 errors | 0 warnings | 0 notes

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

## bsplus (0.1.0)
Maintainer: Ian Lyttle <ian.lyttle@schneider-electric.com>  
Bug reports: https://github.com/ijlyttle/bsplus/issues

0 errors | 0 warnings | 0 notes

## cdcfluview (0.5.1)
Maintainer: Bob Rudis <bob@rud.is>  
Bug reports: https://github.com/hrbrmstr/cdcfluview/issues

0 errors | 0 warnings | 0 notes

## censys (0.1.0)
Maintainer: Bob Rudis <brudis@rapid7.com>  
Bug reports: https://github.com/hrbrmstr/censys/issues

0 errors | 0 warnings | 0 notes

## congressbr (0.1.0)
Maintainer: Robert Myles McDonnell <robertmylesmcdonnell@gmail.com>

0 errors | 0 warnings | 0 notes

## corrr (0.2.1)
Maintainer: Simon Jackson <drsimonjackson@gmail.com>  
Bug reports: https://github.com/drsimonj/corrr/issues

0 errors | 0 warnings | 0 notes

## countytimezones (1.0.0)
Maintainer: Brooke Anderson <brooke.anderson@colostate.edu>  
Bug reports: https://github.com/geanders/countytimezones/issues

0 errors | 0 warnings | 0 notes

## countyweather (0.1.0)
Maintainer: Rachel Severson <rachel.severson@colostate.edu>

0 errors | 0 warnings | 0 notes

## cymruservices (0.2.0)
Maintainer: Bob Rudis <bob@rudis.net>

0 errors | 0 warnings | 0 notes

## d3r (0.6.4)
Maintainer: Kent Russell <kent.russell@timelyportfolio.com>  
Bug reports: https://github.com/timelyportfolio/d3r/issues

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Packages which this enhances but not available for checking:
  ‘partykit’ ‘treemap’
```

## doctr (0.2.0)
Maintainer: Caio Lente <me@ctlente.com>

0 errors | 0 warnings | 0 notes

## docxtractr (0.2.0)
Maintainer: Bob Rudis <bob@rudis.net>

0 errors | 0 warnings | 0 notes

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

## epidata (0.1.0)
Maintainer: Bob Rudis <bob@rud.is>  
Bug reports: https://github.com/hrbrmstr/epidata/issues

0 errors | 0 warnings | 0 notes

## esc (0.3.0)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/strengejacke/esc/issues

0 errors | 0 warnings | 1 note 

```
checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘metafor’
```

## estatapi (0.3.0)
Maintainer: Hiroaki Yutani <yutani.ini@gmail.com>  
Bug reports: https://github.com/yutannihilation/estatapi/issues

0 errors | 0 warnings | 0 notes

## evaluator (0.1.0)
Maintainer: David Severski <davidski@deadheaven.com>  
Bug reports: https://github.com/davidski/evaluator/issues

0 errors | 0 warnings | 1 note 

```
checking dependencies in R code ... NOTE
Missing or unexported object: ‘purrr::by_row’
```

## exampletestr (0.4.0)
Maintainer: Rory Nolan <rorynoolan@gmail.com>  
Bug reports: https://www.github.com/rorynolan/autothresholdr/issues

0 errors | 0 warnings | 0 notes

## fbar (0.1.23)
Maintainer: Max Conway <conway.max1@gmail.com>

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Packages suggested but not available for checking:
  ‘Rglpk’ ‘ROI.plugin.glpk’
```

## flextable (0.1.0)
Maintainer: David Gohel <david.gohel@ardata.fr>

0 errors | 0 warnings | 0 notes

## fourierin (0.2.1)
Maintainer: Guillermo Basulto-Elias <guillermobasulto@gmail.com>  
Bug reports: https://github.com/gbasulto/fourierin/issues

0 errors | 0 warnings | 0 notes

## fuzzr (0.2.1)
Maintainer: Matthew Lincoln <matthew.d.lincoln@gmail.com>  
Bug reports: https://github.com/mdlincoln/fuzzr/issues

0 errors | 0 warnings | 0 notes

## fuzzyjoin (0.1.2)
Maintainer: David Robinson <drobinson@stackoverflow.com>

0 errors | 0 warnings | 0 notes

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

## geoparser (0.1.0)
Maintainer: Maëlle Salmon <maelle.salmon@yahoo.se>  
Bug reports: http://github.com/ropenscilabs/geoparser/issues

0 errors | 0 warnings | 0 notes

## ggeffects (0.1.0)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/strengejacke/ggeffects/issues

0 errors | 0 warnings | 0 notes

## gglogo (0.1.3)
Maintainer: Eric Hare <erichare@iastate.edu>  
Bug reports: https://github.com/heike/gglogo/issues

0 errors | 0 warnings | 0 notes

## ggmosaic (0.1.2)
Maintainer: Haley Jeppson <hjeppson@iastate.edu>  
Bug reports: https://github.com/haleyjeppson/ggmosaic

0 errors | 0 warnings | 0 notes

## ggstance (0.3)
Maintainer: Lionel Henry <lionel@rstudio.com>

0 errors | 0 warnings | 0 notes

## giphyr (0.1.1)
Maintainer: Hao Zhu <haozhu233@gmail.com>  
Bug reports: https://github.com/haozhu233/giphyr/issues

0 errors | 0 warnings | 0 notes

## gitlabr (0.9)
Maintainer: Jirka Lewandowski <jirka.lewandowski@wzb.eu>  
Bug reports: https://gitlab.points-of-interest.cc/points-of-interest/gitlabr/issues/

0 errors | 0 warnings | 0 notes

## googlesheets (0.2.2)
Maintainer: Jennifer Bryan <jenny@rstudio.com>  
Bug reports: https://github.com/jennybc/googlesheets/issues

0 errors | 0 warnings | 0 notes

## grattan (1.4.1.2)
Maintainer: Hugh Parsonage <hugh.parsonage@gmail.com>  
Bug reports: https://github.com/HughParsonage/grattan/issues

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Package suggested but not available for checking: ‘taxstats’
```

## GSODR (1.0.2.1)
Maintainer: Adam Sparks <adamhsparks@gmail.com>  
Bug reports: https://github.com/ropensci/GSODR/issues

0 errors | 0 warnings | 0 notes

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

## highcharter (0.5.0)
Maintainer: Joshua Kunst <jbkunst@gmail.com>  
Bug reports: https://github.com/jbkunst/highcharter/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is 16.4Mb
  sub-directories of 1Mb or more:
    doc          13.7Mb
    htmlwidgets   1.8Mb
```

## hrbrthemes (0.1.0)
Maintainer: Bob Rudis <bob@rud.is>  
Bug reports: https://github.com/hrbrmstr/hrbrthemes/issues

0 errors | 0 warnings | 0 notes

## hurricaneexposure (0.0.1)
Maintainer: Brooke Anderson <brooke.anderson@colostate.edu>  
Bug reports: https://github.com/geanders/hurricaneexposure/issues

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Package suggested but not available for checking: ‘hurricaneexposuredata’
```

## icpsrdata (0.3.0)
Maintainer: Frederick Solt <frederick-solt@uiowa.edu>

0 errors | 0 warnings | 0 notes

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

## ImputeRobust (1.1-2)
Maintainer: Daniel Salfran <daniel.salfran@uni-hamburg.de>

0 errors | 0 warnings | 0 notes

## inferr (0.1.1)
Maintainer: Aravind Hebbali <hebbali.aravind@gmail.com>  
Bug reports: https://github.com/rsquaredacademy/inferr/issues

0 errors | 0 warnings | 0 notes

## jpmesh (0.3.0)
Maintainer: Shinya Uryu <suika1127@gmail.com>  
Bug reports: https://github.com/uribo/jpmesh/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is 205.9Mb
  sub-directories of 1Mb or more:
    extdata  205.2Mb
```

## kntnr (0.4.0)
Maintainer: Hiroaki Yutani <yutani.ini@gmail.com>

0 errors | 0 warnings | 0 notes

## kokudosuuchi (0.2.0)
Maintainer: Hiroaki Yutani <yutani.ini@gmail.com>  
Bug reports: https://github.com/yutannihilation/kokudosuuchi/issues

0 errors | 0 warnings | 0 notes

## leaflet (1.1.0)
Maintainer: Joe Cheng <joe@rstudio.com>  
Bug reports: https://github.com/rstudio/leaflet/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is  5.4Mb
  sub-directories of 1Mb or more:
    htmlwidgets   4.3Mb
```

## livechatR (0.1.0)
Maintainer: Lawrence Wu <lwu@payoff.com>

0 errors | 0 warnings | 0 notes

## longurl (0.3.0)
Maintainer: Bob Rudis <bob@rud.is>

0 errors | 0 warnings | 0 notes

## milr (0.2.0)
Maintainer: Ping-Yang Chen <pychen.ping@gmail.com>  
Bug reports: https://github.com/PingYangChen/milr/issues

0 errors | 0 warnings | 1 note 

```
checking compiled code ... NOTE
File ‘milr/libs/milr.so’:
  Found no calls to: ‘R_registerRoutines’, ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## modelr (0.1.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/modelr/issues

0 errors | 0 warnings | 0 notes

## modeval (0.1.3)
Maintainer: Younggun You <younggun@stanford.edu>

0 errors | 0 warnings | 0 notes

## normalr (0.0.3)
Maintainer: Kevin Chang <k.chang@auckland.ac.nz>  
Bug reports: https://github.com/kcha193/normalr/issues

0 errors | 0 warnings | 0 notes

## officer (0.1.3)
Maintainer: David Gohel <david.gohel@ardata.fr>  
Bug reports: https://github.com/davidgohel/officer/issues

0 errors | 0 warnings | 0 notes

## pewdata (0.2.0)
Maintainer: Frederick Solt <frederick-solt@uiowa.edu>

0 errors | 0 warnings | 0 notes

## phylopath (0.2.3)
Maintainer: Wouter van der Bijl <wouter.van.der.bijl@zoologi.su.se>  
Bug reports: https://github.com/Ax3man/phylopath/issues

0 errors | 0 warnings | 0 notes

## pinnacle.API (2.0.4)
Maintainer: Marco Blume <marco.blume@pinnaclesports.com>

0 errors | 0 warnings | 0 notes

## plotly (4.6.0)
Maintainer: Carson Sievert <cpsievert1@gmail.com>  
Bug reports: https://github.com/ropensci/plotly/issues

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Packages suggested but not available for checking: ‘RSelenium’ ‘IRdisplay’
```

## pollen (0.52.00)
Maintainer: Jakub Nowosad <nowosad.jakub@gmail.com>  
Bug reports: https://github.com/Nowosad/pollen/issues

0 errors | 0 warnings | 0 notes

## pollstR (2.0.0)
Maintainer: Jeffrey B. Arnold <jeffrey.arnold@gmail.com>  
Bug reports: https://github.com/rOpenGov/pollstR/issues

0 errors | 0 warnings | 0 notes

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

## qiitr (0.1.0)
Maintainer: Hiroaki Yutani <yutani.ini@gmail.com>  
Bug reports: https://github.com/yutannihilation/qiitr/issues

0 errors | 0 warnings | 0 notes

## rAltmetric (0.7.0)
Maintainer: Karthik Ram <karthik.ram@gmail.com>  
Bug reports: https://github.com/ropensci/rAltmetric/issues

0 errors | 0 warnings | 0 notes

## readOffice (0.2.2)
Maintainer: Mark Ewing <b.mark@ewingsonline.com>

0 errors | 0 warnings | 0 notes

## RevEcoR (0.99.3)
Maintainer: Yang Cao <yiluheihei@gmail.com>

0 errors | 0 warnings | 0 notes

## rnoaa (0.7.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/rnoaa/issues

0 errors | 0 warnings | 0 notes

## rtypeform (0.3.0)
Maintainer: Colin Gillespie <csgillespie@gmail.com>  
Bug reports: https://github.com/csgillespie/rtypeform/issues

0 errors | 0 warnings | 0 notes

## scanstatistics (0.1.0)
Maintainer: Benjamin Kjellson <benjak@math.su.se>  
Bug reports: https://github.com/BenjaK/scanstatistics/issues

0 errors | 0 warnings | 0 notes

## ShinyTester (0.1.0)
Maintainer: Amit Kohli <amit@amitkohli.com>

0 errors | 0 warnings | 0 notes

## sjmisc (2.4.0)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/strengejacke/sjmisc/issues

0 errors | 0 warnings | 0 notes

## sjPlot (2.3.1)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/sjPlot/devel/issues

0 errors | 0 warnings | 0 notes

## sjstats (0.10.0)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/strengejacke/sjstats/issues

0 errors | 0 warnings | 1 note 

```
checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘piecewiseSEM’
```

## spup (0.1-0)
Maintainer: Kasia Sawicka <kasia.sawicka@wur.nl>

0 errors | 0 warnings | 0 notes

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

## survutils (1.0.0)
Maintainer: Fong Chun Chan <fongchunchan@gmail.com>  
Bug reports: https://github.com/tinyheero/survutils/issues

0 errors | 0 warnings | 0 notes

## tatoo (1.0.5)
Maintainer: Stefan Fleck <stefan.b.fleck@gmail.com>

0 errors | 0 warnings | 0 notes

## tensorr (0.1.0)
Maintainer: Robert Zamora <zamora.rr@gmail.com>  
Bug reports: https://github.com/zamorarr/tensorr/issues

0 errors | 0 warnings | 0 notes

## tidyquant (0.5.1)
Maintainer: Matt Dancho <mdancho@business-science.io>  
Bug reports: https://github.com/business-science/tidyquant/issues

0 errors | 0 warnings | 0 notes

## tidyRSS (1.0.1)
Maintainer: Robert Myles McDonnell <robertmylesmcdonnell@gmail.com>  
Bug reports: https://github.com/RobertMyles/tidyrss/issues

0 errors | 0 warnings | 0 notes

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

## tidyverse (1.1.1)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/tidyverse/tidyverse/issues

0 errors | 0 warnings | 0 notes

## timekit (0.2.0)
Maintainer: Matt Dancho <mdancho@business-science.io>  
Bug reports: https://github.com/business-science/timekit/issues

0 errors | 0 warnings | 0 notes

## twilio (0.1.0)
Maintainer: Sean Kross <sean@seankross.com>

0 errors | 0 warnings | 0 notes

## uaparserjs (0.1.0)
Maintainer: Bob Rudis <bob@rud.is>  
Bug reports: https://github.com/hrbrmstr/uaparserjs/issues

0 errors | 0 warnings | 0 notes

## unpivotr (0.1.1)
Maintainer: Duncan Garmonsway <nacnudus@gmail.com>  
Bug reports: https://github.com/nacnudus/unpivotr/issues

0 errors | 0 warnings | 0 notes

## valaddin (0.1.0)
Maintainer: Eugene Ha <eha@posteo.de>  
Bug reports: https://github.com/egnha/valaddin/issues

0 errors | 0 warnings | 0 notes

## valr (0.2.0)
Maintainer: Jay Hesselberth <jay.hesselberth@gmail.com>  
Bug reports: https://github.com/rnabioco/valr/issues

0 errors | 0 warnings | 0 notes

## vdiffr (0.1.1)
Maintainer: Lionel Henry <lionel@rstudio.com>

0 errors | 0 warnings | 1 note 

```
checking compiled code ... NOTE
File ‘vdiffr/libs/vdiffr.so’:
  Found no calls to: ‘R_registerRoutines’, ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
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

## widgetframe (0.1.0)
Maintainer: Bhaskar Karambelkar <bhaskarvk@gmail.com>  
Bug reports: https://github.com/bhaskarvk/widgetframe/issues

0 errors | 0 warnings | 0 notes

## zeallot (0.0.3)
Maintainer: Nathan Teetor <nathanteetor@gmail.com>  
Bug reports: https://github.com/nteetor/zeallot/issues

0 errors | 0 warnings | 0 notes

## zeligverse (0.1.0)
Maintainer: Christopher Gandrud <zelig.zee@gmail.com>  
Bug reports: https://github.com/IQSS/zeligverse/issues

0 errors | 0 warnings | 0 notes

