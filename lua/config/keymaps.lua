vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
-- Easily hit escape terminal mode. 
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>") 


-- Go language specific keymaps
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- Run go commands
    vim.keymap.set("n", "<leader>gr", "<cmd>GoRun %<CR>", { buffer = true, desc = "Go Run" })
    vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { buffer = true, desc = "Go Test" })
    vim.keymap.set("n", "<leader>gT", "<cmd>GoTestFunc<CR>", { buffer = true, desc = "Go Test Function" })
    
    -- Generate tags
    vim.keymap.set("n", "<leader>gtg", "<cmd>GoTags<CR>", { buffer = true, desc = "Go Generate Tags" })
    
    -- Interface implementation
    vim.keymap.set("n", "<leader>gi", "<cmd>GoImpl<CR>", { buffer = true, desc = "Go Implement Interface" })
    
    -- Go mod commands
    vim.keymap.set("n", "<leader>gmt", "<cmd>GoModTidy<CR>", { buffer = true, desc = "Go Mod Tidy" })
    vim.keymap.set("n", "<leader>gmv", "<cmd>GoModVendor<CR>", { buffer = true, desc = "Go Mod Vendor" })
  end,
})
