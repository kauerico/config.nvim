return {
  lsp = {
    pyright = {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
            typeCheckingMode = "basic",
          },
        },
      },
    },
  },
  
  formatters = { "black" },
  linters = { "pylint" },  -- or use "flake8", "mypy"
  
  dap = {
    adapter = {
      type = "executable",
      command = "python",
      args = { "-m", "debugpy.adapter" },
    },
    configurations = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          -- This will use the virtual environment if active
          return "python"
        end,
      },
      {
        type = "python",
        request = "launch",
        name = "Launch with arguments",
        program = "${file}",
        args = function()
          local input = vim.fn.input("Arguments: ")
          return vim.split(input, " +")
        end,
      },
    },
  },
  
  treesitter = { "python" },
  
  filetype_settings = {
    tabwidth = 4,
    format_on_save = true,
  },
}
