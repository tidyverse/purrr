#define R_NO_REMAP
#include <Rinternals.h>
#include "backports.h"
#include "utils.h"
#include <R_ext/Parse.h>

SEXP current_env(void) {
  static SEXP call = NULL;

  if (!call) {
    // `sys.frame(sys.nframe())` doesn't work because `sys.nframe()`
    // returns the number of the frame in which evaluation occurs. It
    // doesn't return the number of frames on the stack. So we'd need
    // to evaluate it in the last frame on the stack which is what we
    // are looking for to begin with. We use instead this workaround:
    // Call `sys.frame()` from a closure to push a new frame on the
    // stack, and use negative indexing to get the previous frame.
    ParseStatus status;
    SEXP code = PROTECT(Rf_mkString("sys.frame(-1)"));
    SEXP parsed = PROTECT(R_ParseVector(code, -1, &status, R_NilValue));
    SEXP body = VECTOR_ELT(parsed, 0);

    SEXP fn = PROTECT(R_mkClosure(R_NilValue, body, R_BaseEnv));

    call = Rf_lang1(fn);
    R_PreserveObject(call);

    UNPROTECT(3);
  }

  return Rf_eval(call, R_BaseEnv);
}


void r_abort0(SEXP env, char* buf) {
  SEXP message = PROTECT(Rf_mkString(buf));

  SEXP fn = PROTECT(
    Rf_lang3(Rf_install("::"), Rf_install("rlang"), Rf_install("abort"))
  );
  SEXP call = PROTECT(Rf_lang3(fn, message, env));

  SEXP node = CDDR(call);
  SET_TAG(node, Rf_install("call"));

  Rf_eval(call, R_BaseEnv);
  while (1); // No return
}

#define BUFSIZE 8192
void r_abort(const char* fmt, ...) {
  char buf[BUFSIZE];
  va_list dots;
  va_start(dots, fmt);
  vsnprintf(buf, BUFSIZE, fmt, dots);
  va_end(dots);
  buf[BUFSIZE - 1] = '\0';

  SEXP env = PROTECT(current_env());
  r_abort0(env, buf);
}

void r_abort_call(SEXP env, const char* fmt, ...) {
  char buf[BUFSIZE];
  va_list dots;
  va_start(dots, fmt);
  vsnprintf(buf, BUFSIZE, fmt, dots);
  va_end(dots);
  buf[BUFSIZE - 1] = '\0';

  r_abort0(env, buf);
}

const char* rlang_obj_type_friendly_full(SEXP x, bool value, bool length) {
  const char* (*rlang_ptr)(SEXP x, bool value, bool length) = NULL;
  if (rlang_ptr == NULL) {
    rlang_ptr = (const char* (*)(SEXP, bool, bool))
      R_GetCCallable("rlang", "rlang_obj_type_friendly_full");
  }
  return rlang_ptr(x, value, length);
}

void stop_bad_type(SEXP x, const char* expected, const char* what, const char* arg) {
  SEXP fn = Rf_lang3(Rf_install(":::"),
                     Rf_install("purrr"),
                     Rf_install("stop_bad_type"));

  SEXP call = Rf_lang5(PROTECT(fn),
                       PROTECT(sym_protect(x)),
                       PROTECT(Rf_mkString(expected)),
                       what ? PROTECT(Rf_mkString(what)) : R_NilValue,
                       arg ? PROTECT(Rf_mkString(arg)) : R_NilValue);

  PROTECT(call);

  SEXP node = CDR(CDR(CDR(call)));
  SET_TAG(node, Rf_install("what"));

  node = CDR(node);
  SET_TAG(node, Rf_install("arg"));

  SEXP env = PROTECT(current_env());
  Rf_eval(call, env);
  while (1); // No return
}

void stop_bad_element_type(SEXP x, R_xlen_t index, const char* expected, const char* what, const char* arg) {
  SEXP fn = Rf_lang3(Rf_install(":::"),
                     Rf_install("purrr"),
                     Rf_install("stop_bad_element_type"));

  SEXP call = Rf_lang6(PROTECT(fn),
                       PROTECT(sym_protect(x)),
                       PROTECT(Rf_ScalarReal(index)),
                       PROTECT(Rf_mkString(expected)),
                       what ? PROTECT(Rf_mkString(what)) : R_NilValue,
                       arg ? PROTECT(Rf_mkString(arg)) : R_NilValue);

  PROTECT(call);

  SEXP node = CDR(CDR(CDR(CDR(call))));
  SET_TAG(node, Rf_install("what"));

  node = CDR(node);
  SET_TAG(node, Rf_install("arg"));

  SEXP env = PROTECT(current_env());
  Rf_eval(call, env);
  while (1); // No return
}

void stop_bad_element_length(SEXP x,
                             R_xlen_t index,
                             R_xlen_t expected_length,
                             const char* what,
                             const char* arg,
                             bool recycle) {
  SEXP fn = Rf_lang3(Rf_install(":::"),
                     Rf_install("purrr"),
                     Rf_install("stop_bad_element_length"));

  SEXP call = lang7(PROTECT(fn),
                    PROTECT(sym_protect(x)),
                    PROTECT(Rf_ScalarReal(index)),
                    PROTECT(Rf_ScalarReal(expected_length)),
                    what ? PROTECT(Rf_mkString(what)) : R_NilValue,
                    arg ? PROTECT(Rf_mkString(arg)) : R_NilValue,
                    PROTECT(Rf_ScalarLogical(recycle)));

  PROTECT(call);

  SEXP node = CDR(CDR(CDR(CDR(call))));
  SET_TAG(node, Rf_install("what"));

  node = CDR(node);
  SET_TAG(node, Rf_install("arg"));

  node = CDR(node);
  SET_TAG(node, Rf_install("recycle"));

  SEXP env = PROTECT(current_env());
  Rf_eval(call, env);
  while (1); // No return
}
