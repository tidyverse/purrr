#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <stdbool.h>
#include <string.h>
#include "backports.h"
#include "coerce.h"
#include "conditions.h"

static int check_input_lengths(int n, SEXP index, int i, bool strict);
static int check_double_index_finiteness(double val, SEXP index, int i, bool strict);
static int check_double_index_length(double val, int n, int i, bool strict);
static int check_character_index(SEXP string, int i, bool strict);
static int check_names(SEXP names, int i, bool strict);
static int check_offset(int offset, SEXP index_i, bool strict);
static int check_unbound_value(SEXP val, SEXP index_i, bool strict);
static int check_s4_slot(SEXP val, SEXP index_i, bool strict);
static int check_obj_length(SEXP n, bool strict);

int obj_length(SEXP x, bool strict);
SEXP obj_names(SEXP x, bool strict);


// S3 objects must implement a `length()` method in the case of a
// numeric index and a `names()` method for the character case
int find_offset(SEXP x, SEXP index, int i, bool strict) {
  int n = obj_length(x, strict);
  if (n < 0) {
    return -1;
  }

  if (check_input_lengths(n, index, i, strict)) {
    return -1;
  }

  switch (TYPEOF(index)) {
  case INTSXP:
  case REALSXP: {
    int n_protect = 0;

    double val;
    if (TYPEOF(index) == INTSXP) {
      // Coerce instead of cast to standardise missing value
      index = PROTECT(Rf_coerceVector(index, REALSXP));
      ++n_protect;
    }
    val = REAL(index)[0];

    if (check_double_index_finiteness(val, index, i, strict)) {
      goto numeric_index_error;
    }

    --val;
    if (check_double_index_length(val, n, i, strict)) {
      goto numeric_index_error;
    }

    UNPROTECT(n_protect);
    return val;

   numeric_index_error:
    UNPROTECT(n_protect);
    return -1;
  }

  case STRSXP: {
    // Protection is needed because names could be generated in the S3 case
    SEXP names = PROTECT(obj_names(x, strict));
    if (check_names(names, i, strict)) {
      UNPROTECT(1);
      return -1;
    }

    SEXP string = STRING_ELT(index, 0);
    if (check_character_index(string, i, strict)) {
      UNPROTECT(1);
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
        UNPROTECT(1);
        return j;
      }

    }
    if (strict) {
      Rf_errorcall(R_NilValue, "Can't find name `%s` in vector", val);
    } else {
      UNPROTECT(1);
      return -1;
    }
  }

  default:
    stop_bad_element_type(x, i + 1, "a character or numeric vector", "Index", NULL);
  }
}

SEXP extract_vector(SEXP x, SEXP index_i, int i, bool strict) {
  int offset = find_offset(x, index_i, i, strict);
  if (check_offset(offset, index_i, strict)) {
    return R_NilValue;
  }

  if (OBJECT(x)) {
    // We check `index_i` with `check_offset()` but pass the original
    // index rather than an offset in order to support unordered
    // vector classes
    SEXP extract_call = PROTECT(Rf_lang3(Rf_install("[["), x, index_i));
    SEXP out = Rf_eval(extract_call, R_GlobalEnv);
    UNPROTECT(1);
    return out;
  }

  switch (TYPEOF(x)) {
  case LGLSXP:  return Rf_ScalarLogical(LOGICAL(x)[offset]);
  case INTSXP:  return Rf_ScalarInteger(INTEGER(x)[offset]);
  case REALSXP: return Rf_ScalarReal(REAL(x)[offset]);
  case STRSXP:  return Rf_ScalarString(STRING_ELT(x, offset));
  case VECSXP:  return VECTOR_ELT(x, offset);
  case RAWSXP:  return Rf_ScalarRaw(RAW(x)[offset]) ;
  default:
    Rf_errorcall(R_NilValue,
      "Don't know how to index object of type %s at level %d",
      Rf_type2char(TYPEOF(x)), i + 1
    );
  }

  return R_NilValue;
}

SEXP extract_env(SEXP x, SEXP index_i, int i, bool strict) {
  if (TYPEOF(index_i) != STRSXP || Rf_length(index_i) != 1) {
    SEXP ptype = PROTECT(Rf_allocVector(STRSXP, 0));
    stop_bad_element_vector(index_i, i + 1, ptype, 1, "Index", NULL, false);
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
    SEXP ptype = PROTECT(Rf_allocVector(STRSXP, 0));
    stop_bad_element_vector(index_i, i + 1, ptype, 1, "Index", NULL, false);
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

SEXP extract_fn(SEXP x, SEXP clo) {
  SEXP expr = PROTECT(Rf_lang2(clo, x));
  SEXP out = Rf_eval(expr, R_GlobalEnv);

  UNPROTECT(1);
  return out;
}
static bool is_function(SEXP x) {
  switch (TYPEOF(x)) {
  case CLOSXP:
  case BUILTINSXP:
  case SPECIALSXP:
    return true;
  default:
    return false;
  }
}

SEXP pluck_impl(SEXP x, SEXP index, SEXP missing, SEXP strict_arg) {
  if (TYPEOF(index) != VECSXP) {
    stop_bad_type(index, "a list", NULL, "where");
  }

  PROTECT_INDEX idx;
  PROTECT_WITH_INDEX(x, &idx);

  int n = Rf_length(index);
  bool strict = Rf_asLogical(strict_arg);

  for (int i = 0; i < n; ++i) {
    SEXP index_i = VECTOR_ELT(index, i);

    if (is_function(index_i)) {
      x = extract_fn(x, index_i);
      REPROTECT(x, idx);
      continue;
    }
    // Assume all S3 objects implement the vector interface
    if (OBJECT(x) && TYPEOF(x) != S4SXP) {
      x = extract_vector(x, index_i, i, strict);
      REPROTECT(x, idx);
      continue;
    }

    switch (TYPEOF(x)) {
    case NILSXP:
      if (strict) {
        Rf_errorcall(R_NilValue, "Plucked object can't be NULL");
      }
      // Leave the indexing loop early
      goto end;
    case LGLSXP:
    case INTSXP:
    case REALSXP:
    case CPLXSXP:
    case STRSXP:
    case RAWSXP:
    case VECSXP:
    case EXPRSXP:
      x = extract_vector(x, index_i, i, strict);
      REPROTECT(x, idx);
      break;
    case ENVSXP:
      x = extract_env(x, index_i, i, strict);
      REPROTECT(x, idx);
      break;
    case S4SXP:
      x = extract_s4(x, index_i, i, strict);
      REPROTECT(x, idx);
      break;
    default:
      Rf_errorcall(R_NilValue, "Can't pluck from a %s", Rf_type2char(TYPEOF(x)));
    }

  }

 end:
  UNPROTECT(1);
  return x == R_NilValue ? missing : x;
}


/* Type checking */

static int check_input_lengths(int n, SEXP index, int i, bool strict) {
  int index_n = Rf_length(index);

  if (n == 0) {
    if (strict) {
      Rf_errorcall(R_NilValue, "Plucked object must have at least one element");
    } else {
      return -1;
    }
  }

  if (index_n > 1 || (strict && index_n == 0)) {
    stop_bad_element_length(index, i + 1, 1, "Index", NULL, false);
  }

  return 0;
}

static int check_double_index_finiteness(double val, SEXP index, int i, bool strict) {
  if (R_finite(val)) {
    return 0;
  }

  if (strict) {
    Rf_errorcall(R_NilValue,
                 "Index %d must be finite, not %s",
                 i + 1,
                 Rf_translateCharUTF8(Rf_asChar(index)));
  } else {
    return -1;
  }
}

static int check_double_index_length(double val, int n, int i, bool strict) {
  if (val < 0) {
    if (strict) {
      Rf_errorcall(R_NilValue,
                   "Index %d must be greater than 0, not %.0f",
                   i + 1,
                   val + 1);
    } else {
      return -1;
    }
  } else if (val >= n) {
    if (strict) {
      Rf_errorcall(R_NilValue,
                   "Index %d exceeds the length of plucked object (%.0f > %d)",
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
      Rf_errorcall(R_NilValue, "Index %d can't be NA", i + 1);
    } else {
      return -1;
    }
  }

  // "" matches nothing
  const char* val = CHAR(string);
  if (val[0] == '\0') {
    if (strict) {
      Rf_errorcall(R_NilValue, "Index %d can't be an empty string (\"\")", i + 1);
    } else {
      return -1;
    }
  }

  return 0;
}

static int check_names(SEXP names, int i, bool strict) {
  if (TYPEOF(names) == STRSXP) {
    return 0;
  }

  if (strict) {
    Rf_errorcall(R_NilValue, "Index %d is attempting to pluck from an unnamed vector using a string name", i + 1);
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
                 "Can't find index `%s` in vector",
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
                 "Can't find object `%s` in environment",
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

static int check_obj_length(SEXP n, bool strict) {
  if (TYPEOF(n) != INTSXP || Rf_length(n) != 1) {
    if (strict) {
      Rf_errorcall(R_NilValue, "Length of S3 object must be a scalar integer");
    } else {
      return -1;
    }
  }

  return 0;
}


int obj_length(SEXP x, bool strict) {
  if (!OBJECT(x)) {
    return Rf_length(x);
  }

  SEXP length_call = PROTECT(Rf_lang2(Rf_install("length"), x));
  SEXP n = PROTECT(Rf_eval(length_call, R_GlobalEnv));

  if (check_obj_length(n, strict)) {
    UNPROTECT(2);
    return -1;
  }

  UNPROTECT(2);
  return INTEGER(n)[0];
}

SEXP obj_names(SEXP x, bool strict) {
  if (!OBJECT(x)) {
    return Rf_getAttrib(x, R_NamesSymbol);
  }

  SEXP names_call = PROTECT(Rf_lang2(Rf_install("names"), x));
  SEXP names = Rf_eval(names_call, R_GlobalEnv);

  UNPROTECT(1);
  return names;
}
