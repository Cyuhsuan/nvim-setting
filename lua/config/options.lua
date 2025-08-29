-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- 自動換行
vim.opt.wrap = true

-- 換行斷在單詞邊界，而不是硬切
vim.opt.linebreak = true

-- 換行後縮排對齊
vim.opt.breakindent = true

-- 顯示換行符號（可選）
vim.opt.showbreak = "↪ "
vim.keymap.set("n", "<leader>tw", function()
  vim.wo.wrap = not vim.wo.wrap
  print("Wrap: " .. tostring(vim.wo.wrap))
end, { desc = "Toggle line wrap" })
