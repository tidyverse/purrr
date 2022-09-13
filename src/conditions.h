#ifndef CONDITIONS_H
#define CONDITIONS_H

#include <stdbool.h>

void stop_bad_type(SEXP x, const char* expected, const char* what, const char* arg) __attribute__((noreturn));
void stop_bad_element_type(SEXP x, R_xlen_t index, const char* expected, const char* what, const char* arg) __attribute__((noreturn));
void stop_bad_element_length(SEXP x, R_xlen_t index, R_xlen_t expected_length, const char* what, const char* arg, bool recycle) __attribute__((noreturn));
SEXP caller_env();
void __attribute__ ((noreturn)) purrr_abort(const char* fmt, ...);

#endif
