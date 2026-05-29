#include <iostream>
#include <vector>
#include <string>
#include <memory>
#include <algorithm>

#define MAX_SIZE 1024
#define VERSION "2.0"

constexpr double PI = 3.14159265;

namespace islands {
namespace dark {

class Color {
public:
    Color(int r, int g, int b) : r_(r), g_(g), b_(b) {}

    virtual ~Color() = default;

    std::string toHex() const {
        char buf[8];
        snprintf(buf, sizeof(buf), "#%02X%02X%02X", r_, g_, b_);
        return std::string(buf);
    }

    static Color fromHex(const std::string& hex) {
        unsigned int r, g, b;
        sscanf(hex.c_str(), "#%02x%02x%02x", &r, &g, &b);
        return Color(r, g, b);
    }

protected:
    int r_, g_, b_;
};

class Theme {
public:
    Theme(std::string name) : name_(std::move(name)) {}

    void addColor(const std::string& key, const Color& color) {
        colors_[key] = color;
    }

    Color getColor(const std::string& key) const {
        auto it = colors_.find(key);
        if (it != colors_.end()) {
            return it->second;
        }
        return Color(0, 0, 0);
    }

    void printInfo() const {
        std::cout << "Theme: " << name_ << std::endl;
        std::cout << "Colors: " << colors_.size() << std::endl;
    }

private:
    std::string name_;
    std::map<std::string, Color> colors_;
};

}  // namespace dark
}  // namespace islands

int main() {
    islands::dark::Theme theme("Islands Dark");
    theme.addColor("background", islands::dark::Color(25, 26, 28));
    theme.addColor("keyword", islands::dark::Color::fromHex("#CF8E6D"));

    theme.printInfo();
    return 0;
}