#define R_NO_REMAP
#include <Rinternals.h>
#include "utils.h"

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

  Rf_eval(call, R_BaseEnv);
  Rf_error("Internal error: `stop_bad_type()` should have thrown earlier");
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

  Rf_eval(call, R_BaseEnv);
  Rf_error("Internal error: `stop_bad_element_type()` should have thrown earlier");
}

void stop_bad_length(SEXP x,
                     R_xlen_t expected_length,
                     const char* what,
                     const char* arg,
                     bool recycle) {
  SEXP fn = Rf_lang3(Rf_install(":::"),
                     Rf_install("purrr"),
                     Rf_install("stop_bad_length"));

  SEXP call = Rf_lang5(PROTECT(fn),
                       PROTECT(sym_protect(x)),
                       PROTECT(Rf_ScalarReal(expected_length)),
                       what ? PROTECT(Rf_mkString(what)) : R_NilValue,
                       arg ? PROTECT(Rf_mkString(arg)) : R_NilValue);

  PROTECT(call);

  SEXP node = CDR(CDR(CDR(call)));
  SET_TAG(node, Rf_install("what"));

  node = CDR(node);
  SET_TAG(node, Rf_install("arg"));

  Rf_eval(call, R_BaseEnv);
  Rf_error("Internal error: `stop_bad_length()` should have thrown earlier");
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

  Rf_eval(call, R_BaseEnv);
  Rf_error("Internal error: `stop_bad_element_length()` should have thrown earlier");
}

void stop_bad_vector(SEXP x,
                     SEXP expected_ptype,
                     R_xlen_t expected_length,
                     const char* what,
                     const char* arg,
                     bool recycle) {
  SEXP fn = Rf_lang3(Rf_install(":::"),
                     Rf_install("purrr"),
                     Rf_install("stop_bad_vector"));

  SEXP call = Rf_lang6(PROTECT(fn),
                       x,
                       expected_ptype,
                       PROTECT(Rf_ScalarReal(expected_length)),
                       what ? PROTECT(Rf_mkString(what)) : R_NilValue,
                       arg ? PROTECT(Rf_mkString(arg)) : R_NilValue);

  PROTECT(call);

  SEXP node = CDR(CDR(CDR(CDR(call))));
  SET_TAG(node, Rf_install("what"));

  node = CDR(node);
  SET_TAG(node, Rf_install("arg"));

  Rf_eval(call, R_BaseEnv);
  Rf_error("Internal error: `stop_bad_vector()` should have thrown earlier");
}

void stop_bad_element_vector(SEXP x,
                             R_xlen_t index,
                             SEXP expected_ptype,
                             R_xlen_t expected_length,
                             const char* what,
                             const char* arg,
                             bool recycle) {
  SEXP fn = Rf_lang3(Rf_install(":::"),
                     Rf_install("purrr"),
                     Rf_install("stop_bad_element_vector"));

  SEXP call = lang8(PROTECT(fn),
                    x,
                    PROTECT(Rf_ScalarReal(index)),
                    expected_ptype,
                    PROTECT(Rf_ScalarReal(expected_length)),
                    what ? PROTECT(Rf_mkString(what)) : R_NilValue,
                    arg ? PROTECT(Rf_mkString(arg)) : R_NilValue,
                    PROTECT(Rf_ScalarLogical(recycle)));

  PROTECT(call);

  SEXP node = CDR(CDR(CDR(CDR(CDR(call)))));
  SET_TAG(node, Rf_install("what"));

  node = CDR(node);
  SET_TAG(node, Rf_install("arg"));

  node = CDR(node);
  SET_TAG(node, Rf_install("recycle"));

  Rf_eval(call, R_BaseEnv);
  Rf_error("Internal error: `stop_bad_element_length()` should have thrown earlier");
}
