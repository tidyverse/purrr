# meta

<details>

* Version: 8.0-2
* GitHub: https://github.com/guido-s/meta
* Source code: https://github.com/cran/meta
* Date/Publication: 2025-01-21 19:20:02 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "meta")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        R      3.5Mb
        help   1.5Mb
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘metasens’, ‘robumeta’
    ```

# waywiser

<details>

* Version: 0.6.0
* GitHub: https://github.com/ropensci/waywiser
* Source code: https://github.com/cran/waywiser
* Date/Publication: 2024-06-27 19:10:03 UTC
* Number of recursive dependencies: 172

Run `revdepcheck::cloud_details(, "waywiser")` for more info

</details>

## Newly broken

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘multi-scale-assessment.Rmd’
      ...
      |                                                                            
      |=================                                                     |  25%
      |                                                                            
      |==================                                                    |  25%Warning in unzip(file_loc, exdir = tmp) :
      error 1 in extracting from zip file
    Cannot open layer tl_2022_us_county
    
      When sourcing ‘multi-scale-assessment.R’:
    Error: Opening layer failed.
    Execution halted
    
      ‘multi-scale-assessment.Rmd’ using ‘UTF-8’... failed
      ‘residual-autocorrelation.Rmd’ using ‘UTF-8’... OK
      ‘waywiser.Rmd’ using ‘UTF-8’... OK
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

