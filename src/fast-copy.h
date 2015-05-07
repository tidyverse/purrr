#ifndef FASTCOPY_H
#define FASTCOPY_H

#include <dplyr.h>

SEXP rep_each_n(const SEXP x, const IntegerVector& times);
SEXP seq_each_n(int length, const IntegerVector& times);
SEXP copy_at_pos(const SEXP from, SEXP to, int pos);

#endif
