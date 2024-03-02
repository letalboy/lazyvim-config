-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

vim.cmd([[
  autocmd FileType svelte syntax enable
  autocmd FileType svelte highlight link htmlTag Keyword
  autocmd FileType svelte highlight link htmlEndTag Keyword
  autocmd BufNewFile,BufRead *.svelte setlocal filetype=svelte
  autocmd BufNewFile, BufRead *.astro setlocal filetype=astro
  autocmd BufNewFile, BufRead *.md setlocal filetype=markdown
]])

-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--     require("nvim-treesitter.install").ensure_installed()
--   end,
-- })

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.md", "*.astro", "*.svelte" }, -- Add other filetypes as needed
  callback = function()
    vim.cmd("FormatWrite")
  end,
})

-- local markdown_augroup = vim.api.nvim_create_augroup("Markdown", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   group = markdown_augroup,
--   pattern = { "*.md" },
--   callback = function(opts)
--     bufnr = opts["buf"]
--     vim.bo.textwidth = 80
--     vim.bo.formatoptions = "tcqawjp]"
--   end,
-- })
