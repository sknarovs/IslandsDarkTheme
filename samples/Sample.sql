-- Islands Dark Theme - SQL Sample

CREATE TABLE IF NOT EXISTS users (
    id          SERIAL PRIMARY KEY,
    username    VARCHAR(50) NOT NULL UNIQUE,
    email       VARCHAR(255) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active   BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS themes (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    is_dark     BOOLEAN DEFAULT FALSE,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS theme_colors (
    id          SERIAL PRIMARY KEY,
    theme_id    INTEGER REFERENCES themes(id) ON DELETE CASCADE,
    token       VARCHAR(50) NOT NULL,
    hex_value   VARCHAR(7) NOT NULL,
    UNIQUE(theme_id, token)
);

INSERT INTO themes (name, is_dark) VALUES ('Islands Dark', TRUE);

INSERT INTO theme_colors (theme_id, token, hex_value) VALUES
    (1, 'background', '#191A1C'),
    (1, 'foreground', '#BCBEC4'),
    (1, 'keyword',    '#CF8E6D'),
    (1, 'string',     '#6AAB73'),
    (1, 'number',     '#2AACB8'),
    (1, 'comment',    '#7A7E85'),
    (1, 'function',   '#56A8F5'),
    (1, 'constant',   '#C77DBB');

SELECT
    u.username,
    u.email,
    COUNT(tc.id) AS color_count
FROM users u
INNER JOIN themes t ON t.name = 'Islands Dark'
LEFT JOIN theme_colors tc ON tc.theme_id = t.id
WHERE u.is_active = TRUE
    AND u.created_at >= '2024-01-01'
GROUP BY u.username, u.email
HAVING COUNT(tc.id) > 0
ORDER BY color_count DESC;

CREATE OR REPLACE FUNCTION get_theme_colors(p_theme_name VARCHAR)
RETURNS TABLE(token VARCHAR, hex_value VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT tc.token, tc.hex_value
    FROM theme_colors tc
    JOIN themes t ON t.id = tc.theme_id
    WHERE t.name = p_theme_name;
END;
$$ LANGUAGE plpgsql;