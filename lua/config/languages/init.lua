-- Auto-load all language configs from the languages folder
local languages = {}

local function load_language_config(name)
  local ok, config = pcall(require, "config.languages." .. name)
  if ok then
    languages[name] = config
  else
    print("⚠️  Failed to load language config: " .. name)
  end
  return ok
end

-- List only Python and Lua
local language_modules = {
  "python",
  "lua",
  "go",
}

-- Load all language configs
for _, mod in ipairs(language_modules) do
  load_language_config(mod)
end

return languages
