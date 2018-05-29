
This fixes the check error following the last dplyr release.

## Test environments
* local OS X install, R-release
* ubuntu 12.04, R 3.1 -> R-devel
* win-builder (R-devel and R-release)

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

I have not run the revdeps because this is just a fix to a unit test
broken by the last release of dplyr.
