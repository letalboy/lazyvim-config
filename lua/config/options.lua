-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1

-- Hide split borders
vim.cmd([[
  highlight WinSeparator guifg=NONE guibg=NONE
  highlight VertSplit guifg=NONE guibg=NONE
]])

-- Prevent the symbol from being draw
vim.opt.fillchars:append({ vert = " " })
