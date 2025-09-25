#define R_NO_REMAP
#include <R.h>
#include <Rversion.h>
#include <Rinternals.h>
#include "coerce.h"
#include "conditions.h"
#include "utils.h"

// Including <cli/progress.h> before "cleancall.h" because we want to register
// exiting handlers ourselves, rather than letting cli register them for us.
#include <cli/progress.h>
#include "cleancall.h"

static
void cb_progress_done(void* bar_ptr) {
  SEXP bar = (SEXP)bar_ptr;
  cli_progress_done(bar);
  R_ReleaseObject(bar);
}

// call must involve i
SEXP call_loop(SEXP env,
               SEXP call,
               SEXPTYPE type,
               SEXP progress,
               int n,
               SEXP names,
               int* p_i,
               int force) {
  SEXP bar = cli_progress_bar(n, progress);
  R_PreserveObject(bar);
  r_call_on_exit((void (*)(void*)) cb_progress_done, (void*) bar);

  SEXP out = PROTECT(Rf_allocVector(type, n));
  Rf_setAttrib(out, R_NamesSymbol, names);

  for (int i = 0; i < n; ++i) {
    *p_i = i + 1;

    if (CLI_SHOULD_TICK) {
      cli_progress_set(bar, i);
    }
    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    SEXP res = PROTECT(R_forceAndCall(call, force, env));

    if (type != VECSXP && Rf_length(res) != 1) {
      Rf_errorcall(R_NilValue, "Result must be length 1, not %i.", Rf_length(res));
    }

    set_vector_value(out, i, res, 0);
    UNPROTECT(1);
  }

  *p_i = 0;

  UNPROTECT(1);
  return out;
}

SEXP map_impl(SEXP env,
              SEXP ffi_type,
              SEXP progress,
              SEXP ffi_n,
              SEXP names,
              SEXP i) {
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

  SEXPTYPE type = Rf_str2type(CHAR(STRING_ELT(ffi_type, 0)));
  int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(i);
  int force = 1;

  return call_loop(
    env,
    call,
    type,
    progress,
    n,
    names,
    p_i,
    force
  );
}

SEXP map2_impl(SEXP env,
               SEXP ffi_type,
               SEXP progress,
               SEXP ffi_n,
               SEXP names,
               SEXP i) {
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

  SEXPTYPE type = Rf_str2type(CHAR(STRING_ELT(ffi_type, 0)));
  int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(i);
  int force = 2;

  return call_loop(
    env,
    call,
    type,
    progress,
    n,
    names,
    p_i,
    force
  );
}

SEXP pmap_impl(SEXP env,
               SEXP ffi_type,
               SEXP progress,
               SEXP ffi_n,
               SEXP names,
               SEXP i,
               SEXP call_names,
               SEXP ffi_call_n) {
  // Construct call like f(.l[[1]][[i]], .l[[2]][[i]], ...)
  //
  // Currently accessing S3 vectors in a list like .l[[c(1, i)]] will not
  // preserve the class (cf. #358).
  //
  // We construct the call backwards because can only add to the front of a
  // linked list. That makes PROTECTion tricky because we need to update it
  // each time to point to the start of the linked list.
  SEXP l_sym = Rf_install(".l");
  SEXP f_sym = Rf_install(".f");
  SEXP i_sym = Rf_install("i");

  SEXP call = Rf_lang1(R_DotsSymbol);
  PROTECT_INDEX call_shelter;
  PROTECT_WITH_INDEX(call, &call_shelter);

  bool has_call_names = call_names != R_NilValue;
  const SEXP* v_call_names = has_call_names ? STRING_PTR_RO(call_names) : NULL;
  int call_n = INTEGER_ELT(ffi_call_n, 0);

  for (int j = call_n - 1; j >= 0; --j) {
    // Construct call like .l[[j]][[i]]
    SEXP j_val = PROTECT(Rf_ScalarInteger(j + 1));
    SEXP l_j_sym = PROTECT(Rf_lang3(R_Bracket2Symbol, l_sym, j_val));
    SEXP l_j_i_sym = PROTECT(Rf_lang3(R_Bracket2Symbol, l_j_sym, i_sym));

    call = Rf_lcons(l_j_i_sym, call);
    REPROTECT(call, call_shelter);

    if (has_call_names) {
      const char* call_name = CHAR(v_call_names[j]);

      if (call_name[0] != '\0') {
        SET_TAG(call, Rf_install(call_name));
      }
    }

    UNPROTECT(3);
  }

  call = Rf_lcons(f_sym, call);
  REPROTECT(call, call_shelter);

  SEXPTYPE type = Rf_str2type(CHAR(STRING_ELT(ffi_type, 0)));
  int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(i);
  int force = call_n;

  SEXP out = call_loop(
    env,
    call,
    type,
    progress,
    n,
    names,
    p_i,
    force
  );

  UNPROTECT(1);
  return out;
}
