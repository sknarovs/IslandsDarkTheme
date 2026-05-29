#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SIZE 1024
#define VERSION "1.0.0"

typedef struct {
    int r, g, b;
} Color;

typedef struct {
    char name[64];
    Color colors[32];
    int color_count;
} Theme;

Color color_from_hex(const char *hex) {
    Color c = {0, 0, 0};
    if (hex == NULL) return c;
    while (*hex == '#') hex++;
    unsigned int r, g, b;
    sscanf(hex, "%02x%02x%02x", &r, &g, &b);
    c.r = (int)r;
    c.g = (int)g;
    c.b = (int)b;
    return c;
}

void color_to_hex(Color c, char *buf, size_t len) {
    snprintf(buf, len, "#%02X%02X%02X", c.r, c.g, c.b);
}

Theme *theme_new(const char *name) {
    Theme *t = malloc(sizeof(Theme));
    if (t == NULL) return NULL;
    strncpy(t->name, name, sizeof(t->name) - 1);
    t->color_count = 0;
    return t;
}

void theme_add_color(Theme *t, const char *key, Color c) {
    if (t->color_count < 32) {
        t->colors[t->color_count++] = c;
    }
}

void theme_free(Theme *t) {
    if (t != NULL) {
        free(t);
    }
}

int main(void) {
    Theme *theme = theme_new("Islands Dark");
    if (theme == NULL) {
        fprintf(stderr, "Failed to create theme\n");
        return 1;
    }

    theme_add_color(theme, "background", color_from_hex("#191A1C"));
    theme_add_color(theme, "keyword", color_from_hex("#CF8E6D"));

    printf("Theme: %s\n", theme->name);
    printf("Colors: %d\n", theme->color_count);

    for (int i = 0; i < theme->color_count; i++) {
        char hex[8];
        color_to_hex(theme->colors[i], hex, sizeof(hex));
        printf("  Color %d: %s\n", i, hex);
    }

    theme_free(theme);
    return 0;
}