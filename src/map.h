#ifndef MAP_H
#define MAP_H

extern "C" {
  SEXP map_impl(SEXP env, SEXP x_name_, SEXP f_name_, SEXP type_);
  SEXP pmap_impl(SEXP env, SEXP l_name_, SEXP f_name_, SEXP type_);
}

#endif
