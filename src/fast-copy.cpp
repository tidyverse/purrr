// These routines were adapted from Kevin Ushey's code in hadley/reshape

#include <Rcpp.h>
#include "utils.h"

using namespace Rcpp;


#define DO_REP_EACH_N(RTYPE, CTYPE, ACCESSOR)           \
  {                                                     \
    int counter = 0;                                    \
    Shield<SEXP> out(Rf_allocVector(RTYPE, out_size));  \
    CTYPE* x_ptr = ACCESSOR(x);                         \
    CTYPE* out_ptr = ACCESSOR(out);                     \
    for (int i = 0; i < x_size; ++i) {                  \
      for (int j = 0; j < times[i]; ++j) {              \
        out_ptr[counter] = x_ptr[i];                    \
        ++counter;                                      \
      }                                                 \
    }                                                   \
    return out;                                         \
    break;                                              \
  }

SEXP rep_each_n(const RObject x, const IntegerVector& times) {
  int x_size = Rf_length(x);
  int out_size = sum(times);

  switch (x.sexp_type()) {
  case INTSXP:  DO_REP_EACH_N(INTSXP, int, INTEGER);
  case REALSXP: DO_REP_EACH_N(REALSXP, double, REAL);
  case STRSXP: {
    int counter = 0;
    Shield<SEXP> out(Rf_allocVector(STRSXP, out_size));
    for (int i = 0; i < x_size; ++i) {
      for (int j = 0; j < times[i]; ++j) {
        SET_STRING_ELT(out, counter, STRING_ELT(x, i));
        ++counter;
      }
    }
    return out;
    break;
  }
  case LGLSXP:  DO_REP_EACH_N(LGLSXP, int, LOGICAL);
  case CPLXSXP: DO_REP_EACH_N(CPLXSXP, Rcomplex, COMPLEX);
  case RAWSXP:  DO_REP_EACH_N(RAWSXP, Rbyte, RAW);
  case VECSXP:  DO_REP_EACH_N(VECSXP, SEXP, STRING_PTR);
  default: {
    stop("Unsupported type", type2name(x));
    return R_NilValue;
  }
  }
}

#define DO_COPY(C_TYPE, ACCESSOR)                                 \
  {                                                               \
    memcpy((char*) ACCESSOR(to) + offset_to * sizeof(C_TYPE),     \
           (char*) ACCESSOR(from) + offset_from * sizeof(C_TYPE), \
           sizeof(C_TYPE) * n);                                   \
    return from;                                                  \
    break;                                                        \
  }                                                               \

SEXP copy_elements(const RObject from, int offset_from,
                   RObject to, int offset_to, int n = 0) {
  // By default, copy whole 'from' vector
  n = n ? n : Rf_length(from) - offset_from;

  if (from.sexp_type() != to.sexp_type()) {
    stop("Incompatible slice results (types do not match)",
      type2name(from), type2name(to));
  }
  if (Rf_length(to) - offset_to < n) {
    stop("Internal error: destination is too small");
  }

  switch (from.sexp_type()) {
  case INTSXP:  DO_COPY(int, INTEGER);
  case REALSXP: DO_COPY(double, REAL);
  case STRSXP:
    for (int i = offset_to, j = 0; j < n; ++i, ++j) {
      SET_STRING_ELT(to, i, STRING_ELT(from, j + offset_from));
    }
    return to;
    break;
  case LGLSXP:  DO_COPY(int, LOGICAL);
  case CPLXSXP: DO_COPY(Rcomplex, COMPLEX);
  case RAWSXP:  DO_COPY(Rbyte, RAW);
  case VECSXP:  DO_COPY(SEXP, STRING_PTR);
  default:
    stop("Unsupported type", type2name(from));
    return R_NilValue;
  }
}


IntegerVector seq_each_n(const IntegerVector& times) {
  IntegerVector out = no_init(sum(times));
  IntegerVector::iterator out_it = out.begin();

  for (int i = 0; i < times.size(); ++i) {
    int len = times[i];
    std::fill(out_it, out_it + len, i + 1);
    out_it += len;
  }

  return out;
}
