return {
  {
    "catppuccin/nvim",
    opts = {
      flavour = "mocha",
    },
    config = function(_, opts)
      require("catppuccin").setup(opts) -- 必須手動套用 opts（自訂 config 會覆蓋預設 setup）

      -- ColorScheme 後統一設定 highlight（catppuccin 載入時會重設，故掛在此事件）
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#8888aa" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffcc66", bold = true })
          -- (3) active window 亮色分隔線
          vim.api.nvim_set_hl(0, "WinSeparatorActive", { fg = "#89b4fa" }) -- catppuccin blue
          -- current_line_blame 行尾提示：暖褐灰，與冷灰的 Comment(#6c7086) 明顯區隔
          vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#9a7e6b", italic = true })
          -- 注意：inactive window 的整片調暗（含語法高亮彩色字）改由 tint.nvim 負責，
          -- 見 lua/plugins/tint.lua。此處不再手動覆寫 NormalNC。
        end,
      })

      local grp = vim.api.nvim_create_augroup("active_window_highlight", { clear = true })

      -- 進入 window → active
      vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
        group = grp,
        callback = function()
          vim.wo.cursorline = true -- (1) 顯示 cursorline
          vim.wo.winhighlight = "WinSeparator:WinSeparatorActive" -- (3) 亮色分隔線
        end,
      })

      -- 離開 window → inactive
      vim.api.nvim_create_autocmd("WinLeave", {
        group = grp,
        callback = function()
          vim.wo.cursorline = false -- (1) 隱藏 cursorline
          vim.wo.winhighlight = "" -- (3) 還原成預設暗色 WinSeparator
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
