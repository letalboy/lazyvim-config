return {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewToggleFiles",
      "DiffviewRefresh",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff view" },
      { "<leader>gD", "<cmd>DiffviewOpen HEAD~1..HEAD<cr>", desc = "Git last commit diff" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "G",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GRename",
      "GDelete",
      "GBrowse",
    },
  },

  {
    "rbong/vim-flog",
    cmd = {
      "Flog",
      "Flogsplit",
      "Floggit",
    },
    dependencies = {
      "tpope/vim-fugitive",
    },
    keys = {
      { "<leader>gl", "<cmd>Flog<cr>", desc = "Git graph" },
      { "<leader>gL", "<cmd>Flogsplit<cr>", desc = "Git graph split" },
    },
  },

  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "sindrets/diffview.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    keys = {
      {
        "<leader>gU",
        function()
          if vim.fn.executable("gitui") == 0 then
            vim.notify("gitui is not installed or not on PATH", vim.log.levels.WARN)
            return
          end

          local Terminal = require("toggleterm.terminal").Terminal
          Terminal:new({ cmd = "gitui", hidden = true, direction = "float" }):toggle()
        end,
        desc = "GitUI",
      },
    },
  },
}
