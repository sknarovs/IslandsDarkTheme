# Islands Dark

A dark color theme for IntelliJ IDEA and Notepad++.

## Palette

| Token | Color | Hex |
|---|---|---|
| Background | ![#191A1C](https://via.placeholder.com/12/191A1C/191A1C) | `#191A1C` |
| Default text | ![#BCBEC4](https://via.placeholder.com/12/BCBEC4/BCBEC4) | `#BCBEC4` |
| Keyword | ![#CF8E6D](https://via.placeholder.com/12/CF8E6D/CF8E6D) | `#CF8E6D` |
| String | ![#6AAB73](https://via.placeholder.com/12/6AAB73/6AAB73) | `#6AAB73` |
| Number | ![#2AACB8](https://via.placeholder.com/12/2AACB8/2AACB8) | `#2AACB8` |
| Comment | ![#7A7E85](https://via.placeholder.com/12/7A7E85/7A7E85) | `#7A7E85` |
| Function | ![#56A8F5](https://via.placeholder.com/12/56A8F5/56A8F5) | `#56A8F5` |
| Constant / Field | ![#C77DBB](https://via.placeholder.com/12/C77DBB/C77DBB) | `#C77DBB` |
| Preprocessor / Metadata | ![#B3AE60](https://via.placeholder.com/12/B3AE60/B3AE60) | `#B3AE60` |
| Error | ![#F75464](https://via.placeholder.com/12/F75464/F75464) | `#F75464` |

## Installation

### IntelliJ IDEA

1. Copy `Islands_Dark.icls` to your IDE colors directory:
   - **Windows:** `%APPDATA%\JetBrains\<Product><Version>\colors\`
   - **macOS:** `~/Library/Application Support/JetBrains/<Product><Version>/colors/`
   - **Linux:** `~/.config/JetBrains/<Product><Version>/colors/`
2. Restart the IDE.
3. Go to **Settings → Editor → Color Scheme**, select **Islands Dark**.

### Notepad++

1. Open Notepad++.
2. Go to **Settings → Import → Import Style Theme**.
3. Select `IslandsDark.xml`.
4. Restart Notepad++.
5. Go to **Settings → Style Configurator**, select **Islands Dark** from the theme dropdown.

Alternatively, copy `IslandsDark.xml` directly into your Notepad++ themes directory:
   - **Windows:** `%APPDATA%\Notepad++\themes\`
   - **Portable:** `<Notepad++ directory>\themes\`

## Font

The recommended font is **JetBrains Mono**. If it is not installed, the editor will fall back to its default monospace font.

- **IntelliJ:** Go to **Settings → Editor → Font** and set **JetBrains Mono**. The IDE automatically falls back to the system monospace font if JetBrains Mono is unavailable.
- **Notepad++:** The theme sets **JetBrains Mono** as the default font. If JetBrains Mono is not installed, Notepad++ will fall back to its global font setting (**Consolas** on Windows by default). To set JetBrains Mono manually: go to **Settings → Style Configurator**, select **Islands Dark**, pick the **Default Style** entry, and change the font.

## License

MIT