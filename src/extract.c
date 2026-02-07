#define R_NO_REMAP
#include <Rinternals.h>

#include "conditions.h"

static
SEXP maybe_quote(SEXP x) {
  switch (TYPEOF(x)) {
  case LANGSXP:
  case SYMSXP:
  case EXPRSXP:
    return Rf_lang2(R_QuoteSymbol, x);
  default:
    return x;
  }
}

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

SEXP make_map_call(SEXP x, SEXP y, SEXP call_names, int index) {
  (void) y;
  (void) call_names;

  SEXP f_sym = Rf_install(".f");
  SEXP x_i = PROTECT(extract_from_vector(x, index));
  SEXP x_arg = PROTECT(maybe_quote(x_i));
  SEXP call = PROTECT(Rf_lang3(f_sym, x_arg, R_DotsSymbol));
  UNPROTECT(3);  // call, x_arg, x_i
  return call;
}

SEXP make_map2_call(SEXP x, SEXP y, SEXP call_names, int index) {
  (void) call_names;

  SEXP f_sym = Rf_install(".f");
  SEXP x_i = PROTECT(extract_from_vector(x, index));
  SEXP y_i = PROTECT(extract_from_vector(y, index));
  SEXP x_arg = PROTECT(maybe_quote(x_i));
  SEXP y_arg = PROTECT(maybe_quote(y_i));
  SEXP call = PROTECT(Rf_lang4(f_sym, x_arg, y_arg, R_DotsSymbol));
  UNPROTECT(5);  // call, y_arg, x_arg, y_i, x_i
  return call;
}

SEXP make_pmap_call(SEXP xs, SEXP y, SEXP call_names, int index) {
  (void) y;

  const int call_n = Rf_length(xs);
  const bool has_call_names = call_names != R_NilValue;
  const SEXP* v_call_names = has_call_names ? STRING_PTR_RO(call_names) : NULL;

  SEXP call = Rf_lang1(R_DotsSymbol);
  PROTECT_INDEX call_shelter;
  PROTECT_WITH_INDEX(call, &call_shelter);

  for (int j = call_n - 1; j >= 0; --j) {
    SEXP x_j = VECTOR_ELT(xs, j);
    SEXP x_j_i = PROTECT(extract_from_vector(x_j, index));
    SEXP arg = PROTECT(maybe_quote(x_j_i));

    call = Rf_lcons(arg, call);
    REPROTECT(call, call_shelter);

    if (has_call_names) {
      const char* call_name = CHAR(v_call_names[j]);

      if (call_name[0] != '\0') {
        SET_TAG(call, Rf_install(call_name));
      }
    }

    UNPROTECT(2);  // arg, x_j_i
  }

  SEXP f_sym = Rf_install(".f");
  call = Rf_lcons(f_sym, call);

  UNPROTECT(1);  // call
  return call;
}
