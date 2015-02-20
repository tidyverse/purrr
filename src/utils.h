#ifndef UTILS_H
#define UTILS_H

SEXP shadow_call(const SEXP fun, SEXP arg, SEXP dots, const SEXP env = R_NilValue);
SEXP as_data_frame(SEXP x);
int is_atomic(const SEXP x);
int is_atomic(int x);
int is_function(const SEXP fun);
int is_function(int fun);

#endif
