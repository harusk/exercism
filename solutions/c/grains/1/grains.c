#include "grains.h"
#include <math.h>

uint64_t square(uint8_t index) {
    return pow(2, index - 1);
}

uint64_t total() {
    uint64_t sum_squares = 0;
    for(uint8_t index = 1;index <= 64; index++) {
        sum_squares += square(index);
    }
    return sum_squares;
}
