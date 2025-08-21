# admiral

<details>

* Version: 1.3.1
* GitHub: https://github.com/pharmaverse/admiral
* Source code: https://github.com/cran/admiral
* Date/Publication: 2025-07-29 14:40:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "admiral")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘finding-thresholds.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        doc    2.3Mb
        help   1.8Mb
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# CohortCharacteristics

<details>

* Version: 1.0.0
* GitHub: https://github.com/darwin-eu/CohortCharacteristics
* Source code: https://github.com/cran/CohortCharacteristics
* Date/Publication: 2025-05-20 22:30:11 UTC
* Number of recursive dependencies: 189

Run `revdepcheck::cloud_details(, "CohortCharacteristics")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘summarise_characteristics.Rmd’ using rmarkdown
    trying URL 'https://example-data.ohdsi.dev/GiBleed.zip'
    Content type 'application/zip' length 6754786 bytes (6.4 MB)
    ============
    downloaded 1.7 MB
    
    
    Quitting from summarise_characteristics.Rmd:11-19 [unnamed-chunk-1]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ...
    
    Error: processing vignette 'summarise_characteristics.Rmd' failed with diagnostics:
    download from 'https://example-data.ohdsi.dev/GiBleed.zip' failed
    --- failed re-building ‘summarise_characteristics.Rmd’
    
    --- re-building ‘summarise_cohort_overlap.Rmd’ using rmarkdown
    trying URL 'https://example-data.ohdsi.dev/GiBleed.zip'
    Content type 'application/zip' length 6754786 bytes (6.4 MB)
    ==================================================
    downloaded 6.4 MB
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        doc    4.0Mb
        help   1.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘reactable’ ‘DT’
    A package should be listed in only one of these fields.
    ```

# CPAT

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/CPAT
* Date/Publication: 2018-12-25 22:40:08 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "CPAT")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(CPAT)
      Package 'CPAT' version 0.1.0
      Type citation("CPAT") for citing this R package in publications
      > 
      > test_check("CPAT")
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 97 ]
    ...
       1. ├─testthat::expect_equal(...) at test-TestStatisticsFunctions.R:152:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─CPAT:::stat_hs(...)
       5.   └─base::vapply(1:length(dat), custom_var, FUN.VALUE = numeric(1))
       6.     └─CPAT (local) FUN(X[[i]], ...)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 97 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rdpack’ ‘grDevices’
      All declared Imports should be used.
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
# MeasurementDiagnostics

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/MeasurementDiagnostics
* Date/Publication: 2025-07-29 11:50:02 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "MeasurementDiagnostics")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘summariseMeasurementUse.Rmd’ using rmarkdown
    trying URL 'https://example-data.ohdsi.dev/GiBleed.zip'
    Content type 'application/zip' length 6754786 bytes (6.4 MB)
    ===============
    downloaded 2.0 MB
    
    
    Quitting from summariseMeasurementUse.Rmd:10-18 [unnamed-chunk-1]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ...
    
    Error: processing vignette 'summariseMeasurementUse.Rmd' failed with diagnostics:
    download from 'https://example-data.ohdsi.dev/GiBleed.zip' failed
    --- failed re-building ‘summariseMeasurementUse.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘summariseMeasurementUse.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# omock

<details>

* Version: 0.4.0
* GitHub: https://github.com/ohdsi/omock
* Source code: https://github.com/cran/omock
* Date/Publication: 2025-06-12 16:10:02 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "omock")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘omock-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: mockCdmFromDataset
    > ### Title: Create a 'local' cdm_reference from a dataset.
    > ### Aliases: mockCdmFromDataset
    > 
    > ### ** Examples
    > 
    > library(omock)
    ...
    downloaded 56 KB
    
    Warning in utils::download.file(url = url, destfile = datasetFile) :
      downloaded length 57344 != reported length 6754786
    Warning in utils::download.file(url = url, destfile = datasetFile) :
      URL 'https://example-data.ohdsi.dev/GiBleed.zip': Timeout of 60 seconds was reached
    Error in utils::download.file(url = url, destfile = datasetFile) : 
      download from 'https://example-data.ohdsi.dev/GiBleed.zip' failed
    Calls: downloadMockDataset -> <Anonymous>
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
      i Actually got a <simpleError> with text:
        object 'cdm' not found
      ── Failure ('test-mockDatasets.R:35:3'): mock datasets cdm creation ────────────
      Expected `cdm <- mockCdmFromDataset(datasetName = dbName)` to run without any errors.
      i Actually got a <rlang_error> with text:
        At least person and observation_period should be provided in tables
      
      [ FAIL 6 | WARN 12 | SKIP 0 | PASS 108 ]
      Error: Test failures
      Execution halted
    ```

# OmopSketch

<details>

* Version: 0.5.1
* GitHub: https://github.com/OHDSI/OmopSketch
* Source code: https://github.com/cran/OmopSketch
* Date/Publication: 2025-06-19 19:50:06 UTC
* Number of recursive dependencies: 175

Run `revdepcheck::cloud_details(, "OmopSketch")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
        9.         │   └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       10.         │     └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       11.         │       └─base (local) doTryCatch(return(expr), name, parentenv, handler)
       12.         └─testthat:::parallel_event_loop_chunky(queue, reporters, ".")
       13.           └─queue$poll(Inf)
       14.             └─base::lapply(...)
       15.               └─testthat (local) FUN(X[[i]], ...)
       16.                 └─private$handle_error(msg, i)
       17.                   └─rlang::abort(...)
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘database_characteristics.Rmd’ using rmarkdown
    --- finished re-building ‘database_characteristics.Rmd’
    
    --- re-building ‘missing_data.Rmd’ using rmarkdown
    trying URL 'https://example-data.ohdsi.dev/GiBleed.zip'
    Content type 'application/zip' length 6754786 bytes (6.4 MB)
    ===============
    downloaded 2.0 MB
    
    ...
     3.     ├─withr::with_options(...)
     4.     │ └─base::force(code)
     5.     └─utils::download.file(...)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'missing_data.Rmd' failed with diagnostics:
    download from 'https://example-data.ohdsi.dev/GiBleed.zip' failed
    --- failed re-building ‘missing_data.Rmd’
    
    --- re-building ‘summarise_clinical_tables_records.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 18.1Mb
      sub-directories of 1Mb or more:
        doc  17.1Mb
    ```

# PatientProfiles

<details>

* Version: 1.4.2
* GitHub: https://github.com/darwin-eu/PatientProfiles
* Source code: https://github.com/cran/PatientProfiles
* Date/Publication: 2025-07-09 13:20:05 UTC
* Number of recursive dependencies: 138

Run `revdepcheck::cloud_details(, "PatientProfiles")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘cohort-intersect.Rmd’ using rmarkdown
    ```

# quincunx

<details>

* Version: 0.1.10
* GitHub: https://github.com/ramiromagno/quincunx
* Source code: https://github.com/cran/quincunx
* Date/Publication: 2025-05-31 17:10:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "quincunx")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘quincunx-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_cohorts
    > ### Title: Get PGS Catalog Cohorts
    > ### Aliases: get_cohorts
    > 
    > ### ** Examples
    > 
    > # Get information about specific cohorts by their symbols (acronyms)
    ...
     18. │                 └─quincunx:::count(json_string)
     19. ├─base::loadNamespace(x)
     20. │ └─base::namespaceImportFrom(...)
     21. │   └─base::importIntoEnv(impenv, impnames, ns, impvars)
     22. │     └─base::stop(...)
     23. └─base::.handleSimpleError(...)
     24.   └─purrr (local) h(simpleError(msg, call))
     25.     └─cli::cli_abort(...)
     26.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(quincunx)
      > 
      > test_check("quincunx")
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 12 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─quincunx:::is_paginated(txt)
       5. │ └─quincunx:::count(json_string)
       6. └─base::loadNamespace(x)
       7.   └─base::namespaceImportFrom(...)
       8.     └─base::importIntoEnv(impenv, impnames, ns, impvars)
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
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
# wbids

<details>

* Version: 1.0.0
* GitHub: https://github.com/teal-insights/r-wbids
* Source code: https://github.com/cran/wbids
* Date/Publication: 2025-02-08 22:50:02 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "wbids")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wbids-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ids_bulk_files
    > ### Title: Retrieve Available Bulk Download Files for International Debt
    > ###   Statistics
    > ### Aliases: ids_bulk_files
    > 
    > ### ** Examples
    > 
    ...
    + ## End(Don't show)
    + ids_bulk_files()
    + ## Don't show: 
    + }) # examplesIf
    > ids_bulk_files()
    Warning in readBin(3L, raw(0), 32768L) :
      URL 'https://datacatalogapi.worldbank.org/ddhxext/DatasetDownload?dataset_unique_id=0038015&version_id=': Timeout of 60 seconds was reached
    Error in readBin(3L, raw(0), 32768L) : cannot read from connection
    Calls: <Anonymous> ... parse_and_simplify -> parseJSON -> parse_con -> readBin
    Execution halted
    ```

## Newly fixed

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
       1. ├─wbids:::read_bulk_info() at test-read_bulk_info.R:2:3
       2. │ └─jsonlite::fromJSON(...)
       3. │   └─jsonlite:::parse_and_simplify(...)
       4. │     └─jsonlite:::parseJSON(txt, bigint_as_char)
       5. │       └─jsonlite:::parse_con(txt, bigint_as_char)
       6. └─base::readBin(`<url>`, `<raw>`, 32768L)
      
      [ FAIL 1 | WARN 1 | SKIP 7 | PASS 146 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
      Note: found 78 marked UTF-8 strings
    ```
