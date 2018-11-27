#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <stdbool.h>
#include "coerce.h"
#include "backports.h"
#include <string.h>

static int check_input_lengths(int n, int index_n, int i, bool strict) {
  if (n == 0) {
    if (strict) {
      Rf_errorcall(R_NilValue, "Plucked object must have at least one element.");
    } else {
      return -1;
    }
  }

  if (index_n > 1) {
    Rf_errorcall(R_NilValue, "Index %i must have length 1, not %i.", i + 1, n);
  } else if (strict && index_n == 0) {
    Rf_errorcall(R_NilValue, "Index %i must have length 1, not 0", i + 1);
  }

  return 0;
}

static int check_int_index_finiteness(int val, int i, bool strict) {
  if (val != NA_INTEGER) {
    return 0;
  }

  if (strict) {
    Rf_errorcall(R_NilValue, "Index %i must be finite, not NA.", i + 1);
  } else {
    return -1;
  }
}
static int check_double_index_finiteness(double val, SEXP index, int i, bool strict) {
  if (R_finite(val)) {
    return 0;
  }

  if (strict) {
    Rf_errorcall(R_NilValue,
                 "Index %i must be finite, not %s.",
                 i + 1,
                 Rf_translateCharUTF8(Rf_asChar(index)));
  } else {
    return -1;
  }
}

static int check_int_index_length(int val, int n, int i, bool strict) {
  if (val < 0) {
    if (strict) {
      Rf_errorcall(R_NilValue,
                   "Index %i must be greater than 0, not %i.",
                   i + 1,
                   val + 1);
    } else {
      return -1;
    }
  } else if (val >= n) {
    if (strict) {
      Rf_errorcall(R_NilValue,
                   "Index %i exceeds the length of plucked object (%i > %i).",
                   i + 1,
                   val + 1,
                   n);
    } else {
      return -1;
    }
  }

  return 0;
}
static int check_double_index_length(double val, int n, int i, bool strict) {
  if (val < 0) {
    if (strict) {
      Rf_errorcall(R_NilValue,
                   "Index %i must be greater than 0, not %.0f.",
                   i + 1,
                   val + 1);
    } else {
      return -1;
    }
  } else if (val >= n) {
    if (strict) {
      Rf_errorcall(R_NilValue,
                   "Index %i exceeds the length of plucked object (%.0f > %i).",
                   i + 1,
                   val + 1,
                   n);
    } else {
      return -1;
    }
  }

  return 0;
}

static int check_character_index(SEXP string, int i, bool strict) {
  if (string == NA_STRING) {
    if (strict) {
      Rf_errorcall(R_NilValue, "Index %i can't be NA.", i + 1);
    } else {
      return -1;
    }
  }

  // "" matches nothing
  const char* val = CHAR(string);
  if (val[0] == '\0') {
    if (strict) {
      Rf_errorcall(R_NilValue, "Index %i can't be an empty string (\"\").", i + 1);
    } else {
      return -1;
    }
  }

  return 0;
}

static int check_names(SEXP names, int i, bool strict) {
  if (names != R_NilValue) {
    return 0;
  }

  if (strict) {
    Rf_errorcall(R_NilValue, "Index %i is attempting to pluck from an unnamed vector using a string name.", i + 1);
  } else {
    return -1;
  }
}

static int check_offset(int offset, SEXP index_i, bool strict) {
  if (offset >= 0) {
    return 0;
  }

  if (strict) {
    Rf_errorcall(R_NilValue,
                 "Can't find index `%s` in vector.",
                 Rf_translateCharUTF8(Rf_asChar(index_i)));
  } else {
    return -1;
  }
}

static int check_unbound_value(SEXP val, SEXP index_i, bool strict) {
  if (val != R_UnboundValue) {
    return 0;
  }

  if (strict) {
    Rf_errorcall(R_NilValue,
                 "Can't find object `%s` in environment.",
                 Rf_translateCharUTF8(Rf_asChar(index_i)));
  } else {
    return -1;
  }
}

static int check_s4_slot(SEXP val, SEXP index_i, bool strict) {
  if (R_has_slot(val, index_i)) {
    return 0;
  }

  if (strict) {
    Rf_errorcall(R_NilValue,
                 "Can't find slot `%s`.",
                 Rf_translateCharUTF8(Rf_asChar(index_i)));
  } else {
    return -1;
  }
}

int find_offset(SEXP x, SEXP index, int i, bool strict) {
  int n = Rf_length(x);
  if (check_input_lengths(n, Rf_length(index), i, strict)) {
    return -1;
  }

  if (TYPEOF(index) == INTSXP) {
    int val = INTEGER(index)[0];
    if (check_int_index_finiteness(val, i, strict)) {
      return -1;
    }

    --val;
    if (check_int_index_length(val, n, i, strict)) {
      return -1;
    }

    return val;
  } if (TYPEOF(index) == REALSXP) {
    double val = REAL(index)[0];
    if (check_double_index_finiteness(val, index, i, strict)) {
      return -1;
    }

    --val;
    if (check_double_index_length(val, n, i, strict)) {
      return -1;
    }

    return val;
  } else if (TYPEOF(index) == STRSXP) {
    SEXP names = Rf_getAttrib(x, R_NamesSymbol);
    if (check_names(names, i, strict)) {
      return -1;
    }

    SEXP string = STRING_ELT(index, 0);
    if (check_character_index(string, i, strict)) {
      return -1;
    }

    const char* val = Rf_translateCharUTF8(string);
    int n_names = Rf_length(names);

    for (int j = 0; j < n_names; ++j) {
      if (STRING_ELT(names, j) == NA_STRING) {
        continue;
      }

      const char* names_j = Rf_translateCharUTF8(STRING_ELT(names, j));
      if (strcmp(names_j, val) == 0) {
        return j;
      }

    }
    if (strict) {
      Rf_errorcall(R_NilValue, "Can't find name `%s` in vector.", val);
    } else {
      return -1;
    }
  } else {
    Rf_errorcall(R_NilValue, "Index %i must be a character or numeric vector.", i + 1);
  }
}

SEXP extract_vector(SEXP x, SEXP index_i, int i, bool strict) {
  int offset = find_offset(x, index_i, i, strict);
  if (check_offset(offset, index_i, strict)) {
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

SEXP extract_env(SEXP x, SEXP index_i, int i, bool strict) {
  if (TYPEOF(index_i) != STRSXP || Rf_length(index_i) != 1) {
    Rf_errorcall(R_NilValue, "Index %i must be a string.", i + 1);
  }

  SEXP index = STRING_ELT(index_i, 0);
  if (check_character_index(index, i, strict)) {
    return R_NilValue;
  }

  SEXP sym = Rf_installChar(index);
  SEXP out = Rf_findVarInFrame3(x, sym, TRUE);

  if (check_unbound_value(out, index_i, strict)) {
    return R_NilValue;
  }

  return out;
}

SEXP extract_s4(SEXP x, SEXP index_i, int i, bool strict) {
  if (TYPEOF(index_i) != STRSXP || Rf_length(index_i) != 1) {
    Rf_errorcall(R_NilValue, "Index %i must be a string.", i + 1);
  }

  SEXP index = STRING_ELT(index_i, 0);
  if (check_character_index(index, i, strict)) {
    return R_NilValue;
  }

  if (check_s4_slot(x, index_i, strict)) {
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

SEXP pluck_impl(SEXP x, SEXP index, SEXP missing, SEXP strict_arg) {
  if (TYPEOF(index) != VECSXP) {
    Rf_errorcall(R_NilValue, "`index` must be a list (not a %s)",
      Rf_type2char(TYPEOF(index)));
  }

  int n = Rf_length(index);
  bool strict = Rf_asLogical(strict_arg);

  for (int i = 0; i < n; ++i) {
    SEXP index_i = VECTOR_ELT(index, i);

    if (TYPEOF(index_i) == CLOSXP) {
      x = extract_clo(x, index_i);
    } else {
      switch (TYPEOF(x)) {
      case NILSXP:
        if (strict) {
          Rf_errorcall(R_NilValue, "Plucked object can't be NULL.");
        } else {
          return missing;
        }
      case LGLSXP:
      case INTSXP:
      case REALSXP:
      case CPLXSXP:
      case STRSXP:
      case RAWSXP:
      case VECSXP:
      case EXPRSXP:
        x = extract_vector(x, index_i, i, strict);
        break;
      case ENVSXP:
        x = extract_env(x, index_i, i, strict);
        break;
      case S4SXP:
        x = extract_s4(x, index_i, i, strict);
        break;
      default:
        Rf_errorcall(R_NilValue, "Can't pluck from a %s", Rf_type2char(TYPEOF(x)));
      }
    }

  }

  return (Rf_length(x) == 0) ? missing : x;
}
