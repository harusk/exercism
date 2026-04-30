#include "raindrops.h"

namespace raindrops {

    std::string convert(int number) {
        std::string drops{""};
        bool not_divisible{true};
        if(number % 3 == 0) {
            not_divisible = false;
            drops.append("Pling");
        }
        if (number % 5 == 0) {
            not_divisible = false;
            drops.append("Plang");
        }
        if (number % 7 == 0) {
            not_divisible = false;
            drops.append("Plong");
        }
        if (not_divisible) {
            drops.append(std::to_string(number));
        }

        return drops;
    }

}  // namespace raindrops
