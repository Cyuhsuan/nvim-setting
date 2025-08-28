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
vim.keymap.set("t", "jj", [[<C-\><C-n>]], { noremap = true })
-- buffer 管理
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close other buffers" })
-- 用 cwd 開啟（而不是 git root）
vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({
    source = "filesystem",
    position = "left",
    toggle = true,
    dir = vim.loop.cwd(), -- ← cwd
    reveal = true,
  })
end, { desc = "Explorer Neo-tree (cwd)" })
-- 跳到下一個 "(" 的裡面
vim.keymap.set("n", "<leader>)", function()
  local pos = vim.fn.search("(", "W") -- 往後找 "("（W 不換窗口）
  if pos ~= 0 then
    vim.cmd("normal! l")
  end -- 光標移到 "(" 後一格 = 括號內
end, { desc = "Jump inside next (“)” pair" })
