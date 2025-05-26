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

-- enable 24-bit colors
vim.opt.termguicolors = true

-- choose dark or light
vim.opt.background = "dark" -- or "light"

local signs = {
  Error = "", -- red circle with cross
  Warn = "", -- yellow warning triangle
  Hint = "", -- light-bulb
  Info = "", -- blue info circle
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- 2) Make sure you’re actually showing signs
vim.diagnostic.config({
  virtual_text = false, -- optional: disable inline text
  signs = true,         -- enable your new signs
  underline = true,
  update_in_insert = false,
})
