#include <stdio.h>
#include <R.h>
#include <Rinternals.h>

// [[Rcpp::export]]
SEXP hello_spreads() {
  printf("Hello Spreads!\n");
  return(R_NilValue);
}

