#define R_NO_REMAP
#include <Rinternals.h>

SEXP sym_protect(SEXP x) {
  if (TYPEOF(x) == LANGSXP || TYPEOF(x) == SYMSXP) {
    SEXP quote_prim = Rf_eval(Rf_install("quote"), R_BaseEnv);
    return(Rf_lang2(quote_prim, x));
  } else {
    return x;
  }
}

// The return value might be garbage-collected so should be used in
// non-jumpy context
const char* friendly_typeof(SEXP x) {
  SEXP head = Rf_lang3(Rf_install(":::"), Rf_install("purrr"), Rf_install("friendly_type_of"));
  SEXP call = Rf_lang2(PROTECT(head), PROTECT(sym_protect(x)));

  PROTECT(call);
  SEXP type = Rf_eval(call, R_BaseEnv);
  UNPROTECT(2);

  return CHAR(STRING_ELT(type, 0));
}
