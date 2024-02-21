-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Setup nvim-cmp.
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
})

-- Setup lspconfig.
local lspconfig = require("lspconfig")

-- Common on_attach function to run for every LSP server.
local on_attach = function(client, bufnr)
  -- Customize LSP key mappings here
end

-- Setup LSP servers.
lspconfig.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  -- Other tsserver specific settings can be added here
})

-- Add additional servers here. For example, for Lua:
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
  ensure_installed = { "astro", "svelte", "javascript", "typescript", "css", "html" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})

-- Autocommands for automatically setting up LSP for certain file types
vim.api.nvim_create_augroup("LSP", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "LSP",
  pattern = "astro",
  callback = function()
    lspconfig.tsserver.setup({
      on_attach = on_attach,
    })
  end,
})

-- Additional plugins or settings can be configured below.
