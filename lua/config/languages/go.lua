return {
  lsp = {
    gopls = {
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            unreachable = true,
            unusedwrite = true,
          },
          staticcheck = true,
          gofumpt = true,  -- Use gofumpt for stricter formatting
          usePlaceholders = true,  -- Add placeholders for functions
          completeUnimported = true,  -- Auto-complete unimported packages
        },
      },
    },
  },
  
  formatters = { "goimports", "gofumpt" },  -- gofumpt is stricter than gofmt
  linters = { "golangci-lint" },
  
  treesitter = { "go" },
  
  dap = {
    adapter = {
      type = "executable",
      command = "dlv",  -- Delve debugger
      args = { "dap", "--listen", "127.0.0.1:38697" },
    },
    configurations = {
      {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}",
        -- or for package debugging:
        -- program = "${workspaceFolder}",
      },
      {
        type = "go",
        name = "Debug Test",
        request = "launch",
        mode = "test",
        program = "${file}",
      },
    },
  },
  
  filetype_settings = {
    tabwidth = 4,        -- Go traditionally uses tabs
    expandtab = false,   -- Use actual tabs (Go standard)
    format_on_save = true,
  },
}
