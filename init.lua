-- init.lua

-- 1) Bootstrap LazyVim (lazy.nvim + all lua/plugins/* specs)
require("config.lazy")

-- 2) Treesitter (SAFE: runs only after plugins load, and only if available)
-- If you already configure nvim-treesitter in lua/plugins/*, you can delete this block.
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    ts.setup({
      ensure_installed = {
        "astro",
        "svelte",
        "javascript",
        "typescript",
        "css",
        "html",
        -- add more here if you like; or keep this minimal and let your plugin spec handle it
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
    })
  end,
})

-- 3) Any other global Vim settings you still need:

-- keep a visible ":" command line (since Noice cmdline is off)
vim.opt.cmdheight = 1

-- enable 24-bit colors
vim.opt.termguicolors = true

-- choose dark or light
vim.opt.background = "dark" -- or "light"

-- nice diagnostic icons
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

-- show diagnostics in sign column, underline, etc.
vim.diagnostic.config({
  virtual_text = false, -- optional: disable inline text
  signs = true,
  underline = true,
  update_in_insert = false,
})
