#ifndef CONDITIONS_H
#define CONDITIONS_H


void stop_bad_type(SEXP x, const char* expected, const char* what, const char* arg);
void stop_bad_element_type(SEXP x, int index, const char* expected, const char* what, const char* arg);


#endif
