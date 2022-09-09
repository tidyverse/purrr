# elbird

<details>

* Version: 0.2.5
* GitHub: https://github.com/mrchypark/elbird
* Source code: https://github.com/cran/elbird
* Date/Publication: 2022-08-12 15:50:02 UTC
* Number of recursive dependencies: 54

Run `cloud_details(, "elbird")` for more info

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
* Number of recursive dependencies: 175

Run `cloud_details(, "ggPMX")` for more info

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
  [ FAIL 1 | WARN 10 | SKIP 8 | PASS 327 ]
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
  [ FAIL 1 | WARN 10 | SKIP 8 | PASS 327 ]
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
# ImputeRobust

<details>

* Version: 1.3-1
* GitHub: NA
* Source code: https://github.com/cran/ImputeRobust
* Date/Publication: 2018-11-30 12:10:03 UTC
* Number of recursive dependencies: 52

Run `cloud_details(, "ImputeRobust")` for more info

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
# kerastuneR

<details>

* Version: 0.1.0.5
* GitHub: https://github.com/EagerAI/kerastuneR
* Source code: https://github.com/cran/kerastuneR
* Date/Publication: 2022-03-25 08:50:02 UTC
* Number of recursive dependencies: 112

Run `cloud_details(, "kerastuneR")` for more info

</details>

## Newly broken

*   checking whether package ‘kerastuneR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/kerastuneR/new/kerastuneR.Rcheck/00install.out’ for details.
    ```

## Newly fixed

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘keras’
      All declared Imports should be used.
    ```

## Installation

### Devel

```
* installing *source* package ‘kerastuneR’ ...
** package ‘kerastuneR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘kerastuneR’
* removing ‘/tmp/workdir/kerastuneR/new/kerastuneR.Rcheck/kerastuneR’


```
### CRAN

```
* installing *source* package ‘kerastuneR’ ...
** package ‘kerastuneR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (kerastuneR)


```
# rATTAINS

<details>

* Version: 0.1.3
* GitHub: https://github.com/mps9506/rATTAINS
* Source code: https://github.com/cran/rATTAINS
* Date/Publication: 2021-11-03 14:10:02 UTC
* Number of recursive dependencies: 80

Run `cloud_details(, "rATTAINS")` for more info

</details>

## Newly broken

*   checking whether package ‘rATTAINS’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/rATTAINS/new/rATTAINS.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘rATTAINS’ ...
** package ‘rATTAINS’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘rATTAINS’
* removing ‘/tmp/workdir/rATTAINS/new/rATTAINS.Rcheck/rATTAINS’


```
### CRAN

```
* installing *source* package ‘rATTAINS’ ...
** package ‘rATTAINS’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (rATTAINS)


```
# stoRy

<details>

* Version: 0.2.0
* GitHub: https://github.com/theme-ontology/stoRy
* Source code: https://github.com/cran/stoRy
* Date/Publication: 2021-11-08 05:10:02 UTC
* Number of recursive dependencies: 76

Run `cloud_details(, "stoRy")` for more info

</details>

## Newly broken

*   checking whether package ‘stoRy’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/stoRy/new/stoRy.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘stoRy’ ...
** package ‘stoRy’ successfully unpacked and MD5 sums checked
** using staged installation
** R
Warning: namespace ‘stoRy’ is not available and has been replaced
by .GlobalEnv when processing object ‘background_collection’
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘stoRy’
* removing ‘/tmp/workdir/stoRy/new/stoRy.Rcheck/stoRy’


```
### CRAN

```
* installing *source* package ‘stoRy’ ...
** package ‘stoRy’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (stoRy)


```
# tidyjson

<details>

* Version: 0.3.1
* GitHub: https://github.com/colearendt/tidyjson
* Source code: https://github.com/cran/tidyjson
* Date/Publication: 2020-05-31 21:30:03 UTC
* Number of recursive dependencies: 96

Run `cloud_details(, "tidyjson")` for more info

</details>

## Newly broken

*   checking whether package ‘tidyjson’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/tidyjson/new/tidyjson.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘tidyjson’ ...
** package ‘tidyjson’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘tidyjson’
* removing ‘/tmp/workdir/tidyjson/new/tidyjson.Rcheck/tidyjson’


```
### CRAN

```
* installing *source* package ‘tidyjson’ ...
** package ‘tidyjson’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (tidyjson)


```
