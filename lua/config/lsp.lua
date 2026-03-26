-- Main LSP configuration that will be called from your plugins
local M = {}

-- This will be populated by language-specific configs
M.servers = {}

-- Load all language configurations
local languages = require("config.languages")

-- Merge language server configs
for lang_name, lang_config in pairs(languages) do
  if lang_config.lsp then
    for server, config in pairs(lang_config.lsp) do
      M.servers[server] = config
    end
  end
end

-- Function to get all server configs
function M.get_server_configs()
  return M.servers
end

-- Function to get language-specific settings
function M.get_language_settings(lang)
  return languages[lang] or {}
end

return M
