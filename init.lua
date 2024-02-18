-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("nvim-treesitter.configs").setup({
  -- Ensure 'astro' is added to your 'ensure_installed' list
  ensure_installed = { "astro", "svelte", "javascript", "typescript", "css", "html" },

  highlight = {
    enable = true, -- false will disable the whole extension
  },
})

require("lspconfig").astro.setup({
  on_attach = function(client, bufnr)
    -- Optional: further configuration goes here
  end,
})

require("lspconfig").svelte.setup({
  on_attach = function(client, bufnr)
    -- Optional: further configuration goes here
    -- Example: setting up buffer keymaps
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
  end,
  settings = {
    svelte = {
      plugin = {
        svelte = {
          -- put svelte plugin settings here
          -- Example: enable all the language features
          languageFeatures = {
            implementation = true,
            colorPresentations = true,
            documentSymbols = true,
            semanticTokens = true,
            diagnostics = true,
            rename = true,
            typeDefinition = true,
            codeActions = true,
          },
        },
      },
    },
  },
})

-- Check if the 'astro' filetype is recognized, and set it if not
vim.api.nvim_create_augroup("filetype_astro", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.astro",
  command = "set filetype=astro",
  group = "filetype_astro",
})

-- Autocommand group for astro files
local astro_group = vim.api.nvim_create_augroup("astro_autocommands", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.astro",
  callback = function()
    -- Example: Format on save using some formatter, replace with actual Lua function or command
    vim.cmd("silent! AstroFormatter")
  end,
  group = astro_group,
})
