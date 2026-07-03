return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      mappings = {
        ["W"] = function(state)
          local renderer = require("neo-tree.ui.renderer")
          renderer.collapse_all_nodes(state.tree)
          renderer.redraw(state)
        end,
      },
    },
    -- 在 neo-tree 檔案樹視窗顯示行號
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.number = true
          vim.opt_local.relativenumber = true
        end,
      },
    },
  },
}
