-- Assuming you are using nvim-lspconfig and nvim-cmp
local cmp = require("cmp")
local lspconfig = require("lspconfig")

-- Set up the language server for JavaScript/TypeScript
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    -- Custom logic to enhance the server's capabilities
  end,
  -- Add more configuration as needed
})

-- Make sure that `.astro` files are recognized and attached to the tsserver
lspconfig.tsserver.filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx", "astro" }

-- Configure nvim-cmp for autocompletioncmp
cmp.setup({
  -- Your autocompletion configuration here
})

require("lspconfig").tsserver.setup({
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "astro",
  },
})
