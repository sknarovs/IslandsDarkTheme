using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IslandsDark.Sample
{
    public class ColorTheme
    {
        public const string Version = "1.0.0";
        public const int MaxColors = 256;

        private readonly Dictionary<string, string> _colors = new()
        {
            ["background"] = "#191A1C",
            ["foreground"] = "#BCBEC4",
            ["keyword"] = "#CF8E6D",
            ["string"] = "#6AAB73",
            ["number"] = "#2AACB8"
        };

        public string Name { get; init; }
        public bool IsDark => true;

        public ColorTheme(string name)
        {
            Name = name;
        }

        public string this[string key]
        {
            get => _colors.TryGetValue(key, out var value) ? value : null;
            set => _colors[key] = value;
        }

        /// <summary>
        /// Applies the theme to the specified target.
        /// </summary>
        public async Task ApplyAsync(string target)
        {
            await Task.Delay(100);
            Console.WriteLine($"Applied {Name} to {target}");
        }

        public static ColorTheme Default => new("Islands Dark");
    }

    public record Point(double X, double Y)
    {
        public double DistanceTo(Point other) =>
            Math.Sqrt(Math.Pow(X - other.X, 2) + Math.Pow(Y - other.Y, 2));
    }

    #region Extensions
    public static class ColorExtensions
    {
        public static string ToHex(this (int r, int g, int b) color) =>
            $"#{color.r:X2}{color.g:X2}{color.b:X2}";
    }
    #endregion
}