"""Islands Dark Theme - Python Sample"""

import sys
from typing import List, Optional
from dataclasses import dataclass, field

MAX_VALUE = 1000
VERSION = "1.0.0"


@dataclass
class DataPoint:
    """Represents a single data point."""
    x: float
    y: float
    label: str = ""
    metadata: dict = field(default_factory=dict)

    def distance(self, other: "DataPoint") -> float:
        return ((self.x - other.x) ** 2 + (self.y - other.y) ** 2) ** 0.5


def process_items(items: List[str], prefix: str = "item") -> List[str]:
    """Process a list of items with optional prefix."""
    result = []
    for i, item in enumerate(items):
        result.append(f"{prefix}_{i}: {item}")
    return result


async def fetch_data(url: str) -> Optional[dict]:
    """Fetch data from a URL asynchronously."""
    import aiohttp
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            if response.status == 200:
                return await response.json()
    return None


class ColorTheme:
    BG = "#191A1C"
    FG = "#BCBEC4"
    KEYWORD = "#CF8E6D"

    def __init__(self, name: str):
        self.name = name
        self._colors: dict = {}

    @property
    def is_dark(self) -> bool:
        return True

    @staticmethod
    def from_config(path: str) -> "ColorTheme":
        with open(path, "r") as f:
            lines = f.readlines()
        return ColorTheme(lines[0].strip())


if __name__ == "__main__":
    theme = ColorTheme("Islands Dark")
    items = process_items(["alpha", "beta", "gamma"])
    # This is a line comment
    print(f"Theme: {theme.name}, Items: {len(items)}")