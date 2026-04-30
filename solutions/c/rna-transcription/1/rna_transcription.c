#include "rna_transcription.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *to_rna(const char *dna) {
    size_t dna_len = strlen(dna);
    char *rna = (char *)calloc(dna_len+1, sizeof(char));
    for(size_t i = 0; i < dna_len; i++)
    {
        switch(*dna++) {
            case 'G':
                rna[i] = 'C';
                break;
            case 'C':
                rna[i] = 'G';
                break;
            case 'T':
                rna[i] = 'A';
                break;
            case 'A':
                rna[i] = 'U';
                break;
        }
    }
    return rna;
}
