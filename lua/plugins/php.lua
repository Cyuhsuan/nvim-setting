return {
  -- 覆寫 PHP LSP 配置，確保使用 Intelephense
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- 禁用 phpactor
        phpactor = {
          enabled = false,
        },
        -- 啟用 intelephense
        intelephense = {
          enabled = true,
        },
      },
    },
  },
}
