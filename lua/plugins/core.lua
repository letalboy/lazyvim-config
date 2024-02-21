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
  require("gitsigns").setup()
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
      markdown = {
        function()
          return { exe = "prettier", args = { "--parser", "markdown" }, stdin = true }
        end,
      },
      -- Additional filetype formatters here
    },
  })
end

-- Plugin specifications
return {
  { "evanleck/vim-svelte", lazy = true },
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = setup_treesitter },
  { "virchau13/tree-sitter-astro", run = is_windows() and "tree-sitter generate" or "tree-sitter generate" },
  { "akinsho/toggleterm.nvim", config = setup_toggleterm },
  { "ahmedkhalf/project.nvim", config = setup_project },
  { "lewis6991/gitsigns.nvim", config = setup_gitsigns },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    run = (is_windows() and "cd app && npm install" or "cd app && npm install"),
    config = setup_markdown_preview,
  },
  { "numToStr/Comment.nvim" },
  { "mhartington/formatter.nvim", config = setup_formatter },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
}
