#define R_NO_REMAP
#include <R.h>
#include <Rversion.h>
#include <Rinternals.h>
#include "coerce.h"
#include "utils.h"

// Including <cli/progress.h> before "cleancall.h" because we want to register
// exiting handlers ourselves, rather than letting cli register them for us.
#include <cli/progress.h>
#include "cleancall.h"

static SEXP sym_i = NULL;
static SEXP sym_dot_f = NULL;
static SEXP sym_dot_x = NULL;
static SEXP sym_dot_y = NULL;

static SEXP call_dot_x_subset2_i = NULL;
static SEXP call_dot_y_subset2_i = NULL;

static int force_map = 1;
static int force_map2 = 2;

static inline bool has_dots(SEXP env) {
  SEXP dots = Rf_findVarInFrame(env, R_DotsSymbol);
  return dots != R_MissingArg && dots != R_NilValue;
}

static inline SEXP as_call_arg(SEXP x, int* n_prot) {
  switch (TYPEOF(x)) {
  case SYMSXP:
    return PROTECT_N(Rf_lang2(R_QuoteSymbol, x), n_prot);
  case LANGSXP:
    PROTECT_N(x, n_prot);
    return PROTECT_N(Rf_lang2(R_QuoteSymbol, x), n_prot);
  default:
    return x;
  }
}

static void cb_progress_done(void* bar_ptr) {
  SEXP bar = (SEXP)bar_ptr;
  cli_progress_done(bar);
  R_ReleaseObject(bar);
}

static inline SEXP call_loop(
  const void* p_data,
  SEXP (*fn_exec)(const void* p_data, int i),
  SEXPTYPE type,
  SEXP progress,
  int n,
  SEXP names
) {
  SEXP bar = cli_progress_bar(n, progress);
  R_PreserveObject(bar);
  r_call_on_exit((void (*)(void*)) cb_progress_done, (void*) bar);

  SEXP out = PROTECT(Rf_allocVector(type, n));
  Rf_setAttrib(out, R_NamesSymbol, names);

  for (int i = 0; i < n; ++i) {
    if (CLI_SHOULD_TICK) {
      cli_progress_set(bar, i);
    }
    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    SEXP res = PROTECT(fn_exec(p_data, i));

    if (type != VECSXP && Rf_length(res) != 1) {
      Rf_errorcall(R_NilValue, "Result must be length 1, not %i.", Rf_length(res));
    }

    if (type == VECSXP) {
      SET_VECTOR_ELT(out, i, res);
    } else {
      set_vector_value(out, i, res, 0);
    }
    UNPROTECT(1);
  }

  UNPROTECT(1);
  return out;
}

struct map_exec_data {
  SEXP x;
  const void* v_x;
  SEXPTYPE x_type;
  bool x_object;

  SEXP call_arg;
  SEXP call;
  int* v_i;
  SEXP env;
};

struct map2_exec_data {
  SEXP x;
  const void* v_x;
  SEXPTYPE x_type;
  bool x_object;

  SEXP y;
  const void* v_y;
  SEXPTYPE y_type;
  bool y_object;

  SEXP call_x_arg;
  SEXP call_y_arg;
  SEXP call;
  int* v_i;
  SEXP env;
};

struct pmap_elt {
  SEXP elt;
  const void* v_elt;
  SEXPTYPE elt_type;
  bool elt_object;

  SEXP call_arg;
  // .l_{elt}[[i]]
  SEXP call_elt_subset2_i;
};

struct pmap_exec_data {
  const struct pmap_elt* v_l;
  int n_l;

  // .f(.l_1_i, .l_2_i, .l_3_i, ...)
  SEXP call_pmap;
  int force_pmap;

  int* v_i;
  SEXP env;
};

static inline SEXP map_exec(const void* p_data_void, int i) {
  const struct map_exec_data* p_data = (const struct map_exec_data*) p_data_void;
  int n_prot = 0;

  *p_data->v_i = i + 1;

  SEXP x_i = (p_data->x_object) ?
    Rf_eval(call_dot_x_subset2_i, p_data->env) :
    p_vec_get(p_data->v_x, p_data->x_type, i);
  SETCAR(p_data->call_arg, as_call_arg(x_i, &n_prot));

  SEXP out = R_forceAndCall(p_data->call, force_map, p_data->env);
  UNPROTECT(n_prot);
  return out;
}

static inline SEXP map2_exec(const void* p_data_void, int i) {
  const struct map2_exec_data* p_data = (const struct map2_exec_data*) p_data_void;
  int n_prot = 0;

  *p_data->v_i = i + 1;

  SEXP x_i = (p_data->x_object) ?
    Rf_eval(call_dot_x_subset2_i, p_data->env) :
    p_vec_get(p_data->v_x, p_data->x_type, i);
  SETCAR(p_data->call_x_arg, as_call_arg(x_i, &n_prot));

  SEXP y_i = (p_data->y_object) ?
    Rf_eval(call_dot_y_subset2_i, p_data->env) :
    p_vec_get(p_data->v_y, p_data->y_type, i);
  SETCAR(p_data->call_y_arg, as_call_arg(y_i, &n_prot));

  SEXP out = R_forceAndCall(p_data->call, force_map2, p_data->env);
  UNPROTECT(n_prot);
  return out;
}

static inline SEXP pmap_exec(const void* p_data_void, int i) {
  const struct pmap_exec_data* p_data = (const struct pmap_exec_data*) p_data_void;
  int n_prot = 0;

  *p_data->v_i = i + 1;

  for (int j = 0; j < p_data->n_l; ++j) {
    const struct pmap_elt* p_elt = &p_data->v_l[j];

    SEXP elt_i = (p_elt->elt_object) ?
      Rf_eval(p_elt->call_elt_subset2_i, p_data->env) :
      p_vec_get(p_elt->v_elt, p_elt->elt_type, i);
    SETCAR(p_elt->call_arg, as_call_arg(elt_i, &n_prot));
  }

  SEXP out = R_forceAndCall(p_data->call_pmap, p_data->force_pmap, p_data->env);
  UNPROTECT(n_prot);
  return out;
}

SEXP map_impl(
  SEXP x,
  SEXP env,
  SEXP ffi_type,
  SEXP progress,
  SEXP ffi_n,
  SEXP names,
  SEXP i
) {
  const SEXPTYPE type = Rf_str2type(CHAR(STRING_ELT(ffi_type, 0)));
  const int n = INTEGER_ELT(ffi_n, 0);
  int* v_i = INTEGER(i);

  const bool x_object = Rf_isObject(x);
  const SEXPTYPE x_type = TYPEOF(x);
  const void* v_x = x_object ? NULL : vec_cbegin(x, x_type);

  SEXP call = PROTECT(has_dots(env) ?
    Rf_lang3(sym_dot_f, R_NilValue, R_DotsSymbol) :
    Rf_lang2(sym_dot_f, R_NilValue));

  const struct map_exec_data data = (struct map_exec_data) {
    .x = x,
    .v_x = v_x,
    .x_type = x_type,
    .x_object = x_object,
    .call_arg = CDR(call),
    .call = call,
    .v_i = v_i,
    .env = env
  };

  *v_i = 0;
  SEXP out = call_loop(&data, map_exec, type, progress, n, names);
  *v_i = 0;

  UNPROTECT(1);
  return out;
}

SEXP map2_impl(
  SEXP x,
  SEXP y,
  SEXP env,
  SEXP ffi_type,
  SEXP progress,
  SEXP ffi_n,
  SEXP names,
  SEXP i
) {
  const SEXPTYPE type = Rf_str2type(CHAR(STRING_ELT(ffi_type, 0)));
  const int n = INTEGER_ELT(ffi_n, 0);
  int* v_i = INTEGER(i);

  const bool x_object = Rf_isObject(x);
  const SEXPTYPE x_type = TYPEOF(x);
  const void* v_x = x_object ? NULL : vec_cbegin(x, x_type);

  const bool y_object = Rf_isObject(y);
  const SEXPTYPE y_type = TYPEOF(y);
  const void* v_y = y_object ? NULL : vec_cbegin(y, y_type);

  SEXP call = PROTECT(has_dots(env) ?
    Rf_lang4(sym_dot_f, R_NilValue, R_NilValue, R_DotsSymbol) :
    Rf_lang3(sym_dot_f, R_NilValue, R_NilValue));

  const struct map2_exec_data data = (struct map2_exec_data) {
    .x = x,
    .v_x = v_x,
    .x_type = x_type,
    .x_object = x_object,
    .y = y,
    .v_y = v_y,
    .y_type = y_type,
    .y_object = y_object,
    .call_x_arg = CDR(call),
    .call_y_arg = CDDR(call),
    .call = call,
    .v_i = v_i,
    .env = env
  };

  *v_i = 0;
  SEXP out = call_loop(&data, map2_exec, type, progress, n, names);
  *v_i = 0;

  UNPROTECT(1);
  return out;
}

SEXP pmap_impl(
  SEXP l,
  SEXP env,
  SEXP ffi_type,
  SEXP progress,
  SEXP ffi_n,
  SEXP names,
  SEXP i
) {
  int n_prot = 0;

  const SEXPTYPE type = Rf_str2type(CHAR(STRING_ELT(ffi_type, 0)));
  const int n = INTEGER_ELT(ffi_n, 0);
  int* v_i = INTEGER(i);

  char buf[32];

  const int n_l = (int) Rf_xlength(l);
  struct pmap_elt* v_l = (struct pmap_elt*) R_alloc(n_l, sizeof(struct pmap_elt));

  // Build `pmap_elt`s!
  for (int j = 0; j < n_l; ++j) {
    // `l` is guaranteed to be a bare list at this point by `pmap()`
    SEXP elt = VECTOR_ELT(l, j);

    const bool elt_object = Rf_isObject(elt);
    const SEXPTYPE elt_type = TYPEOF(elt);
    const void* v_elt = elt_object ? NULL : vec_cbegin(elt, elt_type);

    v_l[j].elt = elt;
    v_l[j].v_elt = v_elt;
    v_l[j].elt_type = elt_type;
    v_l[j].elt_object = elt_object;

    // For objects, use `[[` to preserve dispatch. Install the object as
    // `.l_{elt}` and construct `.l_{elt}[[i]]`.
    snprintf(buf, sizeof(buf), ".l_%d", j + 1);
    SEXP sym_elt = Rf_install(buf);
    Rf_defineVar(sym_elt, elt, env);
    v_l[j].call_elt_subset2_i = PROTECT_N(
      Rf_lang3(R_Bracket2Symbol, sym_elt, sym_i),
      &n_prot
    );
  }

  // Construct a call whose argument cells are updated on each iteration.
  //
  // We construct the call backwards because can only add to the front of a
  // linked list. That makes PROTECTion tricky because we need to update it
  // each time to point to the start of the linked list.
  SEXP call_pmap = has_dots(env) ? Rf_lang1(R_DotsSymbol) : R_NilValue;
  PROTECT_INDEX call_pmap_pi;
  PROTECT_WITH_INDEX(call_pmap, &call_pmap_pi);
  ++n_prot;

  SEXP call_names = PROTECT_N(Rf_getAttrib(l, R_NamesSymbol), &n_prot);
  const bool has_call_names = call_names != R_NilValue;
  const SEXP* v_call_names = has_call_names ? STRING_PTR_RO(call_names) : NULL;

  for (int j = n_l - 1; j >= 0; --j) {
    call_pmap = Rf_lcons(R_NilValue, call_pmap);
    REPROTECT(call_pmap, call_pmap_pi);
    v_l[j].call_arg = call_pmap;

    if (has_call_names) {
      const char* call_name = CHAR(v_call_names[j]);

      if (call_name[0] != '\0') {
        SET_TAG(call_pmap, Rf_install(call_name));
      }
    }
  }

  call_pmap = Rf_lcons(sym_dot_f, call_pmap);
  REPROTECT(call_pmap, call_pmap_pi);

  const struct pmap_exec_data data = (struct pmap_exec_data) {
    .v_l = v_l,
    .n_l = n_l,
    .call_pmap = call_pmap,
    .force_pmap = n_l,
    .v_i = v_i,
    .env = env
  };

  *v_i = 0;
  SEXP out = call_loop(&data, pmap_exec, type, progress, n, names);
  *v_i = 0;

  UNPROTECT(n_prot);
  return out;
}

void map_init(void) {
  sym_i = Rf_install("i");
  sym_dot_f = Rf_install(".f");
  sym_dot_x = Rf_install(".x");
  sym_dot_y = Rf_install(".y");

  // `.x[[i]]`
  call_dot_x_subset2_i = Rf_lang3(R_Bracket2Symbol, sym_dot_x, sym_i);
  R_PreserveObject(call_dot_x_subset2_i);

  // `.y[[i]]`
  call_dot_y_subset2_i = Rf_lang3(R_Bracket2Symbol, sym_dot_y, sym_i);
  R_PreserveObject(call_dot_y_subset2_i);

}
