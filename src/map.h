#ifndef MAP_H
#define MAP_H

extern "C" {
  SEXP map_impl(
    SEXP x,
    SEXP env,
    SEXP ffi_type,
    SEXP progress,
    SEXP ffi_n,
    SEXP names,
    SEXP i
  );

  SEXP pmap_impl(
    SEXP l,
    SEXP env,
    SEXP ffi_type,
    SEXP progress,
    SEXP ffi_n,
    SEXP names,
    SEXP i
  );
}

#endif
