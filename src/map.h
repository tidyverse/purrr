#ifndef MAP_H
#define MAP_H

extern "C" {
  SEXP map_impl(SEXP env,
                SEXP ffi_type,
                SEXP progress,
                SEXP ffi_n,
                SEXP names,
                SEXP i);

  SEXP pmap_impl(SEXP env,
                 SEXP ffi_type,
                 SEXP progress,
                 SEXP ffi_n,
                 SEXP names,
                 SEXP i,
                 SEXP call_names,
                 SEXP ffi_call_n);
}

#endif
