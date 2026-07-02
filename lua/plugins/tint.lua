-- tint.nvim：對 inactive window 整片調暗（含語法高亮的彩色字），
-- 補足 NormalNC 只能壓普通文字的限制。
return {
  "levouh/tint.nvim",
  event = "VeryLazy",
  opts = {
    tint = -90, -- 調暗幅度（負值變暗，越負越暗）
    saturation = 0.4, -- 保留的飽和度（越低彩色字越灰淡）
    tint_background_colors = true,
    -- 排除這些 group，保留 active window 的亮分隔線與 cursorline
    highlight_ignore_patterns = { "WinSeparator", "Status.*", "CursorLine.*" },
    -- 只跳過浮動視窗（telescope 等 popup），terminal 一般 split 仍會被調暗
    window_ignore_function = function(winid)
      local floating = vim.api.nvim_win_get_config(winid).relative ~= ""
      return floating
    end,
  },
}
