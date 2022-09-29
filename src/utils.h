#ifndef UTILS_H
#define UTILS_H

#include <stdbool.h>


SEXP sym_protect(SEXP x);

bool is_vector(SEXP x);

SEXP lang7(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y);
SEXP lang8(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y, SEXP z);


#endif
