# frozen_string_literal: true

require "json"
require "net/http"

MAX_RETRIES = 3
VERSION = "1.0.0"

module IslandsDark
  class Color
   attr_reader :r, :g, :b

    def initialize(r, g, b)
      @r = r
      @g = g
      @b = b
    end

    def to_hex
      format("#%02X%02X%02X", @r, @g, @b)
    end

    def self.from_hex(hex)
      hex = hex.delete("#")
      Color.new(
        hex[0..1].to_i(16),
        hex[2..3].to_i(16),
        hex[4..5].to_i(16)
      )
    end
  end

  class Theme
    attr_reader :name, :colors

    def initialize(name)
      @name = name
      @colors = {}
    end

    def add_color(key, color)
      @colors[key] = color
    end

    def dark?
      true
    end

    def to_json(*_args)
      {
        name: @name,
        dark: true,
        colors: @colors.transform_values(&:to_hex)
      }.to_json
    end
  end

  module_function

  def process_items(items, prefix: "item")
    items.each_with_index.map { |item, i| "#{prefix}_#{i}: #{item}" }
  end
end

theme = IslandsDark::Theme.new("Islands Dark")
theme.add_color("keyword", IslandsDark::Color.from_hex("#CF8E6D"))
theme.add_color("background", IslandsDark::Color.new(25, 26, 28))

items = IslandsDark.process_items(["alpha", "beta", "gamma"])

=begin
This is a multi-line
block comment in Ruby
=end

puts "Theme: #{theme.name}"
items.each { |item| puts "  - #{item}" }