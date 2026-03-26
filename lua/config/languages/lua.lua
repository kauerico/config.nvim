return {
  lsp = {
    lua_ls = {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",  -- for Neovim
          },
          diagnostics = {
            globals = { "vim" },  -- recognize vim global
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),  -- load Neovim runtime files
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,  -- disable telemetry
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    },
  },
  
  formatters = { "stylua" },
  linters = { "luacheck" },
  
  treesitter = { "lua" },
  
  filetype_settings = {
    tabwidth = 2,
    format_on_save = true,
  },
}
