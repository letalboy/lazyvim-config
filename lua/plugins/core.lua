-- Check the operating system
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

return {
  {
    "evanleck/vim-svelte",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "svelte",
        "astro",
        "c",
        "cpp",
        "go",
        "lua",
        "python",
        "rust",
        "typescript",
        "cmake",
      },
      highlight = {
        enable = true, -- false will disable the whole extension
      },
      incremental_selection = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
  {
    "virchau13/tree-sitter-astro",
    run = "tree-sitter generate",
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- To use a specific version
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
      })
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    run = function()
      -- Use a different build command depending on the OS
      if is_windows then
        vim.fn.system({ "cmd", "/c", "cd app && npm install" })
      else
        vim.fn.system({ "sh", "-c", "cd app && npm install" })
      end
    end,
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      local formatter = require("formatter")

      -- Configuration for Prettier with Astro support
      formatter.setup({
        filetype = {
          astro = {
            -- Prettier formatter configuration for Astro files
            function()
              return {
                exe = "prettier", -- Assuming Prettier is in your $PATH
                args = {
                  "--plugin-search-dir=.",
                  "--parser",
                  "astro",
                  "--plugin",
                  "prettier-plugin-astro",
                },
                stdin = true,
              }
            end,
          },
          svelte = {
            -- Prettier formatter configuration for Svelte files
            function()
              return {
                exe = "prettier", -- Assuming Prettier is in your $PATH
                args = {
                  "--plugin-search-dir=.",
                  "--parser",
                  "svelte",
                },
                stdin = true,
              }
            end,
          },
          markdown = {
            -- Prettier formatter configuration for Markdown files
            function()
              return {
                exe = "prettier", -- Assuming Prettier is in your $PATH
                args = {
                  "--parser",
                  "markdown",
                },
                stdin = true,
              }
            end,
          },
          -- ... other filetype formatters
        },
      })
    end,
  },
  -- The completion plugin
  { "hrsh7th/nvim-cmp" },
  -- Buffer completions
  { "hrsh7th/cmp-buffer" },
  -- Path completions
  { "hrsh7th/cmp-path" },
  -- Command line completions
  { "hrsh7th/cmp-cmdline" },
  -- LSP completions
  { "hrsh7th/cmp-nvim-lsp" },
  -- Snippet completions
  { "saadparwaiz1/cmp_luasnip" },
  -- Snippet engine
  { "L3MON4D3/LuaSnip" },
}
