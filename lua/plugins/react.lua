return {
  -- JSX/TSX 自動標籤補全和關閉
  {
    "windwp/nvim-ts-autotag",
    opts = {
      opts = {
        enable_close = true, -- 自動關閉標籤
        enable_rename = true, -- 自動重命名配對標籤
        enable_close_on_slash = false, -- 不在 / 時自動關閉
      },
      per_filetype = {
        ["html"] = {
          enable_close = false,
        },
      },
    },
  },

  -- React 相關的 treesitter 配置
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "tsx",
        "typescript",
        "javascript",
        "json",
        "html",
        "css",
      },
    },
  },

  -- Tailwind CSS 增強功能
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- 可選
      "neovim/nvim-lspconfig", -- 可選
    },
    opts = {
      document_color = {
        enabled = true, -- 啟用顏色預覽
        kind = "inline", -- "inline" | "foreground" | "background"
        inline_symbol = "●", -- 顏色符號
        debounce = 200,
      },
      conceal = {
        enabled = false, -- 不隱藏 class 名稱
        min_length = nil,
        symbol = "󱏿",
        highlight = {
          fg = "#38BDF8",
        },
      },
      custom_filetypes = {}, -- 額外支持的文件類型
    },
  },

  -- TypeScript 工具增強（可選的現代替代方案）
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = function(client, bufnr)
        -- 禁用格式化，讓 conform.nvim 處理
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        -- 啟用 JSX 關閉標籤功能
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
        -- TypeScript 服務器設定
        tsserver_plugins = {
          -- 可以在這裡添加 TypeScript 插件
        },
      },
    },
    enabled = false, -- 默認禁用，可以根據需要啟用
  },
}