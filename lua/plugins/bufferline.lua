return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- 頂部/底部粗指示條（比左側細 bar 明顯）
        indicator = {
          style = "underline",
        },
        separator_style = "slant", -- 斜切分隔，當前格更立體
        modified_icon = "●",
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)

      -- 統一當前頁籤底色為 catppuccin 黃底 + 深字。
      -- bufferline 會為每個檔案 icon 動態產生 BufferLine<Name>Selected 群組，
      -- 若只設 buffer_selected，icon 那格底色會與文字區不一致（色差）。
      -- 這裡在 ColorScheme 後掃過「所有」*Selected 群組，強制統一 bg，
      -- 確保文字、數字、icon、修改標記全部同一塊黃底，不會有色差。
      local function unify_selected_tab()
        local active_bg = "#f9e2af" -- catppuccin yellow
        local active_fg = "#1e1e2e" -- catppuccin base（深字，在黃底上清楚）

        -- 抓出所有現存的 highlight 群組名稱
        for name, _ in pairs(vim.api.nvim_get_hl(0, {})) do
          if name:match("^BufferLine.*Selected$") then
            local keep_bold = name:match("Buffer") or name:match("Numbers") or name:match("Modified")
            vim.api.nvim_set_hl(0, name, {
              bg = active_bg,
              fg = active_fg,
              bold = keep_bold ~= nil,
              italic = false,
            })
          end
        end
        -- 指示條（underline）與斜切分隔線也對齊黃底
        vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = active_bg, bg = active_bg })
        vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { fg = active_bg, bg = active_bg })
        -- 一般（未選）tab：偏暗灰，拉大對比
        vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { fg = "#7f849c", italic = false })
      end

      unify_selected_tab()
      -- ColorScheme：換色後重套。
      -- BufWinEnter：bufferline 的 icon *Selected 群組是「首次 render 才建立並快取」，
      -- 開新檔案類型時才會出現，故一併在進 buffer 後重掃，確保新 icon 也統一黃底。
      vim.api.nvim_create_autocmd({ "ColorScheme", "BufWinEnter" }, {
        callback = vim.schedule_wrap(unify_selected_tab),
      })
    end,
  },
  -- 讓 catppuccin 產生的 bufferline highlight 基底正確
  {
    "catppuccin/nvim",
    opts = {
      integrations = {
        bufferline = true,
      },
    },
  },
}
