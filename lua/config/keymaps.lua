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

-- Move lines with alt + arrow up or arrow down
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Cut lines with ctrl + x
vim.api.nvim_set_keymap("n", "<C-X>", "dd", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-X>", "d", { noremap = true, silent = true })

-- Fast copy
vim.api.nvim_set_keymap("n", "<C-C>", "yy", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-C>", "y", { noremap = true, silent = true })

-- Fast paste
vim.api.nvim_set_keymap("n", "<C-V>", "p", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-V>", '<C-R>"', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-V>", "p", { noremap = true, silent = true })

-- Undo
vim.api.nvim_set_keymap("n", "<C-Z>", "u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-Z>", "<C-O>u", { noremap = true, silent = true })

-- Redo
vim.api.nvim_set_keymap("n", "<C-S-Z>", "<C-R>", { noremap = true, silent = true })

-- Create a line att top:
vim.api.nvim_set_keymap("n", "<C-S-M>", ":execute 'normal! gg' | startinsert<CR>", { noremap = true, silent = true })

-- Create a line att bottom
vim.api.nvim_set_keymap("n", "<C-S-N>", ":execute 'normal! G' | startinsert<CR>", { noremap = true, silent = true })

-- Tab to left using shit + tab
vim.api.nvim_set_keymap("n", "<C-D>", "<<", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-D>", "<", { noremap = true, silent = true })
