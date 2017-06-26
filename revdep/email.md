Hi,

This is an automated email to let you know about the release of
{{{my_package }}}, which will be submitted to CRAN next Monday 8th
May. We apologise for the short notice. This release has been
necessary to make purrr compatible with the next dplyr release
(0.6.0).

This new version features only one change: all dataframe mappers have
been moved from purrr to the purrrlyr package. We opted for this
somewhat drastic solution because it allows us to substantially reduce
the dependencies of purrr by moving dplyr to suggested packages rather
than imported packages. By the same token, this should considerably
reduce your package dependencies if you're not using dplyr.

It should be straightforward to adapt your package to this change. If
you've been using one of the removed functions (such as `dmap()`),
just import these functions from the new `purrrlyr` package that is
now on CRAN. If you've been using `map_df()`, a function that relies
on `dplyr::bind_rows()`, you simply need to add dplyr to the
`Imports:` field. It is now necessary to be explicit about the dplyr
dependency because purrr does not require dplyr anymore.

Since the master branch is under development, we are putting this
point release together in the following branch:

https://github.com/tidyverse/purrr/tree/release-0.2.2.1

To check for potential problems, I ran `R CMD check` on your package
{{{your_package}}} ({{{your_version}}}).

I found: {{{your_summary}}}.

{{#you_have_problems}}
{{{your_results}}}

If I got an ERROR because I couldn't install your package (or one of
its dependencies), my apologies. You'll have to run the checks
yourself (unfortunately I don't have the time to diagnose installation
failures as I have to run checks on hundreds of packages).

Otherwise, please carefully look at the results. If you think I've
introduced a bug in purrr, please file a reprex
at <https://github.com/tidyverse/purrr/issues>. Otherwise, you'll need
to prepare an update to your package.

To get the development version of {{{ my_package }}} so you can run
the checks yourself, you can run:

    # install.packages("devtools")
    devtools::install_github("tidyverse/purrr", ref = "release-0.2.2.1")

{{/you_have_problems}}
{{^you_have_problems}}
It looks like everything is ok with your package, so no action is
necessary at this time.
{{/you_have_problems}}

If you have any questions about this email, please feel free to
respond directly.

Regards,

{{{ me }}}
