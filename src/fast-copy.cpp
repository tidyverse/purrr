// These routines were adapted from Kevin Ushey's code in hadley/reshape

#include <Rcpp.h>

using namespace Rcpp;


#define DO_REP_EACH_N(RTYPE, CTYPE, ACCESSOR)          \
  {                                                    \
    int counter = 0;                                   \
    Shield<SEXP> out(Rf_allocVector(RTYPE, out_size)); \
    CTYPE* x_ptr = ACCESSOR(x);                        \
    CTYPE* out_ptr = ACCESSOR(out);                    \
    for (int i = 0; i < x_size; ++i) {                 \
      for (int j = 0; j < times[i]; ++j) {             \
        out_ptr[counter] = x_ptr[i];                   \
        ++counter;                                     \
      }                                                \
    }                                                  \
    return out;                                        \
    break;                                             \
  }

SEXP rep_each_n(const SEXP x, const IntegerVector& times) {
  int x_size = Rf_length(x);
  int out_size = sum(times);

  switch (TYPEOF(x)) {
    case INTSXP:
      DO_REP_EACH_N(INTSXP, int, INTEGER);
    case REALSXP:
      DO_REP_EACH_N(REALSXP, double, REAL);
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
      DO_REP_EACH_N(STRSXP, SEXP, STRING_PTR);
    case LGLSXP:
      DO_REP_EACH_N(LGLSXP, int, LOGICAL);
    case CPLXSXP:
      DO_REP_EACH_N(CPLXSXP, Rcomplex, COMPLEX);
    case RAWSXP:
      DO_REP_EACH_N(RAWSXP, Rbyte, RAW);
    case VECSXP:
      DO_REP_EACH_N(VECSXP, SEXP, STRING_PTR);
    default: {
      stop("Unhandled RTYPE");
      return R_NilValue;
    }
  }
}


SEXP seq_each_n(int length, const IntegerVector& times) {
  int out_size = sum(times);
  Shield<SEXP> out(Rf_allocVector(INTSXP, out_size));
  int* out_ptr = INTEGER(out);

  for (int i = 0, counter = 0; i < length; ++i) {
    for (int j = 0; j < times[i]; ++j) {
      out_ptr[counter] = i + 1;
      ++counter;
    }
  }

  return out;
}


#define DO_COPY(C_TYPE, ACCESSOR)                      \
  {                                                    \
    memcpy((char*)ACCESSOR(to) + pos * sizeof(C_TYPE), \
           (char*)ACCESSOR(from),                      \
           sizeof(C_TYPE) * from_size);                \
    return from;                                       \
    break;                                             \
  }                                                    \

SEXP copy_at_pos(const SEXP from, SEXP to, int pos) {
  int from_size = Rf_length(from);

  if (TYPEOF(from) != TYPEOF(to)) {
    stop("Incompatible slice results (types do not match)",
      type2name(from), type2name(to));
  }
  if (Rf_length(to) - pos < from_size) {
    stop("Internal error: destination is too small");
  }

  switch (TYPEOF(from)) {
  case INTSXP:
    DO_COPY(int, INTEGER);
  case REALSXP:
    DO_COPY(double, REAL);
  case STRSXP: {
    for (int i = pos, j = 0; j < from_size; ++i, ++j) {
      SET_STRING_ELT(to, i, STRING_ELT(from, j));
    }
    return to;
    break;
  }
  case LGLSXP:
    DO_COPY(int, LOGICAL);
  case CPLXSXP:
    DO_COPY(Rcomplex, COMPLEX);
  case RAWSXP:
    DO_COPY(Rbyte, RAW);
  case VECSXP:
    DO_COPY(SEXP, STRING_PTR);  // Should we save attributes here?
  default: {
    stop("Unhandled R_TYPE");
    return R_NilValue;
  }
  }
}
