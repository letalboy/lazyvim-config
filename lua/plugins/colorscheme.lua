return {
  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   branch = "osaka",
  --   lazy = true,
  --   priority = 1000,
  --   opts = function()
  --     return {
  --       transparent = true,
  --     }
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "solarized-osaka",
  --   },
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false, -- set true if you want a transparent bg
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight") -- or "tokyonight-moon" etc.
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  --   "getomni/neovim",
  --   name = "omni",
  --   lazy = false,    -- load on start
  --   priority = 1000, -- make sure it runs before other UI plugins
  --   config = function()
  --     vim.opt.termguicolors = true
  --     vim.cmd.colorscheme("omni")
  --
  --     -- Italics (both classic + Tree-sitter groups)
  --     local hl = vim.api.nvim_set_hl
  --     hl(0, "Comment", { italic = true })
  --     hl(0, "@comment", { italic = true })
  --     hl(0, "Keyword", { italic = true })
  --     hl(0, "@keyword", { italic = true })
  --     hl(0, "Conditional", { italic = true })
  --     hl(0, "Repeat", { italic = true })
  --     -- add more groups if you want (Type, StorageClass, etc.)
  --   end,
  -- },
}
