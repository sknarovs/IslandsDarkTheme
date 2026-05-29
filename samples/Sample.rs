use std::collections::HashMap;
use std::fmt;

const MAX_RETRIES: usize = 3;
const VERSION: &str = "1.0.0";

struct Color {
    r: u8,
    g: u8,
    b: u8,
}

impl Color {
    fn new(r: u8, g: u8, b: u8) -> Self {
        Self { r, g, b }
    }

    fn from_hex(hex: &str) -> Self {
        let hex = hex.trim_start_matches('#');
        let r = u8::from_str_radix(&hex[0..2], 16).unwrap_or(0);
        let g = u8::from_str_radix(&hex[2..4], 16).unwrap_or(0);
        let b = u8::from_str_radix(&hex[4..6], 16).unwrap_or(0);
        Self { r, g, b }
    }

    fn to_hex(&self) -> String {
        format!("#{:02X}{:02X}{:02X}", self.r, self.g, self.b)
    }
}

impl fmt::Display for Color {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "rgb({}, {}, {})", self.r, self.g, self.b)
    }
}

#[derive(Debug)]
struct Theme {
    name: String,
    colors: HashMap<String, Color>,
}

impl Theme {
    fn new(name: &str) -> Self {
        Self {
            name: name.to_string(),
            colors: HashMap::new(),
        }
    }

    fn add_color(&mut self, key: &str, color: Color) {
        self.colors.insert(key.to_string(), color);
    }

    fn get_color(&self, key: &str) -> Option<&Color> {
        self.colors.get(key)
    }
}

enum ThemeError {
    NotFound(String),
    InvalidFormat(String),
}

fn process_items(items: &[&str], prefix: &str) -> Vec<String> {
    items
        .iter()
        .enumerate()
        .map(|(i, item)| format!("{}_{}: {}", prefix, i, item))
        .collect()
}

fn main() {
    let mut theme = Theme::new("Islands Dark");
    theme.add_color("background", Color::new(25, 26, 28));
    theme.add_color("keyword", Color::from_hex("#CF8E6D"));
    theme.add_color("string", Color::from_hex("#6AAB73"));

    println!("Theme: {}", theme.name);

    let items = ["alpha", "beta", "gamma"];
    for item in process_items(&items, "item") {
        println!("  {item}");
    }
}