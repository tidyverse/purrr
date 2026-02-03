#define R_NO_REMAP
#include <Rinternals.h>

#include "conditions.h"

static
SEXP make_call_1f() {
  static SEXP call = NULL;
  if (call == NULL) {
    SEXP x_sym = Rf_install(".x");
    SEXP f_sym = Rf_install(".f");
    SEXP i_sym = Rf_install("i");

    // Constructs a call like f(x[[i]], ...) - don't want to substitute
    // actual values for f or x, because they may be long, which creates
    // bad tracebacks()
    SEXP x_i_sym = PROTECT(Rf_lang3(R_Bracket2Symbol, x_sym, i_sym));

    call = Rf_lang3(f_sym, x_i_sym, R_DotsSymbol);
    R_PreserveObject(call);

    UNPROTECT(1);
  }
  return call;
}

static
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

SEXP make_map_call(SEXP x, int index) {
  if (Rf_isObject(x)) {
    return make_call_1f();
  }

  SEXP f_sym = Rf_install(".f");
  SEXP x_i = PROTECT(extract_from_vector(x, index));
  SEXP call = PROTECT(Rf_lang3(f_sym, x_i, R_DotsSymbol));
  UNPROTECT(2);  // call, x_i
  return call;
}
