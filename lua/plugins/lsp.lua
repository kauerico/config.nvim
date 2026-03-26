return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Load your language configurations
      local lsp_config = require("config.lsp")
      local languages = require("config.languages")
      
      -- Setup Mason
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(lsp_config.get_server_configs()),
        automatic_installation = true,
        handlers = {
          -- This function will be called for each installed server
          function(server_name)
            -- Get the config for this server from your language configs
            local config = lsp_config.get_server_configs()[server_name]
            
            if config then
              -- Use the new vim.lsp.config API (Neovim 0.11+)
              vim.lsp.config[server_name] = config
              vim.lsp.enable(server_name)
            end
          end,
        },
      })
      
      -- LSP Keymaps (unchanged)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })
    end,
  },
}
