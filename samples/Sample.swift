import Foundation

let maxRetries = 3
let version = "1.0.0"
let pi = 3.14159

struct Color: CustomStringConvertible {
    let r: Int, g: Int, b: Int

    var description: String {
        String(format: "#%02X%02X%02X", r, g, b)
    }

    static func fromHex(_ hex: String) -> Color {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let r = Int(hex.prefix(2), radix: 16) ?? 0
        let g = Int(hex.dropFirst(2).prefix(2), radix: 16) ?? 0
        let b = Int(hex.dropFirst(4).prefix(2), radix: 16) ?? 0
        return Color(r: r, g: g, b: b)
    }
}

class Theme {
    let name: String
    var colors: [String: Color] = [:]

    init(name: String) {
        self.name = name
    }

    var isDark: Bool { true }

    func addColor(_ key: String, color: Color) {
        colors[key] = color
    }

    func getColor(_ key: String) -> Color? {
        colors[key]
    }
}

@available(macOS 12.0, *)
actor ThemeManager {
    private var themes: [String: Theme] = [:]

    func register(_ theme: Theme) {
        themes[theme.name] = theme
    }

    func theme(named name: String) -> Theme? {
        themes[name]
    }
}

func processItems(_ items: [String], prefix: String = "item") -> [String] {
    items.enumerated().map { index, item in
        "\(prefix)_\(index): \(item)"
    }
}

// Enum with associated values
enum ThemeError: Error {
    case notFound(String)
    case invalidFormat(String)
}

// Generic function
func applyTheme<T: ThemeProtocol>(_ theme: T) throws where T: CustomStringConvertible {
    print("Applying theme: \(theme.description)")
}

let theme = Theme(name: "Islands Dark")
theme.addColor("keyword", color: Color.fromHex("#CF8E6D"))
theme.addColor("background", color: Color(r: 25, g: 26, b: 28))

let items = processItems(["alpha", "beta", "gamma"])
print("Theme: \(theme.name)")