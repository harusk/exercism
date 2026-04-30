#include "acronym.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

char *abbreviate(const char *phrase) {
    if(phrase == NULL) {
        return NULL;
    }
    size_t phrase_len = strlen(phrase);
    if(phrase_len == 0) {
        return NULL;
    }
    size_t output_len = 0;
    for(size_t i = 0; i < phrase_len; i++) {
        if(*(phrase+i) == ' ' || *(phrase+i) == '-' || *(phrase+i) == '_') {
            output_len++;
        }
    }
    char *output = (char *)calloc(output_len+1, sizeof(char));
    size_t j = 0;
    for(size_t i = 0; i < phrase_len; i++) {
        if(i == 0) {
            output[j] = *phrase;
            j++;
        } else {
            if(*(phrase+i) == ' ') {
                if(*(phrase+i+1) != '-' && *(phrase+i+1) != '_') {
                    output[j] = toupper(*(phrase+i+1));
                    j++;
                }
            } else {
                if((*(phrase+i) == '-' || *(phrase+i) == '_') && *(phrase+i+1) != ' ') {
                    output[j] = toupper(*(phrase+i+1));
                    j++;
                }
            }
        }
    }
    return output;
}
