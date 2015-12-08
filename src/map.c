#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

void copy_names(SEXP from, SEXP to) {
  if (Rf_length(from) != Rf_length(to))
    return;

  SEXP names = Rf_getAttrib(from, R_NamesSymbol);
  if (Rf_isNull(names))
    return;

  Rf_setAttrib(to, R_NamesSymbol, names);
}

void set_vector_value(SEXP to, int i, SEXP from, int j) {

  switch(TYPEOF(to)) {
  case LGLSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: LOGICAL(to)[i] = LOGICAL(from)[j]; break;
    default:     Rf_errorcall(R_NilValue, "Element %i is not a logical vector.", i + 1);
    }
    break;
  case INTSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: INTEGER(to)[i] = LOGICAL(from)[j]; break;
    case INTSXP: INTEGER(to)[i] = INTEGER(from)[j]; break;
    default:     Rf_error("Element %i is not a integer or logical vector.", i + 1);
    }
    break;
  case REALSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:  REAL(to)[i] = LOGICAL(from)[j]; break;
    case INTSXP:  REAL(to)[i] = INTEGER(from)[j]; break;
    case REALSXP: REAL(to)[i] = REAL(from)[j]; break;
    default:      Rf_error("Element %i is not a integer, logical, or double vector.", i + 1);
    }
    break;
  case STRSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:
    case INTSXP:
    case REALSXP: SET_STRING_ELT(to, i, Rf_asChar(from)); break;
    case STRSXP:  SET_STRING_ELT(to, i, STRING_ELT(from, 0)); break;
    default:      Rf_error("Element %i is not a integer, logical, double, or character vector.", i + 1);
    }
    break;
  case VECSXP:  SET_VECTOR_ELT(to, i, from); break;
  default:      Rf_error("Unsupported type %s", Rf_type2char(TYPEOF(to)));
  }
}

// call must involve i
SEXP call_loop(SEXP env, SEXP call, int n, SEXPTYPE type) {
  // Create variable "i" and map to scalar integer
  SEXP i_val = PROTECT(Rf_ScalarInteger(1));
  SEXP i = Rf_install("i");
  Rf_defineVar(i, i_val, env);
  UNPROTECT(1);

  SEXP out = PROTECT(Rf_allocVector(type, n));
  for (int i = 0; i < n; ++i) {
    if (i % 1000 == 0)
      R_CheckUserInterrupt();

    INTEGER(i_val)[0] = i + 1;

    SEXP res = Rf_eval(call, env);
    if (type != VECSXP && Rf_length(res) != 1)
      Rf_error("Result %i is not a length 1 atomic vector", i + 1);

    set_vector_value(out, i, res, 0);
  }

  UNPROTECT(1);
  return out;
}

SEXP map_impl(SEXP env, SEXP x_name_, SEXP f_name_, SEXP type_) {
  const char* x_name = CHAR(Rf_asChar(x_name_));
  const char* f_name = CHAR(Rf_asChar(f_name_));

  SEXP x = Rf_install(x_name);
  SEXP f = Rf_install(f_name);
  SEXP i = Rf_install("i");

  SEXP x_val = Rf_eval(x, env);
  if (!Rf_isVector(x_val))
    Rf_error("`.x` is not a vector (%s)", Rf_type2char(TYPEOF(x_val)));
  int n = Rf_length(x_val);

  // Constructs a call like f(x[[i]], ...) - don't want to substitute
  // actual values for f or x, because they may be long, which creates
  // bad tracebacks()
  SEXP Xi = PROTECT(Rf_lang3(R_Bracket2Symbol, x, i));
  SEXP f_call = PROTECT(Rf_lang3(f, Xi, R_DotsSymbol));

  SEXPTYPE type = Rf_str2type(CHAR(Rf_asChar(type_)));
  SEXP out = PROTECT(call_loop(env, f_call, n, type));
  copy_names(x_val, out);

  UNPROTECT(3);

  return out;
}

SEXP map2_impl(SEXP env, SEXP x_name_, SEXP y_name_, SEXP f_name_, SEXP type_) {
  const char* x_name = CHAR(Rf_asChar(x_name_));
  const char* y_name = CHAR(Rf_asChar(y_name_));
  const char* f_name = CHAR(Rf_asChar(f_name_));

  SEXP x = Rf_install(x_name);
  SEXP y = Rf_install(y_name);
  SEXP f = Rf_install(f_name);
  SEXP i = Rf_install("i");

  SEXP x_val = Rf_eval(x, env);
  if (!Rf_isVector(x_val))
    Rf_error("`.x` is not a vector (%s)", Rf_type2char(TYPEOF(x_val)));
  SEXP y_val = Rf_eval(y, env);
  if (!Rf_isVector(y_val))
    Rf_error("`.y` is not a vector (%s)", Rf_type2char(TYPEOF(y_val)));

  int nx = Rf_length(x_val), ny = Rf_length(y_val);
  if (nx != ny && !(nx == 1 || ny == 1)) {
    Rf_error("`.x` (%i) and `.y` (%i) are different lengths", nx, ny);
  }
  int n = (nx > ny) ? nx : ny;

  // Constructs a call like f(x[[i]], y[[i]], ...)
  SEXP one = PROTECT(Rf_ScalarInteger(1));
  SEXP Xi = PROTECT(Rf_lang3(R_Bracket2Symbol, x, nx == 1 ? one : i));
  SEXP Yi = PROTECT(Rf_lang3(R_Bracket2Symbol, y, ny == 1 ? one : i));
  SEXP f_call = PROTECT(Rf_lang4(f, Xi, Yi, R_DotsSymbol));

  SEXPTYPE type = Rf_str2type(CHAR(Rf_asChar(type_)));
  SEXP out = PROTECT(call_loop(env, f_call, n, type));
  copy_names(x_val, out);

  UNPROTECT(5);
  return out;
}

SEXP pmap_impl(SEXP env, SEXP l_name_, SEXP f_name_, SEXP type_) {
  const char* l_name = CHAR(Rf_asChar(l_name_));
  SEXP l = Rf_install(l_name);
  SEXP l_val = Rf_eval(l, env);

  if (!Rf_isVectorList(l_val))
    Rf_error("`.x` is not a list (%s)", Rf_type2char(TYPEOF(l_val)));

  // Check all elements are lists and find maximum length
  int m = Rf_length(l_val);
  int n = 0;
  for (int j = 0; j < m; ++j) {
    SEXP j_val = VECTOR_ELT(l_val, j);
    if (!Rf_isVector(j_val))
      Rf_error("Element %i is not a vector (%s)", j + 1, Rf_type2char(TYPEOF(j_val)));

    int nj = Rf_length(j_val);
    if (nj > n)
      n = nj;
  }

  // Check length of all elements
  for (int j = 0; j < m; ++j) {
    SEXP j_val = VECTOR_ELT(l_val, j);
    int nj = Rf_length(j_val);

    if (nj != 1 && nj != n)
      Rf_error("Element %i has length %i, not 1 or %i.", j + 1, nj, n);
  }

  SEXP l_names = Rf_getAttrib(l_val, R_NamesSymbol);
  int has_names = !Rf_isNull(l_names);

  const char* f_name = CHAR(Rf_asChar(f_name_));
  SEXP f = Rf_install(f_name);
  SEXP i = Rf_install("i");
  SEXP one = PROTECT(Rf_ScalarInteger(1));

  // Construct call like f(.x[[c(1, i)]], .x[[c(2, i)]], ...)
  // We construct the call backwards because can only add to the front of a
  // linked list. That makes PROTECTion tricky because we need to update it
  // each time to point to the start of the linked list.

  SEXP f_call = Rf_lang1(R_DotsSymbol);
  PROTECT_INDEX fi;
  PROTECT_WITH_INDEX(f_call, &fi);

  for (int j = m - 1; j >= 0; --j) {
    int nj = Rf_length(VECTOR_ELT(l_val, j));

    // Construct call like .l[[c(j, i)]]
    SEXP j_ = PROTECT(Rf_ScalarInteger(j + 1));
    SEXP ji_ = PROTECT(Rf_lang3(Rf_install("c"), j_, nj == 1 ? one : i));
    SEXP l_ji = PROTECT(Rf_lang3(R_Bracket2Symbol, l, ji_));

    REPROTECT(f_call = Rf_lcons(l_ji, f_call), fi);
    if (has_names && CHAR(STRING_ELT(l_names, j))[0] != '\0')
      SET_TAG(f_call, Rf_install(CHAR(STRING_ELT(l_names, j))));

    UNPROTECT(3);
  }

  REPROTECT(f_call = Rf_lcons(f, f_call), fi);

  SEXPTYPE type = Rf_str2type(CHAR(Rf_asChar(type_)));
  SEXP out = PROTECT(call_loop(env, f_call, n, type));
  copy_names(VECTOR_ELT(l_val, 0), out);

  UNPROTECT(3);
  return out;
}
