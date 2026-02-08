#ifndef PURRR_EXTRACT_H
#define PURRR_EXTRACT_H

SEXP extract_from_vector(SEXP x, int index);
SEXP make_call_1(SEXP x, int index, const char* symbol);
SEXP make_call_2(SEXP x, SEXP y, int index, const char* symbol);
SEXP make_call_n(SEXP xs, SEXP call_names, int index, const char* symbol);

#endif //PURRR_EXTRACT_H