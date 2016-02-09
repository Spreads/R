#include <stdio.h>
#include <R.h>
#include <Rinternals.h>

// [[Rcpp::export]]
SEXP spreads_welcome() {
  printf("Data Spreads!\nWelcome to Series and Panels for Real-time and Exploratory Analysis of Data Streams.\n");
  return(R_NilValue);
}

