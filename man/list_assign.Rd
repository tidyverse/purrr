% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list-modify.R
\name{list_assign}
\alias{list_assign}
\alias{list_modify}
\alias{list_merge}
\title{Modify a list}
\usage{
list_assign(.x, ..., .is_node = NULL)

list_modify(.x, ..., .is_node = NULL)

list_merge(.x, ..., .is_node = NULL)
}
\arguments{
\item{.x}{List to modify.}

\item{...}{New values of a list. Use \code{zap()} to remove values.

These values should be either all named or all unnamed. When
inputs are all named, they are matched to \code{.x} by name. When they
are all unnamed, they are matched by position.

\link[rlang:dyn-dots]{Dynamic dots} are supported. In particular, if your
replacement values are stored in a list, you can splice that in with
\verb{!!!}.}

\item{.is_node}{A predicate function that determines whether an element is
a node (by returning \code{TRUE}) or a leaf (by returning \code{FALSE}). The
default value, \code{NULL}, treats simple lists as nodes and everything else
(including richer objects like data frames and linear models) as leaves,
using \code{\link[vctrs:obj_is_list]{vctrs::obj_is_list()}}. To recurse into all objects built on lists
use \code{\link[=is.list]{is.list()}}.}
}
\description{
\itemize{
\item \code{list_assign()} modifies the elements of a list by name or position.
\item \code{list_modify()} modifies the elements of a list recursively.
\item \code{list_merge()} merges the elements of a list recursively.
}

\code{list_modify()} is inspired by \code{\link[utils:modifyList]{utils::modifyList()}}.
}
\examples{
x <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
str(x)

# Update values
str(list_assign(x, a = 1))

# Replace values
str(list_assign(x, z = 5))
str(list_assign(x, z = NULL))
str(list_assign(x, z = list(a = 1:5)))

# Replace recursively with list_modify(), leaving the other elements of z alone
str(list_modify(x, z = list(a = 1:5)))

# Remove values
str(list_assign(x, z = zap()))

# Combine values with list_merge()
str(list_merge(x, x = 11, z = list(a = 2:5, c = 3)))

# All these functions support dynamic dots features. Use !!! to splice
# a list of arguments:
l <- list(new = 1, y = zap(), z = 5)
str(list_assign(x, !!!l))
}
