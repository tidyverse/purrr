# arrow

<details>

* Version: 0.15.0
* Source code: https://github.com/cran/arrow
* URL: https://github.com/apache/arrow/, https://arrow.apache.org/docs/r
* BugReports: https://issues.apache.org/jira/projects/ARROW/issues
* Date/Publication: 2019-10-07 19:00:02 UTC
* Number of recursive dependencies: 50

Run `revdep_details(,"arrow")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is 10.9Mb
      sub-directories of 1Mb or more:
        libs   7.7Mb
        R      3.0Mb
    ```

## Newly fixed

*   checking whether package ‘arrow’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lowliner/revdep/checks.noindex/arrow/old/arrow.Rcheck/00install.out’ for details.
    ```

# nlrx

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/nlrx
* URL: https://github.com/nldoc/nlrx/
* BugReports: https://github.com/nldoc/nlrx/issues/
* Date/Publication: 2019-09-26 12:50:02 UTC
* Number of recursive dependencies: 90

Run `revdep_details(,"nlrx")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # Define output directory:
    > outdir <- tempdir()  # adjust path to your needs
    > 
    > # Create documentation:
    > nldoc(modelfiles = modelfiles,
    +       infotab=TRUE,
    +       gui=TRUE,
    +       bs=TRUE,
    +       outpath = outdir,
    +       output_format = "html",
    +       number_sections = TRUE,
    +       theme = "cosmo",
    +       date = date(),
    +       toc = TRUE)
    Warning in file(con, "r") :
      URL 'https://raw.githubusercontent.com/nldoc/nldoc_pg/master/WSP.nlogo': status was 'Couldn't connect to server'
    Error in file(con, "r") : 
      cannot open the connection to 'https://raw.githubusercontent.com/nldoc/nldoc_pg/master/WSP.nlogo'
    Calls: nldoc -> nldoc_read_nlogo -> readLines -> file
    Execution halted
    ```

