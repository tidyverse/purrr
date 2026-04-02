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
