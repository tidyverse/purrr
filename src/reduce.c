#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

#include "box.h"
#include "coerce.h"
#include "subset.h"

#include <stdbool.h>
#include "progress.h"

static
int get_acc_size(int n, int init_index) {
  return n - init_index + 1;
}

/**
 * Translate loop index to R input index
 *
 * @param i Loop index, starts from 0 if `.init` given and 1 if not.
 * @param n R input length.
 * @param left Whether the reduction direction is forwards.
 *
 * @return An integer with R input index.
 */
static
int i_to_input_index(int i, int n, bool left) {
  return left ? i + 1 : n - i;
}

/**
 * Translate loop index to index of `accumulate()` output
 *
 * @param i Loop index, starts from 0 if `.init` given and 1 if not.
 * @param n Size of the input.
 * @param init_index Starting index of the iteration.
 * @param left Whether the reduction direction is forwards.
 *
 * @return An integer with output index to use with `accumulate()`.
 */
static
int i_to_output_index(int i, int n, int init_index, bool left) {
  const int iter = i - init_index;
  // Compute size of the output to make reasoning simpler
  const int acc_size = get_acc_size(n, init_index);
  return left ? iter + 1 : acc_size - iter - 2;
}

static
SEXP shorten_acc_out(
  SEXP acc_out,
  int output_index,
  int acc_size,
  bool left,
  bool box_empty
) {
  const int from = left ? 0 : output_index + (box_empty ? 1 : 0);
  const int to = left ? output_index - (box_empty ? 1 : 0) : acc_size - 1;
  return subset_list(acc_out, from, to);
}

static
SEXP call_loop(
  SEXP accumulate_arg,
  SEXP (*call_fn)(SEXP out, bool left, bool init_missing),
  SEXP ffi_env,
  SEXP ffi_n,
  SEXP ffi_i,
  SEXP ffi_init,
  SEXP left_arg,
  SEXP init_missing_arg,
  SEXP progress,
  int force
) {
  const bool accumulate = Rf_asLogical(accumulate_arg);
  const bool left = Rf_asLogical(left_arg);
  const bool init_missing = Rf_asLogical(init_missing_arg);

  const int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(ffi_i);
  // Initial value cannot be accessed through pointer dereference *p_i, as it
  // results in unexpected interactions between calls and hard-to-diagnose
  // errors.
  const int init_index = init_missing ? 1 : 0;
  const int acc_size = get_acc_size(n, init_index);

  SEXP bar = make_progress_bar(n, progress);

  SEXP out = Rf_duplicate(ffi_init);
  PROTECT_INDEX out_shelter;
  PROTECT_WITH_INDEX(out, &out_shelter);

  SEXP acc_out = NULL;
  if (accumulate) {
    acc_out = PROTECT(Rf_allocVector(VECSXP, acc_size));
    set_vector_value(acc_out, left ? 0 : acc_size - 1, out, 0);
    Rf_setAttrib(acc_out, R_NamesSymbol, Rf_eval(Rf_install("input_names"), ffi_env));
    // SEXP names_x_sym = PROTECT(Rf_lang2(R_NamesSymbol, Rf_install(".x")));
    // SEXP input_names = PROTECT(R_forceAndCall(names_x_sym, 1, ffi_env));
    // UNPROTECT(2);  // input_names, names_x_sym
  }

  for (int i = init_index; i < n; i++) {
    // Translating 0-based `i` to 1-based R indexing, starting from left or
    // right depending on the `left` argument
    *p_i = i_to_input_index(i, n, left);
    const int output_index = i_to_output_index(i, n, init_index, left);

    set_progress(bar, i);
    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    SEXP call = PROTECT(call_fn(out, left, init_missing));
    SEXP res = PROTECT(R_forceAndCall(call, force, ffi_env));

    if (is_done_box(res, false)) {
      if (is_done_box(res, true)) {
        if (accumulate) {
          SEXP acc_out_shortened = shorten_acc_out(
            acc_out, output_index, acc_size, left, true
          );
          UNPROTECT(4);  // res, call, acc_out, out
          return acc_out_shortened;
        }
        UNPROTECT(3);  // res, call, out
        return out;
      }
      SEXP unboxed_res = PROTECT(unbox(res));
      if (accumulate) {
        set_vector_value(acc_out, output_index, unboxed_res, 0);
        UNPROTECT(1);  // unboxed_res
        SEXP acc_out_shortened = shorten_acc_out(
          acc_out, output_index, acc_size, left, false
        );
        UNPROTECT(4);  // res, call, acc_out, out
        return acc_out_shortened;
      }
      UNPROTECT(4);  // unboxed_res, res, call, out
      return unboxed_res;
    }

    if (accumulate) {
      set_vector_value(acc_out, output_index, res, 0);
    }

    out = res;
    REPROTECT(out, out_shelter);

    UNPROTECT(2);  // res, call
  }

  *p_i = 0;

  if (accumulate) {
    UNPROTECT(2);  // acc_out, out
    return acc_out;
  }
  UNPROTECT(1);  // out
  return out;
}

static
SEXP make_reduce_call_(SEXP out, bool left, bool init_missing) {
  static SEXP x_i_sym = NULL;
  if (x_i_sym == NULL) {
    SEXP x_sym = Rf_install(".x");
    SEXP i_sym = Rf_install("i");

    // Constructs a call of the form x[[i]]
    x_i_sym = Rf_lang3(R_Bracket2Symbol, x_sym, i_sym);
    R_PreserveObject(x_i_sym);
  }

  SEXP f_sym = Rf_install(".f");
  // Left-reduce passes the result-so-far on the left, right-reduce
  // passes it on the right. A left-reduce produces left-leaning
  // computation trees while right-reduce produces right-leaning trees.
  return left ? Rf_lang4(f_sym, out, x_i_sym, R_DotsSymbol) :
    Rf_lang4(f_sym, x_i_sym, out, R_DotsSymbol);
}

SEXP reduce_impl(
  SEXP accumulate_arg,
  SEXP ffi_env,
  SEXP ffi_n,
  SEXP ffi_i,
  SEXP ffi_init,
  SEXP left_arg,
  SEXP init_missing_arg,
  SEXP progress
) {
  const int force = 2; // Number of arguments to force

  return call_loop(
    accumulate_arg,
    make_reduce_call_,
    ffi_env,
    ffi_n,
    ffi_i,
    ffi_init,
    left_arg,
    init_missing_arg,
    progress,
    force
  );
}

static
SEXP make_reduce2_call_(SEXP out, bool left, bool init_missing) {
  if (!left) {
    // This shouldn't be accessible by a normal user
    Rf_errorcall(
      R_NilValue,
      "Cannot use `.dir = \"backward\"` with `reduce2()` or `accumulate2()`."
    );
  }

  SEXP i_sym = Rf_install("i");

  static SEXP x_i_sym = NULL;
  if (x_i_sym == NULL) {
    SEXP x_sym = Rf_install(".x");
    // Constructs a call of the form x[[i]]
    x_i_sym = Rf_lang3(R_Bracket2Symbol, x_sym, i_sym);
    R_PreserveObject(x_i_sym);
  }

  static SEXP i_minus_sym = NULL;
  if (i_minus_sym == NULL) {
    SEXP minus_sym = Rf_install("-");
    // Constructs a call of the form `i - 1`
    i_minus_sym = Rf_lang3(minus_sym, i_sym, Rf_ScalarInteger(1));
    R_PreserveObject(i_minus_sym);
  }

  SEXP index_sym = init_missing ? i_minus_sym : i_sym;

  SEXP y_sym = Rf_install(".y");
  // Constructs a call of the form y[[i]] or y[[i - 1]]
  SEXP y_i_sym = PROTECT(Rf_lang3(R_Bracket2Symbol, y_sym, index_sym));

  SEXP f_sym = Rf_install(".f");

  // No direction choice for `reduce2()`
  SEXP call = PROTECT(Rf_lang5(f_sym, out, x_i_sym, y_i_sym, R_DotsSymbol));
  UNPROTECT(2);  // call, y_i_sym
  return call;
}

SEXP reduce2_impl(
  SEXP accumulate_arg,
  SEXP ffi_env,
  SEXP ffi_n,
  SEXP ffi_i,
  SEXP ffi_init,
  SEXP left_arg,
  SEXP init_missing_arg,
  SEXP progress
  ) {
  const int force = 3; // Number of arguments to force

  return call_loop(
    accumulate_arg,
    make_reduce2_call_,
    ffi_env,
    ffi_n,
    ffi_i,
    ffi_init,
    left_arg,
    init_missing_arg,
    progress,
    force
  );
}
