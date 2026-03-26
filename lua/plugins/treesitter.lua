return {
  "nvim-treesitter/nvim-treesitter",
  opts = function()
    -- Load languages from config
    local languages = require("config.languages")
    local parsers = {}
    
    for _, lang_config in pairs(languages) do
      if lang_config.treesitter then
        for _, parser in ipairs(lang_config.treesitter) do
          table.insert(parsers, parser)
        end
      end
    end
    
    return {
      ensure_installed = parsers,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,  -- enable treesitter based indentation
      },
    }
  end,
}
