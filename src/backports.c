#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <Rversion.h>

#if defined(R_VERSION) && R_VERSION < R_Version(3, 2, 0)
SEXP Rf_installChar(SEXP x) {
  return Rf_install(CHAR(x));
}
#endif
