return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.cmdline = opts.cmdline or {}
      opts.cmdline.enabled = false  -- use Neovim's default ":" cmdline
    end,
  },
}
