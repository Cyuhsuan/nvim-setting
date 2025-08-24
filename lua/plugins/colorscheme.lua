return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      style = "darker",
      highlights = {
        Comment = { fg = "#7f848e", italic = true, bold = true },
        -- 兼容舊版 treesitter 名稱
        TSComment = { fg = "#7f848e", italic = true, bold = true },

        -- Tree-sitter（新版使用這些 capture）
        ["@comment"] = { fg = "#7f848e", italic = true, bold = true },
        ["@comment.documentation"] = { fg = "#7f848e", italic = true, bold = true },

        -- LSP Semantic Tokens
        ["@lsp.type.comment"] = { fg = "#7f848e", italic = true, bold = true },

        --（可選）某些語言會細分 TODO 註解
        ["@comment.todo"] = { fg = "#7f848e", italic = true, bold = true },
        ["@text.todo"] = { fg = "#7f848e", italic = true, bold = true },
      },
    },
    config = function(_, opts)
      -- 載入 onedark 主題
      require("onedark").setup(opts)
      require("onedark").load()

      vim.opt.termguicolors = true

      -- 顏色定義
      local c = require("onedark.colors")
      local COLOR_ACTIVE = c.blue or "#61afef"
      local COLOR_INACTIVE = "#5c6370" -- 比 c.fg 更淡，分隔更明顯

      -- 1) 定義分割線高亮（可重覆呼叫）
      local function define_separators()
        vim.api.nvim_set_hl(0, "WinSeparatorActive", { fg = COLOR_ACTIVE, bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "WinSeparatorInactive", { fg = COLOR_INACTIVE, bg = "NONE", bold = true })
      end

      define_separators()

      --[[
      -- 2) 改粗線（避免重覆 append）
      local fc = vim.opt.fillchars:get()
      if fc and fc.vert ~= "┃" then
        vim.opt.fillchars:append({ vert = "┃" })
      end
      -- 粗橫線
      if fc and fc.horiz ~= "━" then
        vim.opt.fillchars:append({ horiz = "━" })
      end
      -- 十字粗線
      if fc and fc.verthoriz ~= "╋" then
        vim.opt.fillchars:append({ verthoriz = "╋" })
      end
      ]]
      vim.opt.fillchars:append({
        vert = "┃", -- 粗垂直線
        horiz = "━", -- 粗水平線
        verthoriz = "╋", -- 中間十字加粗
        vertleft = "┫",
        vertright = "┣",
        horizup = "┻",
        horizdown = "┳",
      })
      -- 3) 安全更新 window 的 winhighlight（只改 WinSeparator，不覆蓋其他設定）
      local function set_sep(active)
        local current = vim.wo.winhighlight or ""

        -- 先移除現有 WinSeparator:XXX 片段
        current = current:gsub("WinSeparator:[^,]+,?", "")
        -- 清理尾端逗號
        current = current:gsub(",$", "")

        if #current > 0 then
          current = current .. ","
        end

        local target = active and "WinSeparator:WinSeparatorActive" or "WinSeparator:WinSeparatorInactive"
        vim.wo.winhighlight = current .. target
      end

      -- 初始視窗設為 Active
      set_sep(true)

      -- 4) 主題重載時，重新定義高亮（避免被覆蓋）
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          if vim.g.colors_name == "onedark" then
            define_separators()
          end
        end,
      })

      -- 5) 視窗切換時動態高亮
      vim.api.nvim_create_autocmd("WinEnter", {
        callback = function()
          set_sep(true)
        end,
      })
      vim.api.nvim_create_autocmd("WinLeave", {
        callback = function()
          set_sep(false)
        end,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
