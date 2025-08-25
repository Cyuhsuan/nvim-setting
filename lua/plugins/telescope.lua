-- 文件路徑：lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- FZF 加速器
  },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "❯ ",
      path_display = { "smart" },
      sorting_strategy = "ascending",
      layout_config = { prompt_position = "top" },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
    vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, { desc = "Git commits (current file)" })
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
    vim.keymap.set("n", "<leader>gS", builtin.git_status, { desc = "Git status" })
    vim.keymap.set("n", "<leader>gT", builtin.git_stash, { desc = "Git stash" })
  end,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
  },
}
