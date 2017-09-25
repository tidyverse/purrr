#ifndef BACKPORTS_H
#define BACKPORTS_H

#include <Rversion.h>

#if defined(R_VERSION) && R_VERSION < R_Version(3, 2, 0)
SEXP Rf_installChar(SEXP x);
#endif

#endif
