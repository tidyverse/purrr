# myTAI

<details>

* Version: 2.3.5
* GitHub: https://github.com/drostlab/myTAI
* Source code: https://github.com/cran/myTAI
* Date/Publication: 2026-02-05 17:10:02 UTC
* Number of recursive dependencies: 231

Run `revdepcheck::cloud_details(, "myTAI")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘myTAI.Rmd’ using rmarkdown
    --- finished re-building ‘myTAI.Rmd’
    
    --- re-building ‘other-strata.Rmd’ using rmarkdown
    --- finished re-building ‘other-strata.Rmd’
    
    --- re-building ‘phylo-expression-object.Rmd’ using rmarkdown
    Performing log-normalization
    0%   10   20   30   40   50   60   70   80   90   100%
    ...
    
    Error: processing vignette 'taxonomy.Rmd' failed with diagnostics:
    'names' attribute [3] must be the same length as the vector [0]
    --- failed re-building ‘taxonomy.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘taxonomy.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.4Mb
      sub-directories of 1Mb or more:
        data   2.0Mb
        doc    6.1Mb
        libs   4.4Mb
    ```

