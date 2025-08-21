# apa

<details>

* Version: 0.3.4
* GitHub: https://github.com/dgromer/apa
* Source code: https://github.com/cran/apa
* Date/Publication: 2023-10-06 15:00:02 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "apa")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/apa/new/apa.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘apa/DESCRIPTION’ ... OK
...
* this is package ‘apa’ version ‘0.3.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/apa/old/apa.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘apa/DESCRIPTION’ ... OK
...
* this is package ‘apa’ version ‘0.3.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# arealDB

<details>

* Version: 0.9.4
* GitHub: https://github.com/luckinet/arealDB
* Source code: https://github.com/cran/arealDB
* Date/Publication: 2025-01-20 13:40:05 UTC
* Number of recursive dependencies: 109

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
# dsTidyverse

<details>

* Version: 1.0.4
* GitHub: NA
* Source code: https://github.com/cran/dsTidyverse
* Date/Publication: 2025-02-27 09:40:06 UTC
* Number of recursive dependencies: 134

Run `revdepcheck::cloud_details(, "dsTidyverse")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/dsTidyverse/new/dsTidyverse.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dsTidyverse/DESCRIPTION’ ... OK
...
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... NONE
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/dsTidyverse/old/dsTidyverse.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dsTidyverse/DESCRIPTION’ ... OK
...
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... NONE
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
# kerastuneR

<details>

* Version: 0.1.0.7
* GitHub: https://github.com/EagerAI/kerastuneR
* Source code: https://github.com/cran/kerastuneR
* Date/Publication: 2024-04-13 13:20:02 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "kerastuneR")` for more info

</details>

## Newly broken

*   checking whether package ‘kerastuneR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/kerastuneR/new/kerastuneR.Rcheck/00install.out’ for details.
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
# metajam

<details>

* Version: 0.3.1
* GitHub: https://github.com/NCEAS/metajam
* Source code: https://github.com/cran/metajam
* Date/Publication: 2024-08-16 17:50:02 UTC
* Number of recursive dependencies: 89

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
# nesRdata

<details>

* Version: 0.3.1
* GitHub: https://github.com/jsta/nesRdata
* Source code: https://github.com/cran/nesRdata
* Date/Publication: 2020-04-30 17:20:02 UTC
* Number of recursive dependencies: 65

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
# ontologics

<details>

* Version: 0.7.4
* GitHub: https://github.com/luckinet/ontologics
* Source code: https://github.com/cran/ontologics
* Date/Publication: 2025-01-17 16:50:02 UTC
* Number of recursive dependencies: 79

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
# rdflib

<details>

* Version: 0.2.9
* GitHub: https://github.com/ropensci/rdflib
* Source code: https://github.com/cran/rdflib
* Date/Publication: 2024-08-17 06:00:05 UTC
* Number of recursive dependencies: 92

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
# sprtt

<details>

* Version: 0.2.0
* GitHub: https://github.com/MeikeSteinhilber/sprtt
* Source code: https://github.com/cran/sprtt
* Date/Publication: 2023-07-06 13:50:02 UTC
* Number of recursive dependencies: 146

Run `revdepcheck::cloud_details(, "sprtt")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/sprtt/new/sprtt.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sprtt/DESCRIPTION’ ... OK
...
* this is package ‘sprtt’ version ‘0.2.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/sprtt/old/sprtt.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sprtt/DESCRIPTION’ ... OK
...
* this is package ‘sprtt’ version ‘0.2.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# stoRy

<details>

* Version: 0.2.2
* GitHub: https://github.com/theme-ontology/stoRy
* Source code: https://github.com/cran/stoRy
* Date/Publication: 2023-06-13 23:10:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "stoRy")` for more info

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
# Surrogate

<details>

* Version: 3.4.1
* GitHub: https://github.com/florianstijven/Surrogate-development
* Source code: https://github.com/cran/Surrogate
* Date/Publication: 2025-04-29 04:40:02 UTC
* Number of recursive dependencies: 192

Run `revdepcheck::cloud_details(, "Surrogate")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Surrogate/new/Surrogate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Surrogate/DESCRIPTION’ ... OK
...
* this is package ‘Surrogate’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/Surrogate/old/Surrogate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Surrogate/DESCRIPTION’ ... OK
...
* this is package ‘Surrogate’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# tidybins

<details>

* Version: 0.1.1
* GitHub: https://github.com/Harrison4192/tidybins
* Source code: https://github.com/cran/tidybins
* Date/Publication: 2024-06-12 04:50:02 UTC
* Number of recursive dependencies: 222

Run `revdepcheck::cloud_details(, "tidybins")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidybins/new/tidybins.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybins/DESCRIPTION’ ... OK
...
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 3 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidybins/old/tidybins.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybins/DESCRIPTION’ ... OK
...
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 3 NOTEs





```
# tidycomm

<details>

* Version: 0.4.1
* GitHub: https://github.com/joon-e/tidycomm
* Source code: https://github.com/cran/tidycomm
* Date/Publication: 2024-02-22 12:20:02 UTC
* Number of recursive dependencies: 141

Run `revdepcheck::cloud_details(, "tidycomm")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidycomm/new/tidycomm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidycomm/DESCRIPTION’ ... OK
...
* this is package ‘tidycomm’ version ‘0.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidycomm/old/tidycomm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidycomm/DESCRIPTION’ ... OK
...
* this is package ‘tidycomm’ version ‘0.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# tidyjson

<details>

* Version: 0.3.2
* GitHub: https://github.com/colearendt/tidyjson
* Source code: https://github.com/cran/tidyjson
* Date/Publication: 2023-01-07 00:20:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "tidyjson")` for more info

</details>

## Newly broken

*   checking whether package ‘tidyjson’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/tidyjson/new/tidyjson.Rcheck/00install.out’ for details.
    ```

## Newly fixed

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) json_schema.Rd:33: Lost braces; missing escapes or markup?
        33 |   \item object  -> {"name": <type>} e.g., {"age": 32} -> {"age": "number"}
           |                    ^
    checkRd: (-1) json_schema.Rd:33: Lost braces; missing escapes or markup?
        33 |   \item object  -> {"name": <type>} e.g., {"age": 32} -> {"age": "number"}
           |                                           ^
    checkRd: (-1) json_schema.Rd:33: Lost braces; missing escapes or markup?
        33 |   \item object  -> {"name": <type>} e.g., {"age": 32} -> {"age": "number"}
           |                                                          ^
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
# TriDimRegression

<details>

* Version: 1.0.2
* GitHub: https://github.com/alexander-pastukhov/tridim-regression
* Source code: https://github.com/cran/TriDimRegression
* Date/Publication: 2023-09-13 14:10:03 UTC
* Number of recursive dependencies: 95

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
