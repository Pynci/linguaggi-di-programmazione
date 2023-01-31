#include <stdlib.h>

int main(){
    // puntatore costante a carattere costante
    const char* const puntCostanteCharCostante;
    char* puntChar = 'd';
    const char* p;  //carattere costante (puntatore variabile)
    p = puntChar;   //corretto
    //*p = 'c';       //errore

    //puntCostanteCharCostante = puntChar;    // ERRORE!
    //*puntCostanteCharCostante = 'c';        // ERRORE!
}