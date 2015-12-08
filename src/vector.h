#ifndef UTILS_H
#define UTILS_H

// Set value of to[i] to from[j], coercing vectors using usual rules.
void set_vector_value(SEXP to, int i, SEXP from, int j);

// Return bool if coerceable
int can_coerce(SEXPTYPE from, SEXPTYPE to);
// Throw error if not coerceable
void ensure_can_coerce(SEXPTYPE from, SEXPTYPE to, int i);


#endif
