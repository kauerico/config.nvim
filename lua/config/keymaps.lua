vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
-- Easily hit escape terminal mode. 
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>") 

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.keymap.set("n", "<leader>gr", function()
      vim.cmd("w")
      vim.cmd("belowright split | terminal go run " .. vim.fn.expand("%"))
      vim.cmd("startinsert")
  
      vim.cmd("tnoremap <buffer> <CR> <C-\\><C-n>:close<CR>")
    end, { buffer = true, desc = "Go Run" })
    
    vim.keymap.set("n", "<leader>gb", function()
      vim.cmd("w")
      vim.cmd("belowright split | terminal go build " .. vim.fn.expand("%"))
    end, { buffer = true, desc = "Go Build" })
    
    vim.keymap.set("n", "<leader>gt", function()
      vim.cmd("w")
      vim.cmd("belowright split | terminal go test")
    end, { buffer = true, desc = "Go Test" })
  end,
})
