#define R_NO_REMAP
#include <Rinternals.h>
#include <stdbool.h>
#include "utils-rlang.h"


#define FMT_BUFSIZE 4096
#define FMT_INTERP(BUF, FMT, DOTS)              \
  {                                             \
    va_list dots;                               \
    va_start(dots, FMT);                        \
    vsnprintf(BUF, FMT_BUFSIZE, FMT, dots);     \
    va_end(dots);                               \
                                                \
    BUF[FMT_BUFSIZE - 1] = '\0';                \
  }

__attribute__((noreturn))
void r_abort(const char* fmt, ...) {
  R_CheckStack2(FMT_BUFSIZE);
  char msg[FMT_BUFSIZE];
  FMT_INTERP(msg, fmt, ...);

  SEXP r_msg = PROTECT(r_chr(msg));
  SEXP call = PROTECT(Rf_lang2(syms_abort, r_msg));
  Rf_eval(call, pkg_ns_env);

  r_never_reached("r_abort");
}

__attribute__((noreturn))
void stop_internal(const char* fn, const char* fmt, ...) {
  R_CheckStack2(FMT_BUFSIZE);
  char msg[FMT_BUFSIZE];
  FMT_INTERP(msg, fmt, ...);

  r_abort("Internal error in `%s()`: %s", fn, msg);
}

#undef FMT_INTERP
#undef FMT_BUFSIZE


#include <R_ext/Parse.h>

static void abort_parse(SEXP code, const char* why) {
  if (Rf_GetOption1(Rf_install("rlang__verbose_errors")) != R_NilValue) {
   Rf_PrintValue(code);
  }
  stop_internal("r_parse", why);
}

SEXP r_parse(const char* str) {
  SEXP str_ = PROTECT(Rf_mkString(str));

  ParseStatus status;
  SEXP out = PROTECT(R_ParseVector(str_, -1, &status, R_NilValue));
  if (status != PARSE_OK) {
    abort_parse(str_, "Parsing failed.");
  }
  if (Rf_length(out) != 1) {
    abort_parse(str_, "Expected a single expression.");
  }

  out = VECTOR_ELT(out, 0);

  UNPROTECT(2);
  return out;
}
SEXP r_parse_eval(const char* str, SEXP env) {
  SEXP out = Rf_eval(PROTECT(r_parse(str)), env);
  UNPROTECT(1);
  return out;
}


SEXP pkg_ns_env = NULL;
SEXP syms_abort = NULL;

void rlang_utils_init(SEXP ns) {
  pkg_ns_env = ns;

  syms_abort = Rf_install("syms_abort");
}
