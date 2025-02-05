# AovBay

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/AovBay
* Date/Publication: 2021-07-22 06:30:02 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "AovBay")` for more info

</details>

## In both

*   checking whether package ‘AovBay’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/AovBay/new/AovBay.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘AovBay’ ...
** package ‘AovBay’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I"../inst/include" -I"/usr/local/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/usr/local/lib/R/site-library/BH/include' -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I'/usr/local/lib/R/site-library/RcppParallel/include' -I'/usr/local/lib/R/site-library/rstan/include' -I'/usr/local/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/usr/local/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
...
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is being loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘AovBay’
* removing ‘/tmp/workdir/AovBay/new/AovBay.Rcheck/AovBay’


```
### CRAN

```
* installing *source* package ‘AovBay’ ...
** package ‘AovBay’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I"../inst/include" -I"/usr/local/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/usr/local/lib/R/site-library/BH/include' -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I'/usr/local/lib/R/site-library/RcppParallel/include' -I'/usr/local/lib/R/site-library/rstan/include' -I'/usr/local/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/usr/local/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
...
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is being loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘AovBay’
* removing ‘/tmp/workdir/AovBay/old/AovBay.Rcheck/AovBay’


```
# arealDB

<details>

* Version: 0.9.4
* GitHub: https://github.com/luckinet/arealDB
* Source code: https://github.com/cran/arealDB
* Date/Publication: 2025-01-20 13:40:05 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "arealDB")` for more info

</details>

## In both

*   checking whether package ‘arealDB’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/arealDB/new/arealDB.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘arealDB’ ...
** package ‘arealDB’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘arealDB’
* removing ‘/tmp/workdir/arealDB/new/arealDB.Rcheck/arealDB’


```
### CRAN

```
* installing *source* package ‘arealDB’ ...
** package ‘arealDB’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘arealDB’
* removing ‘/tmp/workdir/arealDB/old/arealDB.Rcheck/arealDB’


```
# autoReg

<details>

* Version: 0.3.3
* GitHub: https://github.com/cardiomoon/autoReg
* Source code: https://github.com/cran/autoReg
* Date/Publication: 2023-11-14 05:53:27 UTC
* Number of recursive dependencies: 215

Run `revdepcheck::cloud_details(, "autoReg")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/autoReg/new/autoReg.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘autoReg/DESCRIPTION’ ... OK
...
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘Automatic_Regression_Modeling.Rmd’ using ‘UTF-8’... OK
  ‘Bootstrap_Prediction.Rmd’ using ‘UTF-8’... OK
  ‘Getting_started.Rmd’ using ‘UTF-8’... OK
  ‘Statiastical_test_in_gaze.Rmd’ using ‘UTF-8’... OK
  ‘Survival.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/autoReg/old/autoReg.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘autoReg/DESCRIPTION’ ... OK
...
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘Automatic_Regression_Modeling.Rmd’ using ‘UTF-8’... OK
  ‘Bootstrap_Prediction.Rmd’ using ‘UTF-8’... OK
  ‘Getting_started.Rmd’ using ‘UTF-8’... OK
  ‘Statiastical_test_in_gaze.Rmd’ using ‘UTF-8’... OK
  ‘Survival.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# bayesCT

<details>

* Version: 0.99.3
* GitHub: https://github.com/thevaachandereng/bayesCT
* Source code: https://github.com/cran/bayesCT
* Date/Publication: 2020-07-01 09:30:02 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "bayesCT")` for more info

</details>

## In both

*   checking whether package ‘bayesCT’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bayesCT/new/bayesCT.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bayesCT’ ...
** package ‘bayesCT’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘bayesCT’
* removing ‘/tmp/workdir/bayesCT/new/bayesCT.Rcheck/bayesCT’


```
### CRAN

```
* installing *source* package ‘bayesCT’ ...
** package ‘bayesCT’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘bayesCT’
* removing ‘/tmp/workdir/bayesCT/old/bayesCT.Rcheck/bayesCT’


```
# bspcov

<details>

* Version: 1.0.1
* GitHub: https://github.com/statjs/bspcov
* Source code: https://github.com/cran/bspcov
* Date/Publication: 2024-11-13 20:10:02 UTC
* Number of recursive dependencies: 111

Run `revdepcheck::cloud_details(, "bspcov")` for more info

</details>

## In both

*   checking whether package ‘bspcov’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bspcov/new/bspcov.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bspcov’ ...
** package ‘bspcov’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is being loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘bspcov’
* removing ‘/tmp/workdir/bspcov/new/bspcov.Rcheck/bspcov’


```
### CRAN

```
* installing *source* package ‘bspcov’ ...
** package ‘bspcov’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is being loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘bspcov’
* removing ‘/tmp/workdir/bspcov/old/bspcov.Rcheck/bspcov’


```
# censored

<details>

* Version: 0.3.2
* GitHub: https://github.com/tidymodels/censored
* Source code: https://github.com/cran/censored
* Date/Publication: 2024-06-11 18:10:02 UTC
* Number of recursive dependencies: 163

Run `revdepcheck::cloud_details(, "censored")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/censored/new/censored.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘censored/DESCRIPTION’ ... OK
...
* this is package ‘censored’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required and available but unsuitable version: ‘survival’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/censored/old/censored.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘censored/DESCRIPTION’ ... OK
...
* this is package ‘censored’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required and available but unsuitable version: ‘survival’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# CGPfunctions

<details>

* Version: 0.6.3
* GitHub: https://github.com/ibecav/CGPfunctions
* Source code: https://github.com/cran/CGPfunctions
* Date/Publication: 2020-11-12 14:50:09 UTC
* Number of recursive dependencies: 155

Run `revdepcheck::cloud_details(, "CGPfunctions")` for more info

</details>

## In both

*   checking whether package ‘CGPfunctions’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/CGPfunctions/new/CGPfunctions.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘CGPfunctions’ ...
** package ‘CGPfunctions’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘CGPfunctions’
* removing ‘/tmp/workdir/CGPfunctions/new/CGPfunctions.Rcheck/CGPfunctions’


```
### CRAN

```
* installing *source* package ‘CGPfunctions’ ...
** package ‘CGPfunctions’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘CGPfunctions’
* removing ‘/tmp/workdir/CGPfunctions/old/CGPfunctions.Rcheck/CGPfunctions’


```
# CSCNet

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/CSCNet
* Date/Publication: 2022-11-08 18:50:02 UTC
* Number of recursive dependencies: 171

Run `revdepcheck::cloud_details(, "CSCNet")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/CSCNet/new/CSCNet.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘CSCNet/DESCRIPTION’ ... OK
...
* this is package ‘CSCNet’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘riskRegression’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/CSCNet/old/CSCNet.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘CSCNet/DESCRIPTION’ ... OK
...
* this is package ‘CSCNet’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘riskRegression’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# dartR.base

<details>

* Version: 0.98
* GitHub: NA
* Source code: https://github.com/cran/dartR.base
* Date/Publication: 2024-09-19 13:20:02 UTC
* Number of recursive dependencies: 288

Run `revdepcheck::cloud_details(, "dartR.base")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/dartR.base/new/dartR.base.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dartR.base/DESCRIPTION’ ... OK
...
* this is package ‘dartR.base’ version ‘0.98’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘SNPassoc’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/dartR.base/old/dartR.base.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dartR.base/DESCRIPTION’ ... OK
...
* this is package ‘dartR.base’ version ‘0.98’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘SNPassoc’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# dartR.popgen

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/dartR.popgen
* Date/Publication: 2024-06-27 23:20:04 UTC
* Number of recursive dependencies: 175

Run `revdepcheck::cloud_details(, "dartR.popgen")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/dartR.popgen/new/dartR.popgen.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dartR.popgen/DESCRIPTION’ ... OK
...
* this is package ‘dartR.popgen’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘dartR.base’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/dartR.popgen/old/dartR.popgen.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dartR.popgen/DESCRIPTION’ ... OK
...
* this is package ‘dartR.popgen’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘dartR.base’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# deeptrafo

<details>

* Version: 1.0-0
* GitHub: https://github.com/neural-structured-additive-learning/deeptrafo
* Source code: https://github.com/cran/deeptrafo
* Date/Publication: 2024-12-03 18:40:02 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "deeptrafo")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/deeptrafo/new/deeptrafo.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘deeptrafo/DESCRIPTION’ ... OK
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘mlt’

Packages suggested but not available for checking: 'tram', 'cotram'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/deeptrafo/old/deeptrafo.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘deeptrafo/DESCRIPTION’ ... OK
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘mlt’

Packages suggested but not available for checking: 'tram', 'cotram'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# dibble

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/dibble
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "dibble")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# DR.SC

<details>

* Version: 3.4
* GitHub: https://github.com/feiyoung/DR.SC
* Source code: https://github.com/cran/DR.SC
* Date/Publication: 2024-03-19 08:40:02 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "DR.SC")` for more info

</details>

## In both

*   checking whether package ‘DR.SC’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/DR.SC/new/DR.SC.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘DR.SC’ ...
** package ‘DR.SC’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
using C++17
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -DARMA_64BIT_WORD -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -DARMA_64BIT_WORD -fpic  -g -O2  -c getNB_fast.cpp -o getNB_fast.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -DARMA_64BIT_WORD -fpic  -g -O2  -c mt_paral_job.cpp -o mt_paral_job.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -DARMA_64BIT_WORD -fpic  -g -O2  -c mt_paral_job2.cpp -o mt_paral_job2.o
...
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.4 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘DR.SC’
* removing ‘/tmp/workdir/DR.SC/new/DR.SC.Rcheck/DR.SC’


```
### CRAN

```
* installing *source* package ‘DR.SC’ ...
** package ‘DR.SC’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
using C++17
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -DARMA_64BIT_WORD -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -DARMA_64BIT_WORD -fpic  -g -O2  -c getNB_fast.cpp -o getNB_fast.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -DARMA_64BIT_WORD -fpic  -g -O2  -c mt_paral_job.cpp -o mt_paral_job.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -DARMA_64BIT_WORD -fpic  -g -O2  -c mt_paral_job2.cpp -o mt_paral_job2.o
...
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.4 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘DR.SC’
* removing ‘/tmp/workdir/DR.SC/old/DR.SC.Rcheck/DR.SC’


```
# epizootic

<details>

* Version: 1.0.0
* GitHub: https://github.com/viralemergence/epizootic
* Source code: https://github.com/cran/epizootic
* Date/Publication: 2024-10-02 13:10:05 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "epizootic")` for more info

</details>

## In both

*   checking whether package ‘epizootic’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/epizootic/new/epizootic.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘epizootic’ ...
** package ‘epizootic’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c aspatial_siri.cpp -o aspatial_siri.o
g++ -std=gnu++17 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o epizootic.so RcppExports.o aspatial_siri.o -fopenmp -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/epizootic/new/epizootic.Rcheck/00LOCK-epizootic/00new/epizootic/libs
** R
...
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘epizootic’
* removing ‘/tmp/workdir/epizootic/new/epizootic.Rcheck/epizootic’


```
### CRAN

```
* installing *source* package ‘epizootic’ ...
** package ‘epizootic’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c aspatial_siri.cpp -o aspatial_siri.o
g++ -std=gnu++17 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o epizootic.so RcppExports.o aspatial_siri.o -fopenmp -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/epizootic/old/epizootic.Rcheck/00LOCK-epizootic/00new/epizootic/libs
** R
...
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘epizootic’
* removing ‘/tmp/workdir/epizootic/old/epizootic.Rcheck/epizootic’


```
# GeoTox

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/GeoTox
* Number of recursive dependencies: 143

Run `revdepcheck::cloud_details(, "GeoTox")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# GseaVis

<details>

* Version: 0.0.5
* GitHub: https://github.com/junjunlab/GseaVis
* Source code: https://github.com/cran/GseaVis
* Date/Publication: 2022-12-20 19:40:07 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "GseaVis")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/GseaVis/new/GseaVis.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘GseaVis/DESCRIPTION’ ... OK
...
* this is package ‘GseaVis’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘DOSE’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/GseaVis/old/GseaVis.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘GseaVis/DESCRIPTION’ ... OK
...
* this is package ‘GseaVis’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘DOSE’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# hettx

<details>

* Version: 0.1.3
* GitHub: https://github.com/bfifield/hettx
* Source code: https://github.com/cran/hettx
* Date/Publication: 2023-08-19 22:22:34 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "hettx")` for more info

</details>

## In both

*   checking whether package ‘hettx’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/hettx/new/hettx.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘hettx’ ...
** package ‘hettx’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘hettx’
* removing ‘/tmp/workdir/hettx/new/hettx.Rcheck/hettx’


```
### CRAN

```
* installing *source* package ‘hettx’ ...
** package ‘hettx’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘hettx’
* removing ‘/tmp/workdir/hettx/old/hettx.Rcheck/hettx’


```
# immcp

<details>

* Version: 1.0.3
* GitHub: https://github.com/YuanlongHu/immcp
* Source code: https://github.com/cran/immcp
* Date/Publication: 2022-05-12 05:50:02 UTC
* Number of recursive dependencies: 187

Run `revdepcheck::cloud_details(, "immcp")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/immcp/new/immcp.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘immcp/DESCRIPTION’ ... OK
...
* this is package ‘immcp’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'clusterProfiler', 'DOSE'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/immcp/old/immcp.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘immcp/DESCRIPTION’ ... OK
...
* this is package ‘immcp’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'clusterProfiler', 'DOSE'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# invivoPKfit

<details>

* Version: 2.0.0
* GitHub: NA
* Source code: https://github.com/cran/invivoPKfit
* Date/Publication: 2025-01-09 14:30:02 UTC
* Number of recursive dependencies: 172

Run `revdepcheck::cloud_details(, "invivoPKfit")` for more info

</details>

## In both

*   checking whether package ‘invivoPKfit’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/invivoPKfit/new/invivoPKfit.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘invivoPKfit’ ...
** package ‘invivoPKfit’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘expand1’ is not exported by 'namespace:Matrix'
Execution halted
ERROR: lazy loading failed for package ‘invivoPKfit’
* removing ‘/tmp/workdir/invivoPKfit/new/invivoPKfit.Rcheck/invivoPKfit’


```
### CRAN

```
* installing *source* package ‘invivoPKfit’ ...
** package ‘invivoPKfit’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘expand1’ is not exported by 'namespace:Matrix'
Execution halted
ERROR: lazy loading failed for package ‘invivoPKfit’
* removing ‘/tmp/workdir/invivoPKfit/old/invivoPKfit.Rcheck/invivoPKfit’


```
# jsmodule

<details>

* Version: 1.6.1
* GitHub: https://github.com/jinseob2kim/jsmodule
* Source code: https://github.com/cran/jsmodule
* Date/Publication: 2025-01-08 13:10:02 UTC
* Number of recursive dependencies: 241

Run `revdepcheck::cloud_details(, "jsmodule")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/jsmodule/new/jsmodule.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘jsmodule/DESCRIPTION’ ... OK
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘jsmodule.Rmd’ using ‘UTF-8’... OK
  ‘jsmodule_subgroup_cmprsk.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/jsmodule/old/jsmodule.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘jsmodule/DESCRIPTION’ ... OK
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘jsmodule.Rmd’ using ‘UTF-8’... OK
  ‘jsmodule_subgroup_cmprsk.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# lnmixsurv

<details>

* Version: 3.1.6
* GitHub: NA
* Source code: https://github.com/cran/lnmixsurv
* Date/Publication: 2024-09-03 15:20:08 UTC
* Number of recursive dependencies: 195

Run `revdepcheck::cloud_details(, "lnmixsurv")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/lnmixsurv/new/lnmixsurv.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lnmixsurv/DESCRIPTION’ ... OK
...
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘compare.Rmd’ using ‘UTF-8’... OK
  ‘expectation_maximization.Rmd’ using ‘UTF-8’... OK
  ‘intercept_only.Rmd’ using ‘UTF-8’... OK
  ‘lnmixsurv.Rmd’ using ‘UTF-8’... OK
  ‘parallel_computation.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 4 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/lnmixsurv/old/lnmixsurv.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lnmixsurv/DESCRIPTION’ ... OK
...
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘compare.Rmd’ using ‘UTF-8’... OK
  ‘expectation_maximization.Rmd’ using ‘UTF-8’... OK
  ‘intercept_only.Rmd’ using ‘UTF-8’... OK
  ‘lnmixsurv.Rmd’ using ‘UTF-8’... OK
  ‘parallel_computation.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 4 NOTEs





```
# lsirm12pl

<details>

* Version: 1.3.3
* GitHub: NA
* Source code: https://github.com/cran/lsirm12pl
* Date/Publication: 2024-08-28 23:00:02 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "lsirm12pl")` for more info

</details>

## In both

*   checking whether package ‘lsirm12pl’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/lsirm12pl/new/lsirm12pl.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘lsirm12pl’ ...
** package ‘lsirm12pl’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c lsirm1pl.cpp -o lsirm1pl.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c lsirm2pl.cpp -o lsirm2pl.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c lsm.cpp -o lsm.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c utility_cpp.cpp -o utility_cpp.o
...
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘lsirm12pl’
* removing ‘/tmp/workdir/lsirm12pl/new/lsirm12pl.Rcheck/lsirm12pl’


```
### CRAN

```
* installing *source* package ‘lsirm12pl’ ...
** package ‘lsirm12pl’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c lsirm1pl.cpp -o lsirm1pl.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c lsirm2pl.cpp -o lsirm2pl.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c lsm.cpp -o lsm.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp -fpic  -g -O2  -c utility_cpp.cpp -o utility_cpp.o
...
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘lsirm12pl’
* removing ‘/tmp/workdir/lsirm12pl/old/lsirm12pl.Rcheck/lsirm12pl’


```
# MantaID

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/MantaID
* Number of recursive dependencies: 157

Run `revdepcheck::cloud_details(, "MantaID")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# metajam

<details>

* Version: 0.3.1
* GitHub: https://github.com/NCEAS/metajam
* Source code: https://github.com/cran/metajam
* Date/Publication: 2024-08-16 17:50:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "metajam")` for more info

</details>

## In both

*   checking whether package ‘metajam’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/metajam/new/metajam.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘metajam’ ...
** package ‘metajam’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘metajam’
* removing ‘/tmp/workdir/metajam/new/metajam.Rcheck/metajam’


```
### CRAN

```
* installing *source* package ‘metajam’ ...
** package ‘metajam’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘metajam’
* removing ‘/tmp/workdir/metajam/old/metajam.Rcheck/metajam’


```
# miWQS

<details>

* Version: 0.4.4
* GitHub: https://github.com/phargarten2/miWQS
* Source code: https://github.com/cran/miWQS
* Date/Publication: 2021-04-02 21:50:02 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "miWQS")` for more info

</details>

## In both

*   checking whether package ‘miWQS’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/miWQS/new/miWQS.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘wqs’
    ```

## Installation

### Devel

```
* installing *source* package ‘miWQS’ ...
** package ‘miWQS’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘miWQS’
* removing ‘/tmp/workdir/miWQS/new/miWQS.Rcheck/miWQS’


```
### CRAN

```
* installing *source* package ‘miWQS’ ...
** package ‘miWQS’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘miWQS’
* removing ‘/tmp/workdir/miWQS/old/miWQS.Rcheck/miWQS’


```
# multinma

<details>

* Version: 0.7.2
* GitHub: https://github.com/dmphillippo/multinma
* Source code: https://github.com/cran/multinma
* Date/Publication: 2024-09-16 12:20:02 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "multinma")` for more info

</details>

## In both

*   checking whether package ‘multinma’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/multinma/new/multinma.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘multinma’ ...
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I"../inst/include" -I"/usr/local/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/usr/local/lib/R/site-library/BH/include' -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I'/usr/local/lib/R/site-library/RcppParallel/include' -I'/usr/local/lib/R/site-library/rstan/include' -I'/usr/local/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/usr/local/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
...
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:198: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/new/multinma.Rcheck/multinma’


```
### CRAN

```
* installing *source* package ‘multinma’ ...
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I"../inst/include" -I"/usr/local/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/usr/local/lib/R/site-library/BH/include' -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I'/usr/local/lib/R/site-library/RcppParallel/include' -I'/usr/local/lib/R/site-library/rstan/include' -I'/usr/local/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/usr/local/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
...
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:198: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/old/multinma.Rcheck/multinma’


```
# nesRdata

<details>

* Version: 0.3.1
* GitHub: https://github.com/jsta/nesRdata
* Source code: https://github.com/cran/nesRdata
* Date/Publication: 2020-04-30 17:20:02 UTC
* Number of recursive dependencies: 66

Run `revdepcheck::cloud_details(, "nesRdata")` for more info

</details>

## In both

*   checking whether package ‘nesRdata’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/nesRdata/new/nesRdata.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘nesRdata’ ...
** package ‘nesRdata’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘nesRdata’
* removing ‘/tmp/workdir/nesRdata/new/nesRdata.Rcheck/nesRdata’


```
### CRAN

```
* installing *source* package ‘nesRdata’ ...
** package ‘nesRdata’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘nesRdata’
* removing ‘/tmp/workdir/nesRdata/old/nesRdata.Rcheck/nesRdata’


```
# obliqueRSF

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/obliqueRSF
* Date/Publication: 2022-08-28 20:50:02 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "obliqueRSF")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/obliqueRSF/new/obliqueRSF.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘obliqueRSF/DESCRIPTION’ ... OK
...
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/obliqueRSF/old/obliqueRSF.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘obliqueRSF/DESCRIPTION’ ... OK
...
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: OK





```
# ontologics

<details>

* Version: 0.7.4
* GitHub: https://github.com/luckinet/ontologics
* Source code: https://github.com/cran/ontologics
* Date/Publication: 2025-01-17 16:50:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "ontologics")` for more info

</details>

## In both

*   checking whether package ‘ontologics’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ontologics/new/ontologics.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ontologics’ ...
** package ‘ontologics’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘ontologics’
* removing ‘/tmp/workdir/ontologics/new/ontologics.Rcheck/ontologics’


```
### CRAN

```
* installing *source* package ‘ontologics’ ...
** package ‘ontologics’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘ontologics’
* removing ‘/tmp/workdir/ontologics/old/ontologics.Rcheck/ontologics’


```
# OVtool

<details>

* Version: 1.0.3
* GitHub: NA
* Source code: https://github.com/cran/OVtool
* Date/Publication: 2021-11-02 08:10:07 UTC
* Number of recursive dependencies: 156

Run `revdepcheck::cloud_details(, "OVtool")` for more info

</details>

## In both

*   checking whether package ‘OVtool’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/OVtool/new/OVtool.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘OVtool’ ...
** package ‘OVtool’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘twang’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Execution halted
ERROR: lazy loading failed for package ‘OVtool’
* removing ‘/tmp/workdir/OVtool/new/OVtool.Rcheck/OVtool’


```
### CRAN

```
* installing *source* package ‘OVtool’ ...
** package ‘OVtool’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘twang’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Execution halted
ERROR: lazy loading failed for package ‘OVtool’
* removing ‘/tmp/workdir/OVtool/old/OVtool.Rcheck/OVtool’


```
# pammtools

<details>

* Version: 0.5.93
* GitHub: https://github.com/adibender/pammtools
* Source code: https://github.com/cran/pammtools
* Date/Publication: 2024-02-25 10:10:02 UTC
* Number of recursive dependencies: 124

Run `revdepcheck::cloud_details(, "pammtools")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/pammtools/new/pammtools.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pammtools/DESCRIPTION’ ... OK
...
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking R/sysdata.rda ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/pammtools/old/pammtools.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pammtools/DESCRIPTION’ ... OK
...
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking R/sysdata.rda ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: OK





```
# pathwayTMB

<details>

* Version: 0.1.3
* GitHub: NA
* Source code: https://github.com/cran/pathwayTMB
* Date/Publication: 2022-08-09 13:50:02 UTC
* Number of recursive dependencies: 226

Run `revdepcheck::cloud_details(, "pathwayTMB")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/pathwayTMB/new/pathwayTMB.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pathwayTMB/DESCRIPTION’ ... OK
...
* this is package ‘pathwayTMB’ version ‘0.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/pathwayTMB/old/pathwayTMB.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pathwayTMB/DESCRIPTION’ ... OK
...
* this is package ‘pathwayTMB’ version ‘0.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# pencal

<details>

* Version: 2.2.2
* GitHub: NA
* Source code: https://github.com/cran/pencal
* Date/Publication: 2024-06-12 11:10:02 UTC
* Number of recursive dependencies: 174

Run `revdepcheck::cloud_details(, "pencal")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/pencal/new/pencal.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pencal/DESCRIPTION’ ... OK
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘riskRegression’

Package suggested but not available for checking: ‘ptmixed’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/pencal/old/pencal.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pencal/DESCRIPTION’ ... OK
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘riskRegression’

Package suggested but not available for checking: ‘ptmixed’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# quid

<details>

* Version: 0.0.1
* GitHub: NA
* Source code: https://github.com/cran/quid
* Date/Publication: 2021-12-09 09:00:02 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "quid")` for more info

</details>

## In both

*   checking whether package ‘quid’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/quid/new/quid.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘quid’ ...
** package ‘quid’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘quid’
* removing ‘/tmp/workdir/quid/new/quid.Rcheck/quid’


```
### CRAN

```
* installing *source* package ‘quid’ ...
** package ‘quid’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘quid’
* removing ‘/tmp/workdir/quid/old/quid.Rcheck/quid’


```
# rdflib

<details>

* Version: 0.2.9
* GitHub: https://github.com/ropensci/rdflib
* Source code: https://github.com/cran/rdflib
* Date/Publication: 2024-08-17 06:00:05 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "rdflib")` for more info

</details>

## In both

*   checking whether package ‘rdflib’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/rdflib/new/rdflib.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘rdflib’ ...
** package ‘rdflib’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘rdflib’
* removing ‘/tmp/workdir/rdflib/new/rdflib.Rcheck/rdflib’


```
### CRAN

```
* installing *source* package ‘rdflib’ ...
** package ‘rdflib’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘rdflib’
* removing ‘/tmp/workdir/rdflib/old/rdflib.Rcheck/rdflib’


```
# rmlnomogram

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/rmlnomogram
* Number of recursive dependencies: 181

Run `revdepcheck::cloud_details(, "rmlnomogram")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# robber

<details>

* Version: 0.2.4
* GitHub: https://github.com/Chabert-Liddell/robber
* Source code: https://github.com/cran/robber
* Date/Publication: 2024-02-07 13:50:02 UTC
* Number of recursive dependencies: 143

Run `revdepcheck::cloud_details(, "robber")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/robber/new/robber.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘robber/DESCRIPTION’ ... OK
...
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘topological-analysis.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/robber/old/robber.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘robber/DESCRIPTION’ ... OK
...
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘topological-analysis.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# rplec

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/rplec
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "rplec")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# RVA

<details>

* Version: 0.0.5
* GitHub: https://github.com/THERMOSTATS/RVA
* Source code: https://github.com/cran/RVA
* Date/Publication: 2021-11-01 21:40:02 UTC
* Number of recursive dependencies: 210

Run `revdepcheck::cloud_details(, "RVA")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/RVA/new/RVA.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RVA/DESCRIPTION’ ... OK
...
* this is package ‘RVA’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/RVA/old/RVA.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RVA/DESCRIPTION’ ... OK
...
* this is package ‘RVA’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# scCustomize

<details>

* Version: 3.0.1
* GitHub: https://github.com/samuel-marsh/scCustomize
* Source code: https://github.com/cran/scCustomize
* Date/Publication: 2024-12-18 18:40:02 UTC
* Number of recursive dependencies: 272

Run `revdepcheck::cloud_details(, "scCustomize")` for more info

</details>

## In both

*   checking whether package ‘scCustomize’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/scCustomize/new/scCustomize.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘Nebulosa’
    ```

## Installation

### Devel

```
* installing *source* package ‘scCustomize’ ...
** package ‘scCustomize’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘SeuratObject’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is being loaded, but >= 1.6.4 is required
Execution halted
ERROR: lazy loading failed for package ‘scCustomize’
* removing ‘/tmp/workdir/scCustomize/new/scCustomize.Rcheck/scCustomize’


```
### CRAN

```
* installing *source* package ‘scCustomize’ ...
** package ‘scCustomize’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘SeuratObject’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is being loaded, but >= 1.6.4 is required
Execution halted
ERROR: lazy loading failed for package ‘scCustomize’
* removing ‘/tmp/workdir/scCustomize/old/scCustomize.Rcheck/scCustomize’


```
# scpi

<details>

* Version: 2.2.6
* GitHub: NA
* Source code: https://github.com/cran/scpi
* Date/Publication: 2024-11-11 23:40:02 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "scpi")` for more info

</details>

## In both

*   checking whether package ‘scpi’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/scpi/new/scpi.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘scpi’ ...
** package ‘scpi’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Warning in .recacheSubclasses(def@className, def, env) :
  undefined subclass "pcorMatrix" of class "ConstVal"; definition not updated
Warning in .recacheSubclasses(def@className, def, env) :
...
Warning in .recacheSubclasses(def@className, def, env) :
  undefined subclass "pcorMatrix" of class "ConstValORExpr"; definition not updated
Warning in .recacheSubclasses(def@className, def, env) :
  undefined subclass "pcorMatrix" of class "ConstValORNULL"; definition not updated
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘scpi’
* removing ‘/tmp/workdir/scpi/new/scpi.Rcheck/scpi’


```
### CRAN

```
* installing *source* package ‘scpi’ ...
** package ‘scpi’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Warning in .recacheSubclasses(def@className, def, env) :
  undefined subclass "pcorMatrix" of class "ConstVal"; definition not updated
Warning in .recacheSubclasses(def@className, def, env) :
...
Warning in .recacheSubclasses(def@className, def, env) :
  undefined subclass "pcorMatrix" of class "ConstValORExpr"; definition not updated
Warning in .recacheSubclasses(def@className, def, env) :
  undefined subclass "pcorMatrix" of class "ConstValORNULL"; definition not updated
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘scpi’
* removing ‘/tmp/workdir/scpi/old/scpi.Rcheck/scpi’


```
# SCpubr

<details>

* Version: 2.0.2
* GitHub: https://github.com/enblacar/SCpubr
* Source code: https://github.com/cran/SCpubr
* Date/Publication: 2023-10-11 09:50:02 UTC
* Number of recursive dependencies: 301

Run `revdepcheck::cloud_details(, "SCpubr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SCpubr/new/SCpubr.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SCpubr/DESCRIPTION’ ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘reference_manual.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/SCpubr/old/SCpubr.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SCpubr/DESCRIPTION’ ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘reference_manual.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# SEERaBomb

<details>

* Version: 2019.2
* GitHub: NA
* Source code: https://github.com/cran/SEERaBomb
* Date/Publication: 2019-12-12 18:50:03 UTC
* Number of recursive dependencies: 185

Run `revdepcheck::cloud_details(, "SEERaBomb")` for more info

</details>

## In both

*   checking whether package ‘SEERaBomb’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/SEERaBomb/new/SEERaBomb.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘SEERaBomb’ ...
** package ‘SEERaBomb’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: ‘gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
gcc -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c SEERaBomb_init.c -o SEERaBomb_init.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c fillPYM.cpp -o fillPYM.o
g++ -std=gnu++17 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o SEERaBomb.so RcppExports.o SEERaBomb_init.o fillPYM.o -L/opt/R/4.3.1/lib/R/lib -lR
...
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘demography’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Execution halted
ERROR: lazy loading failed for package ‘SEERaBomb’
* removing ‘/tmp/workdir/SEERaBomb/new/SEERaBomb.Rcheck/SEERaBomb’


```
### CRAN

```
* installing *source* package ‘SEERaBomb’ ...
** package ‘SEERaBomb’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: ‘gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
using C++ compiler: ‘g++ (Ubuntu 13.2.0-23ubuntu4) 13.2.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
gcc -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c SEERaBomb_init.c -o SEERaBomb_init.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c fillPYM.cpp -o fillPYM.o
g++ -std=gnu++17 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o SEERaBomb.so RcppExports.o SEERaBomb_init.o fillPYM.o -L/opt/R/4.3.1/lib/R/lib -lR
...
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘demography’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Execution halted
ERROR: lazy loading failed for package ‘SEERaBomb’
* removing ‘/tmp/workdir/SEERaBomb/old/SEERaBomb.Rcheck/SEERaBomb’


```
# SensIAT

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/SensIAT
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "SensIAT")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# SimplyAgree

<details>

* Version: 0.2.0
* GitHub: https://github.com/arcaldwell49/SimplyAgree
* Source code: https://github.com/cran/SimplyAgree
* Date/Publication: 2024-03-21 14:20:06 UTC
* Number of recursive dependencies: 118

Run `revdepcheck::cloud_details(, "SimplyAgree")` for more info

</details>

## In both

*   checking whether package ‘SimplyAgree’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/SimplyAgree/new/SimplyAgree.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘SimplyAgree’ ...
** package ‘SimplyAgree’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Warning in check_dep_version() :
  ABI version mismatch: 
lme4 was built with Matrix ABI version 1
Current Matrix ABI version is 0
Please re-install lme4 from source or restore original ‘Matrix’ package
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘SimplyAgree’
* removing ‘/tmp/workdir/SimplyAgree/new/SimplyAgree.Rcheck/SimplyAgree’


```
### CRAN

```
* installing *source* package ‘SimplyAgree’ ...
** package ‘SimplyAgree’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Warning in check_dep_version() :
  ABI version mismatch: 
lme4 was built with Matrix ABI version 1
Current Matrix ABI version is 0
Please re-install lme4 from source or restore original ‘Matrix’ package
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘SimplyAgree’
* removing ‘/tmp/workdir/SimplyAgree/old/SimplyAgree.Rcheck/SimplyAgree’


```
# ssdGSA

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/ssdGSA
* Date/Publication: 2024-07-26 23:10:02 UTC
* Number of recursive dependencies: 174

Run `revdepcheck::cloud_details(, "ssdGSA")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ssdGSA/new/ssdGSA.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ssdGSA/DESCRIPTION’ ... OK
...
* this is package ‘ssdGSA’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/ssdGSA/old/ssdGSA.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ssdGSA/DESCRIPTION’ ... OK
...
* this is package ‘ssdGSA’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# SSHAARP

<details>

* Version: 2.0.5
* GitHub: NA
* Source code: https://github.com/cran/SSHAARP
* Date/Publication: 2024-12-11 07:50:06 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "SSHAARP")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SSHAARP/new/SSHAARP.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SSHAARP/DESCRIPTION’ ... OK
...
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘vignette.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/SSHAARP/old/SSHAARP.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
    GNU Fortran (Ubuntu 13.2.0-23ubuntu4) 13.2.0
* running under: Ubuntu 24.04.1 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SSHAARP/DESCRIPTION’ ... OK
...
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘vignette.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# stabiliser

<details>

* Version: 1.0.6
* GitHub: NA
* Source code: https://github.com/cran/stabiliser
* Date/Publication: 2023-05-17 11:00:05 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "stabiliser")` for more info

</details>

## In both

*   checking whether package ‘stabiliser’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/stabiliser/new/stabiliser.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘stabiliser’ ...
** package ‘stabiliser’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘maditr’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘stabiliser’
* removing ‘/tmp/workdir/stabiliser/new/stabiliser.Rcheck/stabiliser’


```
### CRAN

```
* installing *source* package ‘stabiliser’ ...
** package ‘stabiliser’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘maditr’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘stabiliser’
* removing ‘/tmp/workdir/stabiliser/old/stabiliser.Rcheck/stabiliser’


```
# tidyseurat

<details>

* Version: 0.8.0
* GitHub: https://github.com/stemangiola/tidyseurat
* Source code: https://github.com/cran/tidyseurat
* Date/Publication: 2024-01-10 04:50:02 UTC
* Number of recursive dependencies: 196

Run `revdepcheck::cloud_details(, "tidyseurat")` for more info

</details>

## In both

*   checking whether package ‘tidyseurat’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/tidyseurat/new/tidyseurat.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘tidyseurat’ ...
** package ‘tidyseurat’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘SeuratObject’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.4 is required
Execution halted
ERROR: lazy loading failed for package ‘tidyseurat’
* removing ‘/tmp/workdir/tidyseurat/new/tidyseurat.Rcheck/tidyseurat’


```
### CRAN

```
* installing *source* package ‘tidyseurat’ ...
** package ‘tidyseurat’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘SeuratObject’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.4 is required
Execution halted
ERROR: lazy loading failed for package ‘tidyseurat’
* removing ‘/tmp/workdir/tidyseurat/old/tidyseurat.Rcheck/tidyseurat’


```
# TriDimRegression

<details>

* Version: 1.0.2
* GitHub: https://github.com/alexander-pastukhov/tridim-regression
* Source code: https://github.com/cran/TriDimRegression
* Date/Publication: 2023-09-13 14:10:03 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "TriDimRegression")` for more info

</details>

## In both

*   checking whether package ‘TriDimRegression’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/TriDimRegression/new/TriDimRegression.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘TriDimRegression’ ...
** package ‘TriDimRegression’ successfully unpacked and MD5 sums checked
** using staged installation
Error in loadNamespace(x) : there is no package called ‘rstantools’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: configuration failed for package ‘TriDimRegression’
* removing ‘/tmp/workdir/TriDimRegression/new/TriDimRegression.Rcheck/TriDimRegression’


```
### CRAN

```
* installing *source* package ‘TriDimRegression’ ...
** package ‘TriDimRegression’ successfully unpacked and MD5 sums checked
** using staged installation
Error in loadNamespace(x) : there is no package called ‘rstantools’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: configuration failed for package ‘TriDimRegression’
* removing ‘/tmp/workdir/TriDimRegression/old/TriDimRegression.Rcheck/TriDimRegression’


```
# WRTDStidal

<details>

* Version: 1.1.4
* GitHub: https://github.com/fawda123/WRTDStidal
* Source code: https://github.com/cran/WRTDStidal
* Date/Publication: 2023-10-20 09:00:11 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "WRTDStidal")` for more info

</details>

## In both

*   checking whether package ‘WRTDStidal’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/WRTDStidal/new/WRTDStidal.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘WRTDStidal’ ...
** package ‘WRTDStidal’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘WRTDStidal’
* removing ‘/tmp/workdir/WRTDStidal/new/WRTDStidal.Rcheck/WRTDStidal’


```
### CRAN

```
* installing *source* package ‘WRTDStidal’ ...
** package ‘WRTDStidal’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘WRTDStidal’
* removing ‘/tmp/workdir/WRTDStidal/old/WRTDStidal.Rcheck/WRTDStidal’


```
