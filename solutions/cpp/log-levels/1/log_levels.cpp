#include <string>

namespace log_line {
std::string message(std::string line) {
    const size_t n = line.find(" ");
    return line.substr(n+1);
}

std::string log_level(std::string line) {
    const size_t n = line.find("]") - 1;
    return line.substr(1, n);
}

std::string reformat(std::string line) {
    std::string msg{message(line)};
    std::string level{log_level(line)};
    std::string new_format{msg + " (" + level + ")"};
    return new_format;
}
}  // namespace log_line
