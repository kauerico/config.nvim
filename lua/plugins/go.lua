return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        -- Go formatter
        gofmt = 'gofumpt',  -- or gopls, gofmt, goimports
        -- LSP
        lsp_cfg = true,     -- Use gopls from your config
        lsp_gofumpt = true, -- Use gofumpt
        lsp_staticcheck = true,
        -- Debugger
        dap_debug = true,
        -- Test runner
        test_runner = 'go', -- or dlv
        -- Tags
        tag_transform = false,
        tag_options = 'json=omitempty',
      })
    end,
  },
}
