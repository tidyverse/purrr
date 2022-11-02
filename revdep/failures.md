# elbird

<details>

* Version: 0.2.5
* GitHub: https://github.com/mrchypark/elbird
* Source code: https://github.com/cran/elbird
* Date/Publication: 2022-08-12 15:50:02 UTC
* Number of recursive dependencies: 54

Run `revdepcheck::cloud_details(, "elbird")` for more info

</details>

## In both

*   checking whether package ‘elbird’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/elbird/new/elbird.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘elbird’ ...
** package ‘elbird’ successfully unpacked and MD5 sums checked
** using staged installation
/usr/bin/uname
Prior system libkiwi installation not found
Preparing to download and build library from source...
------------------------------[ ELBIRD ]------------------------------
Configuration failed because 'git' was not found.
If you want to kiwi build from source in package installation prosess,
make sure git and cmake work in system.
-------------------------------------------------------------------------
ERROR: configuration failed for package ‘elbird’
* removing ‘/tmp/workdir/elbird/new/elbird.Rcheck/elbird’


```
### CRAN

```
* installing *source* package ‘elbird’ ...
** package ‘elbird’ successfully unpacked and MD5 sums checked
** using staged installation
/usr/bin/uname
Prior system libkiwi installation not found
Preparing to download and build library from source...
------------------------------[ ELBIRD ]------------------------------
Configuration failed because 'git' was not found.
If you want to kiwi build from source in package installation prosess,
make sure git and cmake work in system.
-------------------------------------------------------------------------
ERROR: configuration failed for package ‘elbird’
* removing ‘/tmp/workdir/elbird/old/elbird.Rcheck/elbird’


```
# ggPMX

<details>

* Version: 1.2.8
* GitHub: https://github.com/ggPMXdevelopment/ggPMX
* Source code: https://github.com/cran/ggPMX
* Date/Publication: 2022-06-17 23:10:02 UTC
* Number of recursive dependencies: 177

Run `revdepcheck::cloud_details(, "ggPMX")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ggPMX/new/ggPMX.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggPMX/DESCRIPTION’ ... OK
* this is package ‘ggPMX’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  [ FAIL 1 | WARN 12 | SKIP 8 | PASS 327 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘ggPMX-guide.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/ggPMX/old/ggPMX.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggPMX/DESCRIPTION’ ... OK
* this is package ‘ggPMX’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  [ FAIL 1 | WARN 11 | SKIP 8 | PASS 327 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘ggPMX-guide.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
# ggraptR

<details>

* Version: 1.3
* GitHub: https://github.com/cargomoose/raptR
* Source code: https://github.com/cran/ggraptR
* Date/Publication: 2020-06-24 05:00:03 UTC
* Number of recursive dependencies: 66

Run `revdepcheck::cloud_details(, "ggraptR")` for more info

</details>

## In both

*   checking whether package ‘ggraptR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ggraptR/new/ggraptR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ggraptR’ ...
** package ‘ggraptR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘dplyr’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘pkgconfig’
Execution halted
ERROR: lazy loading failed for package ‘ggraptR’
* removing ‘/tmp/workdir/ggraptR/new/ggraptR.Rcheck/ggraptR’


```
### CRAN

```
* installing *source* package ‘ggraptR’ ...
** package ‘ggraptR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘dplyr’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘pkgconfig’
Execution halted
ERROR: lazy loading failed for package ‘ggraptR’
* removing ‘/tmp/workdir/ggraptR/old/ggraptR.Rcheck/ggraptR’


```
# ImputeRobust

<details>

* Version: 1.3-1
* GitHub: NA
* Source code: https://github.com/cran/ImputeRobust
* Date/Publication: 2018-11-30 12:10:03 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "ImputeRobust")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ImputeRobust/new/ImputeRobust.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ImputeRobust/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ImputeRobust’ version ‘1.3-1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘extremevalues’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/ImputeRobust/old/ImputeRobust.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ImputeRobust/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ImputeRobust’ version ‘1.3-1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘extremevalues’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# Platypus

<details>

* Version: 3.4.1
* GitHub: NA
* Source code: https://github.com/cran/Platypus
* Date/Publication: 2022-08-15 07:20:20 UTC
* Number of recursive dependencies: 353

Run `revdepcheck::cloud_details(, "Platypus")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Platypus/new/Platypus.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Platypus/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Platypus’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘PlatypusV3_agedCNS.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/Platypus/old/Platypus.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Platypus/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Platypus’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘PlatypusV3_agedCNS.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# rdddr

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/rdddr
* Date/Publication: 2022-07-03 09:20:02 UTC
* Number of recursive dependencies: 203

Run `revdepcheck::cloud_details(, "rdddr")` for more info

</details>

## In both

*   checking whether package ‘rdddr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/rdddr/new/rdddr.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘CausalQueries’
    ```

## Installation

### Devel

```
* installing *source* package ‘rdddr’ ...
** package ‘rdddr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘gtable’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘rdddr’
* removing ‘/tmp/workdir/rdddr/new/rdddr.Rcheck/rdddr’


```
### CRAN

```
* installing *source* package ‘rdddr’ ...
** package ‘rdddr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘gtable’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘rdddr’
* removing ‘/tmp/workdir/rdddr/old/rdddr.Rcheck/rdddr’


```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
