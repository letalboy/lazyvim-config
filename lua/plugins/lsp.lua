return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- ── helpers for cross-platform paths ──────────────────────────────
      local util = require("lspconfig.util")
      local is_win = vim.loop.os_uname().sysname == "Windows_NT"
      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
      -- add Mason’s bin dir to PATH, guarding against nil
      local sep = is_win and ";" or ":"
      local sys_path = vim.env.PATH or vim.env.Path or ""
      vim.env.PATH = mason_bin .. sep .. sys_path
      -- ─────────────────────────────────────────────────────────────────

      -- create (or reuse) a group for LSP formatting autocmds
      local fmt_grp = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

      -- Define a common on_attach function
      local on_attach = function(client, bufnr)
        -- Only skip LSP in non-file/utility buffers; don't look at 'modifiable' here.
        local bt = vim.bo[bufnr].buftype
        if bt == "nofile" or bt == "prompt" or bt == "help" or bt == "quickfix" or bt == "terminal" then
          pcall(vim.lsp.buf_detach_client, bufnr, client.id)
          return
        end

        -- if server supports formatting, auto-format on save
        if client.server_capabilities.documentFormattingProvider then
          local fmt_grp = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
          vim.api.nvim_clear_autocmds({ group = fmt_grp, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = fmt_grp,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end,
          })
          vim.api.nvim_buf_set_keymap(
            bufnr,
            "n",
            "<leader>cl",
            "<cmd>lua vim.lsp.codelens.run()<cr>",
            { noremap = true, silent = true, desc = "Run CodeLens" }
          )
        end

        -- manual <leader>f formatter
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end, { buffer = bufnr, desc = "Format buffer" })
      end

      -- Merge all LSP servers
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        ["*"] = {
          keys = {
            { "<CR>", vim.lsp.buf.definition, desc = "Go to Definition", has = "definition" },
          },
        },

        -- TypeScript Server
        vtsls = {
          on_attach = on_attach,
          filetypes = {
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
          },
          root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "package.json", ".git"),
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
              suggest = {
                completeFunctionCalls = true,
              },
              updateImportsOnFileMove = {
                enabled = "always",
              },
              tsserver = {
                watchOptions = {
                  watchFile = "useFsEvents",
                },
              },
            },
            vtsls = {
              autoUseWorkspaceTsdk = true,
              enableMoveToFileCodeAction = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
                maxInlayHintLength = 30,
              },
            },
          },
        },

        -- Lua Server
        lua_ls = {
          on_attach = on_attach,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },

        -- Tailwind CSS Server
        tailwindcss = {
          on_attach = function(client, bufnr)
            if vim.bo[bufnr].filetype == "astro" then
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
            on_attach(client, bufnr)
          end,
          filetypes = { "html", "css", "postcss" },
        },

        -- Astro Server
        astro = {
          on_attach = on_attach,
          filetypes = { "astro" },
        },

        -- Svelte Server
        svelte = {
          on_attach = on_attach,
          cmd = { "svelteserver", "--stdio" },
          filetypes = { "svelte" },
        },

        -- Rust Analyzer
        rust_analyzer = {
          on_attach = on_attach,
          -- make sure Neovim can find the binary
          cmd = { mason_bin .. (is_win and "/rust-analyzer.exe" or "/rust-analyzer") },
          filetypes = { "rust" },
          root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),

          -- (fix): avoid Neovim's incremental change tracking
          flags = {
            allow_incremental_sync = false,
            debounce_text_changes = 150,
          },

          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
              },
              procMacro = { enable = true },
              -- Windows-friendly FS events (prevents drift/races)
              files = { watcher = "client" },
              check = { command = "check" },
              checkOnSave = { enable = true },
            },
          },
        },

        -- Docker Language Server
        dockerls = {
          on_attach = on_attach,
          filetypes = { "dockerfile" },
          root_dir = util.root_pattern("Dockerfile", ".git"),
          settings = {},
        },

        -- Docker Compose Language Service
        docker_compose_language_service = {
          on_attach = on_attach,
          filetypes = { "yaml.docker-compose", "yaml" },
          root_dir = util.root_pattern(
            "docker-compose.yml",
            "docker-compose.yaml",
            "compose.yml",
            "compose.yaml",
            ".git"
          ),
          settings = {},
        },
      })

      -- Return the updated keybindings
      opts.setup = {
        -- Add an autocommand for astro files if needed
        astro = function()
          -- Special setup for astro files can go here
        end,
      }
      return opts
    end,
  },

  -- Add null-ls for Prettier formatting
  {
    "nvimtools/none-ls.nvim", -- Fork of null-ls
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettier.with({
            filetypes = { "astro", "javascript", "typescript" },
          }),
        },
      }
    end,
  },

  -- {
  --   "stevearc/dressing.nvim", -- This will give vim.ui.select a proper UI, which should fix the warning
  --   event = "VeryLazy",
  --   opts = {},
  -- },
}
