#include "resistor_color.h"
#include <stdlib.h>

int color_code(int color) { 
    resistor_band_t band_number_color;
    switch(color) {
        case BLACK:
            band_number_color = BLACK;
            break;
        case BROWN:
            band_number_color = BROWN;
            break;
        case RED:
            band_number_color = RED;
            break;
        case ORANGE:
            band_number_color = ORANGE;
            break;
        case YELLOW:
            band_number_color = YELLOW;
            break;
        case GREEN:
            band_number_color = GREEN;
            break;
        case BLUE:
            band_number_color = BLUE;
            break;
        case VIOLET:
            band_number_color = VIOLET;
            break;
        case GREY:
            band_number_color = GREY;
            break;
        case WHITE:
            band_number_color = WHITE;
            break;
    }
    return band_number_color;
}

resistor_band_t *colors() {
    resistor_band_t* all_colors = (resistor_band_t*)malloc(10 * sizeof(resistor_band_t));

    for (int i = 0; i < 10; i++) {
        all_colors[i] = i;
    }
    
    return all_colors;
}