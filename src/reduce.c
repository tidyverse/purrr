#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

#include "box.h"
#include "coerce.h"
#include "subset.h"
#include "utils.h"

#include <stdbool.h>

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

static SEXP sym_i = NULL;
static SEXP sym_dot_f = NULL;
static SEXP sym_dot_x = NULL;
static SEXP sym_dot_y = NULL;
static SEXP sym_acc = NULL;
static SEXP sym_dot_x_i = NULL;
static SEXP sym_dot_y_i = NULL;

// `.x[[i]]`, `.y[[i]]`, and `.y[[i - 1]]`
static SEXP call_dot_x_subset2_i = NULL;
static SEXP call_dot_y_subset2_i = NULL;
static SEXP call_dot_y_subset2_i_minus = NULL;

// `.f(acc, .x_i)` and `.f(.x_i, acc)`, with and without `...`
static SEXP call_reduce = NULL;
static SEXP call_reduce_dots = NULL;
static SEXP call_reduce_bwd = NULL;
static SEXP call_reduce_bwd_dots = NULL;

// `.f(acc, .x_i, .y_i)`, with and without `...`
static SEXP call_reduce2 = NULL;
static SEXP call_reduce2_dots = NULL;

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

/**
 * Shorten the accumulated output when early return happens.
 *
 * @param acc_out Accumulated output to subset from.
 * @param output_index Index of the currently saved value.
 * @param left Whether the reduction direction is forwards.
 * @param box_empty Whether the "done" box is empty (and should be discarded).
 *
 * @return A `SEXP` being a subset of the original `acc_out`.
 */
static
SEXP shorten_acc_out(
  SEXP acc_out,
  int output_index,
  bool left,
  bool box_empty
) {
  const int acc_size = Rf_length(acc_out);
  const int from = left ? 0 : output_index + (box_empty ? 1 : 0);
  const int to = left ? output_index - (box_empty ? 1 : 0) : acc_size - 1;
  return subset_list(acc_out, from, to);
}

static
SEXP reduce_loop(
  SEXP accumulate_arg,
  SEXP call,
  SEXP y_call,
  SEXP ffi_env,
  SEXP ffi_n,
  SEXP ffi_i,
  SEXP ffi_init,
  SEXP left_arg,
  SEXP init_missing_arg,
  SEXP input_names,
  SEXP progress,
  int force
) {
  int nprot = 0;

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

  SEXP bar = cli_progress_bar(n, progress);
  R_PreserveObject(bar);
  r_call_on_exit((void (*)(void*)) cb_progress_done, (void*) bar);

  PROTECT_INDEX out_shelter;
  PROTECT_WITH_INDEX(ffi_init, &out_shelter); ++nprot;
  SEXP out = ffi_init;

  SEXP acc_out = NULL;
  if (accumulate) {
    acc_out = PROTECT(Rf_allocVector(VECSXP, acc_size)); ++nprot;
    set_vector_value(acc_out, left ? 0 : acc_size - 1, out, 0);
    Rf_setAttrib(acc_out, R_NamesSymbol, input_names);
  }

  for (int i = init_index; i < n; i++) {
    // Translating 0-based `i` to 1-based R indexing, starting from left or
    // right depending on the `left` argument
    *p_i = i_to_input_index(i, n, left);
    const int output_index = i_to_output_index(i, n, init_index, left);

    if (CLI_SHOULD_TICK) {
      cli_progress_set(bar, i);
    }
    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    SEXP x_i = PROTECT(Rf_eval(call_dot_x_subset2_i, ffi_env)); ++nprot;
    Rf_defineVar(sym_dot_x_i, x_i, ffi_env);
    UNPROTECT(1); --nprot;

    if (y_call != NULL) {
      SEXP y_i = PROTECT(Rf_eval(y_call, ffi_env)); ++nprot;
      Rf_defineVar(sym_dot_y_i, y_i, ffi_env);
      UNPROTECT(1); --nprot;
    }

    Rf_defineVar(sym_acc, out, ffi_env);

    SEXP res = PROTECT(R_forceAndCall(call, force, ffi_env)); ++nprot;

    if (is_done_box(res, false)) {
      if (is_done_box(res, true)) {
        if (accumulate) {
          SEXP acc_out_shortened = shorten_acc_out(
            acc_out, output_index, left, true
          );
          UNPROTECT(nprot);  // res, acc_out, out
          return acc_out_shortened;
        }
        UNPROTECT(nprot);  // res, out
        return out;
      }
      SEXP unboxed_res = PROTECT(unbox(res)); ++nprot;
      if (accumulate) {
        set_vector_value(acc_out, output_index, unboxed_res, 0);
        SEXP acc_out_shortened = shorten_acc_out(
          acc_out, output_index, left, false
        );
        UNPROTECT(nprot);  // unboxed_res, res, acc_out, out
        return acc_out_shortened;
      }
      UNPROTECT(nprot);  // unboxed_res, res, out
      return unboxed_res;
    }

    if (accumulate) {
      set_vector_value(acc_out, output_index, res, 0);
    }

    out = res;
    REPROTECT(out, out_shelter);

    UNPROTECT(1);  // res
    nprot -= 1;
  }

  *p_i = 0;

  if (accumulate) {
    UNPROTECT(nprot);  // acc_out, out
    return acc_out;
  }
  UNPROTECT(nprot);  // out
  return out;
}

SEXP reduce_impl(
  SEXP accumulate_arg,
  SEXP ffi_env,
  SEXP ffi_n,
  SEXP ffi_i,
  SEXP ffi_init,
  SEXP left_arg,
  SEXP init_missing_arg,
  SEXP input_names,
  SEXP progress
) {
  const int force = 2; // Number of arguments to force

  const bool left = Rf_asLogical(left_arg);
  const bool dots = env_dots_length(ffi_env) != 0;
  SEXP call = left ?
    (dots ? call_reduce_dots : call_reduce) :
    (dots ? call_reduce_bwd_dots : call_reduce_bwd);

  return reduce_loop(
    accumulate_arg,
    call,
    NULL,
    ffi_env,
    ffi_n,
    ffi_i,
    ffi_init,
    left_arg,
    init_missing_arg,
    input_names,
    progress,
    force
  );
}

SEXP reduce2_impl(
  SEXP accumulate_arg,
  SEXP ffi_env,
  SEXP ffi_n,
  SEXP ffi_i,
  SEXP ffi_init,
  SEXP left_arg,
  SEXP init_missing_arg,
  SEXP input_names,
  SEXP progress
  ) {
  const int force = 3; // Number of arguments to force

  if (!Rf_asLogical(left_arg)) {
    // This shouldn't be accessible by a normal user
    Rf_errorcall(
      R_NilValue,
      "Cannot use `.dir = \"backward\"` with `reduce2()` or `accumulate2()`."
    );
  }

  const bool dots = env_dots_length(ffi_env) != 0;
  SEXP call = dots ? call_reduce2_dots : call_reduce2;

  SEXP y_call = Rf_asLogical(init_missing_arg) ?
    call_dot_y_subset2_i_minus :
    call_dot_y_subset2_i;

  return reduce_loop(
    accumulate_arg,
    call,
    y_call,
    ffi_env,
    ffi_n,
    ffi_i,
    ffi_init,
    left_arg,
    init_missing_arg,
    input_names,
    progress,
    force
  );
}

void reduce_init(void) {
  sym_i = Rf_install("i");
  sym_dot_f = Rf_install(".f");
  sym_dot_x = Rf_install(".x");
  sym_dot_y = Rf_install(".y");
  sym_acc = Rf_install("acc");
  sym_dot_x_i = Rf_install(".x_i");
  sym_dot_y_i = Rf_install(".y_i");

  // `.x[[i]]` and `.y[[i]]`
  call_dot_x_subset2_i = Rf_lang3(R_Bracket2Symbol, sym_dot_x, sym_i);
  R_PreserveObject(call_dot_x_subset2_i);
  call_dot_y_subset2_i = Rf_lang3(R_Bracket2Symbol, sym_dot_y, sym_i);
  R_PreserveObject(call_dot_y_subset2_i);

  // `.y[[i - 1]]`
  SEXP call_i_minus = PROTECT(
    Rf_lang3(Rf_install("-"), sym_i, Rf_ScalarInteger(1))
  );
  call_dot_y_subset2_i_minus = Rf_lang3(
    R_Bracket2Symbol, sym_dot_y, call_i_minus
  );
  R_PreserveObject(call_dot_y_subset2_i_minus);
  UNPROTECT(1);  // call_i_minus

  // Left-reduce passes the result-so-far on the left, right-reduce
  // passes it on the right. A left-reduce produces left-leaning
  // computation trees while right-reduce produces right-leaning trees.
  call_reduce = Rf_lang3(sym_dot_f, sym_acc, sym_dot_x_i);
  R_PreserveObject(call_reduce);
  call_reduce_dots = Rf_lang4(sym_dot_f, sym_acc, sym_dot_x_i, R_DotsSymbol);
  R_PreserveObject(call_reduce_dots);
  call_reduce_bwd = Rf_lang3(sym_dot_f, sym_dot_x_i, sym_acc);
  R_PreserveObject(call_reduce_bwd);
  call_reduce_bwd_dots = Rf_lang4(sym_dot_f, sym_dot_x_i, sym_acc, R_DotsSymbol);
  R_PreserveObject(call_reduce_bwd_dots);

  // No direction choice for `reduce2()`
  call_reduce2 = Rf_lang4(sym_dot_f, sym_acc, sym_dot_x_i, sym_dot_y_i);
  R_PreserveObject(call_reduce2);
  call_reduce2_dots = Rf_lang5(
    sym_dot_f, sym_acc, sym_dot_x_i, sym_dot_y_i, R_DotsSymbol
  );
  R_PreserveObject(call_reduce2_dots);
}
