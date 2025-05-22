return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- 1) Merge in your tsserver settings
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        tsserver = {
          filetypes = {
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
          },
          on_attach = function(client, bufnr)
            -- your existing on_attach logic here
          end,
        },
      })

      -- 2) Grab LazyVim’s default LSP keymaps and add <CR> → goto-definition
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      table.insert(Keys, {
        "<CR>",
        vim.lsp.buf.definition,
        desc = "Go to Definition",
      })
    end,
  },
}
