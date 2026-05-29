<?php

declare(strict_types=1);

namespace IslandsDark\Sample;

const MAX_RETRIES = 3;
const VERSION = '1.0.0';
const PI = 3.14159;

class Color
{
    private int $r;
    private int $g;
    private int $b;

    public function __construct(int $r, int $g, int $b)
    {
        $this->r = $r;
        $this->g = $g;
        $this->b = $b;
    }

    public function toHex(): string
    {
        return sprintf('#%02X%02X%02X', $this->r, $this->g, $this->b);
    }

    public static function fromHex(string $hex): self
    {
        $hex = ltrim($hex, '#');
        return new self(
            hexdec(substr($hex, 0, 2)),
            hexdec(substr($hex, 2, 2)),
            hexdec(substr($hex, 4, 2))
        );
    }
}

#[\Attribute]
class ThemeAttribute
{
    public function __construct(public string $name, public bool $dark = true) {}
}

#[ThemeAttribute(name: 'Islands Dark')]
class Theme
{
    private array $colors = [];
    private string $name;

    public function __construct(string $name)
    {
        $this->name = $name;
    }

    public function addColor(string $key, Color $color): void
    {
        $this->colors[$key] = $color;
    }

    public function getColor(string $key): ?Color
    {
        return $this->colors[$key] ?? null;
    }

    public function getName(): string
    {
        return $this->name;
    }
}

function processItems(array $items, string $prefix = 'item'): array
{
    $result = [];
    foreach ($items as $i => $item) {
        $result[] = "{$prefix}_{$i}: {$item}";
    }
    return $result;
}

$theme = new Theme('Islands Dark');
$theme->addColor('keyword', Color::fromHex('#CF8E6D'));
$items = processItems(['alpha', 'beta', 'gamma']);

echo "Theme: " . $theme->getName() . "\n";

?>