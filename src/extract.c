#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include "coerce.h"
#include "backports.h"
#include <string.h>

int find_offset(SEXP x, SEXP index, int i, int strict) {
  if (Rf_length(index) > 1) {
    Rf_errorcall(R_NilValue,
      "Index %i must have length 1, not %i.",
      i + 1,
      Rf_length(index)
    );
  } else if (strict && Rf_length(index) == 0) {
    Rf_errorcall(R_NilValue, "Index %i must have length 1, not 0", i + 1);
  }

  int n = Rf_length(x);
  if (n == 0) {
    if (strict)
      Rf_errorcall(R_NilValue, "Object being plucked must have at least one element.");
    else
      return -1;
  }

  if (TYPEOF(index) == INTSXP) {
    int val = INTEGER(index)[0];

    if (val == NA_INTEGER) {
      if (strict)
        Rf_errorcall(R_NilValue,
          "Index %i must be finite, not NA.",
          i + 1
        );
      else
        return -1;
    }

    val--;
    if (val < 0) {
      if (strict)
        Rf_errorcall(R_NilValue,
          "Index %i must be greater than 0, not %i.",
          i + 1,
          val + 1
        );
      else
        return -1;
    } else if (val >= n) {
      if (strict)
        Rf_errorcall(R_NilValue,
          "Index %i exceeds the length of object being plucked (%i > %i).",
          i + 1,
          val + 1,
          n
        );
      else
        return -1;
    }

    return val;
  } if (TYPEOF(index) == REALSXP) {
    double val = REAL(index)[0];

    if (!R_finite(val)) {
      if (strict)
        Rf_errorcall(R_NilValue,
          "Index %i must be finite, not %s.",
          i + 1,
          Rf_translateCharUTF8(Rf_asChar(index))
        );
      else
        return -1;
    }

    val--;
    if (val < 0) {
      if (strict)
        Rf_errorcall(R_NilValue,
          "Index %i must be greater than 0, not %.0f.",
          i + 1,
          val + 1
        );
      else
        return -1;
    } else if (val >= n) {
      if (strict)
        Rf_errorcall(R_NilValue,
          "Index %i exceeds the length of object being plucked (%.0f > %i).",
          i + 1,
          val + 1,
          n
        );
      else
        return -1;
    }

    return val;
  } else if (TYPEOF(index) == STRSXP) {
    SEXP names = Rf_getAttrib(x, R_NamesSymbol);
    if (names == R_NilValue) { // vector doesn't have names
      if (strict)
        Rf_errorcall(R_NilValue, "Index %i is attempting to pluck from an unnamed vector using a string name.", i + 1);
      else
        return -1;
    }

    if (STRING_ELT(index, 0) == NA_STRING) {
      if (strict)
        Rf_errorcall(R_NilValue,
          "Index %i must be finite, not NA.",
          i + 1
        );
      else
        return -1;
    }

    const char* val = Rf_translateCharUTF8(STRING_ELT(index, 0));
    if (val[0] == '\0') { // "" matches nothing
      if (strict)
        Rf_errorcall(R_NilValue, "Index %i must not be an empty string (\"\").", i + 1);
      else
        return -1;
    }

    for (int j = 0; j < Rf_length(names); ++j) {
      if (STRING_ELT(names, j) == NA_STRING)
        continue;

      const char* names_j = Rf_translateCharUTF8(STRING_ELT(names, j));
      if (strcmp(names_j, val) == 0)
        return j;

    }
    if (strict)
      Rf_errorcall(R_NilValue, "Can't find name '%s' in vector.", val);
    else
      return -1;
  } else {
    Rf_errorcall(
      R_NilValue,
      "Index %i must be a character or numeric vector.", i + 1
    );
  }
}

SEXP extract_vector(SEXP x, SEXP index_i, int i, int strict) {
  int offset = find_offset(x, index_i, i, strict);
  if (offset < 0) {
    if (strict)
      Rf_errorcall(R_NilValue,
        "Can't find index '%s' in vector.",
        Rf_translateCharUTF8(Rf_asChar(index_i))
      );
    else
      return R_NilValue;
  }

  switch(TYPEOF(x)) {
  case LGLSXP:  return Rf_ScalarLogical(LOGICAL(x)[offset]);
  case INTSXP:  return Rf_ScalarInteger(INTEGER(x)[offset]);
  case REALSXP: return Rf_ScalarReal(REAL(x)[offset]);
  case STRSXP:  return Rf_ScalarString(STRING_ELT(x, offset));
  case VECSXP:  return VECTOR_ELT(x, offset);
  case RAWSXP:  return Rf_ScalarRaw(RAW(x)[offset]) ;
  default:
    Rf_errorcall(R_NilValue,
      "Don't know how to index object of type %s at level %i",
      Rf_type2char(TYPEOF(x)), i + 1
    );
  }

  return R_NilValue;
}

SEXP extract_env(SEXP x, SEXP index_i, int i, int strict) {
  if (TYPEOF(index_i) != STRSXP || Rf_length(index_i) != 1) {
    Rf_errorcall(R_NilValue, "Index %i must be a string.", i + 1);
  }

  SEXP index = STRING_ELT(index_i, 0);
  if (index == NA_STRING) {
    if (strict)
      Rf_errorcall(R_NilValue, "Index %i must not be NA.", i + 1);
    else
      return R_NilValue;
  }

  SEXP sym = Rf_installChar(index);
  SEXP out = Rf_findVarInFrame3(x, sym, TRUE);

  if (out == R_UnboundValue) {
    if (strict)
      Rf_errorcall(R_NilValue,
        "Can't find object '%s' in environment.",
        Rf_translateCharUTF8(Rf_asChar(index_i))
      );
    else
      return R_NilValue;
  }

  return out;
}

SEXP extract_s4(SEXP x, SEXP index_i, int i, int strict) {
  if (TYPEOF(index_i) != STRSXP || Rf_length(index_i) != 1) {
    Rf_errorcall(R_NilValue, "Index %i must be a string.", i + 1);
  }

  SEXP index = STRING_ELT(index_i, 0);
  if (index == NA_STRING) {
    if (strict)
      Rf_errorcall(R_NilValue, "Index %i must not be NA.", i + 1);
    else
      return R_NilValue;
  }

  if (!R_has_slot(x, index_i)) {
    if (strict)
      Rf_errorcall(R_NilValue,
        "Can't find slot '%s'.",
        Rf_translateCharUTF8(Rf_asChar(index_i))
      );
    else
      return R_NilValue;
  }

  SEXP sym = Rf_installChar(index);

  return Rf_getAttrib(x, sym);
}

SEXP extract_clo(SEXP x, SEXP clo) {
  SEXP expr = PROTECT(Rf_lang2(clo, x));
  SEXP out = Rf_eval(expr, R_EmptyEnv);

  UNPROTECT(1);
  return out;
}

SEXP extract_impl(SEXP x, SEXP index, SEXP missing, SEXP strict_arg) {
  if (TYPEOF(index) != VECSXP) {
    Rf_errorcall(R_NilValue, "`index` must be a list (not a %s)",
      Rf_type2char(TYPEOF(index)));
  }

  int n = Rf_length(index);
  int strict = Rf_asLogical(strict_arg);

  for (int i = 0; i < n; ++i) {
    SEXP index_i = VECTOR_ELT(index, i);

    if (TYPEOF(index_i) == CLOSXP) {
      x = extract_clo(x, index_i);
    } else {
      if (Rf_isNull(x)) {
        if (strict)
          Rf_errorcall(R_NilValue, "Object being plucked must not be NULL.");
        else
          return missing;
      } else if (Rf_isVector(x)) {
        x = extract_vector(x, index_i, i, strict);
      } else if (Rf_isEnvironment(x)) {
        x = extract_env(x, index_i, i, strict);
      } else if (Rf_isS4(x)) {
        x = extract_s4(x, index_i, i, strict);
      } else {
        Rf_errorcall(R_NilValue,
          "Don't know how to pluck from a %s", Rf_type2char(TYPEOF(x))
        );
      }
    }

  }

  return (Rf_length(x) == 0) ? missing : x;
}

