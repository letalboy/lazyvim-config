-- Function to check the operating system
local function is_windows()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

-- Setup function for nvim-treesitter
local function setup_treesitter()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "html",
      "markdown",
      "markdown_inline",
      "vim",
      "json",
      "svelte",
      "astro",
      "c",
      "cpp",
      "go",
      "lua",
      "python",
      "rust",
      "regex",
      "go",
      "scss",
      "typescript",
      "cmake",
      "query",
    },
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
end

-- Setup function for toggleterm.nvim
local function setup_toggleterm()
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
end

-- Setup function for project.nvim
local function setup_project()
  require("project_nvim").setup({
    -- Configuration options here or leave empty for default settings
  })
end

-- Setup function for gitsigns.nvim
local function setup_gitsigns()
  require("gitsigns").setup({
    _extmark_signs = true,
    _inline_messaging = false,
    _threaded_diff = true,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil,
    max_file_length = 40000,
  })
  vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
end

-- Setup function for markdown-preview.nvim
local function setup_markdown_preview()
  vim.g.mkdp_auto_start = 1
end

-- Setup function for formatter.nvim
local function setup_formatter()
  local formatter = require("formatter")
  formatter.setup({
    filetype = {
      astro = {
        function()
          return {
            exe = "prettier",
            args = { "--plugin-search-dir=.", "--parser", "astro", "--plugin", "prettier-plugin-astro" },
            stdin = true,
          }
        end,
      },
      svelte = {
        function()
          return { exe = "prettier", args = { "--plugin-search-dir=.", "--parser", "svelte" }, stdin = true }
        end,
      },
      -- markdown = {
      --   function()
      --     return { exe = "prettier", args = { "--parser", "markdown" }, stdin = true }
      --   end,
      -- },
      -- Additional filetype formatters here
    },
  })
end

-- Plugin specifications
return {
  {
    "evanleck/vim-svelte",
    lazy = true,
    ft = "svelte",
  },
  { "wuelnerdotexe/vim-astro",     ft = "astro" },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = setup_treesitter,
  },
  { "virchau13/tree-sitter-astro", run = is_windows() and "tree-sitter generate" or "tree-sitter generate" },
  { "akinsho/toggleterm.nvim",     config = setup_toggleterm },
  { "ahmedkhalf/project.nvim",     config = setup_project },
  {
    "lewis6991/gitsigns.nvim",
    -- ensure we pull the patched async-safe code on main
    branch = "main",
    version = false,
    event = { "BufReadPre", "BufNewFile" },

    opts = function()
      local is_win = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

      return {
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },

        -- visual toggles
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,

        -- file‐watching
        watch_gitdir = {
          interval = is_win and 2000 or 1000,
          follow_files = true,
        },

        -- attach & blame
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false,

        -- performance & thresholds
        sign_priority = 6,
        update_debounce = is_win and 500 or 100,
        status_formatter = nil,
        max_file_length = 40000,

        -- preview window
        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },

        -- use built-in diff on Windows, external on others
        diff_opts = {
          internal = is_win,
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    -- build step: install the small Node server
    build = "cd app && npm install",

    -- only load when you open a Markdown file
    ft = "markdown",
    -- or when you explicitly call one of these commands
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },

    -- run *before* the plugin is loaded
    init = function()
      vim.g.mkdp_auto_start = 1
      -- optionally choose your browser:
      -- vim.g.mkdp_browser = 'chrome'
    end,
  },
  { "numToStr/Comment.nvim",      opts = {},               lazy = false },
  { "mhartington/formatter.nvim", config = setup_formatter },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
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
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    requires = { { "nvim-lua/plenary.nvim" } },
  },
}
