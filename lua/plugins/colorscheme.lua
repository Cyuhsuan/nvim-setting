return {
  {
    "catppuccin/nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#8888aa" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffcc66", bold = true })
        end,
      })
    end,
  },
}
