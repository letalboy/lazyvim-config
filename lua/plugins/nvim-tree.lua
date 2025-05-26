return {
  -- Disable nvim-tree if it was previously used
  { "nvim-tree/nvim-tree.lua", enabled = false },

  -- disable the default LazyVim file-explorer
  -- { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Add Neo-tree plugin (replace Nvim-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,    -- load at startup
    priority = 1000, -- override netrw/other explorers

    init = function()
      -- disable legacy netrw so Neo-tree can take over
      vim.g.neo_tree_remove_legacy_commands = 1
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,

    config = function(_, opts)
      -- 1️⃣ setup Neo-tree with your options
      require("neo-tree").setup(opts)

      -- 2️⃣ auto-open on startup (once)
      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = vim.loop.cwd(),
          })
        end,
      })
    end,

    -- your original options
    opts = {
      sources = { "filesystem", "buffers", "git_status" },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        icons = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "none",
          ["l"] = "open",
          ["h"] = "close_node",
          ["<cr>"] = "open",
          ["o"] = "open",
        },
      },
    },

    -- toggle mapping
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = vim.loop.cwd(),
          })
        end,
        desc = "Toggle File Explorer (Neo-tree)",
      },
    },
  },
}
