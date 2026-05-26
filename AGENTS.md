# AGENTS.md

## Repository purpose

Islands Dark — a dark color theme distributed for two editors:
- `Islands_Dark.icls` — IntelliJ IDEA (ICLS format, parent scheme: Darcula)
- `IslandsDark.xml` — Notepad++ (stylers XML format)

Both files define the same palette. Changes to colors must be applied consistently across both.

## Key color palette

| Token | Hex (fg) |
|---|---|
| Background | `191A1C` |
| Default text | `BCBEC4` |
| Keyword | `CF8E6D` |
| String | `6AAB73` |
| Number | `2AACB8` |
| Comment | `7A7E85` |
| Function | `56A8F5` |
| Constant/Field | `C77DBB` |
| Preprocessor/Metadata | `B3AE60` |
| Error | `F75464` |

Secondary palette (UI highlights, doc comments, regex, etc.) is derived from these and from the Darcula parent scheme. When in doubt, match the ICLS file.

## When editing

- `Islands_Dark.icls`: XML attributes under `<attributes>` and `<colors>`. fontStyle: 0=plain, 1=bold, 2=italic, 3=bold+italic. Does **not** support font specification — that's an IDE setting.
- `IslandsDark.xml`: Lexer-specific `<WordsStyle>` elements with `fgColor`/`bgColor` (6-digit hex, no `#`). Global defaults under `<GlobalStyles>`. Very large file — changes affect many lexers. Default font is set in `Global override` and `Default Style` WidgetStyle entries.
- Both files must stay in sync. Any color change must be applied consistently across both.
- No build, lint, or test pipeline exists. Verification is visual (load the theme in the target editor and inspect).