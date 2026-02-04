#ifndef PURRR_EXTRACT_H
#define PURRR_EXTRACT_H

SEXP extract_from_vector(SEXP x, int index);
SEXP make_map_call(SEXP x, int index);
SEXP make_map2_call(SEXP x, SEXP y, int index);

#endif //PURRR_EXTRACT_H