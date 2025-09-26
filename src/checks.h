#ifndef CHECKS_H
#define CHECKS_H

#include <Rinternals.h>
#include <stdbool.h>

bool is_bool(SEXP value);
bool is_na(SEXP value);

#endif //CHECKS_H
