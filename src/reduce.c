#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

SEXP reduce_impl(
  SEXP ffi_env,
  SEXP ffi_n,
  SEXP ffi_i,
  SEXP ffi_init
) {
  const int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(ffi_i);

  // Number of arguments within `call` to force.
  // Same as `map()`.
  const int force = 1;

  SEXP out = Rf_duplicate(ffi_init);
  PROTECT_INDEX out_shelter;
  PROTECT_WITH_INDEX(out, &out_shelter);

  for (int i = 0; i < n; i++) {
    *p_i = i + 1;

    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    static SEXP x_i_sym = NULL;
    if (x_i_sym == NULL) {
      SEXP x_sym = Rf_install(".x");
      SEXP i_sym = Rf_install("i");

      // Constructs a call of the form x[[i]]
      x_i_sym = Rf_lang3(R_Bracket2Symbol, x_sym, i_sym);
      R_PreserveObject(x_i_sym);
    }

    SEXP f_sym = Rf_install(".f");
    SEXP call = Rf_lang4(f_sym, out, x_i_sym, R_DotsSymbol);

    SEXP res = PROTECT(R_forceAndCall(call, force, ffi_env));
    out = res;
    REPROTECT(out, out_shelter);

    UNPROTECT(1); // res
  }

  *p_i = 0;

  UNPROTECT(1);  // out
  return out;
}
