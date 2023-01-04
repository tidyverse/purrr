#define R_NO_REMAP
#include <Rinternals.h>

#include "cleancall.h"


#if (defined(R_VERSION) && R_VERSION < R_Version(3, 4, 0))
 SEXP R_MakeExternalPtrFn(DL_FUNC p, SEXP tag, SEXP prot) {
   fn_ptr ptr;
   ptr.fn = p;
   return R_MakeExternalPtr(ptr.p, tag, prot);
 }
 DL_FUNC R_ExternalPtrAddrFn(SEXP s) {
   fn_ptr ptr;
   ptr.p = R_ExternalPtrAddr(s);
   return ptr.fn;
 }
#endif

// The R API does not have a setter for function pointers

SEXP cleancall_MakeExternalPtrFn(DL_FUNC p, SEXP tag, SEXP prot) {
    fn_ptr tmp;
    tmp.fn = p;
    return R_MakeExternalPtr(tmp.p, tag, prot);
}

void cleancall_SetExternalPtrAddrFn(SEXP s, DL_FUNC p) {
    fn_ptr ptr;
    ptr.fn = p;
    R_SetExternalPtrAddr(s, ptr.p);
}


// Initialised at load time with the `.Call` primitive
SEXP cleancall_fns_dot_call = NULL;

static SEXP callbacks = NULL;

void cleancall_init(void) {
  cleancall_fns_dot_call = Rf_findVar(Rf_install(".Call"), R_BaseEnv);
  callbacks = R_NilValue;
}

struct eval_args {
  SEXP call;
  SEXP env;
};

static SEXP eval_wrap(void* data) {
  struct eval_args* args = (struct eval_args*) data;
  return Rf_eval(args->call, args->env);
}


SEXP cleancall_call(SEXP args, SEXP env) {
  SEXP call = PROTECT(Rf_lcons(cleancall_fns_dot_call, args));
  struct eval_args data = { call, env };

  SEXP out = r_with_cleanup_context(&eval_wrap, &data);

  UNPROTECT(1);
  return out;
}


// Preallocate a callback
static void push_callback(SEXP stack) {
  SEXP top = CDR(stack);

  SEXP early_handler = PROTECT(Rf_allocVector(LGLSXP, 1));
  SEXP fn_extptr = PROTECT(cleancall_MakeExternalPtrFn(NULL, R_NilValue,
                                                       R_NilValue));
  SEXP data_extptr = PROTECT(R_MakeExternalPtr(NULL, early_handler,
                                               R_NilValue));
  SEXP cb = Rf_cons(Rf_cons(fn_extptr, data_extptr), top);

  SETCDR(stack, cb);

  UNPROTECT(3);
}

struct data_wrapper {
  SEXP (*fn)(void* data);
  void *data;
  SEXP callbacks;
  int success;
};

static void call_exits(void* data) {
  // Remove protecting node. Don't remove the preallocated callback on
  // the top as it might contain a handler when something went wrong.
  SEXP top = CDR(callbacks);

  // Restore old stack
  struct data_wrapper* state = data;
  callbacks = (SEXP) state->callbacks;

  // Handlers should not jump
  while (top != R_NilValue) {
    SEXP cb = CAR(top);
    top = CDR(top);

    void (*fn)(void*) = (void (*)(void*)) R_ExternalPtrAddrFn(CAR(cb));
    void *data = (void*) R_ExternalPtrAddr(CDR(cb));
    int early_handler = LOGICAL(R_ExternalPtrTag(CDR(cb)))[0];

    // Check for empty pointer in preallocated callbacks
    if (fn) {
      if (!early_handler || !state->success) fn(data);
    }
  }
}

static SEXP with_cleanup_context_wrap(void *data) {
  struct data_wrapper* cdata = data;
  SEXP ret = cdata->fn(cdata->data);
  cdata->success = 1;
  return ret;
}

SEXP r_with_cleanup_context(SEXP (*fn)(void* data), void* data) {
  // Preallocate new stack before changing `callbacks` to avoid
  // leaving the global variable in a bad state if alloc fails
  SEXP new = PROTECT(Rf_cons(R_NilValue, R_NilValue));
  push_callback(new);

  SEXP old = callbacks;
  callbacks = new;

  struct data_wrapper state = { fn, data, old, 0 };

  SEXP out = R_ExecWithCleanup(with_cleanup_context_wrap, &state,
                               &call_exits, &state);

  UNPROTECT(1);
  return out;
}

static void call_save_handler(void (*fn)(void *data), void* data,
                              int early) {
  if (Rf_isNull(callbacks)) {
    fn(data);
    Rf_error("Internal error: Exit handler pushed outside "
             "of an exit context");
  }

  SEXP cb = CADR(callbacks);

  // Update pointers
  cleancall_SetExternalPtrAddrFn(CAR(cb), (DL_FUNC) fn);
  R_SetExternalPtrAddr(CDR(cb), data);
  LOGICAL(R_ExternalPtrTag(CDR(cb)))[0] = early;

  // Preallocate the next callback in case the allocator jumps
  push_callback(callbacks);
}

void r_call_on_exit(void (*fn)(void* data), void* data) {
  call_save_handler(fn, data, /* early = */ 0);
}

void r_call_on_early_exit(void (*fn)(void* data), void* data) {
  call_save_handler(fn, data, /* early = */ 1);
}
