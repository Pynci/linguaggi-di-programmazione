/* -*- Mode: C -*- */

/* matrici.h
 * File header per una piccola libreria che implementa il prodotto tra matrici
 */

#ifndef MATRICI_H
#define MATRICI_H

#include <stdio.h>

//creo una struttura per contenere le informazioni delle matrici
struct _matrice {
  int numeroRighe;
  int numeroColonne;

  // dichiaro così perché non conosco il numero di righe/colonne, arriva a runtime
  // lo dichiaro come array di puntatori a puntatori (array di array)
  float ** matrice;
};


// definisco un puntatore alla struttura (nota la maiuscola)
// typedef dice: il tipo di dato "struct matrice*" avrà nome "Matrice"
typedef struct _matrice* Matrice;

// creo il costruttore per la matrice
extern Matrice crea_matrice(int, int);

// stampa della matrice
extern void stampa_matrice(Matrice);

// genera una matrice di zeri
extern Matrice matrice_zero(int, int);

// ritorna la matrice identità nxn
extern Matrice matrice_id(int);

// ritorna righe e colonne
extern int matrice_numeroRighe(Matrice);
extern int matrice_numeroColonne(Matrice);

// getter e setter
extern float matrice_get(Matrice, int, int);
extern float matrice_set(Matrice, int, int, float);

// OPERAZIONI TRA MATRICI
extern Matrice matrice_somma(Matrice, Matrice);
extern Matrice matrice_prodotto(Matrice, Matrice);
extern Matrice matrice_trasposta(Matrice, Matrice);

#endif //MATRICI_H
