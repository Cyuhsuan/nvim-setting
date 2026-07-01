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
  },
}
