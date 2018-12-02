#ifndef CONDITIONS_H
#define CONDITIONS_H



void stop_bad_type(SEXP x, const char* expected, const char* what, const char* arg) __attribute__((noreturn));
void stop_bad_element_type(SEXP x, R_xlen_t index, const char* expected, const char* what, const char* arg) __attribute__((noreturn));

#endif
