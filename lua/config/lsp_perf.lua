-- lua/config/lsp_perf.lua
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.semanticTokensProvider then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  virtual_text = { spacing = 2, prefix = "●" },
})
