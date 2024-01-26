-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable continuations
vim.keymap.set("n", "<Leader>o", "o<Esc>^Da", vim.opts)
vim.keymap.set("n", "<Leader>O", "O<Esc>^Da", vim.opts)

-- New tab
vim.keymap.set("n", "te", ":tabedit")
vim.keymap.set("n", "<tab>", ":tabnext<Return>", vim.opts)
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", vim.opts)
-- Split window
vim.keymap.set("n", "ss", ":split<Return>", vim.opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", vim.opts)
-- Move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")
