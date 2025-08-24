-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#e06c75", bg = "NONE", bold = true })
-- Option + 方向鍵 調整分割視窗大小
vim.keymap.set("n", "<A-Left>", "<C-w><")
vim.keymap.set("n", "<A-Right>", "<C-w>>")
vim.keymap.set("n", "<A-Up>", "<C-w>+")
vim.keymap.set("n", "<A-Down>", "<C-w>-")
-- Option + = 讓所有視窗平均大小
vim.keymap.set("n", "<A-=>", "<C-w>=")
-- Esc change
vim.keymap.set("i", "jj", "<Esc>")
-- termail change
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { noremap = true })
