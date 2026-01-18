#ifndef PURRR_PROGRESS_H
#define PURRR_PROGRESS_H

SEXP make_progress_bar(int n, SEXP progress);
void set_progress(SEXP bar, int i);

#endif