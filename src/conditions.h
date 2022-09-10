#ifndef CONDITIONS_H
#define CONDITIONS_H

#include <stdbool.h>

void stop_bad_type(SEXP x, const char* expected, const char* what, const char* arg, SEXP env) __attribute__((noreturn));
void stop_bad_element_type(SEXP x, R_xlen_t index, const char* expected, const char* what, const char* arg, SEXP env) __attribute__((noreturn));
void stop_bad_element_length(SEXP x, R_xlen_t index, R_xlen_t expected_length, const char* what, const char* arg, bool recycle, SEXP env) __attribute__((noreturn));

#endif
