## Test environments
* local OS X install, R 3.4.0
* ubuntu 12.04 (on travis-ci), R 3.4.0
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

I have run R CMD check on the 94 downstream dependencies.
(Summary at https://github.com/hadley/purrr/tree/master/revdep).

There were 9 problems, some of which are due to an API change. Package
maintainers were notified one week ago. One of the problem occurred in
purrrlyr, and we'll send a fix for this package soon after release.
