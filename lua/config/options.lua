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

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Prevent the symbol from being draw
vim.opt.fillchars:append({ vert = " " })
vim.g.lazyvim_python_lsp = "basedpyright"

-- Always show signs/nums
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

-- Use the theme's window-separator color for the divider
vim.cmd("highlight! link GutterSeparator WinSeparator")

-- [signs][numbers]│ [code]
vim.opt.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum}%#GutterSeparator#│%* "
vim.api.nvim_set_hl(0, "GutterSeparator", { fg = "#5a5f72" }) -- pick any hex
vim.opt.numberwidth = 3
-- vim.opt.colorcolumn = "1"                                     -- You can fake it inside the text area with a first-column guide
