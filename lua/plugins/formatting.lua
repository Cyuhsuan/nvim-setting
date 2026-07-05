return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Go 格式化
      go = { "goimports", "gofumpt" },
      -- JavaScript/TypeScript 格式化
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      -- php
      php = { "php_cs_fixer" },
      -- Web 相關格式化
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      -- 其他格式
      markdown = { "prettier" },
    },
    -- Prettier 配置，支持 Tailwind CSS 類排序
    formatters = {
      prettier = {
        options = {
          ft_parsers = {
            javascript = "babel",
            javascriptreact = "babel",
            typescript = "typescript",
            typescriptreact = "typescript",
          },
          -- Tailwind CSS 類排序支持 (需要安裝 prettier-plugin-tailwindcss)
          plugins = { "prettier-plugin-tailwindcss" },
        },
      },
    },
  },
}

