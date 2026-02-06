#define R_NO_REMAP
#include <Rinternals.h>

#include "conditions.h"

SEXP extract_from_vector(SEXP x, int index) {
  // We assume that `x` is not an R object (i.e. doesn't have S3/S4/... classes)
  switch (TYPEOF(x)) {
  case LGLSXP:  return Rf_ScalarLogical(LOGICAL(x)[index]);
  case INTSXP:  return Rf_ScalarInteger(INTEGER(x)[index]);
  case REALSXP: return Rf_ScalarReal(REAL(x)[index]);
  case STRSXP:  return Rf_ScalarString(STRING_ELT(x, index));
  case VECSXP:  return VECTOR_ELT(x, index);
  case RAWSXP:  return Rf_ScalarRaw(RAW(x)[index]) ;
  case CPLXSXP: return Rf_ScalarComplex(COMPLEX_ELT(x, index));
  default:
    r_abort(
      "Internal error: found in extract_from_vector()",
      Rf_type2char(TYPEOF(x))
    );
  }
}

SEXP make_map_call(SEXP x, SEXP y, int index) {
  (void) y;
  SEXP f_sym = Rf_install(".f");
  SEXP x_i = PROTECT(extract_from_vector(x, index));
  SEXP call = PROTECT(Rf_lang3(f_sym, x_i, R_DotsSymbol));
  UNPROTECT(2);  // call, x_i
  return call;
}

SEXP make_map2_call(SEXP x, SEXP y, int index) {
  SEXP f_sym = Rf_install(".f");
  SEXP x_i = PROTECT(extract_from_vector(x, index));
  SEXP y_i = PROTECT(extract_from_vector(y, index));
  SEXP call = PROTECT(Rf_lang4(f_sym, x_i, y_i, R_DotsSymbol));
  UNPROTECT(3);  // call, y_i, x_i
  return call;
}
