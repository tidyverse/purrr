#ifndef UTILS_H
#define UTILS_H

#include <stdbool.h>


SEXP sym_protect(SEXP x);

// The return value might be garbage-collected so should be used in
// non-jumpy context
const char* friendly_typeof(SEXP x);

bool is_vector(SEXP x);


#endif
