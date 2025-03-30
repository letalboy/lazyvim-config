return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          filetypes = {
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
          },
          -- Optional custom config
          on_attach = function(client, bufnr)
            -- your attach logic here
          end,
        },
      },
    },
  },
}
