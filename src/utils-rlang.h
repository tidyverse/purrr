#ifndef PURRR_UTILS_RLANG_H
#define PURRR_UTILS_RLANG_H


#define r_lgl Rf_ScalarLogical
#define r_int Rf_ScalarInteger
#define r_str Rf_mkChar
#define r_chr Rf_mkString
#define r_sym Rf_install

static inline
__attribute__((noreturn))
void r_never_reached(const char* fn) {
  Rf_error("Internal error in `%s()`: Reached the unreachable.", fn);
}

__attribute__((noreturn)) void r_abort(const char* fmt, ...);
__attribute__((noreturn)) void stop_internal(const char* fn, const char* fmt, ...);

static inline
__attribute__((noreturn))
void stop_unimplemented_type(const char* fn, SEXPTYPE type) {
  stop_internal(fn, "Unimplemented type `%s`.", Rf_type2char(type));
}


SEXP r_parse(const char* str);
SEXP r_parse_eval(const char* str, SEXP env);


extern SEXP pkg_ns_env;

extern SEXP syms_abort;


#endif
