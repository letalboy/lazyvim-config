-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("nvim-treesitter.configs").setup({
  -- Ensure 'astro' is added to your 'ensure_installed' list
  ensure_installed = { "astro", "javascript", "typescript", "css", "html" },

  highlight = {
    enable = true, -- false will disable the whole extension
  },
})

require("lspconfig").astro.setup({
  on_attach = function(client, bufnr)
    -- Optional: further configuration goes here
  end,
})
