/* -*- Mode: C -*- */

#ifndef MATRICI_TEST_I
#define MATRICI_TEST_I

#include <stdio.h>
#include <stdlib.h>
#include "matrici.h"

int main(){
  Matrice m44 = crea_matrice(4, 4);
  Matrice z33 = matrice_zero(3, 2);
  Matrice id5 = matrice_id(5);

  printf("\n >>> La matrice è:\n");
  stampa_matrice(m44);

  printf("\n >>> La matrice di zeri è:\n");
  stampa_matrice(z33);
  
  printf("\n >>> La matrice identità è:\n");
  stampa_matrice(id5);
  
}

#endif //MATRICI_TEST_I

