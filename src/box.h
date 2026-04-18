#ifndef PURRR_BOX_H
#define PURRR_BOX_H
#include <Rinternals.h>
#include <stdbool.h>

bool is_done_box(SEXP out, bool check_empty);
SEXP unbox(SEXP box);

#endif