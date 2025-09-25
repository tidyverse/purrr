#ifndef BACKPORTS_H
#define BACKPORTS_H

#include <Rversion.h>

#if defined(R_VERSION) && R_VERSION < R_Version(3, 2, 0)
SEXP Rf_installChar(SEXP);
#endif

#if defined(R_VERSION) && R_VERSION < R_Version(4, 5, 0)
SEXP R_mkClosure(SEXP, SEXP, SEXP);
#endif

#endif
