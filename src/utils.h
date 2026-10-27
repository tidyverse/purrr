#ifndef UTILS_H
#define UTILS_H

#include <stdbool.h>
#include <Rversion.h>

#define PROTECT_N(x, n) (++(*n), PROTECT(x))

#if (defined(R_VERSION) && R_VERSION < R_Version(4, 5, 0))
 SEXP R_getVarEx(SEXP symbol, SEXP rho, Rboolean inherits, SEXP ifnotfound);
 SEXP R_getVar(SEXP symbol, SEXP rho, Rboolean inherits);
#endif

#if (defined(R_VERSION) && R_VERSION < R_Version(4, 5, 0))
static inline const SEXP* VECTOR_PTR_RO(SEXP x) {
  return (const SEXP*) DATAPTR_RO(x);
}
#endif

SEXP sym_protect(SEXP x);

bool is_vector(SEXP x);

SEXP lang7(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y);
SEXP lang8(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y, SEXP z);

static inline const void* vec_cbegin(SEXP x, SEXPTYPE type) {
  switch (type) {
    case LGLSXP: return LOGICAL_RO(x);
    case INTSXP: return INTEGER_RO(x);
    case REALSXP: return REAL_RO(x);
    case CPLXSXP: return COMPLEX_RO(x);
    case RAWSXP: return RAW_RO(x);
    case STRSXP: return STRING_PTR_RO(x);
    case VECSXP: return VECTOR_PTR_RO(x);
    default: Rf_error("Unreachable");
  }
}

static inline SEXP p_vec_get(const void* v_x, SEXPTYPE type, int i) {
  switch (type) {
    case LGLSXP: return Rf_ScalarLogical(((const int*) v_x)[i]);
    case INTSXP: return Rf_ScalarInteger(((const int*) v_x)[i]);
    case REALSXP: return Rf_ScalarReal(((const double*) v_x)[i]);
    case CPLXSXP: return Rf_ScalarComplex(((const Rcomplex*) v_x)[i]);
    case RAWSXP: return Rf_ScalarRaw(((const Rbyte*) v_x)[i]);
    case STRSXP: return Rf_ScalarString(((const SEXP*) v_x)[i]);
    case VECSXP: return ((const SEXP*) v_x)[i];
    default: Rf_error("Unreachable");
  }
}

#endif
