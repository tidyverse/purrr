# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.2.2 (2015-08-14) |
|system   |x86_64, darwin13.4.0         |
|ui       |RStudio (0.99.830)           |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |America/Chicago              |
|date     |2015-12-28                   |

## Packages

|package  |*  |version  |date       |source         |
|:--------|:--|:--------|:----------|:--------------|
|BH       |   |1.58.0-1 |2015-05-21 |CRAN (R 3.2.0) |
|dplyr    |   |0.4.3    |2015-09-01 |CRAN (R 3.2.0) |
|lazyeval |   |0.1.10   |2015-01-02 |CRAN (R 3.2.0) |
|magrittr |   |1.5      |2014-11-22 |CRAN (R 3.2.0) |
|Rcpp     |   |0.12.2   |2015-11-15 |CRAN (R 3.2.2) |
|testthat |*  |0.11.0   |2015-10-14 |CRAN (R 3.2.0) |

# Check results
1 checked out of 1 dependencies 

## heemod (0.1.0)
Maintainer: Antoine Filipovic-Pierucci <pierucci@gmail.com>

```
checking examples ... ERROR
Running examples in ‘heemod-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: eval_model_newdata
> ### Title: Iteratively Evaluate a Markov Model With New Parameter Values
> ### Aliases: eval_model_newdata
> 
> ### ** Examples
> 
> 
> par1 <- define_parameters(
+   a = 1,
+   b = 1 / (markov_cycle + a)
+ )
> 
> mat1 <- define_matrix(
+   1-b, b,
+   0, 1
+ )
> 
> sl1 <- define_state_list(
+   define_state(var = a),
+   define_state(var = a * markov_cycle)
+ )
No named state -> generating names.
> 
> mod1 <- define_model(
+   parameters = par1,
+   transition_matrix = mat1,
+   states = sl1
+ )
> 
> new_tab <- data.frame(
+   a = 1:10
+ )
> 
> eval_model_newdata(
+   mod1,
+   cycles = 5,
+   init = 1:0,
+   newdata = new_tab
+ )
Error in purrr::map_rows(tab_res, f, .labels = FALSE)$.out : 
  object of type 'closure' is not subsettable
Calls: eval_model_newdata ... eval_newdata -> eval_model -> eval_matrix -> unlist
Execution halted
```
```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  11: FUN(X[[i]], ...)
  12: eval_matrix(get_matrix(model), parameters)
  13: unlist(purrr::map_rows(tab_res, f, .labels = FALSE)$.out, recursive = FALSE)
  
  testthat results ================================================================
  OK: 56 SKIPPED: 0 FAILED: 4
  1. Error: Matrix evaluation 
  2. Error: Model evaluation, 1 model 
  3. Error: Model evaluation, 2 models 
  4. Error: run_models behaves as expected 
  
  Error: testthat unit tests failed
  Execution halted
```
```
checking re-building of vignette outputs ... NOTE
Error in re-building vignettes:
  ...
Quitting from lines 205-210 (homogenous.Rmd) 
Error: processing vignette 'homogenous.Rmd' failed with diagnostics:
object of type 'closure' is not subsettable
Execution halted

```
```
DONE
Status: 2 ERRORs, 1 NOTE
```

