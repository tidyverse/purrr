#include <Rcpp.h>
using namespace Rcpp;


bool is_vector(RObject x) {
  switch(TYPEOF(x)) {
  case LGLSXP:
  case INTSXP:
  case REALSXP:
  case CPLXSXP:
  case CHARSXP:
  case VECSXP:
    return true;
  default:
    return false;
  }
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
    X(Rf_install(x_name.c_str())),
    f(Rf_install(f_name.c_str())),
    i(Rf_install("i")),
    Xi(Rf_lcons(R_Bracket2Symbol, Rf_lcons(X, Rf_lcons(i, R_NilValue)))),
    f_call(Rf_lcons(f, Rf_lcons(Xi, Rf_lcons(R_DotsSymbol, R_NilValue))));

  List out(n);
  for (int i = 0; i < n; ++i) {
    env.assign("i", i + 1);
    out[i] = Rf_eval(f_call, env);
  }
  if (x.hasAttribute("names"))
    out.attr("names") = x.attr("names");

  return out;
}

