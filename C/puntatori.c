#include <stdlib.h>

int main() {
    char* p;                        //puntatore a carattere
    char s[] = "Ford Prefect";      //array di caratteri

    const char* pc = s;             //puntatore ad array di caratteri costanti
    pc = p;

    char* const cp = s;             //puntatore costante ad array di caratteri
    cp[3] = 'Y';

    const char* const cpc = s;      //puntatore costante ad array di caratteri costanti
}