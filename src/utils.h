#ifndef UTILS_H
#define UTILS_H


// The return value might be garbage-collected so should be used in
// non-jumpy context
const char* friendly_typeof(SEXP x);


#endif
