#ifndef CONDITIONS_H
#define CONDITIONS_H

#include <stdbool.h>

void __attribute__ ((noreturn)) stop_bad_type(SEXP x, const char* expected, const char* what, const char* arg) __attribute__((noreturn));
void __attribute__ ((noreturn)) stop_bad_element_type(SEXP x, R_xlen_t index, const char* expected, const char* what, const char* arg) __attribute__((noreturn));
void __attribute__ ((noreturn)) stop_bad_element_length(SEXP x, R_xlen_t index, R_xlen_t expected_length, const char* what, const char* arg, bool recycle) __attribute__((noreturn));
SEXP current_env(void);
void __attribute__ ((noreturn)) r_abort(const char* fmt, ...);
void __attribute__ ((noreturn)) r_abort_call(SEXP env, const char* fmt, ...);

const char* rlang_obj_type_friendly_full(SEXP x, bool value, bool length);

#endif
