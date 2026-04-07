#ifndef UTILS_H
#define UTILS_H

#include <stdbool.h>
#include <Rversion.h>


#if (defined(R_VERSION) && R_VERSION < R_Version(4, 5, 0))
 SEXP R_getVarEx(SEXP symbol, SEXP rho, Rboolean inherits, SEXP ifnotfound);
 SEXP R_getVar(SEXP symbol, SEXP rho, Rboolean inherits);
#endif

SEXP sym_protect(SEXP x);

bool is_vector(SEXP x);

SEXP lang7(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y);
SEXP lang8(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y, SEXP z);


#endif
