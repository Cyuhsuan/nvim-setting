return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install("go")
  end,
  config = function()
    local sources = require("dbee.sources")
    require("dbee").setup({
      sources = {
        sources.FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
        sources.EnvSource:new("DBEE_CONNECTIONS"),
      },
      drawer = {
        mappings = {
          { key = "r", mode = "n", action = "refresh" },
          { key = "<CR>", mode = "n", action = "action_1" },
          { key = "cw", mode = "n", action = "action_2" },
          { key = "dd", mode = "n", action = "action_3" },
          { key = "o", mode = "n", action = "toggle" },
          { key = "y", mode = "n", action = "menu_yank" },
          { key = "<Esc>", mode = "n", action = "menu_close" },
          { key = "q", mode = "n", action = "menu_close" },
        },
      },
    })
  end,
}
