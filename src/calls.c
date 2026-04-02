#define R_NO_REMAP
#include <Rinternals.h>

SEXP make_object_f_call_1() {
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

SEXP make_vector_f_call_1() {
  static SEXP call = NULL;
  if (call == NULL) {
    SEXP x_i_sym = Rf_install(".x_i");
    SEXP f_sym = Rf_install(".f");

    call = Rf_lang3(f_sym, x_i_sym, R_DotsSymbol);
    R_PreserveObject(call);
  }
  return call;
}

SEXP make_object_f_call_2() {
  static SEXP call = NULL;
  if (call == NULL) {
    SEXP x_sym = Rf_install(".x");
    SEXP y_sym = Rf_install(".y");
    SEXP f_sym = Rf_install(".f");
    SEXP i_sym = Rf_install("i");

    // Constructs a call like f(x[[i]], y[[i]], ...)
    SEXP x_i_sym = PROTECT(Rf_lang3(R_Bracket2Symbol, x_sym, i_sym));
    SEXP y_i_sym = PROTECT(Rf_lang3(R_Bracket2Symbol, y_sym, i_sym));

    call = Rf_lang4(f_sym, x_i_sym, y_i_sym, R_DotsSymbol);
    R_PreserveObject(call);

    UNPROTECT(2);
  }
  return call;
}

SEXP make_vector_f_call_2() {
  static SEXP call = NULL;
  if (call == NULL) {
    SEXP x_i_sym = Rf_install(".x_i");
    SEXP y_i_sym = Rf_install(".y_i");
    SEXP f_sym = Rf_install(".f");

    call = Rf_lang4(f_sym, x_i_sym, y_i_sym, R_DotsSymbol);
    R_PreserveObject(call);
  }
  return call;
}
