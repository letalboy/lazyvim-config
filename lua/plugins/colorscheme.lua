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
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      -- load tokyonight
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")

      -- Make the vertical split actually render (pick one you like)
      vim.opt.fillchars:append({
        vert = "│", -- or "▏" for a thinner bar, "┃" for thicker
        vertleft = "│",
        vertright = "│",
        verthoriz = "┼", -- junction character
      })

      -- use the Visual (selection) color for split bars
      local visual = vim.api.nvim_get_hl(0, { name = "Visual", link = false })
      local sep = visual.bg or visual.fg or "#7aa2f7" -- fallback if needed

      -- normal window separators
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = sep, bg = "NONE" })
      vim.api.nvim_set_hl(0, "VertSplit", { fg = sep, bg = "NONE" })

      -- neo-tree specific separator
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = sep, bg = "NONE" })
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
