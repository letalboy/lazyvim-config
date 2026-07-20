return {
  {
    "folke/noice.nvim",
    dependencies = { "rcarriga/nvim-notify" },
    opts = function(_, opts)
      opts = opts or {}
      -- keep logs/progress
      opts.lsp = vim.tbl_deep_extend("force", opts.lsp or {}, {
        progress = { enabled = true },
      })
      opts.messages = vim.tbl_deep_extend("force", opts.messages or {}, {
        enabled = true,
        view = "mini",
        view_error = "notify",
        view_warn = "notify",
      })
      -- stop the focus stealers
      opts.cmdline = { enabled = false } -- ← disable popup ":" cmdline
      opts.presets = vim.tbl_deep_extend("force", opts.presets or {}, {
        command_palette = false,         -- ← disable palette (causes the top-right box)
        long_message_to_split = true,    -- keep long logs readable
        lsp_doc_border = true,
      })
      return opts
    end,
  },
}
