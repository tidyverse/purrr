#ifndef CLEANCALL_H
#define CLEANCALL_H

#include <Rversion.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

#ifdef __cplusplus
extern "C" {
#endif

// --------------------------------------------------------------------
// Internals
// --------------------------------------------------------------------

typedef union {void* p; DL_FUNC fn;} fn_ptr;

#if (defined(R_VERSION) && R_VERSION < R_Version(3, 4, 0))
 SEXP R_MakeExternalPtrFn(DL_FUNC p, SEXP tag, SEXP prot);
 DL_FUNC R_ExternalPtrAddrFn(SEXP s);
#endif

// --------------------------------------------------------------------
// API for packages that embed cleancall
// --------------------------------------------------------------------

// The R API does not have a setter for external function pointers
SEXP cleancall_MakeExternalPtrFn(DL_FUNC p, SEXP tag, SEXP prot);
void cleancall_SetExternalPtrAddrFn(SEXP s, DL_FUNC p);

#define CLEANCALL_METHOD_RECORD  \
  {"cleancall_call", (DL_FUNC) &cleancall_call, 2}

SEXP cleancall_call(SEXP args, SEXP env);
void cleancall_init(void);

// --------------------------------------------------------------------
// Public API
// --------------------------------------------------------------------

#define R_CLEANCALL_SUPPORT 1

SEXP r_with_cleanup_context(SEXP (*fn)(void* data), void* data);
void r_call_on_exit(void (*fn)(void* data), void* data);
void r_call_on_early_exit(void (*fn)(void* data), void* data);

#ifdef __cplusplus
}
#endif

#endif
