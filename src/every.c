#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

#include "conditions.h"
#include "checks.h"

SEXP every_impl(SEXP env, SEXP ffi_n, SEXP ffi_i);

SEXP every_impl(SEXP env, SEXP ffi_n, SEXP ffi_i) {
  int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(ffi_i);

  SEXP x_sym = Rf_install(".x");
  SEXP p_sym = Rf_install(".p");
  SEXP i_sym = Rf_install("i");

  // Constructs a call of the form .p(.x[[i]], ...)
  SEXP x_i_sym = PROTECT(Rf_lang3(R_Bracket2Symbol, x_sym, i_sym));
  SEXP call = PROTECT(Rf_lang3(p_sym, x_i_sym, R_DotsSymbol));

  SEXP out = PROTECT(Rf_allocVector(LGLSXP, 1));
  int* p_out = LOGICAL(out);
  *p_out = TRUE;

  for (int i = 0; i < n; i++) {
    *p_i = i + 1;

    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    SEXP res = PROTECT(R_forceAndCall(call, 1, env));

    if (is_na(res)) {
      *p_out = NA_LOGICAL;
      UNPROTECT(1);
      continue;
    }

    if (!is_bool(res)) {
      r_abort(
        "`.p()` must return a single `TRUE` or `FALSE`, not %s.",
        rlang_obj_type_friendly_full(res, true, false)
      );
    }

    int res_value = LOGICAL(res)[0];
    UNPROTECT(1);

    if (res_value == FALSE) {
      *p_out = FALSE;
      break;
    }
  }

  *p_i = 0;

  UNPROTECT(3);
  return out;
}
