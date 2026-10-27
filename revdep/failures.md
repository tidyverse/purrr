# b3gbi (1.1.3)

* GitHub: <https://github.com/b-cubed-eu/b3gbi>
* Email: <mailto:Shawn.Dove@allzool.bio.uni-giessen.de>
* GitHub mirror: <https://github.com/cran/b3gbi>

Run `revdepcheck::cloud_details(, "b3gbi")` for more info

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/b3gbi/new/b3gbi.Rcheck’
* using R version 4.6.0 (2026-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* current time: 2026-10-27 17:37:53 UTC
* using option ‘--no-manual’
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/b3gbi/old/b3gbi.Rcheck’
* using R version 4.6.0 (2026-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* current time: 2026-10-27 17:34:40 UTC
* using option ‘--no-manual’
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# deepSTRAPP (1.1.0)

* GitHub: <https://github.com/MaelDore/deepSTRAPP>
* Email: <mailto:mael.dore@gmail.com>
* GitHub mirror: <https://github.com/cran/deepSTRAPP>

Run `revdepcheck::cloud_details(, "deepSTRAPP")` for more info

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/deepSTRAPP/new/deepSTRAPP.Rcheck’
* using R version 4.6.0 (2026-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* current time: 2026-10-27 17:39:16 UTC
* using option ‘--no-manual’
...
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking compiled code ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/deepSTRAPP/old/deepSTRAPP.Rcheck’
* using R version 4.6.0 (2026-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* current time: 2026-10-27 17:34:40 UTC
* using option ‘--no-manual’
...
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking compiled code ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# multinma (0.9.1)

* GitHub: <https://github.com/dmphillippo/multinma>
* Email: <mailto:david.phillippo@bristol.ac.uk>
* GitHub mirror: <https://github.com/cran/multinma>

Run `revdepcheck::cloud_details(, "multinma")` for more info

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
** this is package ‘multinma’ version ‘0.9.1’
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
specified C++17
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
using C++17


...
/tmp/r-deps/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/tmp/r-deps/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/tmp/r-deps/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.6.0/lib/R/etc/Makeconf:197: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/new/multinma.Rcheck/multinma’


```
### CRAN

```
* installing *source* package ‘multinma’ ...
** this is package ‘multinma’ version ‘0.9.1’
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
specified C++17
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
using C++17


...
/tmp/r-deps/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/tmp/r-deps/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/tmp/r-deps/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.6.0/lib/R/etc/Makeconf:197: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/old/multinma.Rcheck/multinma’


```
# tidyllm (0.7.1)

* GitHub: <https://github.com/edubruell/tidyllm>
* Email: <mailto:eduard.bruell@zew.de>
* GitHub mirror: <https://github.com/cran/tidyllm>

Run `revdepcheck::cloud_details(, "tidyllm")` for more info

## Newly broken

*   checking whether package ‘tidyllm’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘/tmp/workdir/tidyllm/new/tidyllm.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘tidyllm’ ...
** this is package ‘tidyllm’ version ‘0.7.1’
** package ‘tidyllm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: Use of pairlists in purrr functions was deprecated in purrr 1.0.0.
ℹ Please coerce explicitly with `as.list()`
ℹ The deprecated feature was likely used in the tidyllm package.
...
ℹ With name: chat.
Caused by error in `purrr::map_chr()`:
ℹ In index: 1.
ℹ With name: .llm.
Caused by error in `map_()`:
! argument ".x_i" is missing, with no default
Error: unable to load R code in package ‘tidyllm’
Execution halted
ERROR: lazy loading failed for package ‘tidyllm’
* removing ‘/tmp/workdir/tidyllm/new/tidyllm.Rcheck/tidyllm’


```
### CRAN

```
* installing *source* package ‘tidyllm’ ...
** this is package ‘tidyllm’ version ‘0.7.1’
** package ‘tidyllm’ successfully unpacked and MD5 sums checked
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
* DONE (tidyllm)


```
# TriDimRegression (1.0.3)

* GitHub: <https://github.com/alexander-pastukhov/tridim-regression>
* Email: <mailto:pastukhov.alexander@gmail.com>
* GitHub mirror: <https://github.com/cran/TriDimRegression>

Run `revdepcheck::cloud_details(, "TriDimRegression")` for more info

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
** this is package ‘TriDimRegression’ version ‘1.0.3’
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
** this is package ‘TriDimRegression’ version ‘1.0.3’
** package ‘TriDimRegression’ successfully unpacked and MD5 sums checked
** using staged installation
Error in loadNamespace(x) : there is no package called ‘rstantools’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: configuration failed for package ‘TriDimRegression’
* removing ‘/tmp/workdir/TriDimRegression/old/TriDimRegression.Rcheck/TriDimRegression’


```
