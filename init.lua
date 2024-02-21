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

local lspconfig = require("lspconfig")

-- Setup LSP servers.
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    -- Custom logic to enhance the server's capabilities
  end,
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

-- Disable tailwindcss language server for .astro files
require("lspconfig").tailwindcss.setup({
  on_attach = function(client, bufnr)
    if vim.bo[bufnr].filetype == "astro" then
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
    end
    -- Your on_attach function body
  end,
  filetypes = { "html", "css", "postcss" }, -- Remove "astro" from this list
})

require("lspconfig").astro.setup({
  on_attach = function(client, bufnr)
    -- Custom logic for Astro files
  end,
  filetypes = { "astro" },
  -- Other configurations...
})

-- Setup for TypeScript and JavaScript files
require("lspconfig").tsserver.setup({
  on_attach = function(client, bufnr)
    -- Your on_attach function body
  end,
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
  },
  -- Other tsserver configurations
})

-- Assuming you have null-ls and Prettier installed and configured globally
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.prettier.with({
      filetypes = { "astro", "javascript", "typescript" },
    }),
  },
})

-- Use 'null-ls' for linting and formatting support
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      extra_filetypes = { "astro" },
    }),
    null_ls.builtins.diagnostics.eslint.with({
      extra_filetypes = { "astro" },
    }),
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
