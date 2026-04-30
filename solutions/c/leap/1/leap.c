#include "leap.h"

bool leap_year(int year) {
    bool result = false;
    if (year % 4 == 0) {
        result = true;
        if (year % 100 == 0) {
            if (year % 400 == 0)
                result = true;
            else
                result = false;
        }
    }
    return result;
}
