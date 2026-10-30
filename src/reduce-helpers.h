#ifndef PURRR_REDUCE_HELPERS_H
#define PURRR_REDUCE_HELPERS_H
#include <Rinternals.h>
#include <stdbool.h>

bool is_done_box(SEXP out, bool check_empty);
SEXP unbox(SEXP box);

SEXP subset_list(SEXP list, int from, int to);

#endif
