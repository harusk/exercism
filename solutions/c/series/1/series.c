#include "series.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

slices_t slices(char *input_text, unsigned int substring_length) {
    slices_t slice1;
    if(substring_length == 0) {
        slice1.substring_count = 0;
        slice1.substring = malloc(sizeof(char *));
        slice1.substring[0] = malloc(strlen("") + 1);
        strcpy(slice1.substring[0], "");
        return slice1;
    }
    char *p1 = input_text;
    unsigned int i;
    unsigned int j;
    unsigned int len = (unsigned int)strlen(input_text);
    slice1.substring_count = 0;
    int counter = 0;
    int arr_size = 1;
    slice1.substring = malloc(arr_size * sizeof(char *));
    for(i = 0; i < len; i++)
    {
        char *substring = (char *)malloc(substring_length * sizeof(char));
        for(j = 0; j < substring_length; j++) {
            char element = *(p1+i+j);
            if(element == '\0'){
                free(substring);
                substring = NULL;
                break;
            }
            *(substring+j) = element;
        }
        if(substring != NULL) {
            slice1.substring[counter] = malloc(strlen(substring) + 1);
            strcpy(slice1.substring[counter], substring);
            char **tmp = realloc(slice1.substring, (arr_size+1) * sizeof(char *));
            if(tmp != NULL) {
                slice1.substring = tmp;
            }
            counter++;
            arr_size++;
        }
    }
    slice1.substring_count = counter;
    return slice1;
}
