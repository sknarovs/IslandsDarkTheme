-- Islands Dark Theme - Lua Sample

local MAX_RETRIES = 3
local VERSION = "1.0.0"

local Color = {}
Color.__index = Color

function Color.new(r, g, b)
    return setmetatable({ r = r, g = g, b = b }, Color)
end

function Color:toHex()
    return string.format("#%02X%02X%02X", self.r, self.g, self.b)
end

function Color.fromHex(hex)
    hex = hex:gsub("^#", "")
    local r = tonumber(hex:sub(1, 2), 16)
    local g = tonumber(hex:sub(3, 4), 16)
    local b = tonumber(hex:sub(5, 6), 16)
    return Color.new(r, g, b)
end

local Theme = {}
Theme.__index = Theme

function Theme.new(name)
    local self = setmetatable({}, Theme)
    self.name = name
    self.colors = {}
    return self
end

function Theme:addColor(key, color)
    self.colors[key] = color
end

function Theme:getColor(key)
    return self.colors[key]
end

function Theme:isDark()
    return true
end

function Theme:printInfo()
    print("Theme: " .. self.name)
    for key, color in pairs(self.colors) do
        print(string.format("  %s: %s", key, color:toHex()))
    end
end

local function processItems(items, prefix)
    prefix = prefix or "item"
    local result = {}
    for i, item in ipairs(items) do
        table.insert(result, string.format("%s_%d: %s", prefix, i, item))
    end
    return result
end

local theme = Theme.new("Islands Dark")
theme:addColor("keyword", Color.fromHex("#CF8E6D"))
theme:addColor("background", Color.new(25, 26, 28))
theme:printInfo()

local items = processItems({ "alpha", "beta", "gamma" })
for _, item in ipairs(items) do
    print("  " .. item)
end

return Theme