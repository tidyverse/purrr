#define R_NO_REMAP
#include <Rinternals.h>
#include <stdbool.h>

SEXP sym_protect(SEXP x) {
  if (TYPEOF(x) == LANGSXP || TYPEOF(x) == SYMSXP) {
    SEXP quote_prim = Rf_eval(Rf_install("quote"), R_BaseEnv);
    return(Rf_lang2(quote_prim, x));
  } else {
    return x;
  }
}

bool is_vector(SEXP x) {
  switch (TYPEOF(x)) {
  case LGLSXP:
  case INTSXP:
  case REALSXP:
  case CPLXSXP:
  case STRSXP:
  case RAWSXP:
  case VECSXP:
    return true;
  default:
    return false;
  }
}

SEXP list6(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x) {
  PROTECT(s);
  s = Rf_cons(s, Rf_list5(t, u, v, w, x));
  UNPROTECT(1);
  return s;
}

SEXP lang7(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y) {
  PROTECT(s);
  s = Rf_lcons(s, list6(t, u, v, w, x, y));
  UNPROTECT(1);
  return s;
}
SEXP list7(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y) {
  PROTECT(s);
  s = Rf_cons(s, list6(t, u, v, w, x, y));
  UNPROTECT(1);
  return s;
}
SEXP lang8(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y, SEXP z) {
  PROTECT(s);
  s = Rf_lcons(s, list7(t, u, v, w, x, y, z));
  UNPROTECT(1);
  return s;
}
