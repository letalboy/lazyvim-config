-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true, desc = "" }

-- Focus Nvim-Tree with Alt-h
vim.keymap.set("n", "<A-h>", "<cmd>NvimTreeFocus<CR>", {
  noremap = true,
  silent = true,
  desc = "Focus Nvim-Tree",
})
-- Return to your last window with Alt-l
vim.keymap.set("n", "<A-l>", "<cmd>NvimTreeClose<CR>", {
  noremap = true,
  silent = true,
  desc = "Close Nvim-Tree (back to code)",
})

-- cycle buffers with Tab / Shift-Tab
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Prev buffer" }))

-- or with Alt+Left / Alt+Right
vim.keymap.set("n", "<A-Right>", "<cmd>bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
vim.keymap.set("n", "<A-Left>", "<cmd>bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Prev buffer" }))

-- or bracket style (vim’s builtin)
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Prev buffer" }))

-- Split buffer to the RIGHT
vim.keymap.set("n", "]", "<cmd>vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Split buffer → right" }))
vim.keymap.set("n", ">", "<cmd>vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Split buffer → right" }))

-- Split buffer to the LEFT
-- `leftabove vsplit` creates the split on the far left
vim.keymap.set("n", "[", "<cmd>leftabove vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Split buffer → left" }))
vim.keymap.set("n", "<", "<cmd>leftabove vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Split buffer → left" }))

-- Swap/rotate all windows (for a two‐pane layout this simply swaps them)
vim.keymap.set("n", "<leader>w", "<cmd>wincmd r<CR>", vim.tbl_extend("force", opts, { desc = "Rotate/swap windows" }))

-- Disable continuations
vim.keymap.set("n", "<Leader>o", "o<Esc>^Da", vim.opts)
vim.keymap.set("n", "<Leader>O", "O<Esc>^Da", vim.opts)

-- Comment
vim.keymap.set("n", "<leader>c", "gcc", { noremap = false }) -- Toggle comment on current line
vim.keymap.set("v", "<leader>c", "gc", { noremap = false })  -- Toggle comment on selection

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

-- Undo / redo
vim.keymap.set("n", "<C-Z>", "u", { noremap = true, silent = true, desc = "Undo" })
vim.keymap.set("i", "<C-Z>", "<C-g>u<C-o>u", { noremap = true, silent = true, desc = "Undo" })
vim.keymap.set("x", "<C-Z>", "<Esc>u", { noremap = true, silent = true, desc = "Undo" })

vim.keymap.set("n", "<C-S-Z>", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set("i", "<C-S-Z>", "<C-g>u<C-o><C-r>", { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set("x", "<C-S-Z>", "<Esc><C-r>", { noremap = true, silent = true, desc = "Redo" })

-- Create a line att top:
vim.api.nvim_set_keymap("n", "<C-S-M>", ":execute 'normal! gg' | startinsert<CR>", { noremap = true, silent = true })

-- Create a line att botto
vim.api.nvim_set_keymap("n", "<C-S-N>", ":execute 'normal! G' | startinsert<CR>", { noremap = true, silent = true })

-- Tab to left using shit + tab
vim.api.nvim_set_keymap("n", "<C-D>", "<<", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-D>", "<", { noremap = true, silent = true })

-- Telescope maps
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })

-- MarkdownVisualize
vim.api.nvim_set_keymap("n", "<leader>mp", "<Plug>MarkdownPreview", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ms", "<Plug>MarkdownPreviewStop", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mt", "<Plug>MarkdownPreviewToggle", { noremap = true, silent = true })

-- Map mouse "Back" (X1) to jump-list back (<C-o>)
vim.keymap.set("n", "<X1Mouse>", "<C-o>", { desc = "Jump back" })
-- Map mouse "Forward" (X2) to jump-list forward (<C-i>)
vim.keymap.set("n", "<X2Mouse>", "<C-i>", { desc = "Jump forward" })

-- indent selected lines and keep them selected
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })

-- un-indent selected lines and keep them selected
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>dv", function()
  local cur = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not cur })
end, { desc = "Toggle diagnostic virtual text" })

-- in the same config function, after setup:
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle Nvim-Tree" })
-- Alt+f → search the word under the mouse (keeps your cursor where it was)
vim.keymap.set("n", "<A-f>", function()
  local mp = vim.fn.getmousepos()
  if mp.winid == 0 then
    return
  end

  local cur_win = vim.api.nvim_get_current_win()
  local cur_pos = vim.api.nvim_win_get_cursor(cur_win)

  local win = mp.winid
  local buf = vim.api.nvim_win_get_buf(win)
  local linecount = vim.api.nvim_buf_line_count(buf)

  -- Clamp line to buffer range
  local row = math.min(math.max(mp.line or 1, 1), linecount)

  -- Get the line and clamp column to its byte length
  local line = vim.api.nvim_buf_get_lines(buf, row - 1, row, false)[1] or ""
  local maxbyte = #line
  local col = math.max(0, math.min((mp.column or 1) - 1, maxbyte)) -- 0-based, in bytes

  -- Jump, do "*", then restore (all wrapped in pcall to avoid hard errors)
  pcall(vim.api.nvim_set_current_win, win)
  local ok = pcall(vim.api.nvim_win_set_cursor, win, { row, col })
  if ok then
    vim.cmd("silent! normal! *")
  end
  pcall(vim.api.nvim_set_current_win, cur_win)
  pcall(vim.api.nvim_win_set_cursor, cur_win, cur_pos)
end, { desc = "Search word under mouse", silent = true })

-- Select entire buffer with Ctrl+A
-- Normal: select all lines
vim.keymap.set("n", "<C-A>", "ggVG", { noremap = true, silent = true, desc = "Select entire buffer" })

-- Visual/Insert/Terminal: jump out, then select all
vim.keymap.set("v", "<C-A>", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select entire buffer" })
vim.keymap.set("i", "<C-A>", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select entire buffer" })
vim.keymap.set("t", "<C-A>", [[<C-\><C-n>ggVG]], { noremap = true, silent = true, desc = "Select entire buffer" })

-- Increment number:
vim.keymap.set("n", "<leader>=", "<C-a>", { remap = true, desc = "Increment number" })
