return {
  -- 差異 / 歷史視圖
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("diffview.actions")

      require("diffview").setup({
        use_icons = true, -- 建議裝 Nerd Font
        keymaps = {
          view = {
            ["q"] = "<cmd>DiffviewClose<CR>",
            ["gf"] = actions.goto_file_edit,
          },
          file_panel = {
            ["q"] = "<cmd>DiffviewClose<CR>",
            ["gf"] = actions.goto_file_edit,
          },
          file_history_panel = {
            ["q"] = "<cmd>DiffviewClose<CR>",
          },
        },
      })
      -- 快捷鍵
      local map = vim.keymap.set
      map("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Diffview: open diff" })
      map("n", "<leader>gh", ":DiffviewFileHistory<CR>", { desc = "Diffview: file history" })
      map("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Diffview: close" })
    end,
  },

  -- 顯示行級變更、hunk 操作
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 行尾顯示
        delay = 300,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "\u{f2c0} <author>, <author_time:%Y-%m-%d> - <summary>",
      -- blame_line / preview_hunk 浮動視窗的外框
      preview_config = {
        border = "rounded", -- single / double / rounded / solid / shadow
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "│" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
        end
        map("n", "]h", gs.next_hunk, "Gitsigns: next hunk")
        map("n", "[h", gs.prev_hunk, "Gitsigns: prev hunk")
        map("n", "<leader>hs", gs.stage_hunk, "Gitsigns: stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Gitsigns: reset hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Gitsigns: preview hunk")
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Gitsigns: blame line")
      end,
    },
  },

  -- 在 nvim 呼叫 LazyGit（需系統已安裝 lazygit）
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    },
  },
}
