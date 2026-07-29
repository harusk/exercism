#include <string>

namespace log_line {
    std::string message(std::string line) {
        std::string::size_type n = line.find(":") + 2;
        std::string only_message = line.substr(n);
        return only_message;
    }
    
    std::string log_level(std::string line) {
        std::string::size_type end = line.find("]") - 1;
        std::string::size_type start = line.find("[") + 1;
        std::string level = line.substr(start, end);
        return level;
    }
    
    std::string reformat(std::string line) {
        std::string message_line = message(line);
        std::string log = log_level(line);
        message_line.append(" ").append("(").append(log).append(")");
        return message_line;
    }
}  // namespace log_line
