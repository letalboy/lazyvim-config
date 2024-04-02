return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = {
        "gd",
        function()
          -- DO NOT RESUSE WINDOW
          require("telescope.builtin").lsp_definitions({ reuse_win = false })
        end,
        desc = "Goto Definition",
        has = "definition",
      }
    end,
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      setup = {},
    },
  },
}

-- local lspconfig = require("lspconfig")
--
-- -- Common on_attach function to share between LSP servers
-- local function on_attach(client, bufnr)
--   -- Custom logic to enhance the server's capabilities
--   -- Define or import this function if it contains custom logic
-- end
--
-- -- Setup for TypeScript and JavaScript files
-- lspconfig.tsserver.setup({
--   on_attach = on_attach, -- Use the common on_attach function
--   filetypes = {
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--   },
--   -- Other tsserver configurations...
-- })
--
-- -- Setup for Lua (assuming lua_ls is the correct server name; you may mean sumneko_lua)
-- lspconfig.lua_ls.setup({
--   on_attach = on_attach,
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" },
--       },
--     },
--   },
-- })
--
-- -- Disable tailwindcss language server for .astro files
-- lspconfig.tailwindcss.setup({
--   on_attach = function(client, bufnr)
--     -- Include the same logic as the other on_attach functions if necessary
--     if vim.bo[bufnr].filetype == "astro" then
--       client.server_capabilities.document_formatting = false
--       client.server_capabilities.document_range_formatting = false
--     end
--   end,
--   filetypes = { "html", "css", "postcss" }, -- Removed "astro" from this list
-- })
--
-- -- Setup for Astro files
-- lspconfig.astro.setup({
--   on_attach = on_attach, -- Use the common on_attach function
--   filetypes = { "astro" },
--   -- Other configurations for astro...
-- })
--
-- -- Autocommands for automatically setting up LSP for certain file types
-- vim.api.nvim_create_augroup("LSP", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--   group = "LSP",
--   pattern = "astro",
--   callback = function()
--     -- It seems like you want to set up LSP for astro files here
--     -- But if you have the `lspconfig.astro.setup` above, this is unnecessary
--   end,
-- })
