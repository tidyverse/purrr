#define R_NO_REMAP
#include <R.h>
#include <Rversion.h>
#include <Rinternals.h>
#include "coerce.h"
#include "conditions.h"
#include "utils.h"

#include "cli/progress.h"

void copy_names(SEXP from, SEXP to) {
  SEXP names = Rf_getAttrib(from, R_NamesSymbol);
  if (names == R_NilValue) {
    return;
  }

  R_len_t n = Rf_length(to);

  if (Rf_length(names) != n) {
    names = short_vec_recycle(names, n);
  }
  PROTECT(names);

  Rf_setAttrib(to, R_NamesSymbol, names);
  UNPROTECT(1);
}

void check_vector(SEXP x, const char *name, SEXP error_call) {
  if (Rf_isNull(x) || Rf_isVector(x) || Rf_isPairList(x)) {
    return;
  }
  r_abort_call(
    error_call,
    "`%s` must be a vector, not %s.",
    name, rlang_obj_type_friendly_full(x, true, false)
  );
}

// call must involve i
SEXP call_loop(SEXP env, SEXP call, int n, SEXPTYPE type, int force_args,
               SEXP progress) {
  SEXP i = Rf_install("i");
  SEXP i_val = Rf_findVarInFrame(env, i);

  SEXP bar = PROTECT(cli_progress_bar(n, progress));
  SEXP out = PROTECT(Rf_allocVector(type, n));
  for (int i = 0; i < n; ++i) {
    if (CLI_SHOULD_TICK) cli_progress_set(bar, i);
    if (i % 1024 == 0)
      R_CheckUserInterrupt();

    INTEGER(i_val)[0] = i + 1;

    SEXP res = PROTECT(R_forceAndCall(call, force_args, env));

    if (type != VECSXP && Rf_length(res) != 1) {
      Rf_errorcall(R_NilValue, "Result must be length 1, not %i", Rf_length(res));
    }

    set_vector_value(out, i, res, 0);
    UNPROTECT(1);
  }

  INTEGER(i_val)[0] = 0;
  cli_progress_done(bar);

  UNPROTECT(2);
  return out;
}

SEXP map_impl(SEXP env, SEXP type_, SEXP progress, SEXP error_call) {
  SEXP x = Rf_install(".x");
  SEXP f = Rf_install(".f");
  SEXP i = Rf_install("i");
  SEXPTYPE type = Rf_str2type(CHAR(Rf_asChar(type_)));

  SEXP x_val = PROTECT(Rf_eval(x, env));
  check_vector(x_val, ".x", error_call);

  int n = Rf_length(x_val);
  if (n == 0) {
    SEXP out = PROTECT(Rf_allocVector(type, 0));
    copy_names(x_val, out);
    UNPROTECT(2);
    return out;
  }

  // Constructs a call like f(x[[i]], ...) - don't want to substitute
  // actual values for f or x, because they may be long, which creates
  // bad tracebacks()
  SEXP Xi = PROTECT(Rf_lang3(R_Bracket2Symbol, x, i));
  SEXP f_call = PROTECT(Rf_lang3(f, Xi, R_DotsSymbol));

  SEXP out = PROTECT(call_loop(env, f_call, n, type, 1, progress));
  copy_names(x_val, out);

  UNPROTECT(4);

  return out;
}

SEXP map2_impl(SEXP env, SEXP type_, SEXP progress, SEXP error_call) {
  SEXP x = Rf_install(".x");
  SEXP y = Rf_install(".y");
  SEXP f = Rf_install(".f");
  SEXP i = Rf_install("i");
  SEXPTYPE type = Rf_str2type(CHAR(Rf_asChar(type_)));

  SEXP x_val = PROTECT(Rf_eval(x, env));
  check_vector(x_val, ".x", error_call);
  SEXP y_val = PROTECT(Rf_eval(y, env));
  check_vector(y_val, ".y", error_call);

  int nx = Rf_length(x_val), ny = Rf_length(y_val);
  if (nx != ny && nx != 1 && ny != 1) {
    r_abort_call(
      error_call,
      "`.y must have length 1 or %i, not %i.",
      nx, ny
    );
  }
  int n = (nx == 1) ? ny : nx;

  // Constructs a call like f(x[[i]], y[[i]], ...)
  SEXP one = PROTECT(Rf_ScalarInteger(1));
  SEXP Xi = PROTECT(Rf_lang3(R_Bracket2Symbol, x, nx == 1 ? one : i));
  SEXP Yi = PROTECT(Rf_lang3(R_Bracket2Symbol, y, ny == 1 ? one : i));
  SEXP f_call = PROTECT(Rf_lang4(f, Xi, Yi, R_DotsSymbol));

  SEXP out = PROTECT(call_loop(env, f_call, n, type, 2, progress));
  copy_names(x_val, out);

  UNPROTECT(7);
  return out;
}

SEXP pmap_impl(SEXP env, SEXP type_, SEXP progress, SEXP error_call) {
  SEXP l = Rf_install(".l");
  SEXP l_val = PROTECT(Rf_eval(l, env));
  SEXPTYPE type = Rf_str2type(CHAR(Rf_asChar(type_)));

  if (!Rf_isVectorList(l_val)) {
    r_abort_call(
      error_call,
      "`.l` must be a list, not %s.",
      rlang_obj_type_friendly_full(l_val, true, false)
    );
  }

  // Check all elements are lists and find recycled length
  int m = Rf_length(l_val);
  int has_scalar = 0;
  int n = -1;
  for (int j = 0; j < m; ++j) {
    SEXP j_val = VECTOR_ELT(l_val, j);

    if (!Rf_isVector(j_val) && !Rf_isNull(j_val)) {
      r_abort_call(
        error_call,
        "`.l[[%i]]` must be a vector, not %s.",
        j + 1,
        rlang_obj_type_friendly_full(j_val, true, false)
      );
    }

    int nj = Rf_length(j_val);
    if (nj == 1) {
      has_scalar = 1;
      continue;
    }

    if (n == -1) {
      n = nj;
    } else if (nj != n) {
      r_abort_call(
        error_call,
        "`.l[[%i]]` must have length 1 or %i, not %i.",
        j + 1, n, nj
      );
    }
  }

  if (n == -1) {
    n = has_scalar ? 1 : 0;
  }

  SEXP l_names = PROTECT(Rf_getAttrib(l_val, R_NamesSymbol));
  int has_names = !Rf_isNull(l_names);

  SEXP f = Rf_install(".f");
  SEXP i = Rf_install("i");
  SEXP one = PROTECT(Rf_ScalarInteger(1));

  // Construct call like f(.l[[1]][[i]], .l[[2]][[i]], ...)
  //
  // Currently accessing S3 vectors in a list like .l[[c(1, i)]] will not
  // preserve the class (cf. #358).
  //
  // We construct the call backwards because can only add to the front of a
  // linked list. That makes PROTECTion tricky because we need to update it
  // each time to point to the start of the linked list.

  SEXP f_call = Rf_lang1(R_DotsSymbol);
  PROTECT_INDEX fi;
  PROTECT_WITH_INDEX(f_call, &fi);

  for (int j = m - 1; j >= 0; --j) {
    int nj = Rf_length(VECTOR_ELT(l_val, j));

    // Construct call like .l[[j]][[i]]
    SEXP j_ = PROTECT(Rf_ScalarInteger(j + 1));
    SEXP l_j = PROTECT(Rf_lang3(R_Bracket2Symbol, l, j_));
    SEXP l_ji = PROTECT(Rf_lang3(R_Bracket2Symbol, l_j, nj == 1 ? one : i));

    REPROTECT(f_call = Rf_lcons(l_ji, f_call), fi);
    if (has_names && CHAR(STRING_ELT(l_names, j))[0] != '\0')
      SET_TAG(f_call, Rf_install(CHAR(STRING_ELT(l_names, j))));

    UNPROTECT(3);
  }

  REPROTECT(f_call = Rf_lcons(f, f_call), fi);

  SEXP out = PROTECT(call_loop(env, f_call, n, type, m, progress));

  if (Rf_length(l_val)) {
    copy_names(VECTOR_ELT(l_val, 0), out);
  }

  UNPROTECT(5);
  return out;
}
