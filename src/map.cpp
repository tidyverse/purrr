#include <Rcpp.h>
using namespace Rcpp;


bool is_vector(RObject x) {
  switch(TYPEOF(x)) {
  case LGLSXP:
  case INTSXP:
  case REALSXP:
  case CPLXSXP:
  case STRSXP:
  case RAWSXP:
  case VECSXP:
    return true;
  default:
    return false;
  }
}

SEXP inline make_symbol(std::string x) {
  return Rf_install(x.c_str());
}
SEXP inline make_call(SEXP x1) {
  return Rf_lcons(x1, R_NilValue);
}
SEXP inline make_call(SEXP x1, SEXP x2) {
  Shield<SEXP> tmp(make_call(x2));
  return Rf_lcons(x1, tmp);
}
SEXP inline make_call(SEXP x1, SEXP x2, SEXP x3) {
  Shield<SEXP> tmp(make_call(x2, x3));
  return Rf_lcons(x1, tmp);
}
SEXP inline make_call(SEXP x1, SEXP x2, SEXP x3, SEXP x4) {
  Shield<SEXP> tmp(make_call(x2, x3, x4));
  return Rf_lcons(x1, tmp);
}

SEXP call_loop(Environment env, SEXP call, int n) {
  List out(n);
  for (int i = 0; i < n; ++i) {
    env.assign("i", i + 1);
    out[i] = Rf_eval(call, env);
  }

  return out;
}

// [[Rcpp::export]]
SEXP map_impl(Environment env, std::string x_name, std::string f_name) {
  RObject x(env.get(x_name));
  if (!is_vector(x))
    stop("`.x` is not a vector");
  int n = Rf_length(x);

  // Constructs a call like f(x[[i]], ...) - don't want to substitute
  // actual values for f or x, because they may be long, which creates
  // bad tracebacks()
  Shield<SEXP>
    Xi(make_call(R_Bracket2Symbol, make_symbol(x_name), make_symbol("i"))),
    f_call(make_call(make_symbol(f_name), Xi, R_DotsSymbol));

  List out(call_loop(env, f_call, n));
  if (x.hasAttribute("names"))
    out.attr("names") = x.attr("names");

  return out;
}

// [[Rcpp::export]]
SEXP map2_impl(Environment env, std::string x_name, std::string y_name,
               std::string f_name) {
  RObject x(env.get(x_name)), y(env.get(y_name));

  if (!is_vector(x))
    stop("`.x` is not a vector (%s)", Rf_type2char(TYPEOF(x)));
  if (!is_vector(y))
    stop("`.y` is not a vector (%s)", Rf_type2char(TYPEOF(x)));
  if (Rf_length(x) != Rf_length(y) && Rf_length(x) != 1 && Rf_length(y) != 1) {
    stop("`.x` and `.y` are different lengths");
  }

  int nx = Rf_length(x), ny = Rf_length(y);
  int n = std::max(nx, ny);

  Shield<SEXP>
    i(make_symbol("i")),
    one(Rf_ScalarInteger(1)),
    Xi(make_call(R_Bracket2Symbol, make_symbol(x_name), nx == 1 ? one : i)),
    Yi(make_call(R_Bracket2Symbol, make_symbol(y_name), ny == 1 ? one : i)),
    f_call(make_call(make_symbol(f_name), Xi, Yi, R_DotsSymbol));

  List out(call_loop(env, f_call, n));
  if (x.hasAttribute("names")) {
    out.attr("names") = x.attr("names");
  } else if (y.hasAttribute("names")) {
    out.attr("names") = y.attr("names");
  }

  return out;
}

