#ifndef FASTCOPY_H
#define FASTCOPY_H

SEXP rep_each_n(const RObject x, const IntegerVector& times);
SEXP copy_elements(const RObject from, int offset_from, RObject to, int offset_to, int n = 0);
IntegerVector seq_each_n(const IntegerVector& times);

#endif
