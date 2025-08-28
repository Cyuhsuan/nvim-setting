return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- 顯示隱藏檔 (.xxx)
        hide_gitignored = false, -- 顯示被 gitignore 忽略的檔案
      },
    },
  },
}
