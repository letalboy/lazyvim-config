-- init.lua

-- 1. Bootstrap LazyVim (lazy.nvim + all lua/plugins/* specs)
require("config.lazy")

-- 2. Treesitter (you can also move this into lua/plugins/treesitter.lua)
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "astro",
    "svelte",
    "javascript",
    "typescript",
    "css",
    "html",
  },
  ignore_install = {},
  modules = {},
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  rocks = {
    enabled = true,
    hererocks = true,
    -- Lazy will bootstrap luarocks + Lua 5.1 automatically
  },
})

-- 3. Any other global Vim settings you still need:
-- vim.o.termguicolors = true
-- vim.o.updatetime     = 250
-- vim.cmd([[ colorscheme catppuccin ]])
