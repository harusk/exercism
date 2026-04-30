#include "collatz_conjecture.h"

int steps(int start) {
    int current_value = start;
    int steps = 0;

    if(current_value <= 0)
        return -1;

    while(current_value > 1) {
        if(current_value % 2 == 0)
            current_value /= 2;
        else
            current_value = (current_value * 3) + 1;
    
        steps++;
    }
    return steps;
}
