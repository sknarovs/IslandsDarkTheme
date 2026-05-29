package main

import (
	"fmt"
	"net/http"
	"strings"
	"time"
)

const (
	MaxRetries    = 3
	DefaultPort   = 8080
	Version       = "1.0.0"
	Pi            = 3.14159
)

type Color struct {
	R, G, B int
}

func (c Color) ToHex() string {
	return fmt.Sprintf("#%02X%02X%02X", c.R, c.G, c.B)
}

func NewColor(r, g, b int) *Color {
	return &Color{R: r, G: g, B: b}
}

type Theme struct {
	Name   string
	Colors map[string]Color
	Dark   bool
}

func NewTheme(name string) *Theme {
	return &Theme{
		Name: name,
		Colors: map[string]Color{
			"background": {R: 25, G: 26, B: 28},
			"foreground": {R: 188, G: 190, B: 196},
			"keyword":    {R: 207, G: 142, B: 109},
		},
		Dark: true,
	}
}

func (t *Theme) GetColor(key string) (Color, bool) {
	color, ok := t.Colors[key]
	return color, ok
}

func (t *Theme) Apply() error {
	for key, color := range t.Colors {
		fmt.Printf("  %s: %s\n", key, color.ToHex())
	}
	return nil
}

func fetchData(url string) ([]byte, error) {
	client := &http.Client{Timeout: 30 * time.Second}
	resp, err := client.Get(url)
	if err != nil {
		return nil, fmt.Errorf("fetch failed: %w", err)
	}
	defer resp.Body.Close()

	// Process the response
	return nil, nil
}

func main() {
	theme := NewTheme("Islands Dark")
	fmt.Printf("Theme: %s (dark: %v)\n", theme.Name, theme.Dark)
	fmt.Println(strings.Repeat("-", 40))
	theme.Apply()

	items := []string{"alpha", "beta", "gamma"}
	for i, item := range items {
		fmt.Printf("%d: %s\n", i, item)
	}
}