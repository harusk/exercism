#include "difference_of_squares.h"
#include <math.h>

unsigned int sum_of_squares(unsigned int number) {  
    unsigned int square, sum = 0;
    unsigned int natural_number = 1;
    
    for(; natural_number < (number + 1); natural_number++) {
        square = pow(natural_number, 2);
        sum += square;
    }
    return sum;
}

unsigned int square_of_sum(unsigned int number) {
    unsigned int sum = 0;
    unsigned int natural_number = 1;
    
    for(; natural_number < (number + 1); natural_number++) {
        sum += natural_number;
    }
    return pow(sum,2);
}

unsigned int difference_of_squares(unsigned int number) {
    return square_of_sum(number) - sum_of_squares(number);
}
