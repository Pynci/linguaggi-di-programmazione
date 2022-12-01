/* -*- Mode: C -*- */

#ifndef MATRICI_I
#define MATRICI_I

#include <stdio.h>
#include <stdlib.h>
#include "matrici.h"

Matrice crea_matrice(int numeroRighe, int numeroColonne){

  /*
    utilizzo malloc per allocare la memoria necessaria a contenere
    la struttura da creare.
    malloc ritorna un puntatore a void (un puntatore grezzo, un indirizzo di memoria).
    Ho bisogno quindi un cast per interpretare il puntatore come puntatore ad
    una matrice
  */
  Matrice nuova_matrice = (Matrice) malloc(sizeof(struct _matrice));

  // indici righe e colonne
  int r = 0;
  int c = 0;
  
  // ricorda: -> dereferenzia e accede al campo (dot notation)
  //             equivale a: (*nuova_matrice).numeroRighe = numeroRighe;
  nuova_matrice -> numeroRighe = numeroRighe;
  nuova_matrice -> numeroColonne = numeroColonne;

  // istanzio la matrice
  nuova_matrice -> matrice = (float**) malloc(sizeof(float*) * numeroRighe);
  for(r = 0; r < numeroRighe; r++){
    nuova_matrice -> matrice[r] = (float *) malloc(sizeof(float) * numeroColonne);
  }

  // inizializzo la matrice
  for(r = 0; r < numeroRighe; r++){
    for(c = 0; c < numeroColonne; c++){
      nuova_matrice -> matrice[r][c] = 0.0;
    }
  }
  
  return nuova_matrice;
  
}

// stampa della matrice su file
void stampaFile_matrice(FILE* out, Matrice m){

  // indici di riga e colonna
  int r = 0;
  int c = 0;

  // %6f limita il numero i decimali dopo la virgola a 6
  for(r = 0; r < m -> numeroRighe; r++){
    fprintf(out, "[");
    for(c = 0; c < m -> numeroColonne; c++){
      fprintf(out, " %6f", m -> matrice[r][c]);
    }
    fprintf(out, " ]\n");
  }
  
}

// stampa della matrice
void stampa_matrice(Matrice m){
  stampaFile_matrice(stdout, m);
}


/* API */

// ritorna una matrice riempita di zeri
Matrice matrice_zero(int r, int c){
  return crea_matrice(r, c);
}

// ritorna la matrice identità nxn
Matrice matrice_id(int n){

  Matrice identita = crea_matrice(n, n);
  int i = 0;

  for(i = 0; i < n; i++){
    identita -> matrice[i][i] = 1.0;
  }

  return identita;
}

int matrice_numeroRighe(Matrice m){
  return m -> numeroRighe;
}

int matrice_numeroColonne(Matrice m){
  return m -> numeroColonne;
}

// ritorna l'elemento della matrice indicato da r e c
float matrice_get(Matrice m, int r, int c){
  return m -> matrice[r][c];
}

// cambia un elemento e ritorna la matrice
// ritorna float perché il valore dell'assegnamento dipende dal valore di ciò che assegno
float matrice_set(Matrice m, int r, int c, float x){
  return m -> matrice[r][c] = x;
}

// alloca e ritorna una nuova matrice contenente la somma delle due matrici
Matrice matrice_somma(Matrice A, Matrice B){
  
}

Matrice matrice_prodotto(Matrice A, Matrice B){
  
}

Matrice matrice_trasposta(Matrice M){
  
}

#endif //MATRICI_I
