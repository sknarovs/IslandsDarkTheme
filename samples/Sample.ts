interface Color {
    r: number;
    g: number;
    b: number;
    toHex(): string;
}

type ColorMap = Record<string, Color>;

const MAX_RETRIES: number = 3;
const VERSION: string = "1.0.0";

class ThemeColor implements Color {
    constructor(
        public r: number,
        public g: number,
        public b: number
    ) {}

    toHex(): string {
        return `#${this.r.toString(16).padStart(2, "0")}` +
               `${this.g.toString(16).padStart(2, "0")}` +
               `${this.b.toString(16).padStart(2, "0")}`;
    }

    static fromHex(hex: string): ThemeColor {
        const h = hex.replace("#", "");
        return new ThemeColor(
            parseInt(h.substring(0, 2), 16),
            parseInt(h.substring(2, 4), 16),
            parseInt(h.substring(4, 6), 16)
        );
    }
}

class Theme {
    private colors: ColorMap = {};
    public readonly isDark: boolean = true;

    constructor(public name: string) {}

    addColor(key: string, color: Color): void {
        this.colors[key] = color;
    }

    getColor(key: string): Color | undefined {
        return this.colors[key];
    }
}

async function fetchData(url: string): Promise<unknown> {
    try {
        const response: Response = await fetch(url);
        if (!response.ok) {
            throw new Error(`HTTP ${response.status}: ${response.statusText}`);
        }
        return await response.json();
    } catch (error) {
        console.error("Fetch failed:", (error as Error).message);
        return null;
    }
}

function processItems<T>(items: T[], prefix: string = "item"): string[] {
    return items.map((item, i) => `${prefix}_${i}: ${item}`);
}

// Type guard
function isColor(value: unknown): value is Color {
    return typeof value === "object" && value !== null &&
        "r" in value && "g" in value && "b" in value;
}

const theme = new Theme("Islands Dark");
theme.addColor("keyword", ThemeColor.fromHex("#CF8E6D"));
theme.addColor("background", new ThemeColor(25, 26, 28));

const items = processItems(["alpha", "beta", "gamma"]);
export { Theme, ThemeColor, fetchData, processItems };