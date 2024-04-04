-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").rust_analyzer.setup({})

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

-- Must have null-ls and Prettier installed and configured globally
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.prettier.with({
      filetypes = { "astro", "javascript", "typescript" },
    }),
  },
})

-- Treesitter configuration
-- require("nvim-treesitter.configs").setup({
--   ensure_installed = { "astro", "svelte", "javascript", "typescript", "css", "html" },
--   sync_install = false,
--   auto_install = true,
--   highlight = {
--     enable = true,
--   },
-- })
