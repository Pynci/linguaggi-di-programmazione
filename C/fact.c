/* -*- Mode: C -*- */

#include <stdio.h>

int fact(int n) { return n == 0 ? 1 : n * fact(n-1); }

int factstd(int n){
  if (n == 0)
    return 1;
  else
    return n * factstd(n - 1);
}

int main(){
  int i = 0;

  printf("il fattoriale di 5 è %d\n", fact(5));

  for(i = 0; i < 43; i++){
    printf("fact(%d)\t= %d\n", i, factstd(i));
  }
}
