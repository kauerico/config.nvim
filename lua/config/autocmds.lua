vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "<space>te", function()
  vim.cmd.vnew()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)

-- ~/.config/nvim/lua/config/autocmds.lua
--vim.api.nvim_create_autocmd("InsertLeave", {
  --callback = function()
    --if vim.bo.modified and vim.bo.buftype == "" then
      --vim.cmd("write")
      --print("✓ Auto-saved: " .. vim.fn.expand("%"))
    --end
  --end,
--})
--
--vim.api.nvim_create_autocmd("CursorHold", {
  --callback = function()
    --if vim.bo.modified and vim.bo.buftype == "" then
      --vim.cmd("write")
      --print("✓ Auto-saved: " .. vim.fn.expand("%"))
    --end
  --end,
--})
